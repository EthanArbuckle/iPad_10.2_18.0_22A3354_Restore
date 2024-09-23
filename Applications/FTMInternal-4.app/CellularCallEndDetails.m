@implementation CellularCallEndDetails

- (void)setTimestamp:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)callEvent
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_callEvent;
  else
    return 0;
}

- (void)setCallEvent:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_callEvent = a3;
}

- (void)setHasCallEvent:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasCallEvent
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)callEventAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 26)
  {
    if (a3 > 110)
    {
      switch(a3)
      {
        case 'o':
          return CFSTR("CM_CALL_EVENT_HO_COMPLETE");
        case 'p':
          return CFSTR("CM_CALL_EVENT_MT_CALL_PAGE_FAIL");
        case 'u':
          return CFSTR("CM_CALL_EVENT_ALERT");
      }
    }
    else
    {
      switch(a3)
      {
        case 27:
          return CFSTR("CM_CALL_EVENT_SETUP_IND");
        case 29:
          return CFSTR("CM_CALL_EVENT_CALL_CONF");
        case 56:
          return CFSTR("CM_CALL_EVENT_ALERTING");
      }
    }
LABEL_25:
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
    return v3;
  }
  else
  {
    v3 = CFSTR("CM_CALL_EVENT_ORIG");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("CM_CALL_EVENT_ANSWER");
        return v3;
      case 2:
        result = CFSTR("CM_CALL_EVENT_END_REQ");
        break;
      case 3:
        result = CFSTR("CM_CALL_EVENT_END");
        break;
      case 4:
        result = CFSTR("CM_CALL_EVENT_SUPS");
        break;
      case 5:
        result = CFSTR("CM_CALL_EVENT_INCOM");
        break;
      case 6:
        result = CFSTR("CM_CALL_EVENT_CONNECT");
        break;
      case 11:
        result = CFSTR("CM_CALL_EVENT_ABRV_ALERT");
        break;
      default:
        goto LABEL_25;
    }
  }
  return result;
}

- (int)StringAsCallEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_ORIG")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_ANSWER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_END_REQ")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_END")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_SUPS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_INCOM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_CONNECT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_ABRV_ALERT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_SETUP_IND")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_CALL_CONF")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_ALERTING")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_HO_COMPLETE")) & 1) != 0)
  {
    v4 = 111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_MT_CALL_PAGE_FAIL")) & 1) != 0)
  {
    v4 = 112;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_EVENT_ALERT")))
  {
    v4 = 117;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCallId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_callId = a3;
}

- (void)setHasCallId:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCallId
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)direction
{
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    return self->_direction;
  else
    return 0;
}

- (void)setDirection:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_direction = a3;
}

- (void)setHasDirection:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasDirection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)directionAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EB78 + a3);
}

- (int)StringAsDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_DIRECTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_DIRECTION_MO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_DIRECTION_MT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)srvType
{
  if ((*((_BYTE *)&self->_has + 5) & 0x10) != 0)
    return self->_srvType;
  else
    return -1;
}

- (void)setSrvType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_srvType = a3;
}

- (void)setHasSrvType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSrvType
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (id)srvTypeAsString:(int)a3
{
  if ((a3 + 1) >= 0x18)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025E958 + a3 + 1);
}

- (int)StringAsSrvType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_NONE")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_LTE_V2")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_HDR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_CDMA_SPECIFIC")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_CDMA_AUTOMATIC")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_AUTOMATIC")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_CDMA_HDR")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_GSM_WCDMA")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_WCDMA")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_GSM")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_WLAN")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_NON_AUTOMATIC")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_LTE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_GSM_WCDMA_LTE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_HDR_MORE_PREF")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_UMTS")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_UMTS_GSM")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_UMTS_GSM_LTE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_UMTS_GSM_WCDMA_LTE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_UMTS_GSM_WCDMA")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_UMTS_LTE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_CS_ONLY")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_PS_ONLY")) & 1) != 0)
  {
    v4 = 21;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CM_SRV_TYPE_MAX")))
  {
    v4 = 22;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (int)sysMode
{
  if ((*((_BYTE *)&self->_has + 6) & 1) != 0)
    return self->_sysMode;
  else
    return 0;
}

- (void)setSysMode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSysMode
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (id)sysModeAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025EAF8 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsSysMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NO_SRV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE_V2")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GSM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_HDR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WCDMA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_EHRPD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GW")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WLAN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GWL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_UMTS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NR5G")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA_HDR")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)callState
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_callState;
  else
    return 0;
}

- (void)setCallState:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_callState = a3;
}

- (void)setHasCallState:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCallState
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)callStateAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EA18 + a3);
}

- (int)StringAsCallState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_STATE_IDLE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_STATE_ORIG")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_STATE_INCOM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_STATE_CONV")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_STATE_CC_IN_PROGRESS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_STATE_RECALL_RSP_PEND")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setEndStatus:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_endStatus = a3;
}

- (void)setHasEndStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasEndStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCcCause:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_ccCause = a3;
}

- (void)setHasCcCause:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCcCause
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setQmiReleaseCause:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_qmiReleaseCause = a3;
}

- (void)setHasQmiReleaseCause:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasQmiReleaseCause
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setCallDuration:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_callDuration = a3;
}

- (void)setHasCallDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasCallDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)antenna
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_antenna;
  else
    return 0;
}

- (void)setAntenna:(int)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_antenna = a3;
}

- (void)setHasAntenna:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAntenna
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)antennaAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EA48 + a3);
}

- (int)StringAsAntenna:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTD_ANT0")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTD_ANT1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTD_ANT2")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ARTD_ANT3")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)callType
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_callType;
  else
    return -1;
}

- (void)setCallType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_callType = a3;
}

- (void)setHasCallType:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCallType
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)callTypeAsString:(int)a3
{
  if ((a3 + 1) >= 0x12)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EA68 + a3 + 1);
}

- (int)StringAsCallType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_NONE")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_VOICE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_CS_DATA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_PS_DATA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_SMS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_PD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_TEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_OTAPA")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_STD_OTASP")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_NON_STD_OTASP")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_EMERGENCY")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_SUPS")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_VT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_VT_LOOPBACK")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_VS")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_PS_DATA_IS707B")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_TYPE_MAX")))
  {
    v4 = 16;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)setEstablished:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_established = a3;
}

- (void)setHasEstablished:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasEstablished
{
  return *((_BYTE *)&self->_has + 7) & 1;
}

- (void)setConnected:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_connected = a3;
}

- (void)setHasConnected:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasConnected
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setLteCellId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_lteCellId = a3;
}

- (void)setHasLteCellId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasLteCellId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCellId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setZoneId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_zoneId = a3;
}

- (void)setHasZoneId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasZoneId
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setBaseId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_baseId = a3;
}

- (void)setHasBaseId:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBaseId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLteLac:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_lteLac = a3;
}

- (void)setHasLteLac:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasLteLac
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSid:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_sid = a3;
}

- (void)setHasSid:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasSid
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasMcc
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasMnc
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setLac:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasLac
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMrabEver:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_mrabEver = a3;
}

- (void)setHasMrabEver:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasMrabEver
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (void)setMrabEnd:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_mrabEnd = a3;
}

- (void)setHasMrabEnd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasMrabEnd
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (int)band
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_band;
  else
    return 0;
}

- (void)setBand:(int)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBand
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)bandAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("SYS_BAND_BC0");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("SYS_BAND_BC1");
      return v3;
    case 3:
      return CFSTR("SYS_BAND_BC3");
    case 4:
      return CFSTR("SYS_BAND_BC4");
    case 5:
      return CFSTR("SYS_BAND_BC5");
    case 6:
      return CFSTR("SYS_BAND_BC6");
    case 7:
      return CFSTR("SYS_BAND_BC7");
    case 8:
      return CFSTR("SYS_BAND_BC8");
    case 9:
      return CFSTR("SYS_BAND_BC9");
    case 10:
      return CFSTR("SYS_BAND_BC10");
    case 11:
      return CFSTR("SYS_BAND_BC11");
    case 12:
      return CFSTR("SYS_BAND_BC12");
    case 13:
      return CFSTR("SYS_BAND_BC13");
    case 14:
      return CFSTR("SYS_BAND_BC14");
    case 15:
      return CFSTR("SYS_BAND_BC15");
    case 16:
      return CFSTR("SYS_BAND_BC16");
    case 17:
      return CFSTR("SYS_BAND_BC17");
    case 18:
      return CFSTR("SYS_BAND_BC18");
    case 19:
      return CFSTR("SYS_BAND_BC19");
    case 40:
      return CFSTR("SYS_BAND_GSM_450");
    case 41:
      return CFSTR("SYS_BAND_GSM_480");
    case 42:
      return CFSTR("SYS_BAND_GSM_750");
    case 43:
      return CFSTR("SYS_BAND_GSM_850");
    case 44:
      return CFSTR("SYS_BAND_GSM_EGSM_900");
    case 45:
      return CFSTR("SYS_BAND_GSM_PGSM_900");
    case 46:
      return CFSTR("SYS_BAND_GSM_RGSM_900");
    case 47:
      return CFSTR("SYS_BAND_GSM_DCS_1800");
    case 48:
      return CFSTR("SYS_BAND_GSM_PCS_1900");
    case 80:
      return CFSTR("SYS_BAND_WCDMA_I_IMT_2000");
    case 81:
      return CFSTR("SYS_BAND_WCDMA_II_PCS_1900");
    case 82:
      return CFSTR("SYS_BAND_WCDMA_III_1700");
    case 83:
      return CFSTR("SYS_BAND_WCDMA_IV_1700");
    case 84:
      return CFSTR("SYS_BAND_WCDMA_V_850");
    case 85:
      return CFSTR("SYS_BAND_WCDMA_VI_800");
    case 86:
      return CFSTR("SYS_BAND_WCDMA_VII_2600");
    case 87:
      return CFSTR("SYS_BAND_WCDMA_VIII_900");
    case 88:
      return CFSTR("SYS_BAND_WCDMA_IX_1700");
    case 90:
      return CFSTR("SYS_BAND_WCDMA_XI_1500");
    case 91:
      return CFSTR("SYS_BAND_WCDMA_XIX_850");
    case 120:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND1");
    case 121:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND2");
    case 122:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND3");
    case 123:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND4");
    case 124:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND5");
    case 125:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND6");
    case 126:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND7");
    case 127:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND8");
    case 128:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND9");
    case 129:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND10");
    case 130:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND11");
    case 131:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND12");
    case 132:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND13");
    case 133:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND14");
    case 136:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND17");
    case 137:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND18");
    case 138:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND19");
    case 139:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND20");
    case 140:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND21");
    case 143:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND24");
    case 144:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND25");
    case 145:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND26");
    case 152:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND33");
    case 153:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND34");
    case 154:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND35");
    case 155:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND36");
    case 156:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND37");
    case 157:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND38");
    case 158:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND39");
    case 159:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND40");
    case 160:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND41");
    case 161:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND42");
    case 162:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND43");
    case 163:
      return CFSTR("SYS_BAND_UMTS_BAND1");
    case 164:
      return CFSTR("SYS_BAND_UMTS_BAND2");
    case 165:
      return CFSTR("SYS_BAND_UMTS_BAND3");
    case 166:
      return CFSTR("SYS_BAND_UMTS_BAND4");
    case 167:
      return CFSTR("SYS_BAND_UMTS_BAND5");
    case 168:
      return CFSTR("SYS_BAND_UMTS_BAND6");
    default:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsBand:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC0")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC3")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC4")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC5")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC6")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC7")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC8")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC9")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC10")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC11")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC12")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC13")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC14")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC15")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC16")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC17")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC18")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC19")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_450")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_480")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_750")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_850")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_EGSM_900")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_PGSM_900")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_RGSM_900")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_DCS_1800")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_PCS_1900")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_I_IMT_2000")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_II_PCS_1900")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_III_1700")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_IV_1700")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_V_850")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_VI_800")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_VII_2600")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_VIII_900")) & 1) != 0)
  {
    v4 = 87;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_IX_1700")) & 1) != 0)
  {
    v4 = 88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_XI_1500")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_XIX_850")) & 1) != 0)
  {
    v4 = 91;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND1")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND2")) & 1) != 0)
  {
    v4 = 121;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND3")) & 1) != 0)
  {
    v4 = 122;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND4")) & 1) != 0)
  {
    v4 = 123;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND5")) & 1) != 0)
  {
    v4 = 124;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND6")) & 1) != 0)
  {
    v4 = 125;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND7")) & 1) != 0)
  {
    v4 = 126;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND8")) & 1) != 0)
  {
    v4 = 127;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND9")) & 1) != 0)
  {
    v4 = 128;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND10")) & 1) != 0)
  {
    v4 = 129;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND11")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND12")) & 1) != 0)
  {
    v4 = 131;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND13")) & 1) != 0)
  {
    v4 = 132;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND14")) & 1) != 0)
  {
    v4 = 133;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND17")) & 1) != 0)
  {
    v4 = 136;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND18")) & 1) != 0)
  {
    v4 = 137;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND19")) & 1) != 0)
  {
    v4 = 138;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND20")) & 1) != 0)
  {
    v4 = 139;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND21")) & 1) != 0)
  {
    v4 = 140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND24")) & 1) != 0)
  {
    v4 = 143;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND25")) & 1) != 0)
  {
    v4 = 144;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND26")) & 1) != 0)
  {
    v4 = 145;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND33")) & 1) != 0)
  {
    v4 = 152;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND34")) & 1) != 0)
  {
    v4 = 153;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND35")) & 1) != 0)
  {
    v4 = 154;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND36")) & 1) != 0)
  {
    v4 = 155;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND37")) & 1) != 0)
  {
    v4 = 156;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND38")) & 1) != 0)
  {
    v4 = 157;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND39")) & 1) != 0)
  {
    v4 = 158;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND40")) & 1) != 0)
  {
    v4 = 159;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND41")) & 1) != 0)
  {
    v4 = 160;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND42")) & 1) != 0)
  {
    v4 = 161;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND43")) & 1) != 0)
  {
    v4 = 162;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND1")) & 1) != 0)
  {
    v4 = 163;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND2")) & 1) != 0)
  {
    v4 = 164;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND3")) & 1) != 0)
  {
    v4 = 165;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND4")) & 1) != 0)
  {
    v4 = 166;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND5")) & 1) != 0)
  {
    v4 = 167;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND6")))
  {
    v4 = 168;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRfChannel:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_rfChannel = a3;
}

- (void)setHasRfChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasRfChannel
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setPsc:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasPsc
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setTtyMode:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_ttyMode = a3;
}

- (void)setHasTtyMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTtyMode
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setTsAccuracyHour:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_tsAccuracyHour = a3;
}

- (void)setHasTsAccuracyHour:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTsAccuracyHour
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setAccessoryAttached:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_accessoryAttached = a3;
}

- (void)setHasAccessoryAttached:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasAccessoryAttached
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (int)setupSysMode
{
  if ((*((_BYTE *)&self->_has + 5) & 4) != 0)
    return self->_setupSysMode;
  else
    return 0;
}

- (void)setSetupSysMode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_setupSysMode = a3;
}

- (void)setHasSetupSysMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasSetupSysMode
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (id)setupSysModeAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025EAF8 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsSetupSysMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NO_SRV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE_V2")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GSM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_HDR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WCDMA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_EHRPD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GW")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_WLAN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_LTE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_GWL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_UMTS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_NR5G")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_MODE_CDMA_HDR")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)setupDirection
{
  if ((*((_BYTE *)&self->_has + 5) & 2) != 0)
    return self->_setupDirection;
  else
    return 0;
}

- (void)setSetupDirection:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_setupDirection = a3;
}

- (void)setHasSetupDirection:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasSetupDirection
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (id)setupDirectionAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EB78 + a3);
}

- (int)StringAsSetupDirection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_DIRECTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_DIRECTION_MO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CM_CALL_DIRECTION_MT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSl2:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_sl2 = a3;
}

- (void)setHasSl2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSl2
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 5) & 1;
}

- (void)setCoexPolicy:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_coexPolicy = a3;
}

- (void)setHasCoexPolicy:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCoexPolicy
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSl:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_sl = a3;
}

- (void)setHasSl:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSl
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (void)setFb:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_fb = a3;
}

- (void)setHasFb:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFb
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (void)setMsOrigToFb:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_msOrigToFb = a3;
}

- (void)setHasMsOrigToFb:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasMsOrigToFb
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setMsOrigToConf:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_msOrigToConf = a3;
}

- (void)setHasMsOrigToConf:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasMsOrigToConf
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setMsOrigToEnd:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_msOrigToEnd = a3;
}

- (void)setHasMsOrigToEnd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasMsOrigToEnd
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMsStartToAlert:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_msStartToAlert = a3;
}

- (void)setHasMsStartToAlert:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasMsStartToAlert
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setMsFbToSetup:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_msFbToSetup = a3;
}

- (void)setHasMsFbToSetup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMsFbToSetup
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setMsPageToSetup:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_msPageToSetup = a3;
}

- (void)setHasMsPageToSetup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasMsPageToSetup
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setMsSetupToEnd:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_msSetupToEnd = a3;
}

- (void)setHasMsSetupToEnd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasMsSetupToEnd
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setEcioDbx2:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_ecioDbx2 = a3;
}

- (void)setHasEcioDbx2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasEcioDbx2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRssiDbm:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_rssiDbm = a3;
}

- (void)setHasRssiDbm:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasRssiDbm
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setTxPwrDbm:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_txPwrDbm = a3;
}

- (void)setHasTxPwrDbm:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxPwrDbm
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setSensorUseDuringLastCallMs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_sensorUseDuringLastCallMs = a3;
}

- (void)setHasSensorUseDuringLastCallMs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasSensorUseDuringLastCallMs
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setSensorEndToPresentMs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_sensorEndToPresentMs = a3;
}

- (void)setHasSensorEndToPresentMs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasSensorEndToPresentMs
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)clearCapEvents
{
  -[NSMutableArray removeAllObjects](self->_capEvents, "removeAllObjects");
}

- (void)addCapEvent:(id)a3
{
  id v4;
  NSMutableArray *capEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  capEvents = self->_capEvents;
  v8 = v4;
  if (!capEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_capEvents;
    self->_capEvents = v6;

    v4 = v8;
    capEvents = self->_capEvents;
  }
  -[NSMutableArray addObject:](capEvents, "addObject:", v4);

}

- (unint64_t)capEventsCount
{
  return (unint64_t)-[NSMutableArray count](self->_capEvents, "count");
}

- (id)capEventAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_capEvents, "objectAtIndex:", a3);
}

+ (Class)capEventType
{
  return (Class)objc_opt_class(CapEvent, a2);
}

- (void)setSubsId:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasSubsId
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= (unint64_t)&_mh_execute_header;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  const mach_header_64 *v3;

  v3 = &_mh_execute_header;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | (unint64_t)v3);
}

- (BOOL)hasNumSubs
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHoType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_hoType = a3;
}

- (void)setHasHoType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasHoType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHstState:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_hstState = a3;
}

- (void)setHasHstState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasHstState
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setRrcRelCause:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_rrcRelCause = a3;
}

- (void)setHasRrcRelCause:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasRrcRelCause
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)clearRfMeasInfos
{
  -[NSMutableArray removeAllObjects](self->_rfMeasInfos, "removeAllObjects");
}

- (void)addRfMeasInfo:(id)a3
{
  id v4;
  NSMutableArray *rfMeasInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rfMeasInfos = self->_rfMeasInfos;
  v8 = v4;
  if (!rfMeasInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_rfMeasInfos;
    self->_rfMeasInfos = v6;

    v4 = v8;
    rfMeasInfos = self->_rfMeasInfos;
  }
  -[NSMutableArray addObject:](rfMeasInfos, "addObject:", v4);

}

- (unint64_t)rfMeasInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_rfMeasInfos, "count");
}

- (id)rfMeasInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_rfMeasInfos, "objectAtIndex:", a3);
}

+ (Class)rfMeasInfoType
{
  return (Class)objc_opt_class(RfMeasInfo, a2);
}

- (void)setIsSrvccSuccess:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_isSrvccSuccess = a3;
}

- (void)setHasIsSrvccSuccess:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasIsSrvccSuccess
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)srvccTargetRat
{
  if ((*((_BYTE *)&self->_has + 5) & 0x40) != 0)
    return self->_srvccTargetRat;
  else
    return 0;
}

- (void)setSrvccTargetRat:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_srvccTargetRat = a3;
}

- (void)setHasSrvccTargetRat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSrvccTargetRat
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (id)srvccTargetRatAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EB90 + a3);
}

- (int)StringAsSrvccTargetRat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_RAT_GSM")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_RAT_UMTS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_RAT_LTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_RAT_TDS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_RAT_NR5G")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSrvccFailureCause:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_srvccFailureCause = a3;
}

- (void)setHasSrvccFailureCause:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSrvccFailureCause
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setLastMotionState:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_lastMotionState = a3;
}

- (void)setHasLastMotionState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasLastMotionState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMsSinceLastMotionState:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_msSinceLastMotionState = a3;
}

- (void)setHasMsSinceLastMotionState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasMsSinceLastMotionState
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (BOOL)hasTransId
{
  return self->_transId != 0;
}

- (void)setVersion:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($5C7AF59FAF9AD3B0058052679E7AB9DE)(*(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularCallEndDetails;
  v3 = -[CellularCallEndDetails description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallEndDetails dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has;
  void *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v13;
  void *v14;
  id v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v22;
  void *v23;
  NSString *transId;
  void *v25;
  id v26;
  void *v28;
  int callEvent;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t srvccTargetRat;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t direction;
  void *v43;
  int v44;
  void *v45;
  uint64_t sysMode;
  void *v47;
  uint64_t callState;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t antenna;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t setupSysMode;
  void *v78;
  uint64_t setupDirection;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_127;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  callEvent = self->_callEvent;
  if (callEvent > 26)
  {
    if (callEvent > 110)
    {
      switch(callEvent)
      {
        case 'o':
          v30 = CFSTR("CM_CALL_EVENT_HO_COMPLETE");
          goto LABEL_126;
        case 'p':
          v30 = CFSTR("CM_CALL_EVENT_MT_CALL_PAGE_FAIL");
          goto LABEL_126;
        case 'u':
          v30 = CFSTR("CM_CALL_EVENT_ALERT");
          goto LABEL_126;
      }
    }
    else
    {
      switch(callEvent)
      {
        case 27:
          v30 = CFSTR("CM_CALL_EVENT_SETUP_IND");
          goto LABEL_126;
        case 29:
          v30 = CFSTR("CM_CALL_EVENT_CALL_CONF");
          goto LABEL_126;
        case 56:
          v30 = CFSTR("CM_CALL_EVENT_ALERTING");
          goto LABEL_126;
      }
    }
LABEL_125:
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_callEvent));
  }
  else
  {
    v30 = CFSTR("CM_CALL_EVENT_ORIG");
    switch(callEvent)
    {
      case 0:
        break;
      case 1:
        v30 = CFSTR("CM_CALL_EVENT_ANSWER");
        break;
      case 2:
        v30 = CFSTR("CM_CALL_EVENT_END_REQ");
        break;
      case 3:
        v30 = CFSTR("CM_CALL_EVENT_END");
        break;
      case 4:
        v30 = CFSTR("CM_CALL_EVENT_SUPS");
        break;
      case 5:
        v30 = CFSTR("CM_CALL_EVENT_INCOM");
        break;
      case 6:
        v30 = CFSTR("CM_CALL_EVENT_CONNECT");
        break;
      case 11:
        v30 = CFSTR("CM_CALL_EVENT_ABRV_ALERT");
        break;
      default:
        goto LABEL_125;
    }
  }
LABEL_126:
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("call_event"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_128;
  }
LABEL_127:
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_callId));
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("call_id"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_6;
    goto LABEL_132;
  }
LABEL_128:
  direction = self->_direction;
  if (direction >= 3)
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_direction));
  else
    v43 = *(&off_10025EB78 + direction);
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("direction"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_7;
    goto LABEL_136;
  }
LABEL_132:
  v44 = self->_srvType + 1;
  if (v44 >= 0x18)
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_srvType));
  else
    v45 = *(&off_10025E958 + v44);
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("srv_type"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_141;
  }
LABEL_136:
  sysMode = self->_sysMode;
  if (sysMode < 0x10 && ((0x9FFFu >> sysMode) & 1) != 0)
    v47 = *(&off_10025EAF8 + sysMode);
  else
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sysMode));
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("sys_mode"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_145;
  }
LABEL_141:
  callState = self->_callState;
  if (callState >= 6)
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_callState));
  else
    v49 = *(&off_10025EA18 + callState);
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("call_state"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_146;
  }
LABEL_145:
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_endStatus));
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("end_status"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_11;
    goto LABEL_147;
  }
LABEL_146:
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ccCause));
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("cc_cause"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_148;
  }
LABEL_147:
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_qmiReleaseCause));
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("qmi_release_cause"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_13;
    goto LABEL_149;
  }
LABEL_148:
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_callDuration));
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("call_duration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_153;
  }
LABEL_149:
  antenna = self->_antenna;
  if (antenna >= 4)
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_antenna));
  else
    v55 = *(&off_10025EA48 + antenna);
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("antenna"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&has & 0x100000000000000) == 0)
      goto LABEL_15;
    goto LABEL_157;
  }
LABEL_153:
  v56 = self->_callType + 1;
  if (v56 >= 0x12)
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_callType));
  else
    v57 = *(&off_10025EA68 + v56);
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("call_type"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x80000000000000) == 0)
      goto LABEL_16;
    goto LABEL_158;
  }
LABEL_157:
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_established));
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("established"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_159;
  }
LABEL_158:
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_connected));
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("connected"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_160;
  }
LABEL_159:
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lteCellId));
  objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("lte_cell_id"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&has & 0x20000000000000) == 0)
      goto LABEL_19;
    goto LABEL_161;
  }
LABEL_160:
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("cell_id"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_20;
    goto LABEL_162;
  }
LABEL_161:
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_zoneId));
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("zone_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_163;
  }
LABEL_162:
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_baseId));
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("base_id"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_22;
    goto LABEL_164;
  }
LABEL_163:
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lteLac));
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("lte_lac"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_165;
  }
LABEL_164:
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sid));
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("sid"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_166;
  }
LABEL_165:
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc));
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("mcc"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_167;
  }
LABEL_166:
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc));
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("mnc"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x800000000000000) == 0)
      goto LABEL_26;
    goto LABEL_168;
  }
LABEL_167:
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
  objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("lac"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x400000000000000) == 0)
      goto LABEL_27;
    goto LABEL_169;
  }
LABEL_168:
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_mrabEver));
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("mrab_ever"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_28;
    goto LABEL_170;
  }
LABEL_169:
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_mrabEnd));
  objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("mrab_end"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_29;
    goto LABEL_250;
  }
LABEL_170:
  v71 = CFSTR("SYS_BAND_BC0");
  switch(self->_band)
  {
    case 0:
      break;
    case 1:
      v71 = CFSTR("SYS_BAND_BC1");
      break;
    case 3:
      v71 = CFSTR("SYS_BAND_BC3");
      break;
    case 4:
      v71 = CFSTR("SYS_BAND_BC4");
      break;
    case 5:
      v71 = CFSTR("SYS_BAND_BC5");
      break;
    case 6:
      v71 = CFSTR("SYS_BAND_BC6");
      break;
    case 7:
      v71 = CFSTR("SYS_BAND_BC7");
      break;
    case 8:
      v71 = CFSTR("SYS_BAND_BC8");
      break;
    case 9:
      v71 = CFSTR("SYS_BAND_BC9");
      break;
    case 0xA:
      v71 = CFSTR("SYS_BAND_BC10");
      break;
    case 0xB:
      v71 = CFSTR("SYS_BAND_BC11");
      break;
    case 0xC:
      v71 = CFSTR("SYS_BAND_BC12");
      break;
    case 0xD:
      v71 = CFSTR("SYS_BAND_BC13");
      break;
    case 0xE:
      v71 = CFSTR("SYS_BAND_BC14");
      break;
    case 0xF:
      v71 = CFSTR("SYS_BAND_BC15");
      break;
    case 0x10:
      v71 = CFSTR("SYS_BAND_BC16");
      break;
    case 0x11:
      v71 = CFSTR("SYS_BAND_BC17");
      break;
    case 0x12:
      v71 = CFSTR("SYS_BAND_BC18");
      break;
    case 0x13:
      v71 = CFSTR("SYS_BAND_BC19");
      break;
    case 0x28:
      v71 = CFSTR("SYS_BAND_GSM_450");
      break;
    case 0x29:
      v71 = CFSTR("SYS_BAND_GSM_480");
      break;
    case 0x2A:
      v71 = CFSTR("SYS_BAND_GSM_750");
      break;
    case 0x2B:
      v71 = CFSTR("SYS_BAND_GSM_850");
      break;
    case 0x2C:
      v71 = CFSTR("SYS_BAND_GSM_EGSM_900");
      break;
    case 0x2D:
      v71 = CFSTR("SYS_BAND_GSM_PGSM_900");
      break;
    case 0x2E:
      v71 = CFSTR("SYS_BAND_GSM_RGSM_900");
      break;
    case 0x2F:
      v71 = CFSTR("SYS_BAND_GSM_DCS_1800");
      break;
    case 0x30:
      v71 = CFSTR("SYS_BAND_GSM_PCS_1900");
      break;
    case 0x50:
      v71 = CFSTR("SYS_BAND_WCDMA_I_IMT_2000");
      break;
    case 0x51:
      v71 = CFSTR("SYS_BAND_WCDMA_II_PCS_1900");
      break;
    case 0x52:
      v71 = CFSTR("SYS_BAND_WCDMA_III_1700");
      break;
    case 0x53:
      v71 = CFSTR("SYS_BAND_WCDMA_IV_1700");
      break;
    case 0x54:
      v71 = CFSTR("SYS_BAND_WCDMA_V_850");
      break;
    case 0x55:
      v71 = CFSTR("SYS_BAND_WCDMA_VI_800");
      break;
    case 0x56:
      v71 = CFSTR("SYS_BAND_WCDMA_VII_2600");
      break;
    case 0x57:
      v71 = CFSTR("SYS_BAND_WCDMA_VIII_900");
      break;
    case 0x58:
      v71 = CFSTR("SYS_BAND_WCDMA_IX_1700");
      break;
    case 0x5A:
      v71 = CFSTR("SYS_BAND_WCDMA_XI_1500");
      break;
    case 0x5B:
      v71 = CFSTR("SYS_BAND_WCDMA_XIX_850");
      break;
    case 0x78:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND1");
      break;
    case 0x79:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND2");
      break;
    case 0x7A:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND3");
      break;
    case 0x7B:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND4");
      break;
    case 0x7C:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND5");
      break;
    case 0x7D:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND6");
      break;
    case 0x7E:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND7");
      break;
    case 0x7F:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND8");
      break;
    case 0x80:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND9");
      break;
    case 0x81:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND10");
      break;
    case 0x82:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND11");
      break;
    case 0x83:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND12");
      break;
    case 0x84:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND13");
      break;
    case 0x85:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND14");
      break;
    case 0x88:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND17");
      break;
    case 0x89:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND18");
      break;
    case 0x8A:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND19");
      break;
    case 0x8B:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND20");
      break;
    case 0x8C:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND21");
      break;
    case 0x8F:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND24");
      break;
    case 0x90:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND25");
      break;
    case 0x91:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND26");
      break;
    case 0x98:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND33");
      break;
    case 0x99:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND34");
      break;
    case 0x9A:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND35");
      break;
    case 0x9B:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND36");
      break;
    case 0x9C:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND37");
      break;
    case 0x9D:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND38");
      break;
    case 0x9E:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND39");
      break;
    case 0x9F:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND40");
      break;
    case 0xA0:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND41");
      break;
    case 0xA1:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND42");
      break;
    case 0xA2:
      v71 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND43");
      break;
    case 0xA3:
      v71 = CFSTR("SYS_BAND_UMTS_BAND1");
      break;
    case 0xA4:
      v71 = CFSTR("SYS_BAND_UMTS_BAND2");
      break;
    case 0xA5:
      v71 = CFSTR("SYS_BAND_UMTS_BAND3");
      break;
    case 0xA6:
      v71 = CFSTR("SYS_BAND_UMTS_BAND4");
      break;
    case 0xA7:
      v71 = CFSTR("SYS_BAND_UMTS_BAND5");
      break;
    case 0xA8:
      v71 = CFSTR("SYS_BAND_UMTS_BAND6");
      break;
    default:
      v71 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_band));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("band"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_251;
  }
LABEL_250:
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rfChannel));
  objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("rf_channel"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x4000000000000) == 0)
      goto LABEL_31;
    goto LABEL_252;
  }
LABEL_251:
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psc));
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("psc"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x2000000000000) == 0)
      goto LABEL_32;
    goto LABEL_253;
  }
LABEL_252:
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ttyMode));
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("tty_mode"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x40000000000000) == 0)
      goto LABEL_33;
    goto LABEL_254;
  }
LABEL_253:
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tsAccuracyHour));
  objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("ts_accuracy_hour"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_34;
    goto LABEL_255;
  }
LABEL_254:
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_accessoryAttached));
  objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("accessory_attached"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_35;
    goto LABEL_260;
  }
LABEL_255:
  setupSysMode = self->_setupSysMode;
  if (setupSysMode < 0x10 && ((0x9FFFu >> setupSysMode) & 1) != 0)
    v78 = *(&off_10025EAF8 + setupSysMode);
  else
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_setupSysMode));
  objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("setup_sys_mode"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x2000000000000000) == 0)
      goto LABEL_36;
    goto LABEL_264;
  }
LABEL_260:
  setupDirection = self->_setupDirection;
  if (setupDirection >= 3)
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_setupDirection));
  else
    v80 = *(&off_10025EB78 + setupDirection);
  objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("setup_direction"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_37;
    goto LABEL_265;
  }
LABEL_264:
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_sl2));
  objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("sl2"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x1000000000000000) == 0)
      goto LABEL_38;
    goto LABEL_266;
  }
LABEL_265:
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_coexPolicy));
  objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("coex_policy"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x200000000000000) == 0)
      goto LABEL_39;
    goto LABEL_267;
  }
LABEL_266:
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_sl));
  objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("sl"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_268;
  }
LABEL_267:
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_fb));
  objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("fb"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_41;
    goto LABEL_269;
  }
LABEL_268:
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msOrigToFb));
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("ms_orig_to_fb"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_42;
    goto LABEL_270;
  }
LABEL_269:
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msOrigToConf));
  objc_msgSend(v3, "setObject:forKey:", v86, CFSTR("ms_orig_to_conf"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_43;
    goto LABEL_271;
  }
LABEL_270:
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msOrigToEnd));
  objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("ms_orig_to_end"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_44;
    goto LABEL_272;
  }
LABEL_271:
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msStartToAlert));
  objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("ms_start_to_alert"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_45;
    goto LABEL_273;
  }
LABEL_272:
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msFbToSetup));
  objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("ms_fb_to_setup"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_46;
    goto LABEL_274;
  }
LABEL_273:
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msPageToSetup));
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("ms_page_to_setup"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_47;
    goto LABEL_275;
  }
LABEL_274:
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msSetupToEnd));
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("ms_setup_to_end"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_48;
    goto LABEL_276;
  }
LABEL_275:
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_ecioDbx2));
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("ecio_dbx2"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&has & 0x8000000000000) == 0)
      goto LABEL_49;
    goto LABEL_277;
  }
LABEL_276:
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rssiDbm));
  objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("rssi_dbm"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_50;
    goto LABEL_278;
  }
LABEL_277:
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_txPwrDbm));
  objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("tx_pwr_dbm"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_278:
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sensorUseDuringLastCallMs));
  objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("sensor_use_during_last_call_ms"));

  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
  {
LABEL_51:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sensorEndToPresentMs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sensor_end_to_present_ms"));

  }
LABEL_52:
  if (-[NSMutableArray count](self->_capEvents, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_capEvents, "count"));
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v7 = self->_capEvents;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v100, v105, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v101 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v100, v105, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("cap_event"));
  }
  v13 = self->_has;
  if ((*(_QWORD *)&v13 & 0x800000000000) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("subs_id"));

    v13 = self->_has;
    if ((*(_QWORD *)&v13 & 0x100000000) == 0)
    {
LABEL_63:
      if ((*(_QWORD *)&v13 & 0x200000000) == 0)
        goto LABEL_64;
      goto LABEL_94;
    }
  }
  else if ((*(_QWORD *)&v13 & 0x100000000) == 0)
  {
    goto LABEL_63;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("num_subs"));

  v13 = self->_has;
  if ((*(_QWORD *)&v13 & 0x200000000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&v13 & 0x8000) == 0)
      goto LABEL_65;
    goto LABEL_95;
  }
LABEL_94:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("ps_pref"));

  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v13 & 0x10000) == 0)
      goto LABEL_66;
    goto LABEL_96;
  }
LABEL_95:
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hoType));
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("ho_type"));

  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_66:
    if ((*(_QWORD *)&v13 & 0x2000000000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_96:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hstState));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("hst_state"));

  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
  {
LABEL_67:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rrcRelCause));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("rrc_rel_cause"));

  }
LABEL_68:
  if (-[NSMutableArray count](self->_rfMeasInfos, "count"))
  {
    v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_rfMeasInfos, "count"));
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v16 = self->_rfMeasInfos;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v97;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v97 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("rf_meas_info"));
  }
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x20000) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_isSrvccSuccess));
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("is_srvcc_success"));

    v22 = self->_has;
    if ((*(_QWORD *)&v22 & 0x400000000000) == 0)
    {
LABEL_79:
      if ((*(_QWORD *)&v22 & 0x200000000000) == 0)
        goto LABEL_80;
      goto LABEL_103;
    }
  }
  else if ((*(_QWORD *)&v22 & 0x400000000000) == 0)
  {
    goto LABEL_79;
  }
  srvccTargetRat = self->_srvccTargetRat;
  if (srvccTargetRat >= 5)
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_srvccTargetRat));
  else
    v38 = *(&off_10025EB90 + srvccTargetRat);
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("srvcc_target_rat"));

  v22 = self->_has;
  if ((*(_QWORD *)&v22 & 0x200000000000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v22 & 0x80000) == 0)
      goto LABEL_81;
    goto LABEL_104;
  }
LABEL_103:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_srvccFailureCause));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("srvcc_failure_cause"));

  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000) == 0)
  {
LABEL_81:
    if ((*(_DWORD *)&v22 & 0x40000000) == 0)
      goto LABEL_83;
    goto LABEL_82;
  }
LABEL_104:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lastMotionState));
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("last_motion_state"));

  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_82:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msSinceLastMotionState));
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("ms_since_last_motion_state"));

  }
LABEL_83:
  transId = self->_transId;
  if (transId)
    objc_msgSend(v3, "setObject:forKey:", transId, CFSTR("trans_id"));
  if ((*((_BYTE *)&self->_has + 6) & 0x10) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("version"));

  }
  v26 = v3;

  return v26;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100027560(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v18;
  NSString *transId;
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
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_86;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v5, self->_callEvent, 2);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field(v5, self->_callId, 3);
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_6;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteInt32Field(v5, self->_direction, 4);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_7;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteInt32Field(v5, self->_srvType, 5);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteInt32Field(v5, self->_sysMode, 6);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteInt32Field(v5, self->_callState, 7);
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_10;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt32Field(v5, self->_endStatus, 8);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteInt32Field(v5, self->_qmiReleaseCause, 9);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteSint32Field(v5, self->_callDuration, 10);
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_13;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field(v5, self->_ccCause, 11);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt32Field(v5, self->_antenna, 12);
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&has & 0x100000000000000) == 0)
      goto LABEL_15;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt32Field(v5, self->_callType, 13);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x80000000000000) == 0)
      goto LABEL_16;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteBOOLField(v5, self->_established, 14);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteBOOLField(v5, self->_connected, 15);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field(v5, self->_lteCellId, 16);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&has & 0x20000000000000) == 0)
      goto LABEL_19;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field(v5, self->_cellId, 17);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_20;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field(v5, self->_zoneId, 18);
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field(v5, self->_baseId, 19);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_22;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field(v5, self->_lteLac, 20);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint32Field(v5, self->_sid, 21);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint32Field(v5, self->_mcc, 22);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint32Field(v5, self->_mnc, 23);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x800000000000000) == 0)
      goto LABEL_26;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint32Field(v5, self->_lac, 24);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x400000000000000) == 0)
      goto LABEL_27;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteBOOLField(v5, self->_mrabEver, 25);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_28;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteBOOLField(v5, self->_mrabEnd, 26);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_29;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteInt32Field(v5, self->_band, 28);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field(v5, self->_rfChannel, 29);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x4000000000000) == 0)
      goto LABEL_31;
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint32Field(v5, self->_psc, 30);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x2000000000000) == 0)
      goto LABEL_32;
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint32Field(v5, self->_ttyMode, 31);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x40000000000000) == 0)
      goto LABEL_33;
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint32Field(v5, self->_tsAccuracyHour, 32);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_34;
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteBOOLField(v5, self->_accessoryAttached, 33);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_35;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteInt32Field(v5, self->_setupSysMode, 35);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x2000000000000000) == 0)
      goto LABEL_36;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteInt32Field(v5, self->_setupDirection, 36);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_37;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteBOOLField(v5, self->_sl2, 37);
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x1000000000000000) == 0)
      goto LABEL_38;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint32Field(v5, self->_coexPolicy, 38);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x200000000000000) == 0)
      goto LABEL_39;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteBOOLField(v5, self->_sl, 39);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteBOOLField(v5, self->_fb, 40);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_41;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint32Field(v5, self->_msOrigToFb, 41);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_42;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint32Field(v5, self->_msOrigToConf, 42);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_43;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteUint32Field(v5, self->_msOrigToEnd, 43);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_44;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteUint32Field(v5, self->_msStartToAlert, 44);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_45;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteUint32Field(v5, self->_msFbToSetup, 46);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_46;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteUint32Field(v5, self->_msPageToSetup, 47);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_47;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteUint32Field(v5, self->_msSetupToEnd, 48);
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_48;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteSint32Field(v5, self->_ecioDbx2, 49);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&has & 0x8000000000000) == 0)
      goto LABEL_49;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteSint32Field(v5, self->_rssiDbm, 50);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_50;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteSint32Field(v5, self->_txPwrDbm, 51);
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_132:
  PBDataWriterWriteUint32Field(v5, self->_sensorUseDuringLastCallMs, 52);
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
LABEL_51:
    PBDataWriterWriteUint32Field(v5, self->_sensorEndToPresentMs, 53);
LABEL_52:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_capEvents;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v11), 55);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v12 = self->_has;
  if ((*(_QWORD *)&v12 & 0x800000000000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_subsId, 56);
    v12 = self->_has;
    if ((*(_QWORD *)&v12 & 0x100000000) == 0)
    {
LABEL_61:
      if ((*(_QWORD *)&v12 & 0x200000000) == 0)
        goto LABEL_62;
      goto LABEL_136;
    }
  }
  else if ((*(_QWORD *)&v12 & 0x100000000) == 0)
  {
    goto LABEL_61;
  }
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 57);
  v12 = self->_has;
  if ((*(_QWORD *)&v12 & 0x200000000) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&v12 & 0x8000) == 0)
      goto LABEL_63;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint32Field(v5, self->_psPref, 58);
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x8000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v12 & 0x10000) == 0)
      goto LABEL_64;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint32Field(v5, self->_hoType, 60);
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
LABEL_64:
    if ((*(_QWORD *)&v12 & 0x2000000000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_138:
  PBDataWriterWriteUint32Field(v5, self->_hstState, 61);
  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
LABEL_65:
    PBDataWriterWriteUint32Field(v5, self->_rrcRelCause, 62);
LABEL_66:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_rfMeasInfos;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v17), 68);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_isSrvccSuccess, 70);
    v18 = self->_has;
    if ((*(_QWORD *)&v18 & 0x400000000000) == 0)
    {
LABEL_75:
      if ((*(_QWORD *)&v18 & 0x200000000000) == 0)
        goto LABEL_76;
      goto LABEL_142;
    }
  }
  else if ((*(_QWORD *)&v18 & 0x400000000000) == 0)
  {
    goto LABEL_75;
  }
  PBDataWriterWriteInt32Field(v5, self->_srvccTargetRat, 71);
  v18 = self->_has;
  if ((*(_QWORD *)&v18 & 0x200000000000) == 0)
  {
LABEL_76:
    if ((*(_DWORD *)&v18 & 0x80000) == 0)
      goto LABEL_77;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint32Field(v5, self->_srvccFailureCause, 72);
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x80000) == 0)
  {
LABEL_77:
    if ((*(_DWORD *)&v18 & 0x40000000) == 0)
      goto LABEL_79;
    goto LABEL_78;
  }
LABEL_143:
  PBDataWriterWriteUint32Field(v5, self->_lastMotionState, 120);
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
LABEL_78:
    PBDataWriterWriteUint32Field(v5, self->_msSinceLastMotionState, 121);
LABEL_79:
  transId = self->_transId;
  if (transId)
    PBDataWriterWriteStringField(v5, transId, 123);
  if ((*((_BYTE *)&self->_has + 6) & 0x10) != 0)
    PBDataWriterWriteUint32Field(v5, self->_version, 124);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v15;
  char *v16;
  char *v17;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *(_QWORD *)((char *)v4 + 260) |= 1uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_80;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 8) = self->_callEvent;
  *(_QWORD *)((char *)v4 + 260) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)v4 + 9) = self->_callId;
  *(_QWORD *)((char *)v4 + 260) |= 0x40uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_6;
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v4 + 17) = self->_direction;
  *(_QWORD *)((char *)v4 + 260) |= 0x1000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_7;
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)v4 + 51) = self->_srvType;
  *(_QWORD *)((char *)v4 + 260) |= 0x100000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)v4 + 55) = self->_sysMode;
  *(_QWORD *)((char *)v4 + 260) |= 0x1000000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v4 + 10) = self->_callState;
  *(_QWORD *)((char *)v4 + 260) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_10;
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)v4 + 19) = self->_endStatus;
  *(_QWORD *)((char *)v4 + 260) |= 0x4000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)v4 + 40) = self->_qmiReleaseCause;
  *(_QWORD *)((char *)v4 + 260) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)v4 + 7) = self->_callDuration;
  *(_QWORD *)((char *)v4 + 260) |= 0x10uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_13;
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v4 + 14) = self->_ccCause;
  *(_QWORD *)((char *)v4 + 260) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v4 + 4) = self->_antenna;
  *(_QWORD *)((char *)v4 + 260) |= 2uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&has & 0x100000000000000) == 0)
      goto LABEL_15;
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v4 + 11) = self->_callType;
  *(_QWORD *)((char *)v4 + 260) |= 0x100uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x80000000000000) == 0)
      goto LABEL_16;
    goto LABEL_92;
  }
LABEL_91:
  *((_BYTE *)v4 + 254) = self->_established;
  *(_QWORD *)((char *)v4 + 260) |= 0x100000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_93;
  }
LABEL_92:
  *((_BYTE *)v4 + 253) = self->_connected;
  *(_QWORD *)((char *)v4 + 260) |= 0x80000000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v4 + 25) = self->_lteCellId;
  *(_QWORD *)((char *)v4 + 260) |= 0x100000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&has & 0x20000000000000) == 0)
      goto LABEL_19;
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v4 + 15) = self->_cellId;
  *(_QWORD *)((char *)v4 + 260) |= 0x400uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_20;
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)v4 + 62) = self->_zoneId;
  *(_QWORD *)((char *)v4 + 260) |= 0x20000000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)v4 + 6) = self->_baseId;
  *(_QWORD *)((char *)v4 + 260) |= 8uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_22;
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)v4 + 26) = self->_lteLac;
  *(_QWORD *)((char *)v4 + 260) |= 0x200000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v4 + 50) = self->_sid;
  *(_QWORD *)((char *)v4 + 260) |= 0x80000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v4 + 27) = self->_mcc;
  *(_QWORD *)((char *)v4 + 260) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v4 + 28) = self->_mnc;
  *(_QWORD *)((char *)v4 + 260) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x800000000000000) == 0)
      goto LABEL_26;
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v4 + 23) = self->_lac;
  *(_QWORD *)((char *)v4 + 260) |= 0x40000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x400000000000000) == 0)
      goto LABEL_27;
    goto LABEL_103;
  }
LABEL_102:
  *((_BYTE *)v4 + 257) = self->_mrabEver;
  *(_QWORD *)((char *)v4 + 260) |= 0x800000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_28;
    goto LABEL_104;
  }
LABEL_103:
  *((_BYTE *)v4 + 256) = self->_mrabEnd;
  *(_QWORD *)((char *)v4 + 260) |= 0x400000000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_29;
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)v4 + 5) = self->_band;
  *(_QWORD *)((char *)v4 + 260) |= 4uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)v4 + 41) = self->_rfChannel;
  *(_QWORD *)((char *)v4 + 260) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x4000000000000) == 0)
      goto LABEL_31;
    goto LABEL_107;
  }
LABEL_106:
  *((_DWORD *)v4 + 39) = self->_psc;
  *(_QWORD *)((char *)v4 + 260) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x2000000000000) == 0)
      goto LABEL_32;
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)v4 + 59) = self->_ttyMode;
  *(_QWORD *)((char *)v4 + 260) |= 0x4000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x40000000000000) == 0)
      goto LABEL_33;
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)v4 + 58) = self->_tsAccuracyHour;
  *(_QWORD *)((char *)v4 + 260) |= 0x2000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_34;
    goto LABEL_110;
  }
LABEL_109:
  *((_BYTE *)v4 + 252) = self->_accessoryAttached;
  *(_QWORD *)((char *)v4 + 260) |= 0x40000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_35;
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)v4 + 49) = self->_setupSysMode;
  *(_QWORD *)((char *)v4 + 260) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x2000000000000000) == 0)
      goto LABEL_36;
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)v4 + 48) = self->_setupDirection;
  *(_QWORD *)((char *)v4 + 260) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_37;
    goto LABEL_113;
  }
LABEL_112:
  *((_BYTE *)v4 + 259) = self->_sl2;
  *(_QWORD *)((char *)v4 + 260) |= 0x2000000000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x1000000000000000) == 0)
      goto LABEL_38;
    goto LABEL_114;
  }
LABEL_113:
  *((_DWORD *)v4 + 16) = self->_coexPolicy;
  *(_QWORD *)((char *)v4 + 260) |= 0x800uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x200000000000000) == 0)
      goto LABEL_39;
    goto LABEL_115;
  }
LABEL_114:
  *((_BYTE *)v4 + 258) = self->_sl;
  *(_QWORD *)((char *)v4 + 260) |= 0x1000000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_116;
  }
LABEL_115:
  *((_BYTE *)v4 + 255) = self->_fb;
  *(_QWORD *)((char *)v4 + 260) |= 0x200000000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_41;
    goto LABEL_117;
  }
LABEL_116:
  *((_DWORD *)v4 + 32) = self->_msOrigToFb;
  *(_QWORD *)((char *)v4 + 260) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_42;
    goto LABEL_118;
  }
LABEL_117:
  *((_DWORD *)v4 + 30) = self->_msOrigToConf;
  *(_QWORD *)((char *)v4 + 260) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_43;
    goto LABEL_119;
  }
LABEL_118:
  *((_DWORD *)v4 + 31) = self->_msOrigToEnd;
  *(_QWORD *)((char *)v4 + 260) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_44;
    goto LABEL_120;
  }
LABEL_119:
  *((_DWORD *)v4 + 36) = self->_msStartToAlert;
  *(_QWORD *)((char *)v4 + 260) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_45;
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)v4 + 29) = self->_msFbToSetup;
  *(_QWORD *)((char *)v4 + 260) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_46;
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)v4 + 33) = self->_msPageToSetup;
  *(_QWORD *)((char *)v4 + 260) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_47;
    goto LABEL_123;
  }
LABEL_122:
  *((_DWORD *)v4 + 34) = self->_msSetupToEnd;
  *(_QWORD *)((char *)v4 + 260) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_48;
    goto LABEL_124;
  }
LABEL_123:
  *((_DWORD *)v4 + 18) = self->_ecioDbx2;
  *(_QWORD *)((char *)v4 + 260) |= 0x2000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&has & 0x8000000000000) == 0)
      goto LABEL_49;
    goto LABEL_125;
  }
LABEL_124:
  *((_DWORD *)v4 + 45) = self->_rssiDbm;
  *(_QWORD *)((char *)v4 + 260) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_50;
LABEL_126:
    *((_DWORD *)v4 + 47) = self->_sensorUseDuringLastCallMs;
    *(_QWORD *)((char *)v4 + 260) |= 0x10000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x8000000000) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_125:
  *((_DWORD *)v4 + 60) = self->_txPwrDbm;
  *(_QWORD *)((char *)v4 + 260) |= 0x8000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
    goto LABEL_126;
LABEL_50:
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
LABEL_51:
    *((_DWORD *)v4 + 46) = self->_sensorEndToPresentMs;
    *(_QWORD *)((char *)v4 + 260) |= 0x8000000000uLL;
  }
LABEL_52:
  v17 = (char *)v4;
  if (-[CellularCallEndDetails capEventsCount](self, "capEventsCount"))
  {
    objc_msgSend(v17, "clearCapEvents");
    v6 = -[CellularCallEndDetails capEventsCount](self, "capEventsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallEndDetails capEventAtIndex:](self, "capEventAtIndex:", i));
        objc_msgSend(v17, "addCapEvent:", v9);

      }
    }
  }
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x800000000000) != 0)
  {
    *((_DWORD *)v17 + 54) = self->_subsId;
    *(_QWORD *)(v17 + 260) |= 0x800000000000uLL;
    v10 = self->_has;
    if ((*(_QWORD *)&v10 & 0x100000000) == 0)
    {
LABEL_58:
      if ((*(_QWORD *)&v10 & 0x200000000) == 0)
        goto LABEL_59;
      goto LABEL_130;
    }
  }
  else if ((*(_QWORD *)&v10 & 0x100000000) == 0)
  {
    goto LABEL_58;
  }
  *((_DWORD *)v17 + 37) = self->_numSubs;
  *(_QWORD *)(v17 + 260) |= (unint64_t)&_mh_execute_header;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x200000000) == 0)
  {
LABEL_59:
    if ((*(_WORD *)&v10 & 0x8000) == 0)
      goto LABEL_60;
    goto LABEL_131;
  }
LABEL_130:
  *((_DWORD *)v17 + 38) = self->_psPref;
  *(_QWORD *)(v17 + 260) |= 0x200000000uLL;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v10 & 0x10000) == 0)
      goto LABEL_61;
LABEL_132:
    *((_DWORD *)v17 + 21) = self->_hstState;
    *(_QWORD *)(v17 + 260) |= 0x10000uLL;
    if ((*(_QWORD *)&self->_has & 0x2000000000) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
LABEL_131:
  *((_DWORD *)v17 + 20) = self->_hoType;
  *(_QWORD *)(v17 + 260) |= 0x8000uLL;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
    goto LABEL_132;
LABEL_61:
  if ((*(_QWORD *)&v10 & 0x2000000000) != 0)
  {
LABEL_62:
    *((_DWORD *)v17 + 44) = self->_rrcRelCause;
    *(_QWORD *)(v17 + 260) |= 0x2000000000uLL;
  }
LABEL_63:
  if (-[CellularCallEndDetails rfMeasInfosCount](self, "rfMeasInfosCount"))
  {
    objc_msgSend(v17, "clearRfMeasInfos");
    v11 = -[CellularCallEndDetails rfMeasInfosCount](self, "rfMeasInfosCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallEndDetails rfMeasInfoAtIndex:](self, "rfMeasInfoAtIndex:", j));
        objc_msgSend(v17, "addRfMeasInfo:", v14);

      }
    }
  }
  v15 = self->_has;
  v16 = v17;
  if ((*(_DWORD *)&v15 & 0x20000) != 0)
  {
    *((_DWORD *)v17 + 22) = self->_isSrvccSuccess;
    *(_QWORD *)(v17 + 260) |= 0x20000uLL;
    v15 = self->_has;
    if ((*(_QWORD *)&v15 & 0x400000000000) == 0)
    {
LABEL_69:
      if ((*(_QWORD *)&v15 & 0x200000000000) == 0)
        goto LABEL_70;
      goto LABEL_136;
    }
  }
  else if ((*(_QWORD *)&v15 & 0x400000000000) == 0)
  {
    goto LABEL_69;
  }
  *((_DWORD *)v17 + 53) = self->_srvccTargetRat;
  *(_QWORD *)(v17 + 260) |= 0x400000000000uLL;
  v15 = self->_has;
  if ((*(_QWORD *)&v15 & 0x200000000000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v15 & 0x80000) == 0)
      goto LABEL_71;
    goto LABEL_137;
  }
LABEL_136:
  *((_DWORD *)v17 + 52) = self->_srvccFailureCause;
  *(_QWORD *)(v17 + 260) |= 0x200000000000uLL;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x80000) == 0)
  {
LABEL_71:
    if ((*(_DWORD *)&v15 & 0x40000000) == 0)
      goto LABEL_73;
    goto LABEL_72;
  }
LABEL_137:
  *((_DWORD *)v17 + 24) = self->_lastMotionState;
  *(_QWORD *)(v17 + 260) |= 0x80000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_72:
    *((_DWORD *)v17 + 35) = self->_msSinceLastMotionState;
    *(_QWORD *)(v17 + 260) |= 0x40000000uLL;
  }
LABEL_73:
  if (self->_transId)
  {
    objc_msgSend(v17, "setTransId:");
    v16 = v17;
  }
  if ((*((_BYTE *)&self->_has + 6) & 0x10) != 0)
  {
    *((_DWORD *)v16 + 61) = self->_version;
    *(_QWORD *)(v16 + 260) |= 0x10000000000000uLL;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  char *v6;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v21;
  id v22;
  void *v23;
  char *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = (char *)v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *(_QWORD *)((char *)v5 + 260) |= 1uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_84;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 8) = self->_callEvent;
  *(_QWORD *)((char *)v5 + 260) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v5 + 9) = self->_callId;
  *(_QWORD *)((char *)v5 + 260) |= 0x40uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_QWORD *)&has & 0x100000000000) == 0)
      goto LABEL_6;
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)v5 + 17) = self->_direction;
  *(_QWORD *)((char *)v5 + 260) |= 0x1000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&has & 0x1000000000000) == 0)
      goto LABEL_7;
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)v5 + 51) = self->_srvType;
  *(_QWORD *)((char *)v5 + 260) |= 0x100000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)v5 + 55) = self->_sysMode;
  *(_QWORD *)((char *)v5 + 260) |= 0x1000000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v5 + 10) = self->_callState;
  *(_QWORD *)((char *)v5 + 260) |= 0x80uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_10;
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v5 + 19) = self->_endStatus;
  *(_QWORD *)((char *)v5 + 260) |= 0x4000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v5 + 40) = self->_qmiReleaseCause;
  *(_QWORD *)((char *)v5 + 260) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v5 + 7) = self->_callDuration;
  *(_QWORD *)((char *)v5 + 260) |= 0x10uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_13;
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v5 + 14) = self->_ccCause;
  *(_QWORD *)((char *)v5 + 260) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v5 + 4) = self->_antenna;
  *(_QWORD *)((char *)v5 + 260) |= 2uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&has & 0x100000000000000) == 0)
      goto LABEL_15;
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v5 + 11) = self->_callType;
  *(_QWORD *)((char *)v5 + 260) |= 0x100uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000000000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x80000000000000) == 0)
      goto LABEL_16;
    goto LABEL_96;
  }
LABEL_95:
  *((_BYTE *)v5 + 254) = self->_established;
  *(_QWORD *)((char *)v5 + 260) |= 0x100000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_97;
  }
LABEL_96:
  *((_BYTE *)v5 + 253) = self->_connected;
  *(_QWORD *)((char *)v5 + 260) |= 0x80000000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)v5 + 25) = self->_lteCellId;
  *(_QWORD *)((char *)v5 + 260) |= 0x100000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&has & 0x20000000000000) == 0)
      goto LABEL_19;
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v5 + 15) = self->_cellId;
  *(_QWORD *)((char *)v5 + 260) |= 0x400uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_20;
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v5 + 62) = self->_zoneId;
  *(_QWORD *)((char *)v5 + 260) |= 0x20000000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v5 + 6) = self->_baseId;
  *(_QWORD *)((char *)v5 + 260) |= 8uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x80000000000) == 0)
      goto LABEL_22;
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v5 + 26) = self->_lteLac;
  *(_QWORD *)((char *)v5 + 260) |= 0x200000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x80000000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)v5 + 50) = self->_sid;
  *(_QWORD *)((char *)v5 + 260) |= 0x80000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)v5 + 27) = self->_mcc;
  *(_QWORD *)((char *)v5 + 260) |= 0x400000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)v5 + 28) = self->_mnc;
  *(_QWORD *)((char *)v5 + 260) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&has & 0x800000000000000) == 0)
      goto LABEL_26;
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)v5 + 23) = self->_lac;
  *(_QWORD *)((char *)v5 + 260) |= 0x40000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x400000000000000) == 0)
      goto LABEL_27;
    goto LABEL_107;
  }
LABEL_106:
  *((_BYTE *)v5 + 257) = self->_mrabEver;
  *(_QWORD *)((char *)v5 + 260) |= 0x800000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000000000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_28;
    goto LABEL_108;
  }
LABEL_107:
  *((_BYTE *)v5 + 256) = self->_mrabEnd;
  *(_QWORD *)((char *)v5 + 260) |= 0x400000000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_29;
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)v5 + 5) = self->_band;
  *(_QWORD *)((char *)v5 + 260) |= 4uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)v5 + 41) = self->_rfChannel;
  *(_QWORD *)((char *)v5 + 260) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x4000000000000) == 0)
      goto LABEL_31;
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)v5 + 39) = self->_psc;
  *(_QWORD *)((char *)v5 + 260) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000000) == 0)
  {
LABEL_31:
    if ((*(_QWORD *)&has & 0x2000000000000) == 0)
      goto LABEL_32;
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)v5 + 59) = self->_ttyMode;
  *(_QWORD *)((char *)v5 + 260) |= 0x4000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&has & 0x40000000000000) == 0)
      goto LABEL_33;
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)v5 + 58) = self->_tsAccuracyHour;
  *(_QWORD *)((char *)v5 + 260) |= 0x2000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_34;
    goto LABEL_114;
  }
LABEL_113:
  *((_BYTE *)v5 + 252) = self->_accessoryAttached;
  *(_QWORD *)((char *)v5 + 260) |= 0x40000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_35;
    goto LABEL_115;
  }
LABEL_114:
  *((_DWORD *)v5 + 49) = self->_setupSysMode;
  *(_QWORD *)((char *)v5 + 260) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x2000000000000000) == 0)
      goto LABEL_36;
    goto LABEL_116;
  }
LABEL_115:
  *((_DWORD *)v5 + 48) = self->_setupDirection;
  *(_QWORD *)((char *)v5 + 260) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_37;
    goto LABEL_117;
  }
LABEL_116:
  *((_BYTE *)v5 + 259) = self->_sl2;
  *(_QWORD *)((char *)v5 + 260) |= 0x2000000000000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x1000000000000000) == 0)
      goto LABEL_38;
    goto LABEL_118;
  }
LABEL_117:
  *((_DWORD *)v5 + 16) = self->_coexPolicy;
  *(_QWORD *)((char *)v5 + 260) |= 0x800uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x200000000000000) == 0)
      goto LABEL_39;
    goto LABEL_119;
  }
LABEL_118:
  *((_BYTE *)v5 + 258) = self->_sl;
  *(_QWORD *)((char *)v5 + 260) |= 0x1000000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_120;
  }
LABEL_119:
  *((_BYTE *)v5 + 255) = self->_fb;
  *(_QWORD *)((char *)v5 + 260) |= 0x200000000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_41;
    goto LABEL_121;
  }
LABEL_120:
  *((_DWORD *)v5 + 32) = self->_msOrigToFb;
  *(_QWORD *)((char *)v5 + 260) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_42;
    goto LABEL_122;
  }
LABEL_121:
  *((_DWORD *)v5 + 30) = self->_msOrigToConf;
  *(_QWORD *)((char *)v5 + 260) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_43;
    goto LABEL_123;
  }
LABEL_122:
  *((_DWORD *)v5 + 31) = self->_msOrigToEnd;
  *(_QWORD *)((char *)v5 + 260) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_44;
    goto LABEL_124;
  }
LABEL_123:
  *((_DWORD *)v5 + 36) = self->_msStartToAlert;
  *(_QWORD *)((char *)v5 + 260) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_45;
    goto LABEL_125;
  }
LABEL_124:
  *((_DWORD *)v5 + 29) = self->_msFbToSetup;
  *(_QWORD *)((char *)v5 + 260) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_46;
    goto LABEL_126;
  }
LABEL_125:
  *((_DWORD *)v5 + 33) = self->_msPageToSetup;
  *(_QWORD *)((char *)v5 + 260) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_47;
    goto LABEL_127;
  }
LABEL_126:
  *((_DWORD *)v5 + 34) = self->_msSetupToEnd;
  *(_QWORD *)((char *)v5 + 260) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_48;
    goto LABEL_128;
  }
LABEL_127:
  *((_DWORD *)v5 + 18) = self->_ecioDbx2;
  *(_QWORD *)((char *)v5 + 260) |= 0x2000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&has & 0x8000000000000) == 0)
      goto LABEL_49;
    goto LABEL_129;
  }
LABEL_128:
  *((_DWORD *)v5 + 45) = self->_rssiDbm;
  *(_QWORD *)((char *)v5 + 260) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_50;
    goto LABEL_130;
  }
LABEL_129:
  *((_DWORD *)v5 + 60) = self->_txPwrDbm;
  *(_QWORD *)((char *)v5 + 260) |= 0x8000000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_130:
  *((_DWORD *)v5 + 47) = self->_sensorUseDuringLastCallMs;
  *(_QWORD *)((char *)v5 + 260) |= 0x10000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
  {
LABEL_51:
    *((_DWORD *)v5 + 46) = self->_sensorEndToPresentMs;
    *(_QWORD *)((char *)v5 + 260) |= 0x8000000000uLL;
  }
LABEL_52:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = self->_capEvents;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v12), "copyWithZone:", a3);
        objc_msgSend(v6, "addCapEvent:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  v14 = self->_has;
  if ((*(_QWORD *)&v14 & 0x800000000000) != 0)
  {
    *((_DWORD *)v6 + 54) = self->_subsId;
    *(_QWORD *)(v6 + 260) |= 0x800000000000uLL;
    v14 = self->_has;
    if ((*(_QWORD *)&v14 & 0x100000000) == 0)
    {
LABEL_61:
      if ((*(_QWORD *)&v14 & 0x200000000) == 0)
        goto LABEL_62;
      goto LABEL_134;
    }
  }
  else if ((*(_QWORD *)&v14 & 0x100000000) == 0)
  {
    goto LABEL_61;
  }
  *((_DWORD *)v6 + 37) = self->_numSubs;
  *(_QWORD *)(v6 + 260) |= (unint64_t)&_mh_execute_header;
  v14 = self->_has;
  if ((*(_QWORD *)&v14 & 0x200000000) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&v14 & 0x8000) == 0)
      goto LABEL_63;
    goto LABEL_135;
  }
LABEL_134:
  *((_DWORD *)v6 + 38) = self->_psPref;
  *(_QWORD *)(v6 + 260) |= 0x200000000uLL;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v14 & 0x10000) == 0)
      goto LABEL_64;
    goto LABEL_136;
  }
LABEL_135:
  *((_DWORD *)v6 + 20) = self->_hoType;
  *(_QWORD *)(v6 + 260) |= 0x8000uLL;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_64:
    if ((*(_QWORD *)&v14 & 0x2000000000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_136:
  *((_DWORD *)v6 + 21) = self->_hstState;
  *(_QWORD *)(v6 + 260) |= 0x10000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
  {
LABEL_65:
    *((_DWORD *)v6 + 44) = self->_rrcRelCause;
    *(_QWORD *)(v6 + 260) |= 0x2000000000uLL;
  }
LABEL_66:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = self->_rfMeasInfos;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v19), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend(v6, "addRfMeasInfo:", v20);

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v17);
  }

  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x20000) != 0)
  {
    *((_DWORD *)v6 + 22) = self->_isSrvccSuccess;
    *(_QWORD *)(v6 + 260) |= 0x20000uLL;
    v21 = self->_has;
    if ((*(_QWORD *)&v21 & 0x400000000000) == 0)
    {
LABEL_75:
      if ((*(_QWORD *)&v21 & 0x200000000000) == 0)
        goto LABEL_76;
      goto LABEL_140;
    }
  }
  else if ((*(_QWORD *)&v21 & 0x400000000000) == 0)
  {
    goto LABEL_75;
  }
  *((_DWORD *)v6 + 53) = self->_srvccTargetRat;
  *(_QWORD *)(v6 + 260) |= 0x400000000000uLL;
  v21 = self->_has;
  if ((*(_QWORD *)&v21 & 0x200000000000) == 0)
  {
LABEL_76:
    if ((*(_DWORD *)&v21 & 0x80000) == 0)
      goto LABEL_77;
    goto LABEL_141;
  }
LABEL_140:
  *((_DWORD *)v6 + 52) = self->_srvccFailureCause;
  *(_QWORD *)(v6 + 260) |= 0x200000000000uLL;
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) == 0)
  {
LABEL_77:
    if ((*(_DWORD *)&v21 & 0x40000000) == 0)
      goto LABEL_79;
    goto LABEL_78;
  }
LABEL_141:
  *((_DWORD *)v6 + 24) = self->_lastMotionState;
  *(_QWORD *)(v6 + 260) |= 0x80000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_78:
    *((_DWORD *)v6 + 35) = self->_msSinceLastMotionState;
    *(_QWORD *)(v6 + 260) |= 0x40000000uLL;
  }
LABEL_79:
  v22 = -[NSString copyWithZone:](self->_transId, "copyWithZone:", a3, (_QWORD)v26);
  v23 = (void *)*((_QWORD *)v6 + 28);
  *((_QWORD *)v6 + 28) = v22;

  if ((*((_BYTE *)&self->_has + 6) & 0x10) != 0)
  {
    *((_DWORD *)v6 + 61) = self->_version;
    *(_QWORD *)(v6 + 260) |= 0x10000000000000uLL;
  }
  v24 = v6;

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  $5C7AF59FAF9AD3B0058052679E7AB9DE has;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *capEvents;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v10;
  uint64_t v11;
  NSMutableArray *rfMeasInfos;
  uint64_t v13;
  NSString *transId;
  uint64_t v15;
  BOOL v16;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_344;
  has = self->_has;
  v7 = *(_QWORD *)(v4 + 260);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_344;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_callEvent != *((_DWORD *)v4 + 8))
      goto LABEL_344;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_callId != *((_DWORD *)v4 + 9))
      goto LABEL_344;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_direction != *((_DWORD *)v4 + 17))
      goto LABEL_344;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x100000000000) != 0)
  {
    if ((v7 & 0x100000000000) == 0 || self->_srvType != *((_DWORD *)v4 + 51))
      goto LABEL_344;
  }
  else if ((v7 & 0x100000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    if ((v7 & 0x1000000000000) == 0 || self->_sysMode != *((_DWORD *)v4 + 55))
      goto LABEL_344;
  }
  else if ((v7 & 0x1000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_callState != *((_DWORD *)v4 + 10))
      goto LABEL_344;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_endStatus != *((_DWORD *)v4 + 19))
      goto LABEL_344;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_qmiReleaseCause != *((_DWORD *)v4 + 40))
      goto LABEL_344;
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_callDuration != *((_DWORD *)v4 + 7))
      goto LABEL_344;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_ccCause != *((_DWORD *)v4 + 14))
      goto LABEL_344;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_antenna != *((_DWORD *)v4 + 4))
      goto LABEL_344;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_callType != *((_DWORD *)v4 + 11))
      goto LABEL_344;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x100000000000000) != 0)
  {
    if ((v7 & 0x100000000000000) == 0)
      goto LABEL_344;
    if (self->_established)
    {
      if (!v4[254])
        goto LABEL_344;
    }
    else if (v4[254])
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x100000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x80000000000000) != 0)
  {
    if ((v7 & 0x80000000000000) == 0)
      goto LABEL_344;
    if (self->_connected)
    {
      if (!v4[253])
        goto LABEL_344;
    }
    else if (v4[253])
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x80000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_lteCellId != *((_DWORD *)v4 + 25))
      goto LABEL_344;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_cellId != *((_DWORD *)v4 + 15))
      goto LABEL_344;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x20000000000000) != 0)
  {
    if ((v7 & 0x20000000000000) == 0 || self->_zoneId != *((_DWORD *)v4 + 62))
      goto LABEL_344;
  }
  else if ((v7 & 0x20000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_baseId != *((_DWORD *)v4 + 6))
      goto LABEL_344;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_lteLac != *((_DWORD *)v4 + 26))
      goto LABEL_344;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0 || self->_sid != *((_DWORD *)v4 + 50))
      goto LABEL_344;
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_mcc != *((_DWORD *)v4 + 27))
      goto LABEL_344;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_mnc != *((_DWORD *)v4 + 28))
      goto LABEL_344;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_lac != *((_DWORD *)v4 + 23))
      goto LABEL_344;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x800000000000000) != 0)
  {
    if ((v7 & 0x800000000000000) == 0)
      goto LABEL_344;
    if (self->_mrabEver)
    {
      if (!v4[257])
        goto LABEL_344;
    }
    else if (v4[257])
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x800000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x400000000000000) != 0)
  {
    if ((v7 & 0x400000000000000) == 0)
      goto LABEL_344;
    if (self->_mrabEnd)
    {
      if (!v4[256])
        goto LABEL_344;
    }
    else if (v4[256])
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x400000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_band != *((_DWORD *)v4 + 5))
      goto LABEL_344;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0 || self->_rfChannel != *((_DWORD *)v4 + 41))
      goto LABEL_344;
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_psc != *((_DWORD *)v4 + 39))
      goto LABEL_344;
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x4000000000000) != 0)
  {
    if ((v7 & 0x4000000000000) == 0 || self->_ttyMode != *((_DWORD *)v4 + 59))
      goto LABEL_344;
  }
  else if ((v7 & 0x4000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x2000000000000) != 0)
  {
    if ((v7 & 0x2000000000000) == 0 || self->_tsAccuracyHour != *((_DWORD *)v4 + 58))
      goto LABEL_344;
  }
  else if ((v7 & 0x2000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x40000000000000) != 0)
  {
    if ((v7 & 0x40000000000000) == 0)
      goto LABEL_344;
    if (self->_accessoryAttached)
    {
      if (!v4[252])
        goto LABEL_344;
    }
    else if (v4[252])
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x40000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0 || self->_setupSysMode != *((_DWORD *)v4 + 49))
      goto LABEL_344;
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0 || self->_setupDirection != *((_DWORD *)v4 + 48))
      goto LABEL_344;
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x2000000000000000) != 0)
  {
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_344;
    if (self->_sl2)
    {
      if (!v4[259])
        goto LABEL_344;
    }
    else if (v4[259])
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x2000000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_coexPolicy != *((_DWORD *)v4 + 16))
      goto LABEL_344;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x1000000000000000) != 0)
  {
    if ((v7 & 0x1000000000000000) == 0)
      goto LABEL_344;
    if (self->_sl)
    {
      if (!v4[258])
        goto LABEL_344;
    }
    else if (v4[258])
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x1000000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x200000000000000) != 0)
  {
    if ((v7 & 0x200000000000000) == 0)
      goto LABEL_344;
    if (self->_fb)
    {
      if (!v4[255])
        goto LABEL_344;
    }
    else if (v4[255])
    {
      goto LABEL_344;
    }
  }
  else if ((v7 & 0x200000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_msOrigToFb != *((_DWORD *)v4 + 32))
      goto LABEL_344;
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_msOrigToConf != *((_DWORD *)v4 + 30))
      goto LABEL_344;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_msOrigToEnd != *((_DWORD *)v4 + 31))
      goto LABEL_344;
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_msStartToAlert != *((_DWORD *)v4 + 36))
      goto LABEL_344;
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_msFbToSetup != *((_DWORD *)v4 + 29))
      goto LABEL_344;
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_msPageToSetup != *((_DWORD *)v4 + 33))
      goto LABEL_344;
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_msSetupToEnd != *((_DWORD *)v4 + 34))
      goto LABEL_344;
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_ecioDbx2 != *((_DWORD *)v4 + 18))
      goto LABEL_344;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0 || self->_rssiDbm != *((_DWORD *)v4 + 45))
      goto LABEL_344;
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_344;
  }
  v8 = *(_QWORD *)(v4 + 260);
  if ((*(_QWORD *)&has & 0x8000000000000) != 0)
  {
    if ((v8 & 0x8000000000000) == 0 || self->_txPwrDbm != *((_DWORD *)v4 + 60))
      goto LABEL_344;
  }
  else if ((v8 & 0x8000000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    if ((v8 & 0x10000000000) == 0 || self->_sensorUseDuringLastCallMs != *((_DWORD *)v4 + 47))
      goto LABEL_344;
  }
  else if ((v8 & 0x10000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    if ((v8 & 0x8000000000) == 0 || self->_sensorEndToPresentMs != *((_DWORD *)v4 + 46))
      goto LABEL_344;
  }
  else if ((v8 & 0x8000000000) != 0)
  {
    goto LABEL_344;
  }
  capEvents = self->_capEvents;
  if ((unint64_t)capEvents | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](capEvents, "isEqual:"))
  {
    goto LABEL_344;
  }
  v10 = self->_has;
  v11 = *(_QWORD *)(v4 + 260);
  if ((*(_QWORD *)&v10 & 0x800000000000) != 0)
  {
    if ((v11 & 0x800000000000) == 0 || self->_subsId != *((_DWORD *)v4 + 54))
      goto LABEL_344;
  }
  else if ((v11 & 0x800000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&v10 & 0x100000000) != 0)
  {
    if ((v11 & 0x100000000) == 0 || self->_numSubs != *((_DWORD *)v4 + 37))
      goto LABEL_344;
  }
  else if ((v11 & 0x100000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&v10 & 0x200000000) != 0)
  {
    if ((v11 & 0x200000000) == 0 || self->_psPref != *((_DWORD *)v4 + 38))
      goto LABEL_344;
  }
  else if ((v11 & 0x200000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_hoType != *((_DWORD *)v4 + 20))
      goto LABEL_344;
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_hstState != *((_DWORD *)v4 + 21))
      goto LABEL_344;
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&v10 & 0x2000000000) != 0)
  {
    if ((v11 & 0x2000000000) == 0 || self->_rrcRelCause != *((_DWORD *)v4 + 44))
      goto LABEL_344;
  }
  else if ((v11 & 0x2000000000) != 0)
  {
    goto LABEL_344;
  }
  rfMeasInfos = self->_rfMeasInfos;
  if ((unint64_t)rfMeasInfos | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](rfMeasInfos, "isEqual:"))
      goto LABEL_344;
    v10 = self->_has;
  }
  v13 = *(_QWORD *)(v4 + 260);
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    if ((v13 & 0x20000) == 0 || self->_isSrvccSuccess != *((_DWORD *)v4 + 22))
      goto LABEL_344;
  }
  else if ((v13 & 0x20000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&v10 & 0x400000000000) != 0)
  {
    if ((v13 & 0x400000000000) == 0 || self->_srvccTargetRat != *((_DWORD *)v4 + 53))
      goto LABEL_344;
  }
  else if ((v13 & 0x400000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_QWORD *)&v10 & 0x200000000000) != 0)
  {
    if ((v13 & 0x200000000000) == 0 || self->_srvccFailureCause != *((_DWORD *)v4 + 52))
      goto LABEL_344;
  }
  else if ((v13 & 0x200000000000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
    if ((v13 & 0x80000) == 0 || self->_lastMotionState != *((_DWORD *)v4 + 24))
      goto LABEL_344;
  }
  else if ((v13 & 0x80000) != 0)
  {
    goto LABEL_344;
  }
  if ((*(_DWORD *)&v10 & 0x40000000) != 0)
  {
    if ((v13 & 0x40000000) == 0 || self->_msSinceLastMotionState != *((_DWORD *)v4 + 35))
      goto LABEL_344;
  }
  else if ((v13 & 0x40000000) != 0)
  {
    goto LABEL_344;
  }
  transId = self->_transId;
  if (!((unint64_t)transId | *((_QWORD *)v4 + 28)))
    goto LABEL_339;
  if (!-[NSString isEqual:](transId, "isEqual:"))
  {
LABEL_344:
    v16 = 0;
    goto LABEL_345;
  }
  v10 = self->_has;
LABEL_339:
  v15 = *(_QWORD *)(v4 + 260);
  if ((*(_QWORD *)&v10 & 0x10000000000000) != 0)
  {
    if ((v15 & 0x10000000000000) == 0 || self->_version != *((_DWORD *)v4 + 61))
      goto LABEL_344;
    v16 = 1;
  }
  else
  {
    v16 = (v15 & 0x10000000000000) == 0;
  }
LABEL_345:

  return v16;
}

- (unint64_t)hash
{
  $5C7AF59FAF9AD3B0058052679E7AB9DE has;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v4;
  uint64_t v5;
  unint64_t v6;
  $5C7AF59FAF9AD3B0058052679E7AB9DE v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v71 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
LABEL_3:
      v70 = 2654435761 * self->_callEvent;
      if ((*(_BYTE *)&has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_54;
    }
  }
  else
  {
    v71 = 0;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_3;
  }
  v70 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_4:
    v69 = 2654435761 * self->_callId;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_5;
    goto LABEL_55;
  }
LABEL_54:
  v69 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_5:
    v68 = 2654435761 * self->_direction;
    if ((*(_QWORD *)&has & 0x100000000000) != 0)
      goto LABEL_6;
    goto LABEL_56;
  }
LABEL_55:
  v68 = 0;
  if ((*(_QWORD *)&has & 0x100000000000) != 0)
  {
LABEL_6:
    v67 = 2654435761 * self->_srvType;
    if ((*(_QWORD *)&has & 0x1000000000000) != 0)
      goto LABEL_7;
    goto LABEL_57;
  }
LABEL_56:
  v67 = 0;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
LABEL_7:
    v66 = 2654435761 * self->_sysMode;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_58;
  }
LABEL_57:
  v66 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_8:
    v65 = 2654435761 * self->_callState;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_9;
    goto LABEL_59;
  }
LABEL_58:
  v65 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    v64 = 2654435761 * self->_endStatus;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_10;
    goto LABEL_60;
  }
LABEL_59:
  v64 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_10:
    v63 = 2654435761 * self->_qmiReleaseCause;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_11;
    goto LABEL_61;
  }
LABEL_60:
  v63 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_11:
    v62 = 2654435761 * self->_callDuration;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_12;
    goto LABEL_62;
  }
LABEL_61:
  v62 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_12:
    v61 = 2654435761 * self->_ccCause;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_13;
    goto LABEL_63;
  }
LABEL_62:
  v61 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_13:
    v60 = 2654435761 * self->_antenna;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_14;
    goto LABEL_64;
  }
LABEL_63:
  v60 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_14:
    v59 = 2654435761 * self->_callType;
    if ((*(_QWORD *)&has & 0x100000000000000) != 0)
      goto LABEL_15;
    goto LABEL_65;
  }
LABEL_64:
  v59 = 0;
  if ((*(_QWORD *)&has & 0x100000000000000) != 0)
  {
LABEL_15:
    v58 = 2654435761 * self->_established;
    if ((*(_QWORD *)&has & 0x80000000000000) != 0)
      goto LABEL_16;
    goto LABEL_66;
  }
LABEL_65:
  v58 = 0;
  if ((*(_QWORD *)&has & 0x80000000000000) != 0)
  {
LABEL_16:
    v57 = 2654435761 * self->_connected;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_17;
    goto LABEL_67;
  }
LABEL_66:
  v57 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_17:
    v56 = 2654435761 * self->_lteCellId;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_18;
    goto LABEL_68;
  }
LABEL_67:
  v56 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_18:
    v55 = 2654435761 * self->_cellId;
    if ((*(_QWORD *)&has & 0x20000000000000) != 0)
      goto LABEL_19;
    goto LABEL_69;
  }
LABEL_68:
  v55 = 0;
  if ((*(_QWORD *)&has & 0x20000000000000) != 0)
  {
LABEL_19:
    v54 = 2654435761 * self->_zoneId;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_20;
    goto LABEL_70;
  }
LABEL_69:
  v54 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_20:
    v53 = 2654435761 * self->_baseId;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_21;
    goto LABEL_71;
  }
LABEL_70:
  v53 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_21:
    v52 = 2654435761 * self->_lteLac;
    if ((*(_QWORD *)&has & 0x80000000000) != 0)
      goto LABEL_22;
    goto LABEL_72;
  }
LABEL_71:
  v52 = 0;
  if ((*(_QWORD *)&has & 0x80000000000) != 0)
  {
LABEL_22:
    v51 = 2654435761 * self->_sid;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_23;
    goto LABEL_73;
  }
LABEL_72:
  v51 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_23:
    v50 = 2654435761 * self->_mcc;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_24;
    goto LABEL_74;
  }
LABEL_73:
  v50 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_24:
    v49 = 2654435761 * self->_mnc;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_25;
    goto LABEL_75;
  }
LABEL_74:
  v49 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_25:
    v48 = 2654435761 * self->_lac;
    if ((*(_QWORD *)&has & 0x800000000000000) != 0)
      goto LABEL_26;
    goto LABEL_76;
  }
LABEL_75:
  v48 = 0;
  if ((*(_QWORD *)&has & 0x800000000000000) != 0)
  {
LABEL_26:
    v47 = 2654435761 * self->_mrabEver;
    if ((*(_QWORD *)&has & 0x400000000000000) != 0)
      goto LABEL_27;
    goto LABEL_77;
  }
LABEL_76:
  v47 = 0;
  if ((*(_QWORD *)&has & 0x400000000000000) != 0)
  {
LABEL_27:
    v46 = 2654435761 * self->_mrabEnd;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_28;
    goto LABEL_78;
  }
LABEL_77:
  v46 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_28:
    v45 = 2654435761 * self->_band;
    if ((*(_QWORD *)&has & 0x1000000000) != 0)
      goto LABEL_29;
    goto LABEL_79;
  }
LABEL_78:
  v45 = 0;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
LABEL_29:
    v44 = 2654435761 * self->_rfChannel;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_30;
    goto LABEL_80;
  }
LABEL_79:
  v44 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_30:
    v43 = 2654435761 * self->_psc;
    if ((*(_QWORD *)&has & 0x4000000000000) != 0)
      goto LABEL_31;
    goto LABEL_81;
  }
LABEL_80:
  v43 = 0;
  if ((*(_QWORD *)&has & 0x4000000000000) != 0)
  {
LABEL_31:
    v42 = 2654435761 * self->_ttyMode;
    if ((*(_QWORD *)&has & 0x2000000000000) != 0)
      goto LABEL_32;
    goto LABEL_82;
  }
LABEL_81:
  v42 = 0;
  if ((*(_QWORD *)&has & 0x2000000000000) != 0)
  {
LABEL_32:
    v41 = 2654435761 * self->_tsAccuracyHour;
    if ((*(_QWORD *)&has & 0x40000000000000) != 0)
      goto LABEL_33;
    goto LABEL_83;
  }
LABEL_82:
  v41 = 0;
  if ((*(_QWORD *)&has & 0x40000000000000) != 0)
  {
LABEL_33:
    v40 = 2654435761 * self->_accessoryAttached;
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
      goto LABEL_34;
    goto LABEL_84;
  }
LABEL_83:
  v40 = 0;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
LABEL_34:
    v39 = 2654435761 * self->_setupSysMode;
    if ((*(_QWORD *)&has & 0x20000000000) != 0)
      goto LABEL_35;
    goto LABEL_85;
  }
LABEL_84:
  v39 = 0;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
LABEL_35:
    v38 = 2654435761 * self->_setupDirection;
    if ((*(_QWORD *)&has & 0x2000000000000000) != 0)
      goto LABEL_36;
    goto LABEL_86;
  }
LABEL_85:
  v38 = 0;
  if ((*(_QWORD *)&has & 0x2000000000000000) != 0)
  {
LABEL_36:
    v37 = 2654435761 * self->_sl2;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_37;
    goto LABEL_87;
  }
LABEL_86:
  v37 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_37:
    v36 = 2654435761 * self->_coexPolicy;
    if ((*(_QWORD *)&has & 0x1000000000000000) != 0)
      goto LABEL_38;
    goto LABEL_88;
  }
LABEL_87:
  v36 = 0;
  if ((*(_QWORD *)&has & 0x1000000000000000) != 0)
  {
LABEL_38:
    v35 = 2654435761 * self->_sl;
    if ((*(_QWORD *)&has & 0x200000000000000) != 0)
      goto LABEL_39;
    goto LABEL_89;
  }
LABEL_88:
  v35 = 0;
  if ((*(_QWORD *)&has & 0x200000000000000) != 0)
  {
LABEL_39:
    v34 = 2654435761 * self->_fb;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_40;
    goto LABEL_90;
  }
LABEL_89:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_40:
    v33 = 2654435761 * self->_msOrigToFb;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_41;
    goto LABEL_91;
  }
LABEL_90:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_41:
    v32 = 2654435761 * self->_msOrigToConf;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_42;
    goto LABEL_92;
  }
LABEL_91:
  v32 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_42:
    v31 = 2654435761 * self->_msOrigToEnd;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_43;
    goto LABEL_93;
  }
LABEL_92:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_43:
    v30 = 2654435761 * self->_msStartToAlert;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_44;
    goto LABEL_94;
  }
LABEL_93:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_44:
    v29 = 2654435761 * self->_msFbToSetup;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_45;
    goto LABEL_95;
  }
LABEL_94:
  v29 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_45:
    v28 = 2654435761 * self->_msPageToSetup;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_46;
    goto LABEL_96;
  }
LABEL_95:
  v28 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_46:
    v27 = 2654435761 * self->_msSetupToEnd;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_47;
    goto LABEL_97;
  }
LABEL_96:
  v27 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_47:
    v26 = 2654435761 * self->_ecioDbx2;
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
      goto LABEL_48;
    goto LABEL_98;
  }
LABEL_97:
  v26 = 0;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
LABEL_48:
    v25 = 2654435761 * self->_rssiDbm;
    if ((*(_QWORD *)&has & 0x8000000000000) != 0)
      goto LABEL_49;
    goto LABEL_99;
  }
LABEL_98:
  v25 = 0;
  if ((*(_QWORD *)&has & 0x8000000000000) != 0)
  {
LABEL_49:
    v24 = 2654435761 * self->_txPwrDbm;
    if ((*(_QWORD *)&has & 0x10000000000) != 0)
      goto LABEL_50;
LABEL_100:
    v23 = 0;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_51;
    goto LABEL_101;
  }
LABEL_99:
  v24 = 0;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
    goto LABEL_100;
LABEL_50:
  v23 = 2654435761 * self->_sensorUseDuringLastCallMs;
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
LABEL_51:
    v22 = 2654435761 * self->_sensorEndToPresentMs;
    goto LABEL_102;
  }
LABEL_101:
  v22 = 0;
LABEL_102:
  v21 = (unint64_t)-[NSMutableArray hash](self->_capEvents, "hash");
  v4 = self->_has;
  if ((*(_QWORD *)&v4 & 0x800000000000) != 0)
  {
    v20 = 2654435761 * self->_subsId;
    if ((*(_QWORD *)&v4 & 0x100000000) != 0)
    {
LABEL_104:
      v19 = 2654435761 * self->_numSubs;
      if ((*(_QWORD *)&v4 & 0x200000000) != 0)
        goto LABEL_105;
      goto LABEL_111;
    }
  }
  else
  {
    v20 = 0;
    if ((*(_QWORD *)&v4 & 0x100000000) != 0)
      goto LABEL_104;
  }
  v19 = 0;
  if ((*(_QWORD *)&v4 & 0x200000000) != 0)
  {
LABEL_105:
    v18 = 2654435761 * self->_psPref;
    if ((*(_WORD *)&v4 & 0x8000) != 0)
      goto LABEL_106;
    goto LABEL_112;
  }
LABEL_111:
  v18 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_106:
    v17 = 2654435761 * self->_hoType;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
      goto LABEL_107;
LABEL_113:
    v16 = 0;
    if ((*(_QWORD *)&v4 & 0x2000000000) != 0)
      goto LABEL_108;
    goto LABEL_114;
  }
LABEL_112:
  v17 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) == 0)
    goto LABEL_113;
LABEL_107:
  v16 = 2654435761 * self->_hstState;
  if ((*(_QWORD *)&v4 & 0x2000000000) != 0)
  {
LABEL_108:
    v5 = 2654435761 * self->_rrcRelCause;
    goto LABEL_115;
  }
LABEL_114:
  v5 = 0;
LABEL_115:
  v6 = (unint64_t)-[NSMutableArray hash](self->_rfMeasInfos, "hash");
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) != 0)
  {
    v8 = 2654435761 * self->_isSrvccSuccess;
    if ((*(_QWORD *)&v7 & 0x400000000000) != 0)
    {
LABEL_117:
      v9 = 2654435761 * self->_srvccTargetRat;
      if ((*(_QWORD *)&v7 & 0x200000000000) != 0)
        goto LABEL_118;
      goto LABEL_123;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_QWORD *)&v7 & 0x400000000000) != 0)
      goto LABEL_117;
  }
  v9 = 0;
  if ((*(_QWORD *)&v7 & 0x200000000000) != 0)
  {
LABEL_118:
    v10 = 2654435761 * self->_srvccFailureCause;
    if ((*(_DWORD *)&v7 & 0x80000) != 0)
      goto LABEL_119;
LABEL_124:
    v11 = 0;
    if ((*(_DWORD *)&v7 & 0x40000000) != 0)
      goto LABEL_120;
    goto LABEL_125;
  }
LABEL_123:
  v10 = 0;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
    goto LABEL_124;
LABEL_119:
  v11 = 2654435761 * self->_lastMotionState;
  if ((*(_DWORD *)&v7 & 0x40000000) != 0)
  {
LABEL_120:
    v12 = 2654435761 * self->_msSinceLastMotionState;
    goto LABEL_126;
  }
LABEL_125:
  v12 = 0;
LABEL_126:
  v13 = -[NSString hash](self->_transId, "hash");
  if ((*((_BYTE *)&self->_has + 6) & 0x10) != 0)
    v14 = 2654435761 * self->_version;
  else
    v14 = 0;
  return v70 ^ v71 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  uint64_t v18;
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

  v4 = (char *)a3;
  v5 = v4;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
    v6 = *(_QWORD *)(v4 + 260);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_86;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_callEvent = *((_DWORD *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_87;
  }
LABEL_86:
  self->_callId = *((_DWORD *)v4 + 9);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x1000) == 0)
  {
LABEL_5:
    if ((v6 & 0x100000000000) == 0)
      goto LABEL_6;
    goto LABEL_88;
  }
LABEL_87:
  self->_direction = *((_DWORD *)v4 + 17);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x100000000000) == 0)
  {
LABEL_6:
    if ((v6 & 0x1000000000000) == 0)
      goto LABEL_7;
    goto LABEL_89;
  }
LABEL_88:
  self->_srvType = *((_DWORD *)v4 + 51);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x1000000000000) == 0)
  {
LABEL_7:
    if ((v6 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_90;
  }
LABEL_89:
  self->_sysMode = *((_DWORD *)v4 + 55);
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((v6 & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_91;
  }
LABEL_90:
  self->_callState = *((_DWORD *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x4000) == 0)
  {
LABEL_9:
    if ((v6 & 0x800000000) == 0)
      goto LABEL_10;
    goto LABEL_92;
  }
LABEL_91:
  self->_endStatus = *((_DWORD *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x800000000) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_93;
  }
LABEL_92:
  self->_qmiReleaseCause = *((_DWORD *)v4 + 40);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x10) == 0)
  {
LABEL_11:
    if ((v6 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_94;
  }
LABEL_93:
  self->_callDuration = *((_DWORD *)v4 + 7);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x200) == 0)
  {
LABEL_12:
    if ((v6 & 2) == 0)
      goto LABEL_13;
    goto LABEL_95;
  }
LABEL_94:
  self->_ccCause = *((_DWORD *)v4 + 14);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 2) == 0)
  {
LABEL_13:
    if ((v6 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_96;
  }
LABEL_95:
  self->_antenna = *((_DWORD *)v4 + 4);
  *(_QWORD *)&self->_has |= 2uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x100) == 0)
  {
LABEL_14:
    if ((v6 & 0x100000000000000) == 0)
      goto LABEL_15;
    goto LABEL_97;
  }
LABEL_96:
  self->_callType = *((_DWORD *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x100000000000000) == 0)
  {
LABEL_15:
    if ((v6 & 0x80000000000000) == 0)
      goto LABEL_16;
    goto LABEL_98;
  }
LABEL_97:
  self->_established = v4[254];
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x80000000000000) == 0)
  {
LABEL_16:
    if ((v6 & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_99;
  }
LABEL_98:
  self->_connected = v4[253];
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x100000) == 0)
  {
LABEL_17:
    if ((v6 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_100;
  }
LABEL_99:
  self->_lteCellId = *((_DWORD *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x400) == 0)
  {
LABEL_18:
    if ((v6 & 0x20000000000000) == 0)
      goto LABEL_19;
    goto LABEL_101;
  }
LABEL_100:
  self->_cellId = *((_DWORD *)v4 + 15);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x20000000000000) == 0)
  {
LABEL_19:
    if ((v6 & 8) == 0)
      goto LABEL_20;
    goto LABEL_102;
  }
LABEL_101:
  self->_zoneId = *((_DWORD *)v4 + 62);
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 8) == 0)
  {
LABEL_20:
    if ((v6 & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_103;
  }
LABEL_102:
  self->_baseId = *((_DWORD *)v4 + 6);
  *(_QWORD *)&self->_has |= 8uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x200000) == 0)
  {
LABEL_21:
    if ((v6 & 0x80000000000) == 0)
      goto LABEL_22;
    goto LABEL_104;
  }
LABEL_103:
  self->_lteLac = *((_DWORD *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x80000000000) == 0)
  {
LABEL_22:
    if ((v6 & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_105;
  }
LABEL_104:
  self->_sid = *((_DWORD *)v4 + 50);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x400000) == 0)
  {
LABEL_23:
    if ((v6 & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_106;
  }
LABEL_105:
  self->_mcc = *((_DWORD *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x800000) == 0)
  {
LABEL_24:
    if ((v6 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_107;
  }
LABEL_106:
  self->_mnc = *((_DWORD *)v4 + 28);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x40000) == 0)
  {
LABEL_25:
    if ((v6 & 0x800000000000000) == 0)
      goto LABEL_26;
    goto LABEL_108;
  }
LABEL_107:
  self->_lac = *((_DWORD *)v4 + 23);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x800000000000000) == 0)
  {
LABEL_26:
    if ((v6 & 0x400000000000000) == 0)
      goto LABEL_27;
    goto LABEL_109;
  }
LABEL_108:
  self->_mrabEver = v4[257];
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x400000000000000) == 0)
  {
LABEL_27:
    if ((v6 & 4) == 0)
      goto LABEL_28;
    goto LABEL_110;
  }
LABEL_109:
  self->_mrabEnd = v4[256];
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 4) == 0)
  {
LABEL_28:
    if ((v6 & 0x1000000000) == 0)
      goto LABEL_29;
    goto LABEL_111;
  }
LABEL_110:
  self->_band = *((_DWORD *)v4 + 5);
  *(_QWORD *)&self->_has |= 4uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x1000000000) == 0)
  {
LABEL_29:
    if ((v6 & 0x400000000) == 0)
      goto LABEL_30;
    goto LABEL_112;
  }
LABEL_111:
  self->_rfChannel = *((_DWORD *)v4 + 41);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x400000000) == 0)
  {
LABEL_30:
    if ((v6 & 0x4000000000000) == 0)
      goto LABEL_31;
    goto LABEL_113;
  }
LABEL_112:
  self->_psc = *((_DWORD *)v4 + 39);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x4000000000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x2000000000000) == 0)
      goto LABEL_32;
    goto LABEL_114;
  }
LABEL_113:
  self->_ttyMode = *((_DWORD *)v4 + 59);
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x2000000000000) == 0)
  {
LABEL_32:
    if ((v6 & 0x40000000000000) == 0)
      goto LABEL_33;
    goto LABEL_115;
  }
LABEL_114:
  self->_tsAccuracyHour = *((_DWORD *)v4 + 58);
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((v6 & 0x40000000000) == 0)
      goto LABEL_34;
    goto LABEL_116;
  }
LABEL_115:
  self->_accessoryAttached = v4[252];
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x40000000000) == 0)
  {
LABEL_34:
    if ((v6 & 0x20000000000) == 0)
      goto LABEL_35;
    goto LABEL_117;
  }
LABEL_116:
  self->_setupSysMode = *((_DWORD *)v4 + 49);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x20000000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_36;
    goto LABEL_118;
  }
LABEL_117:
  self->_setupDirection = *((_DWORD *)v4 + 48);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x2000000000000000) == 0)
  {
LABEL_36:
    if ((v6 & 0x800) == 0)
      goto LABEL_37;
    goto LABEL_119;
  }
LABEL_118:
  self->_sl2 = v4[259];
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x800) == 0)
  {
LABEL_37:
    if ((v6 & 0x1000000000000000) == 0)
      goto LABEL_38;
    goto LABEL_120;
  }
LABEL_119:
  self->_coexPolicy = *((_DWORD *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x1000000000000000) == 0)
  {
LABEL_38:
    if ((v6 & 0x200000000000000) == 0)
      goto LABEL_39;
    goto LABEL_121;
  }
LABEL_120:
  self->_sl = v4[258];
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x200000000000000) == 0)
  {
LABEL_39:
    if ((v6 & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_122;
  }
LABEL_121:
  self->_fb = v4[255];
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_40:
    if ((v6 & 0x2000000) == 0)
      goto LABEL_41;
    goto LABEL_123;
  }
LABEL_122:
  self->_msOrigToFb = *((_DWORD *)v4 + 32);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_41:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_42;
    goto LABEL_124;
  }
LABEL_123:
  self->_msOrigToConf = *((_DWORD *)v4 + 30);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_42:
    if ((v6 & 0x80000000) == 0)
      goto LABEL_43;
    goto LABEL_125;
  }
LABEL_124:
  self->_msOrigToEnd = *((_DWORD *)v4 + 31);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_43:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_44;
    goto LABEL_126;
  }
LABEL_125:
  self->_msStartToAlert = *((_DWORD *)v4 + 36);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_44:
    if ((v6 & 0x10000000) == 0)
      goto LABEL_45;
    goto LABEL_127;
  }
LABEL_126:
  self->_msFbToSetup = *((_DWORD *)v4 + 29);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_45:
    if ((v6 & 0x20000000) == 0)
      goto LABEL_46;
    goto LABEL_128;
  }
LABEL_127:
  self->_msPageToSetup = *((_DWORD *)v4 + 33);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_46:
    if ((v6 & 0x2000) == 0)
      goto LABEL_47;
    goto LABEL_129;
  }
LABEL_128:
  self->_msSetupToEnd = *((_DWORD *)v4 + 34);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x2000) == 0)
  {
LABEL_47:
    if ((v6 & 0x4000000000) == 0)
      goto LABEL_48;
    goto LABEL_130;
  }
LABEL_129:
  self->_ecioDbx2 = *((_DWORD *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_48:
    if ((v6 & 0x8000000000000) == 0)
      goto LABEL_49;
    goto LABEL_131;
  }
LABEL_130:
  self->_rssiDbm = *((_DWORD *)v4 + 45);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((v6 & 0x10000000000) == 0)
      goto LABEL_50;
    goto LABEL_132;
  }
LABEL_131:
  self->_txPwrDbm = *((_DWORD *)v4 + 60);
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v6 = *(_QWORD *)(v4 + 260);
  if ((v6 & 0x10000000000) == 0)
  {
LABEL_50:
    if ((v6 & 0x8000000000) == 0)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_132:
  self->_sensorUseDuringLastCallMs = *((_DWORD *)v4 + 47);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  if ((*(_QWORD *)(v4 + 260) & 0x8000000000) != 0)
  {
LABEL_51:
    self->_sensorEndToPresentMs = *((_DWORD *)v4 + 46);
    *(_QWORD *)&self->_has |= 0x8000000000uLL;
  }
LABEL_52:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = *((id *)v4 + 6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        -[CellularCallEndDetails addCapEvent:](self, "addCapEvent:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v12 = *(_QWORD *)(v5 + 260);
  if ((v12 & 0x800000000000) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 54);
    *(_QWORD *)&self->_has |= 0x800000000000uLL;
    v12 = *(_QWORD *)(v5 + 260);
    if ((v12 & 0x100000000) == 0)
    {
LABEL_61:
      if ((v12 & 0x200000000) == 0)
        goto LABEL_62;
      goto LABEL_136;
    }
  }
  else if ((v12 & 0x100000000) == 0)
  {
    goto LABEL_61;
  }
  self->_numSubs = *((_DWORD *)v5 + 37);
  *(_QWORD *)&self->_has |= (unint64_t)&_mh_execute_header;
  v12 = *(_QWORD *)(v5 + 260);
  if ((v12 & 0x200000000) == 0)
  {
LABEL_62:
    if ((v12 & 0x8000) == 0)
      goto LABEL_63;
    goto LABEL_137;
  }
LABEL_136:
  self->_psPref = *((_DWORD *)v5 + 38);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v12 = *(_QWORD *)(v5 + 260);
  if ((v12 & 0x8000) == 0)
  {
LABEL_63:
    if ((v12 & 0x10000) == 0)
      goto LABEL_64;
    goto LABEL_138;
  }
LABEL_137:
  self->_hoType = *((_DWORD *)v5 + 20);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v12 = *(_QWORD *)(v5 + 260);
  if ((v12 & 0x10000) == 0)
  {
LABEL_64:
    if ((v12 & 0x2000000000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_138:
  self->_hstState = *((_DWORD *)v5 + 21);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  if ((*(_QWORD *)(v5 + 260) & 0x2000000000) != 0)
  {
LABEL_65:
    self->_rrcRelCause = *((_DWORD *)v5 + 44);
    *(_QWORD *)&self->_has |= 0x2000000000uLL;
  }
LABEL_66:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = *((id *)v5 + 21);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
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
        -[CellularCallEndDetails addRfMeasInfo:](self, "addRfMeasInfo:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), (_QWORD)v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  v18 = *(_QWORD *)(v5 + 260);
  if ((v18 & 0x20000) != 0)
  {
    self->_isSrvccSuccess = *((_DWORD *)v5 + 22);
    *(_QWORD *)&self->_has |= 0x20000uLL;
    v18 = *(_QWORD *)(v5 + 260);
    if ((v18 & 0x400000000000) == 0)
    {
LABEL_75:
      if ((v18 & 0x200000000000) == 0)
        goto LABEL_76;
      goto LABEL_142;
    }
  }
  else if ((v18 & 0x400000000000) == 0)
  {
    goto LABEL_75;
  }
  self->_srvccTargetRat = *((_DWORD *)v5 + 53);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v18 = *(_QWORD *)(v5 + 260);
  if ((v18 & 0x200000000000) == 0)
  {
LABEL_76:
    if ((v18 & 0x80000) == 0)
      goto LABEL_77;
    goto LABEL_143;
  }
LABEL_142:
  self->_srvccFailureCause = *((_DWORD *)v5 + 52);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v18 = *(_QWORD *)(v5 + 260);
  if ((v18 & 0x80000) == 0)
  {
LABEL_77:
    if ((v18 & 0x40000000) == 0)
      goto LABEL_79;
    goto LABEL_78;
  }
LABEL_143:
  self->_lastMotionState = *((_DWORD *)v5 + 24);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  if ((*(_QWORD *)(v5 + 260) & 0x40000000) != 0)
  {
LABEL_78:
    self->_msSinceLastMotionState = *((_DWORD *)v5 + 35);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
  }
LABEL_79:
  if (*((_QWORD *)v5 + 28))
    -[CellularCallEndDetails setTransId:](self, "setTransId:");
  if ((v5[266] & 0x10) != 0)
  {
    self->_version = *((_DWORD *)v5 + 61);
    *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)callId
{
  return self->_callId;
}

- (int)endStatus
{
  return self->_endStatus;
}

- (unsigned)ccCause
{
  return self->_ccCause;
}

- (int)qmiReleaseCause
{
  return self->_qmiReleaseCause;
}

- (int)callDuration
{
  return self->_callDuration;
}

- (BOOL)established
{
  return self->_established;
}

- (BOOL)connected
{
  return self->_connected;
}

- (unsigned)lteCellId
{
  return self->_lteCellId;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)zoneId
{
  return self->_zoneId;
}

- (unsigned)baseId
{
  return self->_baseId;
}

- (unsigned)lteLac
{
  return self->_lteLac;
}

- (unsigned)sid
{
  return self->_sid;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (unsigned)lac
{
  return self->_lac;
}

- (BOOL)mrabEver
{
  return self->_mrabEver;
}

- (BOOL)mrabEnd
{
  return self->_mrabEnd;
}

- (unsigned)rfChannel
{
  return self->_rfChannel;
}

- (unsigned)psc
{
  return self->_psc;
}

- (unsigned)ttyMode
{
  return self->_ttyMode;
}

- (unsigned)tsAccuracyHour
{
  return self->_tsAccuracyHour;
}

- (BOOL)accessoryAttached
{
  return self->_accessoryAttached;
}

- (BOOL)sl2
{
  return self->_sl2;
}

- (unsigned)coexPolicy
{
  return self->_coexPolicy;
}

- (BOOL)sl
{
  return self->_sl;
}

- (BOOL)fb
{
  return self->_fb;
}

- (unsigned)msOrigToFb
{
  return self->_msOrigToFb;
}

- (unsigned)msOrigToConf
{
  return self->_msOrigToConf;
}

- (unsigned)msOrigToEnd
{
  return self->_msOrigToEnd;
}

- (unsigned)msStartToAlert
{
  return self->_msStartToAlert;
}

- (unsigned)msFbToSetup
{
  return self->_msFbToSetup;
}

- (unsigned)msPageToSetup
{
  return self->_msPageToSetup;
}

- (unsigned)msSetupToEnd
{
  return self->_msSetupToEnd;
}

- (int)ecioDbx2
{
  return self->_ecioDbx2;
}

- (int)rssiDbm
{
  return self->_rssiDbm;
}

- (int)txPwrDbm
{
  return self->_txPwrDbm;
}

- (unsigned)sensorUseDuringLastCallMs
{
  return self->_sensorUseDuringLastCallMs;
}

- (unsigned)sensorEndToPresentMs
{
  return self->_sensorEndToPresentMs;
}

- (NSMutableArray)capEvents
{
  return self->_capEvents;
}

- (void)setCapEvents:(id)a3
{
  objc_storeStrong((id *)&self->_capEvents, a3);
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

- (unsigned)hoType
{
  return self->_hoType;
}

- (unsigned)hstState
{
  return self->_hstState;
}

- (unsigned)rrcRelCause
{
  return self->_rrcRelCause;
}

- (NSMutableArray)rfMeasInfos
{
  return self->_rfMeasInfos;
}

- (void)setRfMeasInfos:(id)a3
{
  objc_storeStrong((id *)&self->_rfMeasInfos, a3);
}

- (unsigned)isSrvccSuccess
{
  return self->_isSrvccSuccess;
}

- (unsigned)srvccFailureCause
{
  return self->_srvccFailureCause;
}

- (unsigned)lastMotionState
{
  return self->_lastMotionState;
}

- (unsigned)msSinceLastMotionState
{
  return self->_msSinceLastMotionState;
}

- (NSString)transId
{
  return self->_transId;
}

- (void)setTransId:(id)a3
{
  objc_storeStrong((id *)&self->_transId, a3);
}

- (unsigned)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transId, 0);
  objc_storeStrong((id *)&self->_rfMeasInfos, 0);
  objc_storeStrong((id *)&self->_capEvents, 0);
}

@end
