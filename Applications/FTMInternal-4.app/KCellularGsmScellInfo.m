@implementation KCellularGsmScellInfo

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

- (void)setMcc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMcc
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMnc
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLac
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCellId
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)gsmBand
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_gsmBand;
  else
    return 0;
}

- (void)setGsmBand:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_gsmBand = a3;
}

- (void)setHasGsmBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGsmBand
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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

- (void)setArfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasArfcn
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBsic:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_bsic = a3;
}

- (void)setHasBsic:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBsic
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)state
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_state;
  else
    return 1;
}

- (void)setState:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)stateAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("DEDICATED_STATE");
  if (a3 == 2)
    v3 = CFSTR("NON_DEDICATED_STATE");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEDICATED_STATE")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("NON_DEDICATED_STATE")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumMncDigits
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularGsmScellInfo;
  v3 = -[KCellularGsmScellInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularGsmScellInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  __CFString *v12;
  void *v13;
  void *v14;
  int state;
  __CFString *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("mcc"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("mnc"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("lac"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("cell_id"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_99;
  }
LABEL_19:
  v12 = CFSTR("SYS_BAND_BC0");
  switch(self->_gsmBand)
  {
    case 0:
      break;
    case 1:
      v12 = CFSTR("SYS_BAND_BC1");
      break;
    case 3:
      v12 = CFSTR("SYS_BAND_BC3");
      break;
    case 4:
      v12 = CFSTR("SYS_BAND_BC4");
      break;
    case 5:
      v12 = CFSTR("SYS_BAND_BC5");
      break;
    case 6:
      v12 = CFSTR("SYS_BAND_BC6");
      break;
    case 7:
      v12 = CFSTR("SYS_BAND_BC7");
      break;
    case 8:
      v12 = CFSTR("SYS_BAND_BC8");
      break;
    case 9:
      v12 = CFSTR("SYS_BAND_BC9");
      break;
    case 0xA:
      v12 = CFSTR("SYS_BAND_BC10");
      break;
    case 0xB:
      v12 = CFSTR("SYS_BAND_BC11");
      break;
    case 0xC:
      v12 = CFSTR("SYS_BAND_BC12");
      break;
    case 0xD:
      v12 = CFSTR("SYS_BAND_BC13");
      break;
    case 0xE:
      v12 = CFSTR("SYS_BAND_BC14");
      break;
    case 0xF:
      v12 = CFSTR("SYS_BAND_BC15");
      break;
    case 0x10:
      v12 = CFSTR("SYS_BAND_BC16");
      break;
    case 0x11:
      v12 = CFSTR("SYS_BAND_BC17");
      break;
    case 0x12:
      v12 = CFSTR("SYS_BAND_BC18");
      break;
    case 0x13:
      v12 = CFSTR("SYS_BAND_BC19");
      break;
    case 0x28:
      v12 = CFSTR("SYS_BAND_GSM_450");
      break;
    case 0x29:
      v12 = CFSTR("SYS_BAND_GSM_480");
      break;
    case 0x2A:
      v12 = CFSTR("SYS_BAND_GSM_750");
      break;
    case 0x2B:
      v12 = CFSTR("SYS_BAND_GSM_850");
      break;
    case 0x2C:
      v12 = CFSTR("SYS_BAND_GSM_EGSM_900");
      break;
    case 0x2D:
      v12 = CFSTR("SYS_BAND_GSM_PGSM_900");
      break;
    case 0x2E:
      v12 = CFSTR("SYS_BAND_GSM_RGSM_900");
      break;
    case 0x2F:
      v12 = CFSTR("SYS_BAND_GSM_DCS_1800");
      break;
    case 0x30:
      v12 = CFSTR("SYS_BAND_GSM_PCS_1900");
      break;
    case 0x50:
      v12 = CFSTR("SYS_BAND_WCDMA_I_IMT_2000");
      break;
    case 0x51:
      v12 = CFSTR("SYS_BAND_WCDMA_II_PCS_1900");
      break;
    case 0x52:
      v12 = CFSTR("SYS_BAND_WCDMA_III_1700");
      break;
    case 0x53:
      v12 = CFSTR("SYS_BAND_WCDMA_IV_1700");
      break;
    case 0x54:
      v12 = CFSTR("SYS_BAND_WCDMA_V_850");
      break;
    case 0x55:
      v12 = CFSTR("SYS_BAND_WCDMA_VI_800");
      break;
    case 0x56:
      v12 = CFSTR("SYS_BAND_WCDMA_VII_2600");
      break;
    case 0x57:
      v12 = CFSTR("SYS_BAND_WCDMA_VIII_900");
      break;
    case 0x58:
      v12 = CFSTR("SYS_BAND_WCDMA_IX_1700");
      break;
    case 0x5A:
      v12 = CFSTR("SYS_BAND_WCDMA_XI_1500");
      break;
    case 0x5B:
      v12 = CFSTR("SYS_BAND_WCDMA_XIX_850");
      break;
    case 0x78:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND1");
      break;
    case 0x79:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND2");
      break;
    case 0x7A:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND3");
      break;
    case 0x7B:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND4");
      break;
    case 0x7C:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND5");
      break;
    case 0x7D:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND6");
      break;
    case 0x7E:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND7");
      break;
    case 0x7F:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND8");
      break;
    case 0x80:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND9");
      break;
    case 0x81:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND10");
      break;
    case 0x82:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND11");
      break;
    case 0x83:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND12");
      break;
    case 0x84:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND13");
      break;
    case 0x85:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND14");
      break;
    case 0x88:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND17");
      break;
    case 0x89:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND18");
      break;
    case 0x8A:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND19");
      break;
    case 0x8B:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND20");
      break;
    case 0x8C:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND21");
      break;
    case 0x8F:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND24");
      break;
    case 0x90:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND25");
      break;
    case 0x91:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND26");
      break;
    case 0x98:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND33");
      break;
    case 0x99:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND34");
      break;
    case 0x9A:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND35");
      break;
    case 0x9B:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND36");
      break;
    case 0x9C:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND37");
      break;
    case 0x9D:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND38");
      break;
    case 0x9E:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND39");
      break;
    case 0x9F:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND40");
      break;
    case 0xA0:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND41");
      break;
    case 0xA1:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND42");
      break;
    case 0xA2:
      v12 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND43");
      break;
    case 0xA3:
      v12 = CFSTR("SYS_BAND_UMTS_BAND1");
      break;
    case 0xA4:
      v12 = CFSTR("SYS_BAND_UMTS_BAND2");
      break;
    case 0xA5:
      v12 = CFSTR("SYS_BAND_UMTS_BAND3");
      break;
    case 0xA6:
      v12 = CFSTR("SYS_BAND_UMTS_BAND4");
      break;
    case 0xA7:
      v12 = CFSTR("SYS_BAND_UMTS_BAND5");
      break;
    case 0xA8:
      v12 = CFSTR("SYS_BAND_UMTS_BAND6");
      break;
    default:
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_gsmBand));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("gsm_band"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_100;
  }
LABEL_99:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_arfcn));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("arfcn"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_101;
  }
LABEL_100:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_bsic));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("bsic"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
LABEL_107:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("num_mnc_digits"));

    if ((*(_WORD *)&self->_has & 0x400) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_101:
  state = self->_state;
  if (state == 1)
  {
    v16 = CFSTR("DEDICATED_STATE");
  }
  else if (state == 2)
  {
    v16 = CFSTR("NON_DEDICATED_STATE");
  }
  else
  {
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_state));
  }
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("state"));

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_107;
LABEL_11:
  if ((has & 0x400) != 0)
  {
LABEL_12:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000E146C((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_mcc, 4);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field(v5, self->_mnc, 5);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field(v5, self->_lac, 6);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field(v5, self->_cellId, 7);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field(v5, self->_gsmBand, 8);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(v5, self->_arfcn, 9);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field(v5, self->_bsic, 10);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
LABEL_23:
    PBDataWriterWriteUint32Field(v5, self->_numMncDigits, 13);
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  PBDataWriterWriteInt32Field(v5, self->_state, 11);
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x400) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);
LABEL_13:

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
    *((_WORD *)v4 + 28) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_mcc;
  *((_WORD *)v4 + 28) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 10) = self->_mnc;
  *((_WORD *)v4 + 28) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 8) = self->_lac;
  *((_WORD *)v4 + 28) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 6) = self->_cellId;
  *((_WORD *)v4 + 28) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 7) = self->_gsmBand;
  *((_WORD *)v4 + 28) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 4) = self->_arfcn;
  *((_WORD *)v4 + 28) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 5) = self->_bsic;
  *((_WORD *)v4 + 28) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
LABEL_23:
    *((_DWORD *)v4 + 11) = self->_numMncDigits;
    *((_WORD *)v4 + 28) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  *((_DWORD *)v4 + 12) = self->_state;
  *((_WORD *)v4 + 28) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x400) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 13) = self->_subsId;
    *((_WORD *)v4 + 28) |= 0x400u;
  }
LABEL_13:

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
    *((_WORD *)result + 28) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_mcc;
  *((_WORD *)result + 28) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 10) = self->_mnc;
  *((_WORD *)result + 28) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 8) = self->_lac;
  *((_WORD *)result + 28) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 6) = self->_cellId;
  *((_WORD *)result + 28) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_gsmBand;
  *((_WORD *)result + 28) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 4) = self->_arfcn;
  *((_WORD *)result + 28) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 5) = self->_bsic;
  *((_WORD *)result + 28) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 12) = self->_state;
  *((_WORD *)result + 28) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 11) = self->_numMncDigits;
  *((_WORD *)result + 28) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    return result;
LABEL_12:
  *((_DWORD *)result + 13) = self->_subsId;
  *((_WORD *)result + 28) |= 0x400u;
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
    goto LABEL_57;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 28);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_57;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_57:
    v8 = 0;
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_mcc != *((_DWORD *)v4 + 9))
      goto LABEL_57;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_mnc != *((_DWORD *)v4 + 10))
      goto LABEL_57;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_lac != *((_DWORD *)v4 + 8))
      goto LABEL_57;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_cellId != *((_DWORD *)v4 + 6))
      goto LABEL_57;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_gsmBand != *((_DWORD *)v4 + 7))
      goto LABEL_57;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_arfcn != *((_DWORD *)v4 + 4))
      goto LABEL_57;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_bsic != *((_DWORD *)v4 + 5))
      goto LABEL_57;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x200) == 0 || self->_state != *((_DWORD *)v4 + 12))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 28) & 0x200) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x100) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 11))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 28) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 13))
      goto LABEL_57;
    v8 = 1;
  }
  else
  {
    v8 = (v7 & 0x400) == 0;
  }
LABEL_58:

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

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_mcc;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_mnc;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_lac;
    if ((has & 8) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_cellId;
    if ((has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_gsmBand;
    if ((has & 2) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_arfcn;
    if ((has & 4) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_bsic;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_state;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761 * self->_numMncDigits;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 28);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_mcc = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_mnc = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_lac = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_cellId = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_gsmBand = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_arfcn = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_bsic = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
LABEL_23:
    self->_numMncDigits = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
    if ((*((_WORD *)v4 + 28) & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  self->_state = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x100) != 0)
    goto LABEL_23;
LABEL_11:
  if ((v5 & 0x400) != 0)
  {
LABEL_12:
    self->_subsId = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_13:

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

- (unsigned)arfcn
{
  return self->_arfcn;
}

- (unsigned)bsic
{
  return self->_bsic;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
