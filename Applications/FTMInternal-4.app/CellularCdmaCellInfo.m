@implementation CellularCdmaCellInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)rat
{
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    return self->_rat;
  else
    return 0;
}

- (void)setRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRat
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (id)ratAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025FD10 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsRat:(id)a3
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

- (int)srvStatus
{
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    return self->_srvStatus;
  else
    return -1;
}

- (void)setSrvStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_srvStatus = a3;
}

- (void)setHasSrvStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSrvStatus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)srvStatusAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("SYS_SRV_STATUS_NONE");
  switch(a3)
  {
    case -1:
      return v3;
    case 0:
      v3 = CFSTR("SYS_SRV_STATUS_NO_SRV");
      return v3;
    case 1:
      return CFSTR("SYS_SRV_STATUS_LIMITED");
    case 2:
      return CFSTR("SYS_SRV_STATUS_SRV");
    case 3:
      return CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL");
    case 4:
      return CFSTR("SYS_SRV_STATUS_PWR_SAVE");
    case 5:
      return CFSTR("SYS_SRV_STATUS_MAX");
    default:
      if (a3 == 100)
        return CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE");
      if (a3 == 101)
        return CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsSrvStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_NONE")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_NO_SRV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_LIMITED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_SRV")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_PWR_SAVE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_MAX")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE")) & 1) != 0)
  {
    v4 = 100;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE")))
  {
    v4 = 101;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)setMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMcc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIs95Sid:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_is95Sid = a3;
}

- (void)setHasIs95Sid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIs95Sid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIs95Nid:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_is95Nid = a3;
}

- (void)setHasIs95Nid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIs95Nid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasSectorId
{
  return self->_sectorId != 0;
}

- (int)band
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_band;
  else
    return 0;
}

- (void)setBand:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBand
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (void)setChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBaseId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_baseId = a3;
}

- (void)setHasBaseId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBaseId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setZoneId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_zoneId = a3;
}

- (void)setHasZoneId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasZoneId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (int)hdrSrvStatus
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_hdrSrvStatus;
  else
    return -1;
}

- (void)setHdrSrvStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hdrSrvStatus = a3;
}

- (void)setHasHdrSrvStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHdrSrvStatus
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)hdrSrvStatusAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("SYS_SRV_STATUS_NONE");
  switch(a3)
  {
    case -1:
      return v3;
    case 0:
      v3 = CFSTR("SYS_SRV_STATUS_NO_SRV");
      return v3;
    case 1:
      return CFSTR("SYS_SRV_STATUS_LIMITED");
    case 2:
      return CFSTR("SYS_SRV_STATUS_SRV");
    case 3:
      return CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL");
    case 4:
      return CFSTR("SYS_SRV_STATUS_PWR_SAVE");
    case 5:
      return CFSTR("SYS_SRV_STATUS_MAX");
    default:
      if (a3 == 100)
        return CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE");
      if (a3 == 101)
        return CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsHdrSrvStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_NONE")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_NO_SRV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_LIMITED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_SRV")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_PWR_SAVE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_MAX")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE")) & 1) != 0)
  {
    v4 = 100;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE")))
  {
    v4 = 101;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)setHdrHybrid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_hdrHybrid = a3;
}

- (void)setHasHdrHybrid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasHdrHybrid
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (int)hybridActiveBand
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_hybridActiveBand;
  else
    return 0;
}

- (void)setHybridActiveBand:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hybridActiveBand = a3;
}

- (void)setHasHybridActiveBand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHybridActiveBand
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)hybridActiveBandAsString:(int)a3
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

- (int)StringAsHybridActiveBand:(id)a3
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

- (void)setHybridActiveChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hybridActiveChannel = a3;
}

- (void)setHasHybridActiveChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHybridActiveChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)gwRat
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_gwRat;
  else
    return 0;
}

- (void)setGwRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_gwRat = a3;
}

- (void)setHasGwRat:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasGwRat
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)gwRatAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025FD10 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsGwRat:(id)a3
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

- (int)gwSrvStatus
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_gwSrvStatus;
  else
    return -1;
}

- (void)setGwSrvStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_gwSrvStatus = a3;
}

- (void)setHasGwSrvStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasGwSrvStatus
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)gwSrvStatusAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("SYS_SRV_STATUS_NONE");
  switch(a3)
  {
    case -1:
      return v3;
    case 0:
      v3 = CFSTR("SYS_SRV_STATUS_NO_SRV");
      return v3;
    case 1:
      return CFSTR("SYS_SRV_STATUS_LIMITED");
    case 2:
      return CFSTR("SYS_SRV_STATUS_SRV");
    case 3:
      return CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL");
    case 4:
      return CFSTR("SYS_SRV_STATUS_PWR_SAVE");
    case 5:
      return CFSTR("SYS_SRV_STATUS_MAX");
    default:
      if (a3 == 100)
        return CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE");
      if (a3 == 101)
        return CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsGwSrvStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_NONE")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_NO_SRV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_LIMITED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_SRV")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_PWR_SAVE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_MAX")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE")) & 1) != 0)
  {
    v4 = 100;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE")))
  {
    v4 = 101;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)setHdrPilotPn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hdrPilotPn = a3;
}

- (void)setHasHdrPilotPn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHdrPilotPn
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setPilotPn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_pilotPn = a3;
}

- (void)setHasPilotPn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasPilotPn
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPsPref
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularCdmaCellInfo;
  v3 = -[CellularCdmaCellInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCdmaCellInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $61B41E93924E64F4A8EE0C468EC37E18 has;
  void *v5;
  NSData *sectorId;
  $61B41E93924E64F4A8EE0C468EC37E18 v7;
  void *v8;
  NSData *plmn;
  id v10;
  void *v12;
  uint64_t rat;
  void *v14;
  __CFString *v15;
  int srvStatus;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int hdrSrvStatus;
  __CFString *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  uint64_t gwRat;
  void *v29;
  int gwSrvStatus;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  rat = self->_rat;
  if (rat < 0x10 && ((0x9FFFu >> rat) & 1) != 0)
    v14 = *(&off_10025FD10 + rat);
  else
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rat));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("rat"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_50;
  }
LABEL_37:
  srvStatus = self->_srvStatus;
  v17 = CFSTR("SYS_SRV_STATUS_NONE");
  switch(srvStatus)
  {
    case -1:
      break;
    case 0:
      v17 = CFSTR("SYS_SRV_STATUS_NO_SRV");
      break;
    case 1:
      v17 = CFSTR("SYS_SRV_STATUS_LIMITED");
      break;
    case 2:
      v17 = CFSTR("SYS_SRV_STATUS_SRV");
      break;
    case 3:
      v17 = CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL");
      break;
    case 4:
      v17 = CFSTR("SYS_SRV_STATUS_PWR_SAVE");
      break;
    case 5:
      v17 = CFSTR("SYS_SRV_STATUS_MAX");
      break;
    default:
      if (srvStatus == 100)
      {
        v17 = CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE");
      }
      else if (srvStatus == 101)
      {
        v17 = CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE");
      }
      else
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_srvStatus));
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("srv_status"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_51;
  }
LABEL_50:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("mcc"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_51:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_is95Sid));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("is95_sid"));

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_is95Nid));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("is95_nid"));

  }
LABEL_8:
  sectorId = self->_sectorId;
  if (sectorId)
    objc_msgSend(v3, "setObject:forKey:", sectorId, CFSTR("sector_id"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 2) != 0)
  {
    v15 = CFSTR("SYS_BAND_BC0");
    switch(self->_band)
    {
      case 0:
        break;
      case 1:
        v15 = CFSTR("SYS_BAND_BC1");
        break;
      case 3:
        v15 = CFSTR("SYS_BAND_BC3");
        break;
      case 4:
        v15 = CFSTR("SYS_BAND_BC4");
        break;
      case 5:
        v15 = CFSTR("SYS_BAND_BC5");
        break;
      case 6:
        v15 = CFSTR("SYS_BAND_BC6");
        break;
      case 7:
        v15 = CFSTR("SYS_BAND_BC7");
        break;
      case 8:
        v15 = CFSTR("SYS_BAND_BC8");
        break;
      case 9:
        v15 = CFSTR("SYS_BAND_BC9");
        break;
      case 0xA:
        v15 = CFSTR("SYS_BAND_BC10");
        break;
      case 0xB:
        v15 = CFSTR("SYS_BAND_BC11");
        break;
      case 0xC:
        v15 = CFSTR("SYS_BAND_BC12");
        break;
      case 0xD:
        v15 = CFSTR("SYS_BAND_BC13");
        break;
      case 0xE:
        v15 = CFSTR("SYS_BAND_BC14");
        break;
      case 0xF:
        v15 = CFSTR("SYS_BAND_BC15");
        break;
      case 0x10:
        v15 = CFSTR("SYS_BAND_BC16");
        break;
      case 0x11:
        v15 = CFSTR("SYS_BAND_BC17");
        break;
      case 0x12:
        v15 = CFSTR("SYS_BAND_BC18");
        break;
      case 0x13:
        v15 = CFSTR("SYS_BAND_BC19");
        break;
      case 0x28:
        v15 = CFSTR("SYS_BAND_GSM_450");
        break;
      case 0x29:
        v15 = CFSTR("SYS_BAND_GSM_480");
        break;
      case 0x2A:
        v15 = CFSTR("SYS_BAND_GSM_750");
        break;
      case 0x2B:
        v15 = CFSTR("SYS_BAND_GSM_850");
        break;
      case 0x2C:
        v15 = CFSTR("SYS_BAND_GSM_EGSM_900");
        break;
      case 0x2D:
        v15 = CFSTR("SYS_BAND_GSM_PGSM_900");
        break;
      case 0x2E:
        v15 = CFSTR("SYS_BAND_GSM_RGSM_900");
        break;
      case 0x2F:
        v15 = CFSTR("SYS_BAND_GSM_DCS_1800");
        break;
      case 0x30:
        v15 = CFSTR("SYS_BAND_GSM_PCS_1900");
        break;
      case 0x50:
        v15 = CFSTR("SYS_BAND_WCDMA_I_IMT_2000");
        break;
      case 0x51:
        v15 = CFSTR("SYS_BAND_WCDMA_II_PCS_1900");
        break;
      case 0x52:
        v15 = CFSTR("SYS_BAND_WCDMA_III_1700");
        break;
      case 0x53:
        v15 = CFSTR("SYS_BAND_WCDMA_IV_1700");
        break;
      case 0x54:
        v15 = CFSTR("SYS_BAND_WCDMA_V_850");
        break;
      case 0x55:
        v15 = CFSTR("SYS_BAND_WCDMA_VI_800");
        break;
      case 0x56:
        v15 = CFSTR("SYS_BAND_WCDMA_VII_2600");
        break;
      case 0x57:
        v15 = CFSTR("SYS_BAND_WCDMA_VIII_900");
        break;
      case 0x58:
        v15 = CFSTR("SYS_BAND_WCDMA_IX_1700");
        break;
      case 0x5A:
        v15 = CFSTR("SYS_BAND_WCDMA_XI_1500");
        break;
      case 0x5B:
        v15 = CFSTR("SYS_BAND_WCDMA_XIX_850");
        break;
      case 0x78:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND1");
        break;
      case 0x79:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND2");
        break;
      case 0x7A:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND3");
        break;
      case 0x7B:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND4");
        break;
      case 0x7C:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND5");
        break;
      case 0x7D:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND6");
        break;
      case 0x7E:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND7");
        break;
      case 0x7F:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND8");
        break;
      case 0x80:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND9");
        break;
      case 0x81:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND10");
        break;
      case 0x82:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND11");
        break;
      case 0x83:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND12");
        break;
      case 0x84:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND13");
        break;
      case 0x85:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND14");
        break;
      case 0x88:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND17");
        break;
      case 0x89:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND18");
        break;
      case 0x8A:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND19");
        break;
      case 0x8B:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND20");
        break;
      case 0x8C:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND21");
        break;
      case 0x8F:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND24");
        break;
      case 0x90:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND25");
        break;
      case 0x91:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND26");
        break;
      case 0x98:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND33");
        break;
      case 0x99:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND34");
        break;
      case 0x9A:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND35");
        break;
      case 0x9B:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND36");
        break;
      case 0x9C:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND37");
        break;
      case 0x9D:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND38");
        break;
      case 0x9E:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND39");
        break;
      case 0x9F:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND40");
        break;
      case 0xA0:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND41");
        break;
      case 0xA1:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND42");
        break;
      case 0xA2:
        v15 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND43");
        break;
      case 0xA3:
        v15 = CFSTR("SYS_BAND_UMTS_BAND1");
        break;
      case 0xA4:
        v15 = CFSTR("SYS_BAND_UMTS_BAND2");
        break;
      case 0xA5:
        v15 = CFSTR("SYS_BAND_UMTS_BAND3");
        break;
      case 0xA6:
        v15 = CFSTR("SYS_BAND_UMTS_BAND4");
        break;
      case 0xA7:
        v15 = CFSTR("SYS_BAND_UMTS_BAND5");
        break;
      case 0xA8:
        v15 = CFSTR("SYS_BAND_UMTS_BAND6");
        break;
      default:
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_band));
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("band"));

    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 8) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v7 & 4) == 0)
        goto LABEL_13;
      goto LABEL_132;
    }
  }
  else if ((*(_BYTE *)&v7 & 8) == 0)
  {
    goto LABEL_12;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_channel));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("channel"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_133;
  }
LABEL_132:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_baseId));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("base_id"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_134;
  }
LABEL_133:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_zoneId));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("zone_id"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_147;
  }
LABEL_134:
  hdrSrvStatus = self->_hdrSrvStatus;
  v24 = CFSTR("SYS_SRV_STATUS_NONE");
  switch(hdrSrvStatus)
  {
    case -1:
      break;
    case 0:
      v24 = CFSTR("SYS_SRV_STATUS_NO_SRV");
      break;
    case 1:
      v24 = CFSTR("SYS_SRV_STATUS_LIMITED");
      break;
    case 2:
      v24 = CFSTR("SYS_SRV_STATUS_SRV");
      break;
    case 3:
      v24 = CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL");
      break;
    case 4:
      v24 = CFSTR("SYS_SRV_STATUS_PWR_SAVE");
      break;
    case 5:
      v24 = CFSTR("SYS_SRV_STATUS_MAX");
      break;
    default:
      if (hdrSrvStatus == 100)
      {
        v24 = CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE");
      }
      else if (hdrSrvStatus == 101)
      {
        v24 = CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE");
      }
      else
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hdrSrvStatus));
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("hdr_srv_status"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_148;
  }
LABEL_147:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hdrHybrid));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("hdr_hybrid"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_228;
  }
LABEL_148:
  v26 = CFSTR("SYS_BAND_BC0");
  switch(self->_hybridActiveBand)
  {
    case 0:
      break;
    case 1:
      v26 = CFSTR("SYS_BAND_BC1");
      break;
    case 3:
      v26 = CFSTR("SYS_BAND_BC3");
      break;
    case 4:
      v26 = CFSTR("SYS_BAND_BC4");
      break;
    case 5:
      v26 = CFSTR("SYS_BAND_BC5");
      break;
    case 6:
      v26 = CFSTR("SYS_BAND_BC6");
      break;
    case 7:
      v26 = CFSTR("SYS_BAND_BC7");
      break;
    case 8:
      v26 = CFSTR("SYS_BAND_BC8");
      break;
    case 9:
      v26 = CFSTR("SYS_BAND_BC9");
      break;
    case 0xA:
      v26 = CFSTR("SYS_BAND_BC10");
      break;
    case 0xB:
      v26 = CFSTR("SYS_BAND_BC11");
      break;
    case 0xC:
      v26 = CFSTR("SYS_BAND_BC12");
      break;
    case 0xD:
      v26 = CFSTR("SYS_BAND_BC13");
      break;
    case 0xE:
      v26 = CFSTR("SYS_BAND_BC14");
      break;
    case 0xF:
      v26 = CFSTR("SYS_BAND_BC15");
      break;
    case 0x10:
      v26 = CFSTR("SYS_BAND_BC16");
      break;
    case 0x11:
      v26 = CFSTR("SYS_BAND_BC17");
      break;
    case 0x12:
      v26 = CFSTR("SYS_BAND_BC18");
      break;
    case 0x13:
      v26 = CFSTR("SYS_BAND_BC19");
      break;
    case 0x28:
      v26 = CFSTR("SYS_BAND_GSM_450");
      break;
    case 0x29:
      v26 = CFSTR("SYS_BAND_GSM_480");
      break;
    case 0x2A:
      v26 = CFSTR("SYS_BAND_GSM_750");
      break;
    case 0x2B:
      v26 = CFSTR("SYS_BAND_GSM_850");
      break;
    case 0x2C:
      v26 = CFSTR("SYS_BAND_GSM_EGSM_900");
      break;
    case 0x2D:
      v26 = CFSTR("SYS_BAND_GSM_PGSM_900");
      break;
    case 0x2E:
      v26 = CFSTR("SYS_BAND_GSM_RGSM_900");
      break;
    case 0x2F:
      v26 = CFSTR("SYS_BAND_GSM_DCS_1800");
      break;
    case 0x30:
      v26 = CFSTR("SYS_BAND_GSM_PCS_1900");
      break;
    case 0x50:
      v26 = CFSTR("SYS_BAND_WCDMA_I_IMT_2000");
      break;
    case 0x51:
      v26 = CFSTR("SYS_BAND_WCDMA_II_PCS_1900");
      break;
    case 0x52:
      v26 = CFSTR("SYS_BAND_WCDMA_III_1700");
      break;
    case 0x53:
      v26 = CFSTR("SYS_BAND_WCDMA_IV_1700");
      break;
    case 0x54:
      v26 = CFSTR("SYS_BAND_WCDMA_V_850");
      break;
    case 0x55:
      v26 = CFSTR("SYS_BAND_WCDMA_VI_800");
      break;
    case 0x56:
      v26 = CFSTR("SYS_BAND_WCDMA_VII_2600");
      break;
    case 0x57:
      v26 = CFSTR("SYS_BAND_WCDMA_VIII_900");
      break;
    case 0x58:
      v26 = CFSTR("SYS_BAND_WCDMA_IX_1700");
      break;
    case 0x5A:
      v26 = CFSTR("SYS_BAND_WCDMA_XI_1500");
      break;
    case 0x5B:
      v26 = CFSTR("SYS_BAND_WCDMA_XIX_850");
      break;
    case 0x78:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND1");
      break;
    case 0x79:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND2");
      break;
    case 0x7A:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND3");
      break;
    case 0x7B:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND4");
      break;
    case 0x7C:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND5");
      break;
    case 0x7D:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND6");
      break;
    case 0x7E:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND7");
      break;
    case 0x7F:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND8");
      break;
    case 0x80:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND9");
      break;
    case 0x81:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND10");
      break;
    case 0x82:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND11");
      break;
    case 0x83:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND12");
      break;
    case 0x84:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND13");
      break;
    case 0x85:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND14");
      break;
    case 0x88:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND17");
      break;
    case 0x89:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND18");
      break;
    case 0x8A:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND19");
      break;
    case 0x8B:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND20");
      break;
    case 0x8C:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND21");
      break;
    case 0x8F:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND24");
      break;
    case 0x90:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND25");
      break;
    case 0x91:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND26");
      break;
    case 0x98:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND33");
      break;
    case 0x99:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND34");
      break;
    case 0x9A:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND35");
      break;
    case 0x9B:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND36");
      break;
    case 0x9C:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND37");
      break;
    case 0x9D:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND38");
      break;
    case 0x9E:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND39");
      break;
    case 0x9F:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND40");
      break;
    case 0xA0:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND41");
      break;
    case 0xA1:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND42");
      break;
    case 0xA2:
      v26 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND43");
      break;
    case 0xA3:
      v26 = CFSTR("SYS_BAND_UMTS_BAND1");
      break;
    case 0xA4:
      v26 = CFSTR("SYS_BAND_UMTS_BAND2");
      break;
    case 0xA5:
      v26 = CFSTR("SYS_BAND_UMTS_BAND3");
      break;
    case 0xA6:
      v26 = CFSTR("SYS_BAND_UMTS_BAND4");
      break;
    case 0xA7:
      v26 = CFSTR("SYS_BAND_UMTS_BAND5");
      break;
    case 0xA8:
      v26 = CFSTR("SYS_BAND_UMTS_BAND6");
      break;
    default:
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hybridActiveBand));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("hybrid_active_band"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_229;
  }
LABEL_228:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hybridActiveChannel));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("hybrid_active_channel"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_234;
  }
LABEL_229:
  gwRat = self->_gwRat;
  if (gwRat < 0x10 && ((0x9FFFu >> gwRat) & 1) != 0)
    v29 = *(&off_10025FD10 + gwRat);
  else
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_gwRat));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("gw_rat"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_247;
  }
LABEL_234:
  gwSrvStatus = self->_gwSrvStatus;
  v31 = CFSTR("SYS_SRV_STATUS_NONE");
  switch(gwSrvStatus)
  {
    case -1:
      break;
    case 0:
      v31 = CFSTR("SYS_SRV_STATUS_NO_SRV");
      break;
    case 1:
      v31 = CFSTR("SYS_SRV_STATUS_LIMITED");
      break;
    case 2:
      v31 = CFSTR("SYS_SRV_STATUS_SRV");
      break;
    case 3:
      v31 = CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL");
      break;
    case 4:
      v31 = CFSTR("SYS_SRV_STATUS_PWR_SAVE");
      break;
    case 5:
      v31 = CFSTR("SYS_SRV_STATUS_MAX");
      break;
    default:
      if (gwSrvStatus == 100)
      {
        v31 = CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE");
      }
      else if (gwSrvStatus == 101)
      {
        v31 = CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE");
      }
      else
      {
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_gwSrvStatus));
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("gw_srv_status"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_248;
  }
LABEL_247:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hdrPilotPn));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("hdr_pilot_pn"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_249;
  }
LABEL_248:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pilotPn));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("pilot_pn"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_250;
  }
LABEL_249:
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("subs_id"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x8000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_250:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("num_subs"));

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_25:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ps_pref"));

  }
LABEL_26:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v10 = v3;

  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100105E2C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $61B41E93924E64F4A8EE0C468EC37E18 has;
  NSData *sectorId;
  $61B41E93924E64F4A8EE0C468EC37E18 v7;
  NSData *plmn;
  id v9;

  v4 = a3;
  has = self->_has;
  v9 = v4;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    v4 = v9;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v9, self->_rat, 2);
  v4 = v9;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field(v9, self->_srvStatus, 3);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field(v9, self->_mcc, 4);
  v4 = v9;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field(v9, self->_subsId, 5);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v9, self->_is95Sid, 6);
  v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field(v9, self->_is95Nid, 7);
    v4 = v9;
  }
LABEL_9:
  sectorId = self->_sectorId;
  if (sectorId)
  {
    PBDataWriterWriteDataField(v9, sectorId, 8);
    v4 = v9;
  }
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v9, self->_band, 9);
    v4 = v9;
    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 8) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v7 & 4) == 0)
        goto LABEL_14;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&v7 & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field(v9, self->_channel, 10);
  v4 = v9;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v9, self->_baseId, 11);
  v4 = v9;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field(v9, self->_zoneId, 12);
  v4 = v9;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field(v9, self->_hdrSrvStatus, 13);
  v4 = v9;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField(v9, self->_hdrHybrid, 14);
  v4 = v9;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field(v9, self->_hybridActiveBand, 15);
  v4 = v9;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field(v9, self->_hybridActiveChannel, 16);
  v4 = v9;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field(v9, self->_hdrPilotPn, 17);
  v4 = v9;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field(v9, self->_pilotPn, 18);
  v4 = v9;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field(v9, self->_gwRat, 21);
  v4 = v9;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field(v9, self->_gwSrvStatus, 22);
  v4 = v9;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x8000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_48:
  PBDataWriterWriteUint32Field(v9, self->_numSubs, 23);
  v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_25:
    PBDataWriterWriteUint32Field(v9, self->_psPref, 24);
    v4 = v9;
  }
LABEL_26:
  plmn = self->_plmn;
  if (plmn)
  {
    PBDataWriterWriteDataField(v9, plmn, 25);
    v4 = v9;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $61B41E93924E64F4A8EE0C468EC37E18 has;
  $61B41E93924E64F4A8EE0C468EC37E18 v6;
  _QWORD *v7;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 28) |= 1u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 21) = self->_rat;
  *((_DWORD *)v4 + 28) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 24) = self->_srvStatus;
  *((_DWORD *)v4 + 28) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 15) = self->_mcc;
  *((_DWORD *)v4 + 28) |= 0x1000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 25) = self->_subsId;
  *((_DWORD *)v4 + 28) |= 0x40000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_34:
  *((_DWORD *)v4 + 14) = self->_is95Sid;
  *((_DWORD *)v4 + 28) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 13) = self->_is95Nid;
    *((_DWORD *)v4 + 28) |= 0x400u;
  }
LABEL_9:
  v7 = v4;
  if (self->_sectorId)
  {
    objc_msgSend(v4, "setSectorId:");
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_band;
    *((_DWORD *)v4 + 28) |= 2u;
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 8) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v6 & 4) == 0)
        goto LABEL_14;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 6) = self->_channel;
  *((_DWORD *)v4 + 28) |= 8u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 5) = self->_baseId;
  *((_DWORD *)v4 + 28) |= 4u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 26) = self->_zoneId;
  *((_DWORD *)v4 + 28) |= 0x80000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 10) = self->_hdrSrvStatus;
  *((_DWORD *)v4 + 28) |= 0x80u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  *((_BYTE *)v4 + 108) = self->_hdrHybrid;
  *((_DWORD *)v4 + 28) |= 0x100000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 11) = self->_hybridActiveBand;
  *((_DWORD *)v4 + 28) |= 0x100u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 12) = self->_hybridActiveChannel;
  *((_DWORD *)v4 + 28) |= 0x200u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 9) = self->_hdrPilotPn;
  *((_DWORD *)v4 + 28) |= 0x40u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 17) = self->_pilotPn;
  *((_DWORD *)v4 + 28) |= 0x4000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 7) = self->_gwRat;
  *((_DWORD *)v4 + 28) |= 0x10u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 8) = self->_gwSrvStatus;
  *((_DWORD *)v4 + 28) |= 0x20u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_48:
  *((_DWORD *)v4 + 16) = self->_numSubs;
  *((_DWORD *)v4 + 28) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_25:
    *((_DWORD *)v4 + 20) = self->_psPref;
    *((_DWORD *)v4 + 28) |= 0x8000u;
  }
LABEL_26:
  if (self->_plmn)
  {
    objc_msgSend(v7, "setPlmn:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  $61B41E93924E64F4A8EE0C468EC37E18 has;
  id v8;
  void *v9;
  $61B41E93924E64F4A8EE0C468EC37E18 v10;
  id v11;
  void *v12;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 28) |= 1u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 21) = self->_rat;
  *((_DWORD *)v5 + 28) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 24) = self->_srvStatus;
  *((_DWORD *)v5 + 28) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 15) = self->_mcc;
  *((_DWORD *)v5 + 28) |= 0x1000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 25) = self->_subsId;
  *((_DWORD *)v5 + 28) |= 0x40000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_30:
  *((_DWORD *)v5 + 14) = self->_is95Sid;
  *((_DWORD *)v5 + 28) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    *((_DWORD *)v5 + 13) = self->_is95Nid;
    *((_DWORD *)v5 + 28) |= 0x400u;
  }
LABEL_9:
  v8 = -[NSData copyWithZone:](self->_sectorId, "copyWithZone:", a3);
  v9 = (void *)v6[11];
  v6[11] = v8;

  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_band;
    *((_DWORD *)v6 + 28) |= 2u;
    v10 = self->_has;
    if ((*(_BYTE *)&v10 & 8) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&v10 & 4) == 0)
        goto LABEL_12;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&v10 & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v6 + 6) = self->_channel;
  *((_DWORD *)v6 + 28) |= 8u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 4) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&v10 & 0x80000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v6 + 5) = self->_baseId;
  *((_DWORD *)v6 + 28) |= 4u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v10 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v6 + 26) = self->_zoneId;
  *((_DWORD *)v6 + 28) |= 0x80000u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v10 & 0x100000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v6 + 10) = self->_hdrSrvStatus;
  *((_DWORD *)v6 + 28) |= 0x80u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v10 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  *((_BYTE *)v6 + 108) = self->_hdrHybrid;
  *((_DWORD *)v6 + 28) |= 0x100000u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v10 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v6 + 11) = self->_hybridActiveBand;
  *((_DWORD *)v6 + 28) |= 0x100u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v10 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v6 + 12) = self->_hybridActiveChannel;
  *((_DWORD *)v6 + 28) |= 0x200u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v10 & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v6 + 9) = self->_hdrPilotPn;
  *((_DWORD *)v6 + 28) |= 0x40u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v10 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v6 + 17) = self->_pilotPn;
  *((_DWORD *)v6 + 28) |= 0x4000u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v10 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v6 + 7) = self->_gwRat;
  *((_DWORD *)v6 + 28) |= 0x10u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x20) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v10 & 0x2000) == 0)
      goto LABEL_22;
LABEL_44:
    *((_DWORD *)v6 + 16) = self->_numSubs;
    *((_DWORD *)v6 + 28) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_43:
  *((_DWORD *)v6 + 8) = self->_gwSrvStatus;
  *((_DWORD *)v6 + 28) |= 0x20u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) != 0)
    goto LABEL_44;
LABEL_22:
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
LABEL_23:
    *((_DWORD *)v6 + 20) = self->_psPref;
    *((_DWORD *)v6 + 28) |= 0x8000u;
  }
LABEL_24:
  v11 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v12 = (void *)v6[9];
  v6[9] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $61B41E93924E64F4A8EE0C468EC37E18 has;
  int v7;
  NSData *sectorId;
  int v9;
  NSData *plmn;
  unsigned __int8 v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_115;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 28);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_115;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_rat != *((_DWORD *)v4 + 21))
      goto LABEL_115;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_srvStatus != *((_DWORD *)v4 + 24))
      goto LABEL_115;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_mcc != *((_DWORD *)v4 + 15))
      goto LABEL_115;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_subsId != *((_DWORD *)v4 + 25))
      goto LABEL_115;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_is95Sid != *((_DWORD *)v4 + 14))
      goto LABEL_115;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_is95Nid != *((_DWORD *)v4 + 13))
      goto LABEL_115;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_115;
  }
  sectorId = self->_sectorId;
  if ((unint64_t)sectorId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](sectorId, "isEqual:"))
      goto LABEL_115;
    has = self->_has;
  }
  v9 = *((_DWORD *)v4 + 28);
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_band != *((_DWORD *)v4 + 4))
      goto LABEL_115;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_channel != *((_DWORD *)v4 + 6))
      goto LABEL_115;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_baseId != *((_DWORD *)v4 + 5))
      goto LABEL_115;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v9 & 0x80000) == 0 || self->_zoneId != *((_DWORD *)v4 + 26))
      goto LABEL_115;
  }
  else if ((v9 & 0x80000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_hdrSrvStatus != *((_DWORD *)v4 + 10))
      goto LABEL_115;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) != 0)
    {
      if (self->_hdrHybrid)
      {
        if (!*((_BYTE *)v4 + 108))
          goto LABEL_115;
        goto LABEL_73;
      }
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_73;
    }
LABEL_115:
    v11 = 0;
    goto LABEL_116;
  }
  if ((v9 & 0x100000) != 0)
    goto LABEL_115;
LABEL_73:
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_hybridActiveBand != *((_DWORD *)v4 + 11))
      goto LABEL_115;
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_hybridActiveChannel != *((_DWORD *)v4 + 12))
      goto LABEL_115;
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_hdrPilotPn != *((_DWORD *)v4 + 9))
      goto LABEL_115;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_pilotPn != *((_DWORD *)v4 + 17))
      goto LABEL_115;
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_gwRat != *((_DWORD *)v4 + 7))
      goto LABEL_115;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_gwSrvStatus != *((_DWORD *)v4 + 8))
      goto LABEL_115;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_numSubs != *((_DWORD *)v4 + 16))
      goto LABEL_115;
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0 || self->_psPref != *((_DWORD *)v4 + 20))
      goto LABEL_115;
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_115;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 9))
    v11 = -[NSData isEqual:](plmn, "isEqual:");
  else
    v11 = 1;
LABEL_116:

  return v11;
}

- (unint64_t)hash
{
  $61B41E93924E64F4A8EE0C468EC37E18 has;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  $61B41E93924E64F4A8EE0C468EC37E18 v12;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_rat;
      if ((*(_DWORD *)&has & 0x20000) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_srvStatus;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v6 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_mcc;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_subsId;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_7;
LABEL_14:
    v9 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v8 = 0;
  if ((*(_WORD *)&has & 0x800) == 0)
    goto LABEL_14;
LABEL_7:
  v9 = 2654435761 * self->_is95Sid;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_is95Nid;
    goto LABEL_16;
  }
LABEL_15:
  v10 = 0;
LABEL_16:
  v11 = (unint64_t)-[NSData hash](self->_sectorId, "hash");
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
    v13 = 2654435761 * self->_band;
    if ((*(_BYTE *)&v12 & 8) != 0)
    {
LABEL_18:
      v14 = 2654435761 * self->_channel;
      if ((*(_BYTE *)&v12 & 4) != 0)
        goto LABEL_19;
      goto LABEL_33;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&v12 & 8) != 0)
      goto LABEL_18;
  }
  v14 = 0;
  if ((*(_BYTE *)&v12 & 4) != 0)
  {
LABEL_19:
    v15 = 2654435761 * self->_baseId;
    if ((*(_DWORD *)&v12 & 0x80000) != 0)
      goto LABEL_20;
    goto LABEL_34;
  }
LABEL_33:
  v15 = 0;
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
LABEL_20:
    v16 = 2654435761 * self->_zoneId;
    if ((*(_BYTE *)&v12 & 0x80) != 0)
      goto LABEL_21;
    goto LABEL_35;
  }
LABEL_34:
  v16 = 0;
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
LABEL_21:
    v17 = 2654435761 * self->_hdrSrvStatus;
    if ((*(_DWORD *)&v12 & 0x100000) != 0)
      goto LABEL_22;
    goto LABEL_36;
  }
LABEL_35:
  v17 = 0;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
LABEL_22:
    v18 = 2654435761 * self->_hdrHybrid;
    if ((*(_WORD *)&v12 & 0x100) != 0)
      goto LABEL_23;
    goto LABEL_37;
  }
LABEL_36:
  v18 = 0;
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
LABEL_23:
    v19 = 2654435761 * self->_hybridActiveBand;
    if ((*(_WORD *)&v12 & 0x200) != 0)
      goto LABEL_24;
    goto LABEL_38;
  }
LABEL_37:
  v19 = 0;
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
LABEL_24:
    v20 = 2654435761 * self->_hybridActiveChannel;
    if ((*(_BYTE *)&v12 & 0x40) != 0)
      goto LABEL_25;
    goto LABEL_39;
  }
LABEL_38:
  v20 = 0;
  if ((*(_BYTE *)&v12 & 0x40) != 0)
  {
LABEL_25:
    v21 = 2654435761 * self->_hdrPilotPn;
    if ((*(_WORD *)&v12 & 0x4000) != 0)
      goto LABEL_26;
    goto LABEL_40;
  }
LABEL_39:
  v21 = 0;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
LABEL_26:
    v22 = 2654435761 * self->_pilotPn;
    if ((*(_BYTE *)&v12 & 0x10) != 0)
      goto LABEL_27;
    goto LABEL_41;
  }
LABEL_40:
  v22 = 0;
  if ((*(_BYTE *)&v12 & 0x10) != 0)
  {
LABEL_27:
    v23 = 2654435761 * self->_gwRat;
    if ((*(_BYTE *)&v12 & 0x20) != 0)
      goto LABEL_28;
    goto LABEL_42;
  }
LABEL_41:
  v23 = 0;
  if ((*(_BYTE *)&v12 & 0x20) != 0)
  {
LABEL_28:
    v24 = 2654435761 * self->_gwSrvStatus;
    if ((*(_WORD *)&v12 & 0x2000) != 0)
      goto LABEL_29;
LABEL_43:
    v25 = 0;
    if ((*(_WORD *)&v12 & 0x8000) != 0)
      goto LABEL_30;
LABEL_44:
    v26 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v11 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
  }
LABEL_42:
  v24 = 0;
  if ((*(_WORD *)&v12 & 0x2000) == 0)
    goto LABEL_43;
LABEL_29:
  v25 = 2654435761 * self->_numSubs;
  if ((*(_WORD *)&v12 & 0x8000) == 0)
    goto LABEL_44;
LABEL_30:
  v26 = 2654435761 * self->_psPref;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v11 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 28);
    if ((v5 & 0x10000) == 0)
    {
LABEL_3:
      if ((v5 & 0x20000) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((v5 & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  self->_rat = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x20000) == 0)
  {
LABEL_4:
    if ((v5 & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  self->_srvStatus = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x1000) == 0)
  {
LABEL_5:
    if ((v5 & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  self->_mcc = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x40000) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  self->_subsId = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_34:
  self->_is95Sid = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)v4 + 28) & 0x400) != 0)
  {
LABEL_8:
    self->_is95Nid = *((_DWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_9:
  v7 = v4;
  if (*((_QWORD *)v4 + 11))
  {
    -[CellularCdmaCellInfo setSectorId:](self, "setSectorId:");
    v4 = v7;
  }
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 2) != 0)
  {
    self->_band = *((_DWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 2u;
    v6 = *((_DWORD *)v4 + 28);
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 4) == 0)
        goto LABEL_14;
      goto LABEL_38;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_channel = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 4) == 0)
  {
LABEL_14:
    if ((v6 & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  self->_baseId = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x80000) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  self->_zoneId = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x80000u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x80) == 0)
  {
LABEL_16:
    if ((v6 & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  self->_hdrSrvStatus = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x100000) == 0)
  {
LABEL_17:
    if ((v6 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  self->_hdrHybrid = *((_BYTE *)v4 + 108);
  *(_DWORD *)&self->_has |= 0x100000u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  self->_hybridActiveBand = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x200) == 0)
  {
LABEL_19:
    if ((v6 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  self->_hybridActiveChannel = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x40) == 0)
  {
LABEL_20:
    if ((v6 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  self->_hdrPilotPn = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((v6 & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  self->_pilotPn = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x10) == 0)
  {
LABEL_22:
    if ((v6 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  self->_gwRat = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x20) == 0)
  {
LABEL_23:
    if ((v6 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_48;
  }
LABEL_47:
  self->_gwSrvStatus = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((v6 & 0x8000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_48:
  self->_numSubs = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 28) & 0x8000) != 0)
  {
LABEL_25:
    self->_psPref = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_26:
  if (*((_QWORD *)v4 + 9))
  {
    -[CellularCdmaCellInfo setPlmn:](self, "setPlmn:");
    v4 = v7;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)is95Sid
{
  return self->_is95Sid;
}

- (unsigned)is95Nid
{
  return self->_is95Nid;
}

- (NSData)sectorId
{
  return self->_sectorId;
}

- (void)setSectorId:(id)a3
{
  objc_storeStrong((id *)&self->_sectorId, a3);
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)baseId
{
  return self->_baseId;
}

- (unsigned)zoneId
{
  return self->_zoneId;
}

- (BOOL)hdrHybrid
{
  return self->_hdrHybrid;
}

- (unsigned)hybridActiveChannel
{
  return self->_hybridActiveChannel;
}

- (unsigned)hdrPilotPn
{
  return self->_hdrPilotPn;
}

- (unsigned)pilotPn
{
  return self->_pilotPn;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectorId, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
