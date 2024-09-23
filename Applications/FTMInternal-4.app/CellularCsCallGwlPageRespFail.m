@implementation CellularCsCallGwlPageRespFail

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_redirArfcns, a2);
  v3.receiver = self;
  v3.super_class = (Class)CellularCsCallGwlPageRespFail;
  -[CellularCsCallGwlPageRespFail dealloc](&v3, "dealloc");
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasVersion
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (int)pageRat
{
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    return self->_pageRat;
  else
    return 0;
}

- (void)setPageRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_pageRat = a3;
}

- (void)setHasPageRat:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPageRat
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)pageRatAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025E858[a3];
}

- (int)StringAsPageRat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAGE_RAT_GSM")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAGE_RAT_WCDMA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PAGE_RAT_LTE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)cause
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_cause;
  else
    return 0;
}

- (void)setCause:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_cause = a3;
}

- (void)setHasCause:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCause
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)causeAsString:(int)a3
{
  if (a3 >= 9)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025E870[a3];
}

- (int)StringAsCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MT_PAGING_IGNORED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MT_RRC_CONN_EST_FAIL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MT_RRC_CONN_LOST")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MT_CS_DOMAIN_REL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MT_RR_REL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MT_CSFB_FAIL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MT_RR_REL_NW_REL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MT_CSFB_LOST_GSM")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MT_CSFB_PEND_REJ")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsImsiPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_isImsiPage = a3;
}

- (void)setHasIsImsiPage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasIsImsiPage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)csfbFailureType
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_csfbFailureType;
  else
    return 0;
}

- (void)setCsfbFailureType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_csfbFailureType = a3;
}

- (void)setHasCsfbFailureType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCsfbFailureType
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)csfbFailureTypeAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025E8B8[a3];
}

- (int)StringAsCsfbFailureType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_REJECT_CAUSE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTA_REJECT_CAUSE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AS_REJECT_CAUSE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM_REJECT_CAUSE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CNM_MN_REJECT_CAUSE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_REJECT_CAUSE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ONEX_CSFB_REJECT_CAUSE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)csfbFailureEmmCause
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_csfbFailureEmmCause;
  else
    return 2;
}

- (void)setCsfbFailureEmmCause:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_csfbFailureEmmCause = a3;
}

- (void)setHasCsfbFailureEmmCause:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCsfbFailureEmmCause
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)csfbFailureEmmCauseAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("LTE_NAS_IMSI_UNKNOWN_IN_HSS");
  switch(a3)
  {
    case 2:
      goto LABEL_3;
    case 3:
      v3 = CFSTR("LTE_NAS_ILLEGAL_UE");
      goto LABEL_3;
    case 4:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
LABEL_38:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
LABEL_3:
      result = v3;
      break;
    case 5:
      result = CFSTR("LTE_NAS_IMEI_NOT_ACCEPTED");
      break;
    case 6:
      result = CFSTR("LTE_NAS_ILLEGAL_ME");
      break;
    case 7:
      result = CFSTR("LTE_NAS_EPS_SERVICES_NOT_ALLOWED");
      break;
    case 8:
      result = CFSTR("LTE_NAS_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED");
      break;
    case 9:
      result = CFSTR("LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW");
      break;
    case 10:
      result = CFSTR("LTE_NAS_IMPLICITLY_DETACHED");
      break;
    case 11:
      result = CFSTR("LTE_NAS_PLMN_NOT_ALLOWED");
      break;
    case 12:
      result = CFSTR("LTE_NAS_TRACKING_AREA_NOT_ALLOWED");
      break;
    case 13:
      result = CFSTR("LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA");
      break;
    case 14:
      result = CFSTR("LTE_NAS_EPS_SERVICES_NOT_ALLOWED_IN_PLMN");
      break;
    case 15:
      result = CFSTR("LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA");
      break;
    case 16:
      result = CFSTR("LTE_NAS_MSC_TEMPORARILY_NOT_REACHABLE");
      break;
    case 17:
      result = CFSTR("LTE_NAS_NW_FAILURE");
      break;
    case 18:
      result = CFSTR("LTE_NAS_CS_DOMAIN_NOT_AVAILABLE");
      break;
    case 19:
      result = CFSTR("LTE_NAS_ESM_FAILURE");
      break;
    case 20:
      result = CFSTR("LTE_NAS_MAC_FAILURE");
      break;
    case 21:
      result = CFSTR("LTE_NAS_SYNCH_FAILURE");
      break;
    case 22:
      result = CFSTR("LTE_NAS_CONGESTION");
      break;
    case 23:
      result = CFSTR("LTE_NAS_UE_SECURITY_CAPABILITIES_MISMATCH");
      break;
    case 24:
      result = CFSTR("LTE_NAS_SECURITY_MODE_REJ_UNSPECIFIED");
      break;
    case 25:
      result = CFSTR("LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG");
      break;
    case 26:
      result = CFSTR("LTE_NON_EPS_AUTH_UNACCEPTABLE");
      break;
    case 38:
      result = CFSTR("LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED");
      break;
    case 39:
      result = CFSTR("LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE");
      break;
    case 40:
      result = CFSTR("LTE_NAS_NO_EPS_BEARER_CONTEXT_ACTIVATED");
      break;
    default:
      switch(a3)
      {
        case '_':
          result = CFSTR("LTE_NAS_SEMANTICALLY_INCORRECT_MSG");
          break;
          result = CFSTR("LTE_NAS_INVALID_MANDATORY_INFO");
          break;
        case 'a':
          result = CFSTR("LTE_NAS_NON_EXISTENT_MSG_TYPE");
          break;
        case 'b':
          result = CFSTR("LTE_NAS_MSG_TYPE_INCOMPATIBLE_WITH_PROTOCOL_STATE");
          break;
        case 'c':
          result = CFSTR("LTE_NAS_NON_EXISTANT_INFO");
          break;
        case 'd':
          result = CFSTR("LTE_NAS_CONDITIONAL_IE_ERROR");
          break;
        case 'e':
          result = CFSTR("LTE_NAS_MSG_INCOMPATIBLE_WITH_PROTOCOL_STATE");
          break;
        case 'o':
          result = CFSTR("LTE_NAS_PROTOCOL_ERROR_UNSPECIFIED");
          break;
        case 'p':
          result = CFSTR("LTE_NAS_NO_FAILURE");
          break;
        default:
          goto LABEL_38;
      }
      break;
  }
  return result;
}

- (int)StringAsCsfbFailureEmmCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_IMSI_UNKNOWN_IN_HSS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_ILLEGAL_UE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_IMEI_NOT_ACCEPTED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_ILLEGAL_ME")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_EPS_SERVICES_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_IMPLICITLY_DETACHED")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_PLMN_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_TRACKING_AREA_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_EPS_SERVICES_NOT_ALLOWED_IN_PLMN")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_MSC_TEMPORARILY_NOT_REACHABLE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_NW_FAILURE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_CS_DOMAIN_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_ESM_FAILURE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_MAC_FAILURE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_SYNCH_FAILURE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_CONGESTION")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_UE_SECURITY_CAPABILITIES_MISMATCH")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_SECURITY_MODE_REJ_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NON_EPS_AUTH_UNACCEPTABLE")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_NO_EPS_BEARER_CONTEXT_ACTIVATED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_SEMANTICALLY_INCORRECT_MSG")) & 1) != 0)
  {
    v4 = 95;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_INVALID_MANDATORY_INFO")) & 1) != 0)
  {
    v4 = 96;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_NON_EXISTENT_MSG_TYPE")) & 1) != 0)
  {
    v4 = 97;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_MSG_TYPE_INCOMPATIBLE_WITH_PROTOCOL_STATE")) & 1) != 0)
  {
    v4 = 98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_NON_EXISTANT_INFO")) & 1) != 0)
  {
    v4 = 99;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_CONDITIONAL_IE_ERROR")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_MSG_INCOMPATIBLE_WITH_PROTOCOL_STATE")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_PROTOCOL_ERROR_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 111;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_NO_FAILURE")))
  {
    v4 = 112;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (int)csfbFailureLocalCause
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_csfbFailureLocalCause;
  else
    return 3;
}

- (void)setCsfbFailureLocalCause:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_csfbFailureLocalCause = a3;
}

- (void)setHasCsfbFailureLocalCause:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCsfbFailureLocalCause
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)csfbFailureLocalCauseAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 42)
  {
    v3 = CFSTR("LTE_NAS_ILLEGAL_UE_LOCAL");
    switch(a3)
    {
      case 3:
        goto LABEL_4;
      case 4:
      case 5:
      case 8:
      case 14:
      case 16:
      case 17:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
        goto LABEL_71;
      case 6:
        return CFSTR("LTE_NAS_ILLEGAL_ME_LOCAL");
      case 7:
        return CFSTR("LTE_NAS_EPS_SERVICES_NOT_ALLOWED_LOCAL");
      case 9:
        return CFSTR("LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW_LOCAL");
      case 10:
        return CFSTR("LTE_NAS_IMPLICITLY_DETACHED_LOCAL");
      case 11:
        return CFSTR("LTE_NAS_PLMN_NOT_ALLOWED_LOCAL");
      case 12:
        return CFSTR("LTE_NAS_TRACKING_AREA_NOT_ALLOWED_LOCAL");
      case 13:
        return CFSTR("LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA_LOCAL");
      case 15:
        return CFSTR("LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA_LOCAL");
      case 18:
        return CFSTR("LTE_NAS_CS_DOMAIN_NOT_AVAILABLE_LOCAL");
      case 25:
        return CFSTR("LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG_LOCAL");
      default:
        if (a3 == 38)
        {
          result = CFSTR("LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED_LOCAL");
        }
        else if (a3 == 39)
        {
          result = CFSTR("LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE_LOCAL");
        }
        else
        {
LABEL_71:
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
LABEL_4:
          result = v3;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 256:
        v3 = CFSTR("DRB_RELEASED_AT_RRC");
        goto LABEL_4;
      case 257:
        result = CFSTR("NAS_SIG_CONN_RELEASED");
        break;
      case 258:
        result = CFSTR("EMM_DETACHED");
        break;
      case 259:
        result = CFSTR("EMM_ATTACH_FAILED");
        break;
      case 260:
        result = CFSTR("EMM_ATTACH_STARTED");
        break;
      case 261:
        result = CFSTR("LTE_NAS_SERVICE_REQ_FAILED");
        break;
      case 262:
        result = CFSTR("ESM_ACTIVE_DEDICATED_BEARER_REACTIVATED_BY_NW");
        break;
      case 263:
        result = CFSTR("ESM_LOWER_LAYER_FAILURE");
        break;
      case 264:
        result = CFSTR("ESM_SYNC_UP_WITH_NW");
        break;
      case 265:
        result = CFSTR("ESM_NW_ACTIVATED_DED_BEARER_WITH_ID_OF_DEF_BEARER");
        break;
      case 266:
        result = CFSTR("ESM_BAD_OTA_MESSAGE");
        break;
      case 267:
        result = CFSTR("ESM_DS_REJECTED_THE_CALL");
        break;
      case 268:
        result = CFSTR("ESM_CONTEXT_TRANSFERED_DUE_TO_IRAT");
        break;
      case 269:
        result = CFSTR("DS_EXPLICIT_DEACT");
        break;
      case 270:
        result = CFSTR("ESM_MSGR_FAILURE");
        break;
      case 271:
        result = CFSTR("ESM_LOCAL_CUASE_NONE");
        break;
      case 272:
        result = CFSTR("ESM_REJ_DUE_TO_CONNECTED_STATE");
        break;
      case 273:
        result = CFSTR("LTE_NAS_SERVICE_REQ_FAILED_NO_THROTTLE");
        break;
      case 274:
        result = CFSTR("ACL_FAILURE");
        break;
      case 275:
        result = CFSTR("LTE_NAS_SERVICE_REQ_FAILED_DS_DISALLOW");
        break;
      case 276:
        result = CFSTR("EMM_T3417_EXPIRED");
        break;
      case 277:
        result = CFSTR("EMM_T3417_EXT_EXPIRED");
        break;
      case 278:
        result = CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_TXN");
        break;
      case 279:
        result = CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_HO");
        break;
      case 280:
        result = CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CONN_REL");
        break;
      case 281:
        result = CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_RLF");
        break;
      case 282:
        result = CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CTRL_NOT_CONN");
        break;
      case 283:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_SUCCESS");
        break;
      case 284:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE");
        break;
      case 285:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_ABORTED");
        break;
      case 286:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_ACCESS_BARRED");
        break;
      case 287:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_CELL_RESEL");
        break;
      case 288:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_CONFIG_FAILURE");
        break;
      case 289:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_TIMER_EXPIRED");
        break;
      case 290:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_LINK_FAILURE");
        break;
      case 291:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_NOT_CAMPED");
        break;
      case 292:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_SI_FAILURE");
        break;
      case 293:
        result = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_CONN_REJECT");
        break;
      case 294:
        result = CFSTR("LTE_NAS_LRRC_CONN_REL_NORMAL");
        break;
      case 295:
        result = CFSTR("LTE_NAS_LRRC_CONN_REL_RLF");
        break;
      case 296:
        result = CFSTR("LTE_NAS_LRRC_CONN_REL_CRE_FAILURE");
        break;
      case 297:
        result = CFSTR("LTE_NAS_LRRC_CONN_REL_OOS_DURING_CRE");
        break;
      case 298:
        result = CFSTR("LTE_NAS_LRRC_CONN_REL_ABORTED");
        break;
      case 299:
        result = CFSTR("LTE_NAS_LRRC_CONN_REL_SIB_READ_ERROR");
        break;
      case 300:
        result = CFSTR("LTE_NAS_LRRC_CONN_REL_ABORTED_IRAT_SUCCESS");
        break;
      case 301:
        result = CFSTR("LTE_NAS_REJ_LRRC_RADIO_LINK_FAILURE");
        break;
      case 302:
        result = CFSTR("LTE_NAS_SERVICE_REQ_FAILURE_LTE_NW_REJECT");
        break;
      case 303:
        result = CFSTR("LTE_NAS_DETACH_WITH_REATTACH_LTE_NW_DETACH");
        break;
      case 304:
        result = CFSTR("LTE_NAS_DETACH_WITH_OUT_REATTACH_LTE_NW_DETACH");
        break;
      case 305:
        result = CFSTR("ESM_PROC_TIME_OUT");
        break;
      default:
        if (a3 != 43)
          goto LABEL_71;
        result = CFSTR("LTE_NAS_ESM_UNKNOWN_EPS_BEARER_CONTEXT");
        break;
    }
  }
  return result;
}

- (int)StringAsCsfbFailureLocalCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_ILLEGAL_UE_LOCAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_ILLEGAL_ME_LOCAL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_EPS_SERVICES_NOT_ALLOWED_LOCAL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW_LOCAL")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_IMPLICITLY_DETACHED_LOCAL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_PLMN_NOT_ALLOWED_LOCAL")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_TRACKING_AREA_NOT_ALLOWED_LOCAL")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA_LOCAL")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA_LOCAL")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_CS_DOMAIN_NOT_AVAILABLE_LOCAL")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG_LOCAL")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED_LOCAL")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE_LOCAL")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_ESM_UNKNOWN_EPS_BEARER_CONTEXT")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRB_RELEASED_AT_RRC")) & 1) != 0)
  {
    v4 = 256;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAS_SIG_CONN_RELEASED")) & 1) != 0)
  {
    v4 = 257;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_DETACHED")) & 1) != 0)
  {
    v4 = 258;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_ATTACH_FAILED")) & 1) != 0)
  {
    v4 = 259;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_ATTACH_STARTED")) & 1) != 0)
  {
    v4 = 260;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_SERVICE_REQ_FAILED")) & 1) != 0)
  {
    v4 = 261;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_ACTIVE_DEDICATED_BEARER_REACTIVATED_BY_NW")) & 1) != 0)
  {
    v4 = 262;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_LOWER_LAYER_FAILURE")) & 1) != 0)
  {
    v4 = 263;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_SYNC_UP_WITH_NW")) & 1) != 0)
  {
    v4 = 264;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_NW_ACTIVATED_DED_BEARER_WITH_ID_OF_DEF_BEARER")) & 1) != 0)
  {
    v4 = 265;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_BAD_OTA_MESSAGE")) & 1) != 0)
  {
    v4 = 266;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_DS_REJECTED_THE_CALL")) & 1) != 0)
  {
    v4 = 267;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_CONTEXT_TRANSFERED_DUE_TO_IRAT")) & 1) != 0)
  {
    v4 = 268;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DS_EXPLICIT_DEACT")) & 1) != 0)
  {
    v4 = 269;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_MSGR_FAILURE")) & 1) != 0)
  {
    v4 = 270;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_LOCAL_CUASE_NONE")) & 1) != 0)
  {
    v4 = 271;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_REJ_DUE_TO_CONNECTED_STATE")) & 1) != 0)
  {
    v4 = 272;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_SERVICE_REQ_FAILED_NO_THROTTLE")) & 1) != 0)
  {
    v4 = 273;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACL_FAILURE")) & 1) != 0)
  {
    v4 = 274;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_SERVICE_REQ_FAILED_DS_DISALLOW")) & 1) != 0)
  {
    v4 = 275;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_T3417_EXPIRED")) & 1) != 0)
  {
    v4 = 276;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMM_T3417_EXT_EXPIRED")) & 1) != 0)
  {
    v4 = 277;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_TXN")) & 1) != 0)
  {
    v4 = 278;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_HO")) & 1) != 0)
  {
    v4 = 279;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CONN_REL")) & 1) != 0)
  {
    v4 = 280;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_RLF")) & 1) != 0)
  {
    v4 = 281;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CTRL_NOT_CONN")) & 1) != 0)
  {
    v4 = 282;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_SUCCESS")) & 1) != 0)
  {
    v4 = 283;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE")) & 1) != 0)
  {
    v4 = 284;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_ABORTED")) & 1) != 0)
  {
    v4 = 285;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_ACCESS_BARRED")) & 1) != 0)
  {
    v4 = 286;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_CELL_RESEL")) & 1) != 0)
  {
    v4 = 287;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_CONFIG_FAILURE")) & 1) != 0)
  {
    v4 = 288;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_TIMER_EXPIRED")) & 1) != 0)
  {
    v4 = 289;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_LINK_FAILURE")) & 1) != 0)
  {
    v4 = 290;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_NOT_CAMPED")) & 1) != 0)
  {
    v4 = 291;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_SI_FAILURE")) & 1) != 0)
  {
    v4 = 292;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_CONN_REJECT")) & 1) != 0)
  {
    v4 = 293;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_REL_NORMAL")) & 1) != 0)
  {
    v4 = 294;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_REL_RLF")) & 1) != 0)
  {
    v4 = 295;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_REL_CRE_FAILURE")) & 1) != 0)
  {
    v4 = 296;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_REL_OOS_DURING_CRE")) & 1) != 0)
  {
    v4 = 297;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_REL_ABORTED")) & 1) != 0)
  {
    v4 = 298;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_REL_SIB_READ_ERROR")) & 1) != 0)
  {
    v4 = 299;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_LRRC_CONN_REL_ABORTED_IRAT_SUCCESS")) & 1) != 0)
  {
    v4 = 300;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_REJ_LRRC_RADIO_LINK_FAILURE")) & 1) != 0)
  {
    v4 = 301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_SERVICE_REQ_FAILURE_LTE_NW_REJECT")) & 1) != 0)
  {
    v4 = 302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_DETACH_WITH_REATTACH_LTE_NW_DETACH")) & 1) != 0)
  {
    v4 = 303;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_NAS_DETACH_WITH_OUT_REATTACH_LTE_NW_DETACH")) & 1) != 0)
  {
    v4 = 304;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ESM_PROC_TIME_OUT")))
  {
    v4 = 305;
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

- (void)setCsfbIsLacMismatch:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_csfbIsLacMismatch = a3;
}

- (void)setHasCsfbIsLacMismatch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasCsfbIsLacMismatch
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setCsfbAbnormalCause:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_csfbAbnormalCause = a3;
}

- (void)setHasCsfbAbnormalCause:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCsfbAbnormalCause
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setLteRegLac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_lteRegLac = a3;
}

- (void)setHasLteRegLac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasLteRegLac
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_tac = a3;
}

- (void)setHasTac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTac
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setLteCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_lteCellId = a3;
}

- (void)setHasLteCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLteCellId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAttemptArfcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_attemptArfcn = a3;
}

- (void)setHasAttemptArfcn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAttemptArfcn
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsAttemptBandPcs:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isAttemptBandPcs = a3;
}

- (void)setHasIsAttemptBandPcs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsAttemptBandPcs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAttemptLac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_attemptLac = a3;
}

- (void)setHasAttemptLac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAttemptLac
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAttemptCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_attemptCellId = a3;
}

- (void)setHasAttemptCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAttemptCellId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumRedirFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_numRedirFreq = a3;
}

- (void)setHasNumRedirFreq:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNumRedirFreq
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIsRedirHighBandPcs:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isRedirHighBandPcs = a3;
}

- (void)setHasIsRedirHighBandPcs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsRedirHighBandPcs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (unint64_t)redirArfcnsCount
{
  return self->_redirArfcns.count;
}

- (unsigned)redirArfcns
{
  return self->_redirArfcns.list;
}

- (void)clearRedirArfcns
{
  PBRepeatedUInt32Clear(&self->_redirArfcns, a2);
}

- (void)addRedirArfcn:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_redirArfcns, *(_QWORD *)&a3);
}

- (unsigned)redirArfcnAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_redirArfcns;
  unint64_t count;
  void *v6;
  void *v7;

  p_redirArfcns = &self->_redirArfcns;
  count = self->_redirArfcns.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_redirArfcns->list[a3];
}

- (void)setRedirArfcns:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_redirArfcns, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularCsCallGwlPageRespFail;
  v3 = -[CellularCsCallGwlPageRespFail description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCsCallGwlPageRespFail dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $9871CD01E7CDACA26BC14801762D3127 has;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  uint64_t pageRat;
  __CFString *v13;
  uint64_t cause;
  __CFString *v15;
  void *v16;
  uint64_t csfbFailureType;
  __CFString *v18;
  int csfbFailureEmmCause;
  __CFString *v20;
  int csfbFailureLocalCause;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("version"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_24:
  pageRat = self->_pageRat;
  if (pageRat >= 3)
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_pageRat));
  else
    v13 = off_10025E858[pageRat];
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("page_rat"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_28:
  cause = self->_cause;
  if (cause >= 9)
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cause));
  else
    v15 = off_10025E870[cause];
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cause"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_isImsiPage));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("is_imsi_page"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_33:
  csfbFailureType = self->_csfbFailureType;
  if (csfbFailureType >= 7)
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_csfbFailureType));
  else
    v18 = off_10025E8B8[csfbFailureType];
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("csfb_failure_type"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_76;
  }
LABEL_37:
  csfbFailureEmmCause = self->_csfbFailureEmmCause;
  v20 = CFSTR("LTE_NAS_IMSI_UNKNOWN_IN_HSS");
  switch(csfbFailureEmmCause)
  {
    case 2:
      break;
    case 3:
      v20 = CFSTR("LTE_NAS_ILLEGAL_UE");
      break;
    case 4:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
LABEL_72:
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_csfbFailureEmmCause));
      break;
    case 5:
      v20 = CFSTR("LTE_NAS_IMEI_NOT_ACCEPTED");
      break;
    case 6:
      v20 = CFSTR("LTE_NAS_ILLEGAL_ME");
      break;
    case 7:
      v20 = CFSTR("LTE_NAS_EPS_SERVICES_NOT_ALLOWED");
      break;
    case 8:
      v20 = CFSTR("LTE_NAS_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED");
      break;
    case 9:
      v20 = CFSTR("LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW");
      break;
    case 10:
      v20 = CFSTR("LTE_NAS_IMPLICITLY_DETACHED");
      break;
    case 11:
      v20 = CFSTR("LTE_NAS_PLMN_NOT_ALLOWED");
      break;
    case 12:
      v20 = CFSTR("LTE_NAS_TRACKING_AREA_NOT_ALLOWED");
      break;
    case 13:
      v20 = CFSTR("LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA");
      break;
    case 14:
      v20 = CFSTR("LTE_NAS_EPS_SERVICES_NOT_ALLOWED_IN_PLMN");
      break;
    case 15:
      v20 = CFSTR("LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA");
      break;
    case 16:
      v20 = CFSTR("LTE_NAS_MSC_TEMPORARILY_NOT_REACHABLE");
      break;
    case 17:
      v20 = CFSTR("LTE_NAS_NW_FAILURE");
      break;
    case 18:
      v20 = CFSTR("LTE_NAS_CS_DOMAIN_NOT_AVAILABLE");
      break;
    case 19:
      v20 = CFSTR("LTE_NAS_ESM_FAILURE");
      break;
    case 20:
      v20 = CFSTR("LTE_NAS_MAC_FAILURE");
      break;
    case 21:
      v20 = CFSTR("LTE_NAS_SYNCH_FAILURE");
      break;
    case 22:
      v20 = CFSTR("LTE_NAS_CONGESTION");
      break;
    case 23:
      v20 = CFSTR("LTE_NAS_UE_SECURITY_CAPABILITIES_MISMATCH");
      break;
    case 24:
      v20 = CFSTR("LTE_NAS_SECURITY_MODE_REJ_UNSPECIFIED");
      break;
    case 25:
      v20 = CFSTR("LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG");
      break;
    case 26:
      v20 = CFSTR("LTE_NON_EPS_AUTH_UNACCEPTABLE");
      break;
    case 38:
      v20 = CFSTR("LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED");
      break;
    case 39:
      v20 = CFSTR("LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE");
      break;
    case 40:
      v20 = CFSTR("LTE_NAS_NO_EPS_BEARER_CONTEXT_ACTIVATED");
      break;
    default:
      switch(csfbFailureEmmCause)
      {
        case '_':
          v20 = CFSTR("LTE_NAS_SEMANTICALLY_INCORRECT_MSG");
          break;
          v20 = CFSTR("LTE_NAS_INVALID_MANDATORY_INFO");
          break;
        case 'a':
          v20 = CFSTR("LTE_NAS_NON_EXISTENT_MSG_TYPE");
          break;
        case 'b':
          v20 = CFSTR("LTE_NAS_MSG_TYPE_INCOMPATIBLE_WITH_PROTOCOL_STATE");
          break;
        case 'c':
          v20 = CFSTR("LTE_NAS_NON_EXISTANT_INFO");
          break;
        case 'd':
          v20 = CFSTR("LTE_NAS_CONDITIONAL_IE_ERROR");
          break;
        case 'e':
          v20 = CFSTR("LTE_NAS_MSG_INCOMPATIBLE_WITH_PROTOCOL_STATE");
          break;
        case 'o':
          v20 = CFSTR("LTE_NAS_PROTOCOL_ERROR_UNSPECIFIED");
          break;
        case 'p':
          v20 = CFSTR("LTE_NAS_NO_FAILURE");
          break;
        default:
          goto LABEL_72;
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("csfb_failure_emm_cause"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_147;
  }
LABEL_76:
  csfbFailureLocalCause = self->_csfbFailureLocalCause;
  if (csfbFailureLocalCause <= 42)
  {
    v22 = CFSTR("LTE_NAS_ILLEGAL_UE_LOCAL");
    switch(csfbFailureLocalCause)
    {
      case 3:
        break;
      case 4:
      case 5:
      case 8:
      case 14:
      case 16:
      case 17:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
        goto LABEL_145;
      case 6:
        v22 = CFSTR("LTE_NAS_ILLEGAL_ME_LOCAL");
        break;
      case 7:
        v22 = CFSTR("LTE_NAS_EPS_SERVICES_NOT_ALLOWED_LOCAL");
        break;
      case 9:
        v22 = CFSTR("LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW_LOCAL");
        break;
      case 10:
        v22 = CFSTR("LTE_NAS_IMPLICITLY_DETACHED_LOCAL");
        break;
      case 11:
        v22 = CFSTR("LTE_NAS_PLMN_NOT_ALLOWED_LOCAL");
        break;
      case 12:
        v22 = CFSTR("LTE_NAS_TRACKING_AREA_NOT_ALLOWED_LOCAL");
        break;
      case 13:
        v22 = CFSTR("LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA_LOCAL");
        break;
      case 15:
        v22 = CFSTR("LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA_LOCAL");
        break;
      case 18:
        v22 = CFSTR("LTE_NAS_CS_DOMAIN_NOT_AVAILABLE_LOCAL");
        break;
      case 25:
        v22 = CFSTR("LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG_LOCAL");
        break;
      default:
        if (csfbFailureLocalCause == 38)
        {
          v22 = CFSTR("LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED_LOCAL");
        }
        else if (csfbFailureLocalCause == 39)
        {
          v22 = CFSTR("LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE_LOCAL");
        }
        else
        {
LABEL_145:
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_csfbFailureLocalCause));
        }
        break;
    }
  }
  else
  {
    switch(csfbFailureLocalCause)
    {
      case 256:
        v22 = CFSTR("DRB_RELEASED_AT_RRC");
        break;
      case 257:
        v22 = CFSTR("NAS_SIG_CONN_RELEASED");
        break;
      case 258:
        v22 = CFSTR("EMM_DETACHED");
        break;
      case 259:
        v22 = CFSTR("EMM_ATTACH_FAILED");
        break;
      case 260:
        v22 = CFSTR("EMM_ATTACH_STARTED");
        break;
      case 261:
        v22 = CFSTR("LTE_NAS_SERVICE_REQ_FAILED");
        break;
      case 262:
        v22 = CFSTR("ESM_ACTIVE_DEDICATED_BEARER_REACTIVATED_BY_NW");
        break;
      case 263:
        v22 = CFSTR("ESM_LOWER_LAYER_FAILURE");
        break;
      case 264:
        v22 = CFSTR("ESM_SYNC_UP_WITH_NW");
        break;
      case 265:
        v22 = CFSTR("ESM_NW_ACTIVATED_DED_BEARER_WITH_ID_OF_DEF_BEARER");
        break;
      case 266:
        v22 = CFSTR("ESM_BAD_OTA_MESSAGE");
        break;
      case 267:
        v22 = CFSTR("ESM_DS_REJECTED_THE_CALL");
        break;
      case 268:
        v22 = CFSTR("ESM_CONTEXT_TRANSFERED_DUE_TO_IRAT");
        break;
      case 269:
        v22 = CFSTR("DS_EXPLICIT_DEACT");
        break;
      case 270:
        v22 = CFSTR("ESM_MSGR_FAILURE");
        break;
      case 271:
        v22 = CFSTR("ESM_LOCAL_CUASE_NONE");
        break;
      case 272:
        v22 = CFSTR("ESM_REJ_DUE_TO_CONNECTED_STATE");
        break;
      case 273:
        v22 = CFSTR("LTE_NAS_SERVICE_REQ_FAILED_NO_THROTTLE");
        break;
      case 274:
        v22 = CFSTR("ACL_FAILURE");
        break;
      case 275:
        v22 = CFSTR("LTE_NAS_SERVICE_REQ_FAILED_DS_DISALLOW");
        break;
      case 276:
        v22 = CFSTR("EMM_T3417_EXPIRED");
        break;
      case 277:
        v22 = CFSTR("EMM_T3417_EXT_EXPIRED");
        break;
      case 278:
        v22 = CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_TXN");
        break;
      case 279:
        v22 = CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_HO");
        break;
      case 280:
        v22 = CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CONN_REL");
        break;
      case 281:
        v22 = CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_RLF");
        break;
      case 282:
        v22 = CFSTR("LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CTRL_NOT_CONN");
        break;
      case 283:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_SUCCESS");
        break;
      case 284:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE");
        break;
      case 285:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_ABORTED");
        break;
      case 286:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_ACCESS_BARRED");
        break;
      case 287:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_CELL_RESEL");
        break;
      case 288:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_CONFIG_FAILURE");
        break;
      case 289:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_TIMER_EXPIRED");
        break;
      case 290:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_LINK_FAILURE");
        break;
      case 291:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_NOT_CAMPED");
        break;
      case 292:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_SI_FAILURE");
        break;
      case 293:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_EST_FAILURE_CONN_REJECT");
        break;
      case 294:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_REL_NORMAL");
        break;
      case 295:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_REL_RLF");
        break;
      case 296:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_REL_CRE_FAILURE");
        break;
      case 297:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_REL_OOS_DURING_CRE");
        break;
      case 298:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_REL_ABORTED");
        break;
      case 299:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_REL_SIB_READ_ERROR");
        break;
      case 300:
        v22 = CFSTR("LTE_NAS_LRRC_CONN_REL_ABORTED_IRAT_SUCCESS");
        break;
      case 301:
        v22 = CFSTR("LTE_NAS_REJ_LRRC_RADIO_LINK_FAILURE");
        break;
      case 302:
        v22 = CFSTR("LTE_NAS_SERVICE_REQ_FAILURE_LTE_NW_REJECT");
        break;
      case 303:
        v22 = CFSTR("LTE_NAS_DETACH_WITH_REATTACH_LTE_NW_DETACH");
        break;
      case 304:
        v22 = CFSTR("LTE_NAS_DETACH_WITH_OUT_REATTACH_LTE_NW_DETACH");
        break;
      case 305:
        v22 = CFSTR("ESM_PROC_TIME_OUT");
        break;
      default:
        if (csfbFailureLocalCause != 43)
          goto LABEL_145;
        v22 = CFSTR("LTE_NAS_ESM_UNKNOWN_EPS_BEARER_CONTEXT");
        break;
    }
  }
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("csfb_failure_local_cause"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_148;
  }
LABEL_147:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_csfbIsLacMismatch));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("csfb_is_lac_mismatch"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_149;
  }
LABEL_148:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_csfbAbnormalCause));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("csfb_abnormal_cause"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_150;
  }
LABEL_149:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lteRegLac));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("lte_reg_lac"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_151;
  }
LABEL_150:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tac));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("tac"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_152;
  }
LABEL_151:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lteCellId));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("lte_cell_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_153;
  }
LABEL_152:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_attemptArfcn));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("attempt_arfcn"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_154;
  }
LABEL_153:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isAttemptBandPcs));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("is_attempt_band_pcs"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_155;
  }
LABEL_154:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_attemptLac));
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("attempt_lac"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
LABEL_156:
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numRedirFreq));
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("num_redir_freq"));

    if ((*(_DWORD *)&self->_has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_155:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_attemptCellId));
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("attempt_cell_id"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
    goto LABEL_156;
LABEL_19:
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isRedirHighBandPcs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("is_redir_high_band_pcs"));

  }
LABEL_21:
  v6 = PBRepeatedUInt32NSArray(&self->_redirArfcns);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("redir_arfcn"));

  v8 = v3;
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001C3F8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $9871CD01E7CDACA26BC14801762D3127 has;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_redirArfcns;
  unint64_t v7;
  id v8;

  v4 = a3;
  has = self->_has;
  v8 = v4;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    v4 = v8;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v8, self->_version, 2);
  v4 = v8;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field(v8, self->_pageRat, 3);
  v4 = v8;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field(v8, self->_cause, 4);
  v4 = v8;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v8, self->_isImsiPage, 5);
  v4 = v8;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field(v8, self->_csfbFailureType, 6);
  v4 = v8;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field(v8, self->_csfbFailureEmmCause, 7);
  v4 = v8;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field(v8, self->_csfbFailureLocalCause, 8);
  v4 = v8;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteBOOLField(v8, self->_csfbIsLacMismatch, 9);
  v4 = v8;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v8, self->_csfbAbnormalCause, 10);
  v4 = v8;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field(v8, self->_lteRegLac, 12);
  v4 = v8;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field(v8, self->_tac, 13);
  v4 = v8;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field(v8, self->_lteCellId, 14);
  v4 = v8;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v8, self->_attemptArfcn, 18);
  v4 = v8;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField(v8, self->_isAttemptBandPcs, 19);
  v4 = v8;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field(v8, self->_attemptLac, 20);
  v4 = v8;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field(v8, self->_attemptCellId, 21);
  v4 = v8;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_42:
  PBDataWriterWriteUint32Field(v8, self->_numRedirFreq, 25);
  v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_20:
    PBDataWriterWriteBOOLField(v8, self->_isRedirHighBandPcs, 26);
    v4 = v8;
  }
LABEL_21:
  p_redirArfcns = &self->_redirArfcns;
  if (p_redirArfcns->count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v8, p_redirArfcns->list[v7], 27);
      v4 = v8;
      ++v7;
    }
    while (v7 < p_redirArfcns->count);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $9871CD01E7CDACA26BC14801762D3127 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[4] = self->_timestamp;
    *((_DWORD *)v4 + 26) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 24) = self->_version;
  *((_DWORD *)v4 + 26) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 22) = self->_pageRat;
  *((_DWORD *)v4 + 26) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 13) = self->_cause;
  *((_DWORD *)v4 + 26) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 18) = self->_isImsiPage;
  *((_DWORD *)v4 + 26) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 17) = self->_csfbFailureType;
  *((_DWORD *)v4 + 26) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 15) = self->_csfbFailureEmmCause;
  *((_DWORD *)v4 + 26) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 16) = self->_csfbFailureLocalCause;
  *((_DWORD *)v4 + 26) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  *((_BYTE *)v4 + 100) = self->_csfbIsLacMismatch;
  *((_DWORD *)v4 + 26) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 14) = self->_csfbAbnormalCause;
  *((_DWORD *)v4 + 26) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 20) = self->_lteRegLac;
  *((_DWORD *)v4 + 26) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 23) = self->_tac;
  *((_DWORD *)v4 + 26) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 19) = self->_lteCellId;
  *((_DWORD *)v4 + 26) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 10) = self->_attemptArfcn;
  *((_DWORD *)v4 + 26) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)v4 + 101) = self->_isAttemptBandPcs;
  *((_DWORD *)v4 + 26) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 12) = self->_attemptLac;
  *((_DWORD *)v4 + 26) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
LABEL_43:
    *((_DWORD *)v4 + 21) = self->_numRedirFreq;
    *((_DWORD *)v4 + 26) |= 0x1000u;
    if ((*(_DWORD *)&self->_has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_42:
  *((_DWORD *)v4 + 11) = self->_attemptCellId;
  *((_DWORD *)v4 + 26) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
    goto LABEL_43;
LABEL_19:
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    *((_BYTE *)v4 + 102) = self->_isRedirHighBandPcs;
    *((_DWORD *)v4 + 26) |= 0x40000u;
  }
LABEL_21:
  v9 = v4;
  if (-[CellularCsCallGwlPageRespFail redirArfcnsCount](self, "redirArfcnsCount"))
  {
    objc_msgSend(v9, "clearRedirArfcns");
    v6 = -[CellularCsCallGwlPageRespFail redirArfcnsCount](self, "redirArfcnsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addRedirArfcn:", -[CellularCsCallGwlPageRespFail redirArfcnAtIndex:](self, "redirArfcnAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  void *v5;
  $9871CD01E7CDACA26BC14801762D3127 has;

  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_timestamp;
    *((_DWORD *)v4 + 26) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 24) = self->_version;
  *((_DWORD *)v4 + 26) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 22) = self->_pageRat;
  *((_DWORD *)v4 + 26) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 13) = self->_cause;
  *((_DWORD *)v4 + 26) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 18) = self->_isImsiPage;
  *((_DWORD *)v4 + 26) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 17) = self->_csfbFailureType;
  *((_DWORD *)v4 + 26) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 15) = self->_csfbFailureEmmCause;
  *((_DWORD *)v4 + 26) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 16) = self->_csfbFailureLocalCause;
  *((_DWORD *)v4 + 26) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  v4[100] = self->_csfbIsLacMismatch;
  *((_DWORD *)v4 + 26) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 14) = self->_csfbAbnormalCause;
  *((_DWORD *)v4 + 26) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 20) = self->_lteRegLac;
  *((_DWORD *)v4 + 26) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 23) = self->_tac;
  *((_DWORD *)v4 + 26) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 19) = self->_lteCellId;
  *((_DWORD *)v4 + 26) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 10) = self->_attemptArfcn;
  *((_DWORD *)v4 + 26) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  v4[101] = self->_isAttemptBandPcs;
  *((_DWORD *)v4 + 26) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 12) = self->_attemptLac;
  *((_DWORD *)v4 + 26) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
LABEL_39:
    *((_DWORD *)v4 + 21) = self->_numRedirFreq;
    *((_DWORD *)v4 + 26) |= 0x1000u;
    if ((*(_DWORD *)&self->_has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_38:
  *((_DWORD *)v4 + 11) = self->_attemptCellId;
  *((_DWORD *)v4 + 26) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
    goto LABEL_39;
LABEL_19:
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    v4[102] = self->_isRedirHighBandPcs;
    *((_DWORD *)v4 + 26) |= 0x40000u;
  }
LABEL_21:
  PBRepeatedUInt32Copy(v4 + 8, &self->_redirArfcns);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  $9871CD01E7CDACA26BC14801762D3127 has;
  int v7;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_102;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 26);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 4))
      goto LABEL_102;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_version != *((_DWORD *)v4 + 24))
      goto LABEL_102;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_pageRat != *((_DWORD *)v4 + 22))
      goto LABEL_102;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_cause != *((_DWORD *)v4 + 13))
      goto LABEL_102;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_isImsiPage != *((_DWORD *)v4 + 18))
      goto LABEL_102;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_csfbFailureType != *((_DWORD *)v4 + 17))
      goto LABEL_102;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_csfbFailureEmmCause != *((_DWORD *)v4 + 15))
      goto LABEL_102;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_csfbFailureLocalCause != *((_DWORD *)v4 + 16))
      goto LABEL_102;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0)
      goto LABEL_102;
    if (self->_csfbIsLacMismatch)
    {
      if (!v4[100])
        goto LABEL_102;
    }
    else if (v4[100])
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_csfbAbnormalCause != *((_DWORD *)v4 + 14))
      goto LABEL_102;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_lteRegLac != *((_DWORD *)v4 + 20))
      goto LABEL_102;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_tac != *((_DWORD *)v4 + 23))
      goto LABEL_102;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_lteCellId != *((_DWORD *)v4 + 19))
      goto LABEL_102;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_attemptArfcn != *((_DWORD *)v4 + 10))
      goto LABEL_102;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0)
      goto LABEL_102;
    if (self->_isAttemptBandPcs)
    {
      if (!v4[101])
        goto LABEL_102;
    }
    else if (v4[101])
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_attemptLac != *((_DWORD *)v4 + 12))
      goto LABEL_102;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_attemptCellId != *((_DWORD *)v4 + 11))
      goto LABEL_102;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_numRedirFreq != *((_DWORD *)v4 + 21))
      goto LABEL_102;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) != 0)
    {
      if (self->_isRedirHighBandPcs)
      {
        if (!v4[102])
          goto LABEL_102;
      }
      else if (v4[102])
      {
        goto LABEL_102;
      }
LABEL_108:
      IsEqual = PBRepeatedUInt32IsEqual(&self->_redirArfcns, v4 + 8);
      goto LABEL_103;
    }
  }
  else if ((v7 & 0x40000) == 0)
  {
    goto LABEL_108;
  }
LABEL_102:
  IsEqual = 0;
LABEL_103:

  return IsEqual;
}

- (unint64_t)hash
{
  $9871CD01E7CDACA26BC14801762D3127 has;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_version;
      if ((*(_WORD *)&has & 0x2000) != 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_pageRat;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_cause;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  v6 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_isImsiPage;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  v7 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_csfbFailureType;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  v8 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_csfbFailureEmmCause;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  v9 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_csfbFailureLocalCause;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_csfbIsLacMismatch;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  v11 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_csfbAbnormalCause;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  v12 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_lteRegLac;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  v13 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_tac;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  v14 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_lteCellId;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  v15 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_attemptArfcn;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_isAttemptBandPcs;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  v17 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_attemptLac;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  v18 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_attemptCellId;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_19;
LABEL_38:
    v20 = 0;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_20;
LABEL_39:
    v21 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ PBRepeatedUInt32Hash(&self->_redirArfcns);
  }
LABEL_37:
  v19 = 0;
  if ((*(_WORD *)&has & 0x1000) == 0)
    goto LABEL_38;
LABEL_19:
  v20 = 2654435761 * self->_numRedirFreq;
  if ((*(_DWORD *)&has & 0x40000) == 0)
    goto LABEL_39;
LABEL_20:
  v21 = 2654435761 * self->_isRedirHighBandPcs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ PBRepeatedUInt32Hash(&self->_redirArfcns);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  char *v6;
  char *v7;
  char *i;
  id v9;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 26);
    if ((v5 & 0x8000) == 0)
    {
LABEL_3:
      if ((v5 & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((v5 & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x2000) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  self->_pageRat = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  self->_cause = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  self->_isImsiPage = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  self->_csfbFailureType = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  self->_csfbFailureEmmCause = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  self->_csfbFailureLocalCause = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x10000) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  self->_csfbIsLacMismatch = *((_BYTE *)v4 + 100);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  self->_csfbAbnormalCause = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  self->_lteRegLac = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  self->_tac = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 2) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  self->_lteCellId = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 2) == 0)
  {
LABEL_15:
    if ((v5 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  self->_attemptArfcn = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x20000) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  self->_isAttemptBandPcs = *((_BYTE *)v4 + 101);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_17:
    if ((v5 & 4) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  self->_attemptLac = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_18:
    if ((v5 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  self->_attemptCellId = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x1000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_42:
  self->_numRedirFreq = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 26) & 0x40000) != 0)
  {
LABEL_20:
    self->_isRedirHighBandPcs = *((_BYTE *)v4 + 102);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_21:
  v9 = v4;
  v6 = (char *)objc_msgSend(v4, "redirArfcnsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[CellularCsCallGwlPageRespFail addRedirArfcn:](self, "addRedirArfcn:", objc_msgSend(v9, "redirArfcnAtIndex:", i));
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)isImsiPage
{
  return self->_isImsiPage;
}

- (BOOL)csfbIsLacMismatch
{
  return self->_csfbIsLacMismatch;
}

- (unsigned)csfbAbnormalCause
{
  return self->_csfbAbnormalCause;
}

- (unsigned)lteRegLac
{
  return self->_lteRegLac;
}

- (unsigned)tac
{
  return self->_tac;
}

- (unsigned)lteCellId
{
  return self->_lteCellId;
}

- (unsigned)attemptArfcn
{
  return self->_attemptArfcn;
}

- (BOOL)isAttemptBandPcs
{
  return self->_isAttemptBandPcs;
}

- (unsigned)attemptLac
{
  return self->_attemptLac;
}

- (unsigned)attemptCellId
{
  return self->_attemptCellId;
}

- (unsigned)numRedirFreq
{
  return self->_numRedirFreq;
}

- (BOOL)isRedirHighBandPcs
{
  return self->_isRedirHighBandPcs;
}

@end
