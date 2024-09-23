@implementation KCellularWcdmaCellInfo

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

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumSubs
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMcc
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMnc
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLac
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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

- (int)wcdmaBand
{
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    return self->_wcdmaBand;
  else
    return 0;
}

- (void)setWcdmaBand:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_wcdmaBand = a3;
}

- (void)setHasWcdmaBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWcdmaBand
{
  return (*(_WORD *)&self->_has >> 11) & 1;
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

- (int)hspa
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_hspa;
  else
    return 0;
}

- (void)setHspa:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_hspa = a3;
}

- (void)setHasHspa:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHspa
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)hspaAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F160 + a3);
}

- (int)StringAsHspa:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_HS_IND_HSDPA_HSUPA_UNSUPP_CELL")) & 1) != 0)
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
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_HS_IND_HSDPA_HSUPA_SUPP_CELL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDlUarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dlUarfcn = a3;
}

- (void)setHasDlUarfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDlUarfcn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPsc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPsc
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumMncDigits
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularWcdmaCellInfo;
  v3 = -[KCellularWcdmaCellInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularWcdmaCellInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t hspa;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("subs_id"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("num_subs"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("mcc"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mnc"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("lac"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cell_id"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_102;
  }
LABEL_22:
  v14 = CFSTR("SYS_BAND_BC0");
  switch(self->_wcdmaBand)
  {
    case 0:
      break;
    case 1:
      v14 = CFSTR("SYS_BAND_BC1");
      break;
    case 3:
      v14 = CFSTR("SYS_BAND_BC3");
      break;
    case 4:
      v14 = CFSTR("SYS_BAND_BC4");
      break;
    case 5:
      v14 = CFSTR("SYS_BAND_BC5");
      break;
    case 6:
      v14 = CFSTR("SYS_BAND_BC6");
      break;
    case 7:
      v14 = CFSTR("SYS_BAND_BC7");
      break;
    case 8:
      v14 = CFSTR("SYS_BAND_BC8");
      break;
    case 9:
      v14 = CFSTR("SYS_BAND_BC9");
      break;
    case 0xA:
      v14 = CFSTR("SYS_BAND_BC10");
      break;
    case 0xB:
      v14 = CFSTR("SYS_BAND_BC11");
      break;
    case 0xC:
      v14 = CFSTR("SYS_BAND_BC12");
      break;
    case 0xD:
      v14 = CFSTR("SYS_BAND_BC13");
      break;
    case 0xE:
      v14 = CFSTR("SYS_BAND_BC14");
      break;
    case 0xF:
      v14 = CFSTR("SYS_BAND_BC15");
      break;
    case 0x10:
      v14 = CFSTR("SYS_BAND_BC16");
      break;
    case 0x11:
      v14 = CFSTR("SYS_BAND_BC17");
      break;
    case 0x12:
      v14 = CFSTR("SYS_BAND_BC18");
      break;
    case 0x13:
      v14 = CFSTR("SYS_BAND_BC19");
      break;
    case 0x28:
      v14 = CFSTR("SYS_BAND_GSM_450");
      break;
    case 0x29:
      v14 = CFSTR("SYS_BAND_GSM_480");
      break;
    case 0x2A:
      v14 = CFSTR("SYS_BAND_GSM_750");
      break;
    case 0x2B:
      v14 = CFSTR("SYS_BAND_GSM_850");
      break;
    case 0x2C:
      v14 = CFSTR("SYS_BAND_GSM_EGSM_900");
      break;
    case 0x2D:
      v14 = CFSTR("SYS_BAND_GSM_PGSM_900");
      break;
    case 0x2E:
      v14 = CFSTR("SYS_BAND_GSM_RGSM_900");
      break;
    case 0x2F:
      v14 = CFSTR("SYS_BAND_GSM_DCS_1800");
      break;
    case 0x30:
      v14 = CFSTR("SYS_BAND_GSM_PCS_1900");
      break;
    case 0x50:
      v14 = CFSTR("SYS_BAND_WCDMA_I_IMT_2000");
      break;
    case 0x51:
      v14 = CFSTR("SYS_BAND_WCDMA_II_PCS_1900");
      break;
    case 0x52:
      v14 = CFSTR("SYS_BAND_WCDMA_III_1700");
      break;
    case 0x53:
      v14 = CFSTR("SYS_BAND_WCDMA_IV_1700");
      break;
    case 0x54:
      v14 = CFSTR("SYS_BAND_WCDMA_V_850");
      break;
    case 0x55:
      v14 = CFSTR("SYS_BAND_WCDMA_VI_800");
      break;
    case 0x56:
      v14 = CFSTR("SYS_BAND_WCDMA_VII_2600");
      break;
    case 0x57:
      v14 = CFSTR("SYS_BAND_WCDMA_VIII_900");
      break;
    case 0x58:
      v14 = CFSTR("SYS_BAND_WCDMA_IX_1700");
      break;
    case 0x5A:
      v14 = CFSTR("SYS_BAND_WCDMA_XI_1500");
      break;
    case 0x5B:
      v14 = CFSTR("SYS_BAND_WCDMA_XIX_850");
      break;
    case 0x78:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND1");
      break;
    case 0x79:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND2");
      break;
    case 0x7A:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND3");
      break;
    case 0x7B:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND4");
      break;
    case 0x7C:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND5");
      break;
    case 0x7D:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND6");
      break;
    case 0x7E:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND7");
      break;
    case 0x7F:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND8");
      break;
    case 0x80:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND9");
      break;
    case 0x81:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND10");
      break;
    case 0x82:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND11");
      break;
    case 0x83:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND12");
      break;
    case 0x84:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND13");
      break;
    case 0x85:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND14");
      break;
    case 0x88:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND17");
      break;
    case 0x89:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND18");
      break;
    case 0x8A:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND19");
      break;
    case 0x8B:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND20");
      break;
    case 0x8C:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND21");
      break;
    case 0x8F:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND24");
      break;
    case 0x90:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND25");
      break;
    case 0x91:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND26");
      break;
    case 0x98:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND33");
      break;
    case 0x99:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND34");
      break;
    case 0x9A:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND35");
      break;
    case 0x9B:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND36");
      break;
    case 0x9C:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND37");
      break;
    case 0x9D:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND38");
      break;
    case 0x9E:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND39");
      break;
    case 0x9F:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND40");
      break;
    case 0xA0:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND41");
      break;
    case 0xA1:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND42");
      break;
    case 0xA2:
      v14 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND43");
      break;
    case 0xA3:
      v14 = CFSTR("SYS_BAND_UMTS_BAND1");
      break;
    case 0xA4:
      v14 = CFSTR("SYS_BAND_UMTS_BAND2");
      break;
    case 0xA5:
      v14 = CFSTR("SYS_BAND_UMTS_BAND3");
      break;
    case 0xA6:
      v14 = CFSTR("SYS_BAND_UMTS_BAND4");
      break;
    case 0xA7:
      v14 = CFSTR("SYS_BAND_UMTS_BAND5");
      break;
    case 0xA8:
      v14 = CFSTR("SYS_BAND_UMTS_BAND6");
      break;
    default:
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_wcdmaBand));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("wcdma_band"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_106;
  }
LABEL_102:
  hspa = self->_hspa;
  if (hspa >= 4)
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hspa));
  else
    v16 = *(&off_10025F160 + hspa);
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("hspa"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
LABEL_107:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psc));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("psc"));

    if ((*(_WORD *)&self->_has & 0x80) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_106:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlUarfcn));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("dl_uarfcn"));

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_107;
LABEL_12:
  if ((has & 0x80) != 0)
  {
LABEL_13:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("num_mnc_digits"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10009FA08((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_subsId, 2);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 3);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field(v5, self->_mcc, 4);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field(v5, self->_mnc, 5);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(v5, self->_lac, 6);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field(v5, self->_cellId, 7);
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field(v5, self->_wcdmaBand, 8);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field(v5, self->_dlUarfcn, 9);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
LABEL_25:
    PBDataWriterWriteUint32Field(v5, self->_numMncDigits, 13);
    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v5, self->_psc, 10);
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 8) != 0)
LABEL_13:
    PBDataWriterWriteInt32Field(v5, self->_hspa, 14);
LABEL_14:

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
    *((_WORD *)v4 + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_subsId;
  *((_WORD *)v4 + 30) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 11) = self->_numSubs;
  *((_WORD *)v4 + 30) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 8) = self->_mcc;
  *((_WORD *)v4 + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 9) = self->_mnc;
  *((_WORD *)v4 + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 7) = self->_lac;
  *((_WORD *)v4 + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 4) = self->_cellId;
  *((_WORD *)v4 + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 14) = self->_wcdmaBand;
  *((_WORD *)v4 + 30) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 5) = self->_dlUarfcn;
  *((_WORD *)v4 + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
LABEL_25:
    *((_DWORD *)v4 + 10) = self->_numMncDigits;
    *((_WORD *)v4 + 30) |= 0x80u;
    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  *((_DWORD *)v4 + 12) = self->_psc;
  *((_WORD *)v4 + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 6) = self->_hspa;
    *((_WORD *)v4 + 30) |= 8u;
  }
LABEL_14:

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
    *((_WORD *)result + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 13) = self->_subsId;
  *((_WORD *)result + 30) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 11) = self->_numSubs;
  *((_WORD *)result + 30) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_mcc;
  *((_WORD *)result + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_mnc;
  *((_WORD *)result + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 7) = self->_lac;
  *((_WORD *)result + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 4) = self->_cellId;
  *((_WORD *)result + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 14) = self->_wcdmaBand;
  *((_WORD *)result + 30) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 5) = self->_dlUarfcn;
  *((_WORD *)result + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 12) = self->_psc;
  *((_WORD *)result + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      return result;
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 10) = self->_numMncDigits;
  *((_WORD *)result + 30) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) == 0)
    return result;
LABEL_13:
  *((_DWORD *)result + 6) = self->_hspa;
  *((_WORD *)result + 30) |= 8u;
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
    goto LABEL_62;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 30);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_62;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_62:
    v8 = 0;
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 13))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_numSubs != *((_DWORD *)v4 + 11))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_mcc != *((_DWORD *)v4 + 8))
      goto LABEL_62;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_mnc != *((_DWORD *)v4 + 9))
      goto LABEL_62;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_lac != *((_DWORD *)v4 + 7))
      goto LABEL_62;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4))
      goto LABEL_62;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0 || self->_wcdmaBand != *((_DWORD *)v4 + 14))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_dlUarfcn != *((_DWORD *)v4 + 5))
      goto LABEL_62;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_psc != *((_DWORD *)v4 + 12))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 10))
      goto LABEL_62;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_hspa != *((_DWORD *)v4 + 6))
      goto LABEL_62;
    v8 = 1;
  }
  else
  {
    v8 = (v7 & 8) == 0;
  }
LABEL_63:

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
  uint64_t v14;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_subsId;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_numSubs;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_mcc;
    if ((has & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_mnc;
    if ((has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_lac;
    if ((has & 2) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_cellId;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_wcdmaBand;
    if ((has & 4) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_dlUarfcn;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_psc;
    if ((has & 0x80) != 0)
      goto LABEL_12;
LABEL_24:
    v13 = 0;
    if ((has & 8) != 0)
      goto LABEL_13;
LABEL_25:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  v12 = 0;
  if ((has & 0x80) == 0)
    goto LABEL_24;
LABEL_12:
  v13 = 2654435761 * self->_numMncDigits;
  if ((has & 8) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761 * self->_hspa;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 30);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_subsId = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_numSubs = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_mcc = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_mnc = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_lac = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_cellId = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_wcdmaBand = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_dlUarfcn = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0)
      goto LABEL_12;
LABEL_25:
    self->_numMncDigits = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x80u;
    if ((*((_WORD *)v4 + 30) & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  self->_psc = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x80) != 0)
    goto LABEL_25;
LABEL_12:
  if ((v5 & 8) != 0)
  {
LABEL_13:
    self->_hspa = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_14:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
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

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

@end
