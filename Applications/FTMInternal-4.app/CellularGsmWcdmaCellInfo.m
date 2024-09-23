@implementation CellularGsmWcdmaCellInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)rat
{
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    return self->_rat;
  else
    return 0;
}

- (void)setRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRat
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)ratAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025F230 + a3);
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
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    return self->_srvStatus;
  else
    return -1;
}

- (void)setSrvStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_srvStatus = a3;
}

- (void)setHasSrvStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSrvStatus
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
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

- (int)srvDomain
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_srvDomain;
  else
    return -1;
}

- (void)setSrvDomain:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_srvDomain = a3;
}

- (void)setHasSrvDomain:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSrvDomain
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)srvDomainAsString:(int)a3
{
  if ((a3 + 1) >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F2B0 + a3 + 1);
}

- (int)StringAsSrvDomain:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_DOMAIN_NONE")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_DOMAIN_NO_SRV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_DOMAIN_CS_ONLY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_DOMAIN_PS_ONLY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_DOMAIN_CS_PS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_DOMAIN_CAMPED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_SRV_DOMAIN_MAX")))
  {
    v4 = 5;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)setMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMcc
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMnc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLac
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCellId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)wcdmaBand
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_wcdmaBand;
  else
    return 0;
}

- (void)setWcdmaBand:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_wcdmaBand = a3;
}

- (void)setHasWcdmaBand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasWcdmaBand
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)wcdmaBandAsString:(int)a3
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

- (int)StringAsWcdmaBand:(id)a3
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

- (int)tdsBand
{
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    return self->_tdsBand;
  else
    return 0;
}

- (void)setTdsBand:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tdsBand = a3;
}

- (void)setHasTdsBand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTdsBand
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)tdsBandAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F2E8 + a3);
}

- (int)StringAsTdsBand:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_TDS_BANDA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_TDS_BANDB")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_TDS_BANDC")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_TDS_BANDD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_TDS_BANDE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_TDS_BANDF")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)hspa
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_hspa;
  else
    return -1;
}

- (void)setHspa:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hspa = a3;
}

- (void)setHasHspa:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHspa
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)hspaAsString:(int)a3
{
  if ((a3 + 1) >= 8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F318 + a3 + 1);
}

- (int)StringAsHspa:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_HS_IND_NONE")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_HS_IND_HSDPA_HSUPA_UNSUPP_CELL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_HS_IND_HSDPA_SUPP_CELL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_HS_IND_HSUPA_SUPP_CELL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_HS_IND_HSDPA_HSUPA_SUPP_CELL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_HS_IND_HSDPAPLUS_SUPP_CELL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_HS_IND_HSDPAPLUS_HSUPA_SUPP_CELL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_HS_IND_MAX")))
  {
    v4 = 6;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)setDlUarfcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_dlUarfcn = a3;
}

- (void)setHasDlUarfcn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDlUarfcn
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPsc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPsc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (int)gsmBand
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_gsmBand;
  else
    return 0;
}

- (void)setGsmBand:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_gsmBand = a3;
}

- (void)setHasGsmBand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasGsmBand
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)gsmBandAsString:(int)a3
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

- (int)StringAsGsmBand:(id)a3
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

- (void)setGsmArfcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_gsmArfcn = a3;
}

- (void)setHasGsmArfcn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasGsmArfcn
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setFmtId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_fmtId = a3;
}

- (void)setHasFmtId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFmtId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSubsId
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularGsmWcdmaCellInfo;
  v3 = -[CellularGsmWcdmaCellInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularGsmWcdmaCellInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has;
  void *v5;
  id v6;
  void *v8;
  uint64_t rat;
  void *v10;
  int srvStatus;
  __CFString *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  uint64_t tdsBand;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  rat = self->_rat;
  if (rat < 0x10 && ((0x9FFFu >> rat) & 1) != 0)
    v10 = *(&off_10025F230 + rat);
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rat));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("rat"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_28:
  srvStatus = self->_srvStatus;
  v12 = CFSTR("SYS_SRV_STATUS_NONE");
  switch(srvStatus)
  {
    case -1:
      break;
    case 0:
      v12 = CFSTR("SYS_SRV_STATUS_NO_SRV");
      break;
    case 1:
      v12 = CFSTR("SYS_SRV_STATUS_LIMITED");
      break;
    case 2:
      v12 = CFSTR("SYS_SRV_STATUS_SRV");
      break;
    case 3:
      v12 = CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL");
      break;
    case 4:
      v12 = CFSTR("SYS_SRV_STATUS_PWR_SAVE");
      break;
    case 5:
      v12 = CFSTR("SYS_SRV_STATUS_MAX");
      break;
    default:
      if (srvStatus == 100)
      {
        v12 = CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE");
      }
      else if (srvStatus == 101)
      {
        v12 = CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE");
      }
      else
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_srvStatus));
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("srv_status"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_45;
  }
LABEL_41:
  v13 = self->_srvDomain + 1;
  if (v13 >= 7)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_srvDomain));
  else
    v14 = *(&off_10025F2B0 + v13);
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("srv_domain"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_46;
  }
LABEL_45:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("mcc"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_47;
  }
LABEL_46:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("mnc"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_9;
    goto LABEL_48;
  }
LABEL_47:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("lac"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_10;
    goto LABEL_49;
  }
LABEL_48:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("cell_id"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_129;
  }
LABEL_49:
  v19 = CFSTR("SYS_BAND_BC0");
  switch(self->_wcdmaBand)
  {
    case 0:
      break;
    case 1:
      v19 = CFSTR("SYS_BAND_BC1");
      break;
    case 3:
      v19 = CFSTR("SYS_BAND_BC3");
      break;
    case 4:
      v19 = CFSTR("SYS_BAND_BC4");
      break;
    case 5:
      v19 = CFSTR("SYS_BAND_BC5");
      break;
    case 6:
      v19 = CFSTR("SYS_BAND_BC6");
      break;
    case 7:
      v19 = CFSTR("SYS_BAND_BC7");
      break;
    case 8:
      v19 = CFSTR("SYS_BAND_BC8");
      break;
    case 9:
      v19 = CFSTR("SYS_BAND_BC9");
      break;
    case 0xA:
      v19 = CFSTR("SYS_BAND_BC10");
      break;
    case 0xB:
      v19 = CFSTR("SYS_BAND_BC11");
      break;
    case 0xC:
      v19 = CFSTR("SYS_BAND_BC12");
      break;
    case 0xD:
      v19 = CFSTR("SYS_BAND_BC13");
      break;
    case 0xE:
      v19 = CFSTR("SYS_BAND_BC14");
      break;
    case 0xF:
      v19 = CFSTR("SYS_BAND_BC15");
      break;
    case 0x10:
      v19 = CFSTR("SYS_BAND_BC16");
      break;
    case 0x11:
      v19 = CFSTR("SYS_BAND_BC17");
      break;
    case 0x12:
      v19 = CFSTR("SYS_BAND_BC18");
      break;
    case 0x13:
      v19 = CFSTR("SYS_BAND_BC19");
      break;
    case 0x28:
      v19 = CFSTR("SYS_BAND_GSM_450");
      break;
    case 0x29:
      v19 = CFSTR("SYS_BAND_GSM_480");
      break;
    case 0x2A:
      v19 = CFSTR("SYS_BAND_GSM_750");
      break;
    case 0x2B:
      v19 = CFSTR("SYS_BAND_GSM_850");
      break;
    case 0x2C:
      v19 = CFSTR("SYS_BAND_GSM_EGSM_900");
      break;
    case 0x2D:
      v19 = CFSTR("SYS_BAND_GSM_PGSM_900");
      break;
    case 0x2E:
      v19 = CFSTR("SYS_BAND_GSM_RGSM_900");
      break;
    case 0x2F:
      v19 = CFSTR("SYS_BAND_GSM_DCS_1800");
      break;
    case 0x30:
      v19 = CFSTR("SYS_BAND_GSM_PCS_1900");
      break;
    case 0x50:
      v19 = CFSTR("SYS_BAND_WCDMA_I_IMT_2000");
      break;
    case 0x51:
      v19 = CFSTR("SYS_BAND_WCDMA_II_PCS_1900");
      break;
    case 0x52:
      v19 = CFSTR("SYS_BAND_WCDMA_III_1700");
      break;
    case 0x53:
      v19 = CFSTR("SYS_BAND_WCDMA_IV_1700");
      break;
    case 0x54:
      v19 = CFSTR("SYS_BAND_WCDMA_V_850");
      break;
    case 0x55:
      v19 = CFSTR("SYS_BAND_WCDMA_VI_800");
      break;
    case 0x56:
      v19 = CFSTR("SYS_BAND_WCDMA_VII_2600");
      break;
    case 0x57:
      v19 = CFSTR("SYS_BAND_WCDMA_VIII_900");
      break;
    case 0x58:
      v19 = CFSTR("SYS_BAND_WCDMA_IX_1700");
      break;
    case 0x5A:
      v19 = CFSTR("SYS_BAND_WCDMA_XI_1500");
      break;
    case 0x5B:
      v19 = CFSTR("SYS_BAND_WCDMA_XIX_850");
      break;
    case 0x78:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND1");
      break;
    case 0x79:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND2");
      break;
    case 0x7A:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND3");
      break;
    case 0x7B:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND4");
      break;
    case 0x7C:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND5");
      break;
    case 0x7D:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND6");
      break;
    case 0x7E:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND7");
      break;
    case 0x7F:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND8");
      break;
    case 0x80:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND9");
      break;
    case 0x81:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND10");
      break;
    case 0x82:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND11");
      break;
    case 0x83:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND12");
      break;
    case 0x84:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND13");
      break;
    case 0x85:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND14");
      break;
    case 0x88:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND17");
      break;
    case 0x89:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND18");
      break;
    case 0x8A:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND19");
      break;
    case 0x8B:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND20");
      break;
    case 0x8C:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND21");
      break;
    case 0x8F:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND24");
      break;
    case 0x90:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND25");
      break;
    case 0x91:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND26");
      break;
    case 0x98:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND33");
      break;
    case 0x99:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND34");
      break;
    case 0x9A:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND35");
      break;
    case 0x9B:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND36");
      break;
    case 0x9C:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND37");
      break;
    case 0x9D:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND38");
      break;
    case 0x9E:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND39");
      break;
    case 0x9F:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND40");
      break;
    case 0xA0:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND41");
      break;
    case 0xA1:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND42");
      break;
    case 0xA2:
      v19 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND43");
      break;
    case 0xA3:
      v19 = CFSTR("SYS_BAND_UMTS_BAND1");
      break;
    case 0xA4:
      v19 = CFSTR("SYS_BAND_UMTS_BAND2");
      break;
    case 0xA5:
      v19 = CFSTR("SYS_BAND_UMTS_BAND3");
      break;
    case 0xA6:
      v19 = CFSTR("SYS_BAND_UMTS_BAND4");
      break;
    case 0xA7:
      v19 = CFSTR("SYS_BAND_UMTS_BAND5");
      break;
    case 0xA8:
      v19 = CFSTR("SYS_BAND_UMTS_BAND6");
      break;
    default:
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_wcdmaBand));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("wcdma_band"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_133;
  }
LABEL_129:
  tdsBand = self->_tdsBand;
  if (tdsBand >= 6)
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_tdsBand));
  else
    v21 = *(&off_10025F2E8 + tdsBand);
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("tds_band"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_137;
  }
LABEL_133:
  v22 = self->_hspa + 1;
  if (v22 >= 8)
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hspa));
  else
    v23 = *(&off_10025F318 + v22);
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("hspa"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_138;
  }
LABEL_137:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlUarfcn));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("dl_uarfcn"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_139;
  }
LABEL_138:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psc));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("psc"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_219;
  }
LABEL_139:
  v26 = CFSTR("SYS_BAND_BC0");
  switch(self->_gsmBand)
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
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_gsmBand));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("gsm_band"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_220;
  }
LABEL_219:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_gsmArfcn));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("gsm_arfcn"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_221;
  }
LABEL_220:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_fmtId));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("fmt_id"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_19;
LABEL_222:
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("subs_id"));

    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_221:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("num_subs"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
    goto LABEL_222;
LABEL_19:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_20:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ps_pref"));

  }
LABEL_21:
  v6 = v3;

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B58EC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $8BB8A71BA2C7375E37BF2088B44ABA31 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_timestamp, 1);
    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v5, self->_rat, 2);
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field(v5, self->_srvStatus, 3);
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field(v5, self->_mcc, 4);
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(v5, self->_mnc, 5);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field(v5, self->_lac, 6);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field(v5, self->_cellId, 7);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field(v5, self->_wcdmaBand, 8);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field(v5, self->_dlUarfcn, 9);
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field(v5, self->_psc, 10);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field(v5, self->_gsmBand, 11);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field(v5, self->_gsmArfcn, 12);
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field(v5, self->_srvDomain, 13);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field(v5, self->_hspa, 14);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field(v5, self->_tdsBand, 15);
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field(v5, self->_fmtId, 16);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_19;
LABEL_39:
    PBDataWriterWriteUint32Field(v5, self->_subsId, 18);
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 17);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
    goto LABEL_39;
LABEL_19:
  if ((*(_WORD *)&has & 0x800) != 0)
LABEL_20:
    PBDataWriterWriteUint32Field(v5, self->_psPref, 19);
LABEL_21:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 22) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 16) = self->_rat;
  *((_DWORD *)v4 + 22) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 18) = self->_srvStatus;
  *((_DWORD *)v4 + 22) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 11) = self->_mcc;
  *((_DWORD *)v4 + 22) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 12) = self->_mnc;
  *((_DWORD *)v4 + 22) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 10) = self->_lac;
  *((_DWORD *)v4 + 22) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 4) = self->_cellId;
  *((_DWORD *)v4 + 22) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 21) = self->_wcdmaBand;
  *((_DWORD *)v4 + 22) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 5) = self->_dlUarfcn;
  *((_DWORD *)v4 + 22) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 15) = self->_psc;
  *((_DWORD *)v4 + 22) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 8) = self->_gsmBand;
  *((_DWORD *)v4 + 22) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 7) = self->_gsmArfcn;
  *((_DWORD *)v4 + 22) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 17) = self->_srvDomain;
  *((_DWORD *)v4 + 22) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 9) = self->_hspa;
  *((_DWORD *)v4 + 22) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 20) = self->_tdsBand;
  *((_DWORD *)v4 + 22) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 6) = self->_fmtId;
  *((_DWORD *)v4 + 22) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_19;
LABEL_39:
    *((_DWORD *)v4 + 19) = self->_subsId;
    *((_DWORD *)v4 + 22) |= 0x10000u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_38:
  *((_DWORD *)v4 + 13) = self->_numSubs;
  *((_DWORD *)v4 + 22) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
    goto LABEL_39;
LABEL_19:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 14) = self->_psPref;
    *((_DWORD *)v4 + 22) |= 0x800u;
  }
LABEL_21:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 22) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 16) = self->_rat;
  *((_DWORD *)result + 22) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 18) = self->_srvStatus;
  *((_DWORD *)result + 22) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 11) = self->_mcc;
  *((_DWORD *)result + 22) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 12) = self->_mnc;
  *((_DWORD *)result + 22) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 10) = self->_lac;
  *((_DWORD *)result + 22) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 4) = self->_cellId;
  *((_DWORD *)result + 22) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 21) = self->_wcdmaBand;
  *((_DWORD *)result + 22) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 5) = self->_dlUarfcn;
  *((_DWORD *)result + 22) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 15) = self->_psc;
  *((_DWORD *)result + 22) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 8) = self->_gsmBand;
  *((_DWORD *)result + 22) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 7) = self->_gsmArfcn;
  *((_DWORD *)result + 22) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 17) = self->_srvDomain;
  *((_DWORD *)result + 22) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 9) = self->_hspa;
  *((_DWORD *)result + 22) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 20) = self->_tdsBand;
  *((_DWORD *)result + 22) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 6) = self->_fmtId;
  *((_DWORD *)result + 22) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 13) = self->_numSubs;
  *((_DWORD *)result + 22) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0)
      return result;
    goto LABEL_20;
  }
LABEL_39:
  *((_DWORD *)result + 19) = self->_subsId;
  *((_DWORD *)result + 22) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
    return result;
LABEL_20:
  *((_DWORD *)result + 14) = self->_psPref;
  *((_DWORD *)result + 22) |= 0x800u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has;
  int v7;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_97;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 22);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_97;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_97:
    v8 = 0;
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_rat != *((_DWORD *)v4 + 16))
      goto LABEL_97;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_srvStatus != *((_DWORD *)v4 + 18))
      goto LABEL_97;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_mcc != *((_DWORD *)v4 + 11))
      goto LABEL_97;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_mnc != *((_DWORD *)v4 + 12))
      goto LABEL_97;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_lac != *((_DWORD *)v4 + 10))
      goto LABEL_97;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4))
      goto LABEL_97;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_wcdmaBand != *((_DWORD *)v4 + 21))
      goto LABEL_97;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_dlUarfcn != *((_DWORD *)v4 + 5))
      goto LABEL_97;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_psc != *((_DWORD *)v4 + 15))
      goto LABEL_97;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_gsmBand != *((_DWORD *)v4 + 8))
      goto LABEL_97;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_gsmArfcn != *((_DWORD *)v4 + 7))
      goto LABEL_97;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_srvDomain != *((_DWORD *)v4 + 17))
      goto LABEL_97;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_hspa != *((_DWORD *)v4 + 9))
      goto LABEL_97;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_tdsBand != *((_DWORD *)v4 + 20))
      goto LABEL_97;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_fmtId != *((_DWORD *)v4 + 6))
      goto LABEL_97;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_numSubs != *((_DWORD *)v4 + 13))
      goto LABEL_97;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_subsId != *((_DWORD *)v4 + 19))
      goto LABEL_97;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_psPref != *((_DWORD *)v4 + 14))
      goto LABEL_97;
    v8 = 1;
  }
  else
  {
    v8 = (*((_DWORD *)v4 + 22) & 0x800) == 0;
  }
LABEL_98:

  return v8;
}

- (unint64_t)hash
{
  $8BB8A71BA2C7375E37BF2088B44ABA31 has;
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
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_rat;
      if ((*(_WORD *)&has & 0x8000) != 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_srvStatus;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  v5 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_mcc;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  v6 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_mnc;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  v7 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_lac;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  v8 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_cellId;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_wcdmaBand;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  v10 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_dlUarfcn;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  v11 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_psc;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  v12 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_gsmBand;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  v13 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_gsmArfcn;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  v14 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_srvDomain;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  v15 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_hspa;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_tdsBand;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  v17 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_fmtId;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  v18 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_numSubs;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_19;
LABEL_38:
    v20 = 0;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_20;
LABEL_39:
    v21 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_37:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x10000) == 0)
    goto LABEL_38;
LABEL_19:
  v20 = 2654435761 * self->_subsId;
  if ((*(_WORD *)&has & 0x800) == 0)
    goto LABEL_39;
LABEL_20:
  v21 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 22);
    if ((v5 & 0x2000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_rat = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  self->_srvStatus = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  self->_mcc = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  self->_mnc = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  self->_lac = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x40000) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  self->_cellId = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x40000) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  self->_wcdmaBand = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  self->_dlUarfcn = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  self->_psc = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  self->_gsmBand = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  self->_gsmArfcn = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x4000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  self->_srvDomain = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x40) == 0)
  {
LABEL_15:
    if ((v5 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  self->_hspa = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x20000) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  self->_tdsBand = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 8) == 0)
  {
LABEL_17:
    if ((v5 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  self->_fmtId = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x400) == 0)
  {
LABEL_18:
    if ((v5 & 0x10000) == 0)
      goto LABEL_19;
LABEL_39:
    self->_subsId = *((_DWORD *)v4 + 19);
    *(_DWORD *)&self->_has |= 0x10000u;
    if ((*((_DWORD *)v4 + 22) & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_38:
  self->_numSubs = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x10000) != 0)
    goto LABEL_39;
LABEL_19:
  if ((v5 & 0x800) != 0)
  {
LABEL_20:
    self->_psPref = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_21:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
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

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)dlUarfcn
{
  return self->_dlUarfcn;
}

- (unsigned)psc
{
  return self->_psc;
}

- (unsigned)gsmArfcn
{
  return self->_gsmArfcn;
}

- (unsigned)fmtId
{
  return self->_fmtId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)psPref
{
  return self->_psPref;
}

@end
