@implementation KCellularMmContext

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

- (int)regStatus
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_regStatus;
  else
    return 0;
}

- (void)setRegStatus:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_regStatus = a3;
}

- (void)setHasRegStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRegStatus
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)regStatusAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("KREG_STATUS_NORMAL_SERVICE");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("KREG_STATUS_REGISTRATION_FAILURE");
      return v3;
    case 2:
      return CFSTR("KREG_STATUS_LIMITED_SERVICE");
    case 3:
      return CFSTR("KREG_STATUS_NO_SERVICE");
    case 4:
      return CFSTR("KREG_STATUS_AT_NOT_REGISTERED");
    case 5:
      return CFSTR("KREG_STATUS_REGISTRATION_SERVICE_DISABLED");
    case 6:
      return CFSTR("KREG_STATUS_SERVICE_DETACHED");
    case 7:
      return CFSTR("KREG_STATUS_SERVICE_ACTIVATED");
    case 8:
      return CFSTR("KREG_STATUS_EMERGENCY_SERVICE");
    case 9:
      return CFSTR("KREG_STATUS_EMERGENCY_LIMITED");
    case 10:
      return CFSTR("KREG_STATUS_REGISTERED_SMS_ONLY");
    case 11:
      return CFSTR("KREG_STATUS_REGISTRATION_IN_PROGRESS");
    case 12:
      return CFSTR("KREG_STATUS_POWER_OFF_NO_SERVICE");
    default:
      if (a3 == 100)
        return CFSTR("KREG_STATUS_SUSPENDED");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsRegStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_NORMAL_SERVICE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_REGISTRATION_FAILURE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_LIMITED_SERVICE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_NO_SERVICE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_AT_NOT_REGISTERED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_REGISTRATION_SERVICE_DISABLED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_SERVICE_DETACHED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_SERVICE_ACTIVATED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_EMERGENCY_SERVICE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_EMERGENCY_LIMITED")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_REGISTERED_SMS_ONLY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_REGISTRATION_IN_PROGRESS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_POWER_OFF_NO_SERVICE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KREG_STATUS_SUSPENDED")))
  {
    v4 = 100;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)updateStatus
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_updateStatus;
  else
    return 1;
}

- (void)setUpdateStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_updateStatus = a3;
}

- (void)setHasUpdateStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasUpdateStatus
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)updateStatusAsString:(int)a3
{
  if ((a3 - 1) >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F728 + a3 - 1);
}

- (int)StringAsUpdateStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_UPDATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_NOT_UPDATED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_ROAMING_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_UPDATE_DISABLED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasLai
{
  return self->_lai != 0;
}

- (void)setTmsi:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_tmsi = a3;
}

- (void)setHasTmsi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTmsi
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setT3212DurS:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_t3212DurS = a3;
}

- (void)setHasT3212DurS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasT3212DurS
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)procFailureCause
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_procFailureCause;
  else
    return 0;
}

- (void)setProcFailureCause:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_procFailureCause = a3;
}

- (void)setHasProcFailureCause:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasProcFailureCause
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)procFailureCauseAsString:(int)a3
{
  if (a3 >= 0x10)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F748 + a3);
}

- (int)StringAsProcFailureCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_LOWER_LAYER_FAILURE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_ACCESS_BARRED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_LIMITED_SERVICE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_PAGE_NOT_EXPECTED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_T3210_EXPIRY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_T3240_EXPIRY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_DETACH_INITIATED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_PS_SUSPENDED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_SERV_REQ_THROTTLING")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_T3317_EXPIRY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_REJECTED_BY_NW")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_NW_AUTH_REJ")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_INVALID_IE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_TIMEOUT")) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_PROC_FAILURE_CAUSE_OTHER")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)rejectCause
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_rejectCause;
  else
    return 0;
}

- (void)setRejectCause:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rejectCause = a3;
}

- (void)setHasRejectCause:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRejectCause
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)rejectCauseAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("KNAS_MM_REJ_CAUSE_NONE");
  switch(a3)
  {
    case 0:
      goto LABEL_3;
    case 1:
    case 18:
    case 19:
    case 24:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 35:
    case 36:
    case 37:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
LABEL_39:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      goto LABEL_3;
    case 2:
      v3 = CFSTR("KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN");
LABEL_3:
      result = v3;
      break;
    case 3:
      result = CFSTR("KNAS_MM_REJ_CAUSE_ILLEGAL_MS");
      break;
    case 4:
      result = CFSTR("KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN_IN_VLR");
      break;
    case 5:
      result = CFSTR("KNAS_MM_REJ_CAUSE_IMEI_NOT_ACCEPTED");
      break;
    case 6:
      result = CFSTR("KNAS_MM_REJ_CAUSE_ILLEGAL_ME");
      break;
    case 7:
      result = CFSTR("KNAS_MM_REJ_CAUSE_GPRS_SERVICES_NOT_ALLOWED");
      break;
    case 8:
      result = CFSTR("KNAS_MM_REJ_CAUSE_GPRS_AND_NON_GPRS_SERVICES_NOT_ALLOWED");
      break;
    case 9:
      result = CFSTR("KNAS_MM_REJ_CAUSE_MS_IDENTITY_NOT_DERIVED_BY_NW");
      break;
    case 10:
      result = CFSTR("KNAS_MM_REJ_CAUSE_IMPLICITLY_DET");
      break;
    case 11:
      result = CFSTR("KNAS_MM_REJ_CAUSE_PLMN_NOT_ALLOWED");
      break;
    case 12:
      result = CFSTR("KNAS_MM_REJ_CAUSE_LA_NOT_ALLOWED");
      break;
    case 13:
      result = CFSTR("KNAS_MM_REJ_CAUSE_ROM_NOT_ALLOWED_IN_LA");
      break;
    case 14:
      result = CFSTR("KNAS_MM_REJ_CAUSE_GPRS_NOT_ALLOWED_IN_PLMN");
      break;
    case 15:
      result = CFSTR("KNAS_MM_REJ_CAUSE_NO_SUITABLE_CELL_IN_LA");
      break;
    case 16:
      result = CFSTR("KNAS_MM_REJ_CAUSE_MSC_OUT_OF_REACH");
      break;
    case 17:
      result = CFSTR("KNAS_MM_REJ_CAUSE_NW_FAILURE");
      break;
    case 20:
      result = CFSTR("KNAS_MM_REJ_CAUSE_MAC_FAILURE");
      break;
    case 21:
      result = CFSTR("KNAS_MM_REJ_CAUSE_SYNCH_FAILURE");
      break;
    case 22:
      result = CFSTR("KNAS_MM_REJ_CAUSE_CONGESTION");
      break;
    case 23:
      result = CFSTR("KNAS_MM_REJ_CAUSE_GSM_AUTH_UNACCEPTABLE");
      break;
    case 25:
      result = CFSTR("KNAS_MM_REJ_CAUSE_CSG_NOT_AUTHORIZED");
      break;
    case 32:
      result = CFSTR("KNAS_MM_REJ_CAUSE_SERVICE_OPTION_NOT_SUPPORTED");
      break;
    case 33:
      result = CFSTR("KNAS_MM_REJ_CAUSE_REQ_SERVICE_OPTION_NOT_SUBSCRIBED");
      break;
    case 34:
      result = CFSTR("KNAS_MM_REJ_CAUSE_SERVICE_OPTION_TEMPORARILY_OUT_OF_ORDER");
      break;
    case 38:
      result = CFSTR("KNAS_MM_REJ_CAUSE_CALL_NOT_IDENTIFIED");
      break;
    case 40:
      result = CFSTR("KNAS_MM_REJ_CAUSE_NO_PDP_CONTEXT_ACTIVATED");
      break;
    case 63:
      result = CFSTR("KNAS_MM_REJ_CAUSE_RETRY_UPON_ENTRY_TO_NEW_CELL");
      break;
    default:
      switch(a3)
      {
        case '_':
          result = CFSTR("KNAS_MM_REJ_CAUSE_SEMANTICALLY_INCORRECT_MSG");
          break;
          result = CFSTR("KNAS_MM_REJ_CAUSE_INVALID_MANDATORY_INFO");
          break;
        case 'a':
          result = CFSTR("KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_IMPL");
          break;
        case 'b':
          result = CFSTR("KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_COMPATIBLE");
          break;
        case 'c':
          result = CFSTR("KNAS_MM_REJ_CAUSE_INFO_ELEMENT_NOT_IMPL");
          break;
        case 'd':
          result = CFSTR("KNAS_MM_REJ_CAUSE_IE_ERROR");
          break;
        case 'e':
          result = CFSTR("KNAS_MM_REJ_CAUSE_MSG_NOT_COMPATIBLE");
          break;
        case 'o':
          result = CFSTR("KNAS_MM_REJ_CAUSE_PROTOCOL_ERROR_UNSPECIFIED");
          break;
        default:
          goto LABEL_39;
      }
      break;
  }
  return result;
}

- (int)StringAsRejectCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_ILLEGAL_MS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN_IN_VLR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_IMEI_NOT_ACCEPTED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_ILLEGAL_ME")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_GPRS_SERVICES_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_GPRS_AND_NON_GPRS_SERVICES_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_MS_IDENTITY_NOT_DERIVED_BY_NW")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_IMPLICITLY_DET")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_PLMN_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_LA_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_ROM_NOT_ALLOWED_IN_LA")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_GPRS_NOT_ALLOWED_IN_PLMN")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_NO_SUITABLE_CELL_IN_LA")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_MSC_OUT_OF_REACH")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_NW_FAILURE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_MAC_FAILURE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_SYNCH_FAILURE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_CONGESTION")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_GSM_AUTH_UNACCEPTABLE")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_CSG_NOT_AUTHORIZED")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_SERVICE_OPTION_NOT_SUPPORTED")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_REQ_SERVICE_OPTION_NOT_SUBSCRIBED")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_SERVICE_OPTION_TEMPORARILY_OUT_OF_ORDER")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_CALL_NOT_IDENTIFIED")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_NO_PDP_CONTEXT_ACTIVATED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_RETRY_UPON_ENTRY_TO_NEW_CELL")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_SEMANTICALLY_INCORRECT_MSG")) & 1) != 0)
  {
    v4 = 95;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_INVALID_MANDATORY_INFO")) & 1) != 0)
  {
    v4 = 96;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_IMPL")) & 1) != 0)
  {
    v4 = 97;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_COMPATIBLE")) & 1) != 0)
  {
    v4 = 98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_INFO_ELEMENT_NOT_IMPL")) & 1) != 0)
  {
    v4 = 99;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_IE_ERROR")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_MSG_NOT_COMPATIBLE")) & 1) != 0)
  {
    v4 = 101;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KNAS_MM_REJ_CAUSE_PROTOCOL_ERROR_UNSPECIFIED")))
  {
    v4 = 111;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsCombinedProc:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isCombinedProc = a3;
}

- (void)setHasIsCombinedProc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsCombinedProc
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularMmContext;
  v3 = -[KCellularMmContext description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularMmContext dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  int regStatus;
  __CFString *v7;
  int v8;
  void *v9;
  KCellularLocationAreaId *lai;
  void *v11;
  __int16 v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t procFailureCause;
  void *v18;
  int rejectCause;
  __CFString *v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_27;
      goto LABEL_23;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  regStatus = self->_regStatus;
  v7 = CFSTR("KREG_STATUS_NORMAL_SERVICE");
  switch(regStatus)
  {
    case 0:
      break;
    case 1:
      v7 = CFSTR("KREG_STATUS_REGISTRATION_FAILURE");
      break;
    case 2:
      v7 = CFSTR("KREG_STATUS_LIMITED_SERVICE");
      break;
    case 3:
      v7 = CFSTR("KREG_STATUS_NO_SERVICE");
      break;
    case 4:
      v7 = CFSTR("KREG_STATUS_AT_NOT_REGISTERED");
      break;
    case 5:
      v7 = CFSTR("KREG_STATUS_REGISTRATION_SERVICE_DISABLED");
      break;
    case 6:
      v7 = CFSTR("KREG_STATUS_SERVICE_DETACHED");
      break;
    case 7:
      v7 = CFSTR("KREG_STATUS_SERVICE_ACTIVATED");
      break;
    case 8:
      v7 = CFSTR("KREG_STATUS_EMERGENCY_SERVICE");
      break;
    case 9:
      v7 = CFSTR("KREG_STATUS_EMERGENCY_LIMITED");
      break;
    case 10:
      v7 = CFSTR("KREG_STATUS_REGISTERED_SMS_ONLY");
      break;
    case 11:
      v7 = CFSTR("KREG_STATUS_REGISTRATION_IN_PROGRESS");
      break;
    case 12:
      v7 = CFSTR("KREG_STATUS_POWER_OFF_NO_SERVICE");
      break;
    default:
      if (regStatus == 100)
        v7 = CFSTR("KREG_STATUS_SUSPENDED");
      else
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_regStatus));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("reg_status"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_23:
    v8 = self->_updateStatus - 1;
    if (v8 >= 4)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_updateStatus));
    else
      v9 = *(&off_10025F728 + v8);
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("update_status"));

  }
LABEL_27:
  lai = self->_lai;
  if (lai)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLocationAreaId dictionaryRepresentation](lai, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("lai"));

  }
  v12 = (__int16)self->_has;
  if ((v12 & 0x40) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tmsi));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("tmsi"));

    v12 = (__int16)self->_has;
    if ((v12 & 0x20) == 0)
    {
LABEL_31:
      if ((v12 & 2) == 0)
        goto LABEL_32;
      goto LABEL_39;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_31;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_t3212DurS));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("t3212_dur_s"));

  v12 = (__int16)self->_has;
  if ((v12 & 2) == 0)
  {
LABEL_32:
    if ((v12 & 8) == 0)
      goto LABEL_33;
    goto LABEL_43;
  }
LABEL_39:
  procFailureCause = self->_procFailureCause;
  if (procFailureCause >= 0x10)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_procFailureCause));
  else
    v18 = *(&off_10025F748 + procFailureCause);
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("proc_failure_cause"));

  v12 = (__int16)self->_has;
  if ((v12 & 8) == 0)
  {
LABEL_33:
    if ((v12 & 0x100) == 0)
      goto LABEL_34;
LABEL_82:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isCombinedProc));
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("is_combined_proc"));

    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_35;
  }
LABEL_43:
  rejectCause = self->_rejectCause;
  v20 = CFSTR("KNAS_MM_REJ_CAUSE_NONE");
  switch(rejectCause)
  {
    case 0:
      break;
    case 1:
    case 18:
    case 19:
    case 24:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 35:
    case 36:
    case 37:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
LABEL_79:
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rejectCause));
      break;
    case 2:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN");
      break;
    case 3:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_ILLEGAL_MS");
      break;
    case 4:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN_IN_VLR");
      break;
    case 5:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_IMEI_NOT_ACCEPTED");
      break;
    case 6:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_ILLEGAL_ME");
      break;
    case 7:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_GPRS_SERVICES_NOT_ALLOWED");
      break;
    case 8:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_GPRS_AND_NON_GPRS_SERVICES_NOT_ALLOWED");
      break;
    case 9:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_MS_IDENTITY_NOT_DERIVED_BY_NW");
      break;
    case 10:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_IMPLICITLY_DET");
      break;
    case 11:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_PLMN_NOT_ALLOWED");
      break;
    case 12:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_LA_NOT_ALLOWED");
      break;
    case 13:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_ROM_NOT_ALLOWED_IN_LA");
      break;
    case 14:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_GPRS_NOT_ALLOWED_IN_PLMN");
      break;
    case 15:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_NO_SUITABLE_CELL_IN_LA");
      break;
    case 16:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_MSC_OUT_OF_REACH");
      break;
    case 17:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_NW_FAILURE");
      break;
    case 20:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_MAC_FAILURE");
      break;
    case 21:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_SYNCH_FAILURE");
      break;
    case 22:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_CONGESTION");
      break;
    case 23:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_GSM_AUTH_UNACCEPTABLE");
      break;
    case 25:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_CSG_NOT_AUTHORIZED");
      break;
    case 32:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_SERVICE_OPTION_NOT_SUPPORTED");
      break;
    case 33:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_REQ_SERVICE_OPTION_NOT_SUBSCRIBED");
      break;
    case 34:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_SERVICE_OPTION_TEMPORARILY_OUT_OF_ORDER");
      break;
    case 38:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_CALL_NOT_IDENTIFIED");
      break;
    case 40:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_NO_PDP_CONTEXT_ACTIVATED");
      break;
    case 63:
      v20 = CFSTR("KNAS_MM_REJ_CAUSE_RETRY_UPON_ENTRY_TO_NEW_CELL");
      break;
    default:
      switch(rejectCause)
      {
        case '_':
          v20 = CFSTR("KNAS_MM_REJ_CAUSE_SEMANTICALLY_INCORRECT_MSG");
          break;
          v20 = CFSTR("KNAS_MM_REJ_CAUSE_INVALID_MANDATORY_INFO");
          break;
        case 'a':
          v20 = CFSTR("KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_IMPL");
          break;
        case 'b':
          v20 = CFSTR("KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_COMPATIBLE");
          break;
        case 'c':
          v20 = CFSTR("KNAS_MM_REJ_CAUSE_INFO_ELEMENT_NOT_IMPL");
          break;
        case 'd':
          v20 = CFSTR("KNAS_MM_REJ_CAUSE_IE_ERROR");
          break;
        case 'e':
          v20 = CFSTR("KNAS_MM_REJ_CAUSE_MSG_NOT_COMPATIBLE");
          break;
        case 'o':
          v20 = CFSTR("KNAS_MM_REJ_CAUSE_PROTOCOL_ERROR_UNSPECIFIED");
          break;
        default:
          goto LABEL_79;
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("reject_cause"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
    goto LABEL_82;
LABEL_34:
  if ((v12 & 0x10) != 0)
  {
LABEL_35:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D7DEC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  KCellularLocationAreaId *lai;
  __int16 v6;
  id v7;

  v7 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v7, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v7, self->_regStatus, 2);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field(v7, self->_updateStatus, 3);
LABEL_5:
  lai = self->_lai;
  if (lai)
    PBDataWriterWriteSubmessage(v7, lai, 4);
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_tmsi, 5);
    v6 = (__int16)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
      goto LABEL_20;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field(v7, self->_t3212DurS, 6);
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 8) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field(v7, self->_procFailureCause, 7);
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_11:
    if ((v6 & 0x100) == 0)
      goto LABEL_12;
LABEL_22:
    PBDataWriterWriteBOOLField(v7, self->_isCombinedProc, 9);
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_21:
  PBDataWriterWriteInt32Field(v7, self->_rejectCause, 8);
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
    goto LABEL_22;
LABEL_12:
  if ((v6 & 0x10) != 0)
LABEL_13:
    PBDataWriterWriteUint32Field(v7, self->_subsId, 15);
LABEL_14:

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
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_regStatus;
  *((_WORD *)v4 + 28) |= 4u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 12) = self->_updateStatus;
    *((_WORD *)v4 + 28) |= 0x80u;
  }
LABEL_5:
  if (self->_lai)
  {
    v7 = v4;
    objc_msgSend(v4, "setLai:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_tmsi;
    *((_WORD *)v4 + 28) |= 0x40u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0)
        goto LABEL_10;
      goto LABEL_20;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 10) = self->_t3212DurS;
  *((_WORD *)v4 + 28) |= 0x20u;
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 8) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 6) = self->_procFailureCause;
  *((_WORD *)v4 + 28) |= 2u;
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_11:
    if ((v6 & 0x100) == 0)
      goto LABEL_12;
LABEL_22:
    *((_BYTE *)v4 + 52) = self->_isCombinedProc;
    *((_WORD *)v4 + 28) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_21:
  *((_DWORD *)v4 + 8) = self->_rejectCause;
  *((_WORD *)v4 + 28) |= 8u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
    goto LABEL_22;
LABEL_12:
  if ((v6 & 0x10) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_subsId;
    *((_WORD *)v4 + 28) |= 0x10u;
  }
LABEL_14:

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
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_regStatus;
  *((_WORD *)v5 + 28) |= 4u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 12) = self->_updateStatus;
    *((_WORD *)v5 + 28) |= 0x80u;
  }
LABEL_5:
  v8 = -[KCellularLocationAreaId copyWithZone:](self->_lai, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_tmsi;
    *((_WORD *)v6 + 28) |= 0x40u;
    v10 = (__int16)self->_has;
    if ((v10 & 0x20) == 0)
    {
LABEL_7:
      if ((v10 & 2) == 0)
        goto LABEL_8;
      goto LABEL_18;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v6 + 10) = self->_t3212DurS;
  *((_WORD *)v6 + 28) |= 0x20u;
  v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_8:
    if ((v10 & 8) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v6 + 6) = self->_procFailureCause;
  *((_WORD *)v6 + 28) |= 2u;
  v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_9:
    if ((v10 & 0x100) == 0)
      goto LABEL_10;
LABEL_20:
    *((_BYTE *)v6 + 52) = self->_isCombinedProc;
    *((_WORD *)v6 + 28) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v6;
    goto LABEL_11;
  }
LABEL_19:
  *((_DWORD *)v6 + 8) = self->_rejectCause;
  *((_WORD *)v6 + 28) |= 8u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
    goto LABEL_20;
LABEL_10:
  if ((v10 & 0x10) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 9) = self->_subsId;
    *((_WORD *)v6 + 28) |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  KCellularLocationAreaId *lai;
  __int16 v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_53;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 28);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_53;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_regStatus != *((_DWORD *)v4 + 7))
      goto LABEL_53;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_updateStatus != *((_DWORD *)v4 + 12))
      goto LABEL_53;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_53;
  }
  lai = self->_lai;
  if ((unint64_t)lai | *((_QWORD *)v4 + 2))
  {
    if (!-[KCellularLocationAreaId isEqual:](lai, "isEqual:"))
      goto LABEL_53;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)v4 + 28);
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_tmsi != *((_DWORD *)v4 + 11))
      goto LABEL_53;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_t3212DurS != *((_DWORD *)v4 + 10))
      goto LABEL_53;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_procFailureCause != *((_DWORD *)v4 + 6))
      goto LABEL_53;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_rejectCause != *((_DWORD *)v4 + 8))
      goto LABEL_53;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x100) != 0)
    {
      if (self->_isCombinedProc)
      {
        if (!*((_BYTE *)v4 + 52))
          goto LABEL_53;
        goto LABEL_48;
      }
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_48;
    }
LABEL_53:
    v10 = 0;
    goto LABEL_54;
  }
  if ((*((_WORD *)v4 + 28) & 0x100) != 0)
    goto LABEL_53;
LABEL_48:
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 9))
      goto LABEL_53;
    v10 = 1;
  }
  else
  {
    v10 = (v9 & 0x10) == 0;
  }
LABEL_54:

  return v10;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    v4 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761u * self->_timestamp;
  if ((has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_regStatus;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_updateStatus;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[KCellularLocationAreaId hash](self->_lai, "hash");
  v8 = (__int16)self->_has;
  if ((v8 & 0x40) != 0)
  {
    v9 = 2654435761 * self->_tmsi;
    if ((v8 & 0x20) != 0)
    {
LABEL_10:
      v10 = 2654435761 * self->_t3212DurS;
      if ((v8 & 2) != 0)
        goto LABEL_11;
      goto LABEL_17;
    }
  }
  else
  {
    v9 = 0;
    if ((v8 & 0x20) != 0)
      goto LABEL_10;
  }
  v10 = 0;
  if ((v8 & 2) != 0)
  {
LABEL_11:
    v11 = 2654435761 * self->_procFailureCause;
    if ((v8 & 8) != 0)
      goto LABEL_12;
    goto LABEL_18;
  }
LABEL_17:
  v11 = 0;
  if ((v8 & 8) != 0)
  {
LABEL_12:
    v12 = 2654435761 * self->_rejectCause;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_13;
LABEL_19:
    v13 = 0;
    if ((v8 & 0x10) != 0)
      goto LABEL_14;
LABEL_20:
    v14 = 0;
    return v5 ^ v4 ^ v6 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v7;
  }
LABEL_18:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_19;
LABEL_13:
  v13 = 2654435761 * self->_isCombinedProc;
  if ((v8 & 0x10) == 0)
    goto LABEL_20;
LABEL_14:
  v14 = 2654435761 * self->_subsId;
  return v5 ^ v4 ^ v6 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  __int16 v6;
  KCellularLocationAreaId *lai;
  uint64_t v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 28);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 28);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 0x80) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_regStatus = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 28) & 0x80) != 0)
  {
LABEL_4:
    self->_updateStatus = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_5:
  lai = self->_lai;
  v8 = *((_QWORD *)v5 + 2);
  if (lai)
  {
    if (!v8)
      goto LABEL_14;
    v10 = v5;
    -[KCellularLocationAreaId mergeFrom:](lai, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    v10 = v5;
    -[KCellularMmContext setLai:](self, "setLai:");
  }
  v5 = v10;
LABEL_14:
  v9 = *((_WORD *)v5 + 28);
  if ((v9 & 0x40) != 0)
  {
    self->_tmsi = *((_DWORD *)v5 + 11);
    *(_WORD *)&self->_has |= 0x40u;
    v9 = *((_WORD *)v5 + 28);
    if ((v9 & 0x20) == 0)
    {
LABEL_16:
      if ((v9 & 2) == 0)
        goto LABEL_17;
      goto LABEL_24;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    goto LABEL_16;
  }
  self->_t3212DurS = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v9 = *((_WORD *)v5 + 28);
  if ((v9 & 2) == 0)
  {
LABEL_17:
    if ((v9 & 8) == 0)
      goto LABEL_18;
    goto LABEL_25;
  }
LABEL_24:
  self->_procFailureCause = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_has |= 2u;
  v9 = *((_WORD *)v5 + 28);
  if ((v9 & 8) == 0)
  {
LABEL_18:
    if ((v9 & 0x100) == 0)
      goto LABEL_19;
LABEL_26:
    self->_isCombinedProc = *((_BYTE *)v5 + 52);
    *(_WORD *)&self->_has |= 0x100u;
    if ((*((_WORD *)v5 + 28) & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_25:
  self->_rejectCause = *((_DWORD *)v5 + 8);
  *(_WORD *)&self->_has |= 8u;
  v9 = *((_WORD *)v5 + 28);
  if ((v9 & 0x100) != 0)
    goto LABEL_26;
LABEL_19:
  if ((v9 & 0x10) != 0)
  {
LABEL_20:
    self->_subsId = *((_DWORD *)v5 + 9);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_21:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (KCellularLocationAreaId)lai
{
  return self->_lai;
}

- (void)setLai:(id)a3
{
  objc_storeStrong((id *)&self->_lai, a3);
}

- (unsigned)tmsi
{
  return self->_tmsi;
}

- (unsigned)t3212DurS
{
  return self->_t3212DurS;
}

- (BOOL)isCombinedProc
{
  return self->_isCombinedProc;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lai, 0);
}

@end
