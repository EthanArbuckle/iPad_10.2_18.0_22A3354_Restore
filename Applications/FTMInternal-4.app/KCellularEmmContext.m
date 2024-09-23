@implementation KCellularEmmContext

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
    return 0;
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
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025ED50 + a3);
}

- (int)StringAsUpdateStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EPS_STATUS_UPDATED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EPS_STATUS_NOT_UPDATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EPS_STATUS_ROAMING_NOT_ALLOWED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)ueOpMode
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_ueOpMode;
  else
    return 0;
}

- (void)setUeOpMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_ueOpMode = a3;
}

- (void)setHasUeOpMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasUeOpMode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)ueOpModeAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025ED68 + a3);
}

- (int)StringAsUeOpMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EPS_UE_OP_MODE_PS_MODE_1")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EPS_UE_OP_MODE_PS_MODE_2")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EPS_UE_OP_MODE_CSPS_MODE_1")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EPS_UE_OP_MODE_CSPS_MODE_2")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearTaiLists
{
  -[NSMutableArray removeAllObjects](self->_taiLists, "removeAllObjects");
}

- (void)addTaiList:(id)a3
{
  id v4;
  NSMutableArray *taiLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  taiLists = self->_taiLists;
  v8 = v4;
  if (!taiLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_taiLists;
    self->_taiLists = v6;

    v4 = v8;
    taiLists = self->_taiLists;
  }
  -[NSMutableArray addObject:](taiLists, "addObject:", v4);

}

- (unint64_t)taiListsCount
{
  return (unint64_t)-[NSMutableArray count](self->_taiLists, "count");
}

- (id)taiListAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_taiLists, "objectAtIndex:", a3);
}

+ (Class)taiListType
{
  return (Class)objc_opt_class(KCellularTrackingAreaId, a2);
}

- (BOOL)hasGuti
{
  return self->_guti != 0;
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

  v3 = CFSTR("EMM_CAUSE_NO_CAUSE");
  switch(a3)
  {
    case 0:
      goto LABEL_3;
    case 1:
    case 4:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 36:
    case 37:
    case 38:
LABEL_39:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      goto LABEL_3;
    case 2:
      v3 = CFSTR("EMM_CAUSE_IMSI_UNKNOWN_IN_HSS");
LABEL_3:
      result = v3;
      break;
    case 3:
      result = CFSTR("EMM_CAUSE_ILLEGAL_UE");
      break;
    case 5:
      result = CFSTR("EMM_CAUSE_IMEI_NOT_ACCEPTED");
      break;
    case 6:
      result = CFSTR("EMM_CAUSE_ILLEGAL_ME");
      break;
    case 7:
      result = CFSTR("EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED");
      break;
    case 8:
      result = CFSTR("EMM_CAUSE_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED");
      break;
    case 9:
      result = CFSTR("EMM_CAUSE_UE_IDENTITY_CANNOT_BE_DERIVED_BY_NETWORK");
      break;
    case 10:
      result = CFSTR("EMM_CAUSE_IMPLICITLY_DETACHED");
      break;
    case 11:
      result = CFSTR("EMM_CAUSE_PLMN_NOT_ALLOWED");
      break;
    case 12:
      result = CFSTR("EMM_CAUSE_TRACKING_AREA_NOT_ALLOWED");
      break;
    case 13:
      result = CFSTR("EMM_CAUSE_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA");
      break;
    case 14:
      result = CFSTR("EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED_IN_THIS_PLMN");
      break;
    case 15:
      result = CFSTR("EMM_CAUSE_NO_SUITABLE_CELLS_IN_TRACKING_AREA");
      break;
    case 16:
      result = CFSTR("EMM_CAUSE_MSC_TEMPORARILY_NOT_REACHABLE");
      break;
    case 17:
      result = CFSTR("EMM_CAUSE_NETWORK_FAILURE");
      break;
    case 18:
      result = CFSTR("EMM_CAUSE_CS_DOMAIN_NOT_AVAILABLE");
      break;
    case 19:
      result = CFSTR("EMM_CAUSE_ESM_FAILURE");
      break;
    case 20:
      result = CFSTR("EMM_CAUSE_MAC_FAILURE");
      break;
    case 21:
      result = CFSTR("EMM_CAUSE_SYNCH_FAILURE");
      break;
    case 22:
      result = CFSTR("EMM_CAUSE_CONGESTION");
      break;
    case 23:
      result = CFSTR("EMM_CAUSE_UE_SECURITY_CAPABILITY_MISMATCH");
      break;
    case 24:
      result = CFSTR("EMM_CAUSE_SECURITY_MODE_REJECTED_UNSPECIFIED");
      break;
    case 25:
      result = CFSTR("EMM_CAUSE_NOT_AUTHORIZED_FOR_THIS_CSG");
      break;
    case 26:
      result = CFSTR("EMM_CAUSE_NON_EPS_AUTHENTICATION_UNACCEPTABLE");
      break;
    case 35:
      result = CFSTR("EMM_CAUSE_REQUESTED_SERVICE_OPTION_NOT_AUTHORIZED_IN_THIS_PLMN");
      break;
    case 39:
      result = CFSTR("EMM_CAUSE_CS_DOMAIN_TEMPORARILY_NOT_AVAILABLE");
      break;
    case 40:
      result = CFSTR("EMM_CAUSE_NO_EPS_BEARER_CONTEXT_ACTIVATED");
      break;
    default:
      switch(a3)
      {
        case '_':
          result = CFSTR("EMM_CAUSE_SEMANTICALLY_INCORRECT_MESSAGE");
          break;
          result = CFSTR("EMM_CAUSE_INVALID_MANDATORY_INFORMATION");
          break;
        case 'a':
          result = CFSTR("EMM_CAUSE_MESSAGE_TYPE_NON_EXISTENT_OR_NOT_IMPLEMENTED");
          break;
        case 'b':
          result = CFSTR("EMM_CAUSE_MESSAGE_TYPE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE");
          break;
        case 'c':
          result = CFSTR("EMM_CAUSE_IE_NON_EXISTENT_OR_NOT_IMPLEMENTED");
          break;
        case 'd':
          result = CFSTR("EMM_CAUSE_CONDITIONAL_IE_ERROR");
          break;
        case 'e':
          result = CFSTR("EMM_CAUSE_MESSAGE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE");
          break;
        case 'o':
          result = CFSTR("EMM_CAUSE_PROTOCOL_ERROR_UNSPECIFIED");
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
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_NO_CAUSE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_IMSI_UNKNOWN_IN_HSS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_ILLEGAL_UE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_IMEI_NOT_ACCEPTED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_ILLEGAL_ME")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_UE_IDENTITY_CANNOT_BE_DERIVED_BY_NETWORK")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_IMPLICITLY_DETACHED")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_PLMN_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_TRACKING_AREA_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED_IN_THIS_PLMN")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_NO_SUITABLE_CELLS_IN_TRACKING_AREA")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_MSC_TEMPORARILY_NOT_REACHABLE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_NETWORK_FAILURE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_CS_DOMAIN_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_ESM_FAILURE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_MAC_FAILURE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_SYNCH_FAILURE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_CONGESTION")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_UE_SECURITY_CAPABILITY_MISMATCH")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_SECURITY_MODE_REJECTED_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_NOT_AUTHORIZED_FOR_THIS_CSG")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_NON_EPS_AUTHENTICATION_UNACCEPTABLE")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_REQUESTED_SERVICE_OPTION_NOT_AUTHORIZED_IN_THIS_PLMN")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_CS_DOMAIN_TEMPORARILY_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_NO_EPS_BEARER_CONTEXT_ACTIVATED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_SEMANTICALLY_INCORRECT_MESSAGE")) & 1) != 0)
  {
    v4 = 95;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_INVALID_MANDATORY_INFORMATION")) & 1) != 0)
  {
    v4 = 96;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_MESSAGE_TYPE_NON_EXISTENT_OR_NOT_IMPLEMENTED")) & 1) != 0)
  {
    v4 = 97;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_MESSAGE_TYPE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE")) & 1) != 0)
  {
    v4 = 98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_IE_NON_EXISTENT_OR_NOT_IMPLEMENTED")) & 1) != 0)
  {
    v4 = 99;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_CONDITIONAL_IE_ERROR")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_MESSAGE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE")) & 1) != 0)
  {
    v4 = 101;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_CAUSE_PROTOCOL_ERROR_UNSPECIFIED")))
  {
    v4 = 111;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)regProc
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_regProc;
  else
    return 0;
}

- (void)setRegProc:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_regProc = a3;
}

- (void)setHasRegProc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRegProc
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)regProcAsString:(int)a3
{
  if (a3 >= 8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025ED88 + a3);
}

- (int)StringAsRegProc:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_PROC_NO_PROC")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_PROC_ATTACH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_PROC_ATTACH_COMB")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_PROC_EMERGENCY_ATTACH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_PROC_TAU")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_PROC_TAU_COMB")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_PROC_PERIODIC_TAU")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_PROC_SERV_REQ")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setT3412DurS:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_t3412DurS = a3;
}

- (void)setHasT3412DurS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasT3412DurS
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsImsVoiceSupported:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isImsVoiceSupported = a3;
}

- (void)setHasIsImsVoiceSupported:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsImsVoiceSupported
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsEmergBearerSupported:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isEmergBearerSupported = a3;
}

- (void)setHasIsEmergBearerSupported:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsEmergBearerSupported
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
  v8.super_class = (Class)KCellularEmmContext;
  v3 = -[KCellularEmmContext description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularEmmContext dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  uint64_t updateStatus;
  void *v9;
  uint64_t ueOpMode;
  void *v11;
  id v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  Guti *guti;
  void *v20;
  __int16 v21;
  void *v22;
  int rejectCause;
  __CFString *v25;
  uint64_t regProc;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

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
        goto LABEL_4;
      goto LABEL_24;
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

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_32;
    goto LABEL_28;
  }
LABEL_24:
  updateStatus = self->_updateStatus;
  if (updateStatus >= 3)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_updateStatus));
  else
    v9 = *(&off_10025ED50 + updateStatus);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("update_status"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_28:
    ueOpMode = self->_ueOpMode;
    if (ueOpMode >= 4)
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ueOpMode));
    else
      v11 = *(&off_10025ED68 + ueOpMode);
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("ue_op_mode"));

  }
LABEL_32:
  if (-[NSMutableArray count](self->_taiLists, "count"))
  {
    v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_taiLists, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = self->_taiLists;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("tai_list"));
  }
  guti = self->_guti;
  if (guti)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[Guti dictionaryRepresentation](guti, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("guti"));

  }
  v21 = (__int16)self->_has;
  if ((v21 & 8) != 0)
  {
    rejectCause = self->_rejectCause;
    v25 = CFSTR("EMM_CAUSE_NO_CAUSE");
    switch(rejectCause)
    {
      case 0:
        break;
      case 1:
      case 4:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 36:
      case 37:
      case 38:
LABEL_88:
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rejectCause));
        break;
      case 2:
        v25 = CFSTR("EMM_CAUSE_IMSI_UNKNOWN_IN_HSS");
        break;
      case 3:
        v25 = CFSTR("EMM_CAUSE_ILLEGAL_UE");
        break;
      case 5:
        v25 = CFSTR("EMM_CAUSE_IMEI_NOT_ACCEPTED");
        break;
      case 6:
        v25 = CFSTR("EMM_CAUSE_ILLEGAL_ME");
        break;
      case 7:
        v25 = CFSTR("EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED");
        break;
      case 8:
        v25 = CFSTR("EMM_CAUSE_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED");
        break;
      case 9:
        v25 = CFSTR("EMM_CAUSE_UE_IDENTITY_CANNOT_BE_DERIVED_BY_NETWORK");
        break;
      case 10:
        v25 = CFSTR("EMM_CAUSE_IMPLICITLY_DETACHED");
        break;
      case 11:
        v25 = CFSTR("EMM_CAUSE_PLMN_NOT_ALLOWED");
        break;
      case 12:
        v25 = CFSTR("EMM_CAUSE_TRACKING_AREA_NOT_ALLOWED");
        break;
      case 13:
        v25 = CFSTR("EMM_CAUSE_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA");
        break;
      case 14:
        v25 = CFSTR("EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED_IN_THIS_PLMN");
        break;
      case 15:
        v25 = CFSTR("EMM_CAUSE_NO_SUITABLE_CELLS_IN_TRACKING_AREA");
        break;
      case 16:
        v25 = CFSTR("EMM_CAUSE_MSC_TEMPORARILY_NOT_REACHABLE");
        break;
      case 17:
        v25 = CFSTR("EMM_CAUSE_NETWORK_FAILURE");
        break;
      case 18:
        v25 = CFSTR("EMM_CAUSE_CS_DOMAIN_NOT_AVAILABLE");
        break;
      case 19:
        v25 = CFSTR("EMM_CAUSE_ESM_FAILURE");
        break;
      case 20:
        v25 = CFSTR("EMM_CAUSE_MAC_FAILURE");
        break;
      case 21:
        v25 = CFSTR("EMM_CAUSE_SYNCH_FAILURE");
        break;
      case 22:
        v25 = CFSTR("EMM_CAUSE_CONGESTION");
        break;
      case 23:
        v25 = CFSTR("EMM_CAUSE_UE_SECURITY_CAPABILITY_MISMATCH");
        break;
      case 24:
        v25 = CFSTR("EMM_CAUSE_SECURITY_MODE_REJECTED_UNSPECIFIED");
        break;
      case 25:
        v25 = CFSTR("EMM_CAUSE_NOT_AUTHORIZED_FOR_THIS_CSG");
        break;
      case 26:
        v25 = CFSTR("EMM_CAUSE_NON_EPS_AUTHENTICATION_UNACCEPTABLE");
        break;
      case 35:
        v25 = CFSTR("EMM_CAUSE_REQUESTED_SERVICE_OPTION_NOT_AUTHORIZED_IN_THIS_PLMN");
        break;
      case 39:
        v25 = CFSTR("EMM_CAUSE_CS_DOMAIN_TEMPORARILY_NOT_AVAILABLE");
        break;
      case 40:
        v25 = CFSTR("EMM_CAUSE_NO_EPS_BEARER_CONTEXT_ACTIVATED");
        break;
      default:
        switch(rejectCause)
        {
          case '_':
            v25 = CFSTR("EMM_CAUSE_SEMANTICALLY_INCORRECT_MESSAGE");
            break;
            v25 = CFSTR("EMM_CAUSE_INVALID_MANDATORY_INFORMATION");
            break;
          case 'a':
            v25 = CFSTR("EMM_CAUSE_MESSAGE_TYPE_NON_EXISTENT_OR_NOT_IMPLEMENTED");
            break;
          case 'b':
            v25 = CFSTR("EMM_CAUSE_MESSAGE_TYPE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE");
            break;
          case 'c':
            v25 = CFSTR("EMM_CAUSE_IE_NON_EXISTENT_OR_NOT_IMPLEMENTED");
            break;
          case 'd':
            v25 = CFSTR("EMM_CAUSE_CONDITIONAL_IE_ERROR");
            break;
          case 'e':
            v25 = CFSTR("EMM_CAUSE_MESSAGE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE");
            break;
          case 'o':
            v25 = CFSTR("EMM_CAUSE_PROTOCOL_ERROR_UNSPECIFIED");
            break;
          default:
            goto LABEL_88;
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("reject_cause"));

    v21 = (__int16)self->_has;
    if ((v21 & 2) == 0)
    {
LABEL_45:
      if ((v21 & 0x20) == 0)
        goto LABEL_46;
      goto LABEL_94;
    }
  }
  else if ((v21 & 2) == 0)
  {
    goto LABEL_45;
  }
  regProc = self->_regProc;
  if (regProc >= 8)
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_regProc));
  else
    v27 = *(&off_10025ED88 + regProc);
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("reg_proc"));

  v21 = (__int16)self->_has;
  if ((v21 & 0x20) == 0)
  {
LABEL_46:
    if ((v21 & 0x200) == 0)
      goto LABEL_47;
    goto LABEL_95;
  }
LABEL_94:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_t3412DurS));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("t3412_dur_s"));

  v21 = (__int16)self->_has;
  if ((v21 & 0x200) == 0)
  {
LABEL_47:
    if ((v21 & 0x100) == 0)
      goto LABEL_48;
LABEL_96:
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isEmergBearerSupported));
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("is_emerg_bearer_supported"));

    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_49;
  }
LABEL_95:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isImsVoiceSupported));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("is_ims_voice_supported"));

  v21 = (__int16)self->_has;
  if ((v21 & 0x100) != 0)
    goto LABEL_96;
LABEL_48:
  if ((v21 & 0x10) != 0)
  {
LABEL_49:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005F7C4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  __int16 has;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  Guti *guti;
  __int16 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v5, self->_regStatus, 2);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_25:
  PBDataWriterWriteInt32Field(v5, self->_updateStatus, 3);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field(v5, self->_ueOpMode, 4);
LABEL_6:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_taiLists;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 5);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  guti = self->_guti;
  if (guti)
    PBDataWriterWriteSubmessage(v5, guti, 6);
  v13 = (__int16)self->_has;
  if ((v13 & 8) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_rejectCause, 7);
    v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_17:
      if ((v13 & 0x20) == 0)
        goto LABEL_18;
      goto LABEL_29;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field(v5, self->_regProc, 8);
  v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_18:
    if ((v13 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v5, self->_t3412DurS, 9);
  v13 = (__int16)self->_has;
  if ((v13 & 0x200) == 0)
  {
LABEL_19:
    if ((v13 & 0x100) == 0)
      goto LABEL_20;
LABEL_31:
    PBDataWriterWriteBOOLField(v5, self->_isEmergBearerSupported, 11);
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_30:
  PBDataWriterWriteBOOLField(v5, self->_isImsVoiceSupported, 10);
  v13 = (__int16)self->_has;
  if ((v13 & 0x100) != 0)
    goto LABEL_31;
LABEL_20:
  if ((v13 & 0x10) != 0)
LABEL_21:
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);
LABEL_22:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 34) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
LABEL_22:
      *((_DWORD *)v4 + 15) = self->_updateStatus;
      *((_WORD *)v4 + 34) |= 0x80u;
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_regStatus;
  *((_WORD *)v4 + 34) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_22;
LABEL_4:
  if ((has & 0x40) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 14) = self->_ueOpMode;
    *((_WORD *)v4 + 34) |= 0x40u;
  }
LABEL_6:
  v11 = v4;
  if (-[KCellularEmmContext taiListsCount](self, "taiListsCount"))
  {
    objc_msgSend(v11, "clearTaiLists");
    v6 = -[KCellularEmmContext taiListsCount](self, "taiListsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularEmmContext taiListAtIndex:](self, "taiListAtIndex:", i));
        objc_msgSend(v11, "addTaiList:", v9);

      }
    }
  }
  if (self->_guti)
    objc_msgSend(v11, "setGuti:");
  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    *((_DWORD *)v11 + 8) = self->_rejectCause;
    *((_WORD *)v11 + 34) |= 8u;
    v10 = (__int16)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_14:
      if ((v10 & 0x20) == 0)
        goto LABEL_15;
      goto LABEL_26;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v11 + 6) = self->_regProc;
  *((_WORD *)v11 + 34) |= 2u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_15:
    if ((v10 & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v11 + 10) = self->_t3412DurS;
  *((_WORD *)v11 + 34) |= 0x20u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_16:
    if ((v10 & 0x100) == 0)
      goto LABEL_17;
LABEL_28:
    *((_BYTE *)v11 + 64) = self->_isEmergBearerSupported;
    *((_WORD *)v11 + 34) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_27:
  *((_BYTE *)v11 + 65) = self->_isImsVoiceSupported;
  *((_WORD *)v11 + 34) |= 0x200u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
    goto LABEL_28;
LABEL_17:
  if ((v10 & 0x10) != 0)
  {
LABEL_18:
    *((_DWORD *)v11 + 9) = self->_subsId;
    *((_WORD *)v11 + 34) |= 0x10u;
  }
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  __int16 has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  id v14;
  void *v15;
  __int16 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 34) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_regStatus;
  *((_WORD *)v5 + 34) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_23:
  *((_DWORD *)v5 + 15) = self->_updateStatus;
  *((_WORD *)v5 + 34) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 14) = self->_ueOpMode;
    *((_WORD *)v5 + 34) |= 0x40u;
  }
LABEL_6:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_taiLists;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v6, "addTaiList:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v14 = -[Guti copyWithZone:](self->_guti, "copyWithZone:", a3);
  v15 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v14;

  v16 = (__int16)self->_has;
  if ((v16 & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_rejectCause;
    *((_WORD *)v6 + 34) |= 8u;
    v16 = (__int16)self->_has;
    if ((v16 & 2) == 0)
    {
LABEL_15:
      if ((v16 & 0x20) == 0)
        goto LABEL_16;
      goto LABEL_27;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v6 + 6) = self->_regProc;
  *((_WORD *)v6 + 34) |= 2u;
  v16 = (__int16)self->_has;
  if ((v16 & 0x20) == 0)
  {
LABEL_16:
    if ((v16 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v6 + 10) = self->_t3412DurS;
  *((_WORD *)v6 + 34) |= 0x20u;
  v16 = (__int16)self->_has;
  if ((v16 & 0x200) == 0)
  {
LABEL_17:
    if ((v16 & 0x100) == 0)
      goto LABEL_18;
LABEL_29:
    *((_BYTE *)v6 + 64) = self->_isEmergBearerSupported;
    *((_WORD *)v6 + 34) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      return v6;
    goto LABEL_19;
  }
LABEL_28:
  *((_BYTE *)v6 + 65) = self->_isImsVoiceSupported;
  *((_WORD *)v6 + 34) |= 0x200u;
  v16 = (__int16)self->_has;
  if ((v16 & 0x100) != 0)
    goto LABEL_29;
LABEL_18:
  if ((v16 & 0x10) != 0)
  {
LABEL_19:
    *((_DWORD *)v6 + 9) = self->_subsId;
    *((_WORD *)v6 + 34) |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  NSMutableArray *taiLists;
  Guti *guti;
  __int16 v10;
  __int16 v11;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_62;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 34);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_62;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_regStatus != *((_DWORD *)v4 + 7))
      goto LABEL_62;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_updateStatus != *((_DWORD *)v4 + 15))
      goto LABEL_62;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_ueOpMode != *((_DWORD *)v4 + 14))
      goto LABEL_62;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  taiLists = self->_taiLists;
  if ((unint64_t)taiLists | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](taiLists, "isEqual:"))
  {
    goto LABEL_62;
  }
  guti = self->_guti;
  if ((unint64_t)guti | *((_QWORD *)v4 + 2))
  {
    if (!-[Guti isEqual:](guti, "isEqual:"))
      goto LABEL_62;
  }
  v10 = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 34);
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_rejectCause != *((_DWORD *)v4 + 8))
      goto LABEL_62;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_regProc != *((_DWORD *)v4 + 6))
      goto LABEL_62;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_t3412DurS != *((_DWORD *)v4 + 10))
      goto LABEL_62;
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x200) == 0)
      goto LABEL_62;
    if (self->_isImsVoiceSupported)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_62;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x200) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x100) != 0)
    {
      if (self->_isEmergBearerSupported)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_62;
        goto LABEL_57;
      }
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_57;
    }
LABEL_62:
    v12 = 0;
    goto LABEL_63;
  }
  if ((*((_WORD *)v4 + 34) & 0x100) != 0)
    goto LABEL_62;
LABEL_57:
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 9))
      goto LABEL_62;
    v12 = 1;
  }
  else
  {
    v12 = (v11 & 0x10) == 0;
  }
LABEL_63:

  return v12;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_regStatus;
      if ((has & 0x80) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((has & 0x40) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_updateStatus;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_ueOpMode;
    goto LABEL_10;
  }
LABEL_9:
  v7 = 0;
LABEL_10:
  v8 = (unint64_t)-[NSMutableArray hash](self->_taiLists, "hash");
  v9 = -[Guti hash](self->_guti, "hash");
  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    v11 = 2654435761 * self->_rejectCause;
    if ((v10 & 2) != 0)
    {
LABEL_12:
      v12 = 2654435761 * self->_regProc;
      if ((v10 & 0x20) != 0)
        goto LABEL_13;
      goto LABEL_19;
    }
  }
  else
  {
    v11 = 0;
    if ((v10 & 2) != 0)
      goto LABEL_12;
  }
  v12 = 0;
  if ((v10 & 0x20) != 0)
  {
LABEL_13:
    v13 = 2654435761 * self->_t3412DurS;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_14;
    goto LABEL_20;
  }
LABEL_19:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_14:
    v14 = 2654435761 * self->_isImsVoiceSupported;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_15;
LABEL_21:
    v15 = 0;
    if ((v10 & 0x10) != 0)
      goto LABEL_16;
LABEL_22:
    v16 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_20:
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_21;
LABEL_15:
  v15 = 2654435761 * self->_isEmergBearerSupported;
  if ((v10 & 0x10) == 0)
    goto LABEL_22;
LABEL_16:
  v16 = 2654435761 * self->_subsId;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  __int16 v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  Guti *guti;
  uint64_t v13;
  __int16 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 34);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 34);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_regStatus = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 34);
  if ((v6 & 0x80) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  self->_updateStatus = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 34) & 0x40) != 0)
  {
LABEL_5:
    self->_ueOpMode = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_6:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *((id *)v4 + 6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[KCellularEmmContext addTaiList:](self, "addTaiList:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  guti = self->_guti;
  v13 = *((_QWORD *)v5 + 2);
  if (guti)
  {
    if (v13)
      -[Guti mergeFrom:](guti, "mergeFrom:");
  }
  else if (v13)
  {
    -[KCellularEmmContext setGuti:](self, "setGuti:");
  }
  v14 = *((_WORD *)v5 + 34);
  if ((v14 & 8) != 0)
  {
    self->_rejectCause = *((_DWORD *)v5 + 8);
    *(_WORD *)&self->_has |= 8u;
    v14 = *((_WORD *)v5 + 34);
    if ((v14 & 2) == 0)
    {
LABEL_24:
      if ((v14 & 0x20) == 0)
        goto LABEL_25;
      goto LABEL_32;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_24;
  }
  self->_regProc = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_has |= 2u;
  v14 = *((_WORD *)v5 + 34);
  if ((v14 & 0x20) == 0)
  {
LABEL_25:
    if ((v14 & 0x200) == 0)
      goto LABEL_26;
    goto LABEL_33;
  }
LABEL_32:
  self->_t3412DurS = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v14 = *((_WORD *)v5 + 34);
  if ((v14 & 0x200) == 0)
  {
LABEL_26:
    if ((v14 & 0x100) == 0)
      goto LABEL_27;
LABEL_34:
    self->_isEmergBearerSupported = *((_BYTE *)v5 + 64);
    *(_WORD *)&self->_has |= 0x100u;
    if ((*((_WORD *)v5 + 34) & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_33:
  self->_isImsVoiceSupported = *((_BYTE *)v5 + 65);
  *(_WORD *)&self->_has |= 0x200u;
  v14 = *((_WORD *)v5 + 34);
  if ((v14 & 0x100) != 0)
    goto LABEL_34;
LABEL_27:
  if ((v14 & 0x10) != 0)
  {
LABEL_28:
    self->_subsId = *((_DWORD *)v5 + 9);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_29:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)taiLists
{
  return self->_taiLists;
}

- (void)setTaiLists:(id)a3
{
  objc_storeStrong((id *)&self->_taiLists, a3);
}

- (Guti)guti
{
  return self->_guti;
}

- (void)setGuti:(id)a3
{
  objc_storeStrong((id *)&self->_guti, a3);
}

- (unsigned)t3412DurS
{
  return self->_t3412DurS;
}

- (BOOL)isImsVoiceSupported
{
  return self->_isImsVoiceSupported;
}

- (BOOL)isEmergBearerSupported
{
  return self->_isEmergBearerSupported;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taiLists, 0);
  objc_storeStrong((id *)&self->_guti, 0);
}

@end
