@implementation CellularWcdmaTxRxHist

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  PBRepeatedUInt32Clear(&self->_rxBins, a2);
  PBRepeatedUInt32Clear(&self->_secRxBins, v3);
  PBRepeatedUInt32Clear(&self->_txBins, v4);
  PBRepeatedUInt32Clear(&self->_rxBinsIdles, v5);
  PBRepeatedUInt32Clear(&self->_secRxBinsIdles, v6);
  PBRepeatedUInt32Clear(&self->_secTxBins, v7);
  PBRepeatedUInt32Clear(&self->_acTxBins, v8);
  PBRepeatedUInt32Clear(&self->_adTxBins, v9);
  v10.receiver = self;
  v10.super_class = (Class)CellularWcdmaTxRxHist;
  -[CellularWcdmaTxRxHist dealloc](&v10, "dealloc");
}

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

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDuration
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

- (void)setInVoiceCall:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_inVoiceCall = a3;
}

- (void)setHasInVoiceCall:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInVoiceCall
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)minRxLevelDbm
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_minRxLevelDbm;
  else
    return -121;
}

- (void)setMinRxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_minRxLevelDbm = a3;
}

- (void)setHasMinRxLevelDbm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMinRxLevelDbm
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (unint64_t)rxBinsCount
{
  return self->_rxBins.count;
}

- (unsigned)rxBins
{
  return self->_rxBins.list;
}

- (void)clearRxBins
{
  PBRepeatedUInt32Clear(&self->_rxBins, a2);
}

- (void)addRxBins:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rxBins, *(_QWORD *)&a3);
}

- (unsigned)rxBinsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rxBins;
  unint64_t count;
  void *v6;
  void *v7;

  p_rxBins = &self->_rxBins;
  count = self->_rxBins.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rxBins->list[a3];
}

- (void)setRxBins:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rxBins, a3, a4);
}

- (int)minSecRxLevelDbm
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_minSecRxLevelDbm;
  else
    return -121;
}

- (void)setMinSecRxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_minSecRxLevelDbm = a3;
}

- (void)setHasMinSecRxLevelDbm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMinSecRxLevelDbm
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (unint64_t)secRxBinsCount
{
  return self->_secRxBins.count;
}

- (unsigned)secRxBins
{
  return self->_secRxBins.list;
}

- (void)clearSecRxBins
{
  PBRepeatedUInt32Clear(&self->_secRxBins, a2);
}

- (void)addSecRxBins:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_secRxBins, *(_QWORD *)&a3);
}

- (unsigned)secRxBinsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_secRxBins;
  unint64_t count;
  void *v6;
  void *v7;

  p_secRxBins = &self->_secRxBins;
  count = self->_secRxBins.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_secRxBins->list[a3];
}

- (void)setSecRxBins:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_secRxBins, a3, a4);
}

- (int)minTxLevelDbm
{
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_minTxLevelDbm;
  else
    return -56;
}

- (void)setMinTxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_minTxLevelDbm = a3;
}

- (void)setHasMinTxLevelDbm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMinTxLevelDbm
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (unint64_t)txBinsCount
{
  return self->_txBins.count;
}

- (unsigned)txBins
{
  return self->_txBins.list;
}

- (void)clearTxBins
{
  PBRepeatedUInt32Clear(&self->_txBins, a2);
}

- (void)addTxBins:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_txBins, *(_QWORD *)&a3);
}

- (unsigned)txBinsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_txBins;
  unint64_t count;
  void *v6;
  void *v7;

  p_txBins = &self->_txBins;
  count = self->_txBins.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_txBins->list[a3];
}

- (void)setTxBins:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_txBins, a3, a4);
}

- (int)minRxLevelIdleDbm
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_minRxLevelIdleDbm;
  else
    return -121;
}

- (void)setMinRxLevelIdleDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_minRxLevelIdleDbm = a3;
}

- (void)setHasMinRxLevelIdleDbm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMinRxLevelIdleDbm
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)rxBinsIdlesCount
{
  return self->_rxBinsIdles.count;
}

- (unsigned)rxBinsIdles
{
  return self->_rxBinsIdles.list;
}

- (void)clearRxBinsIdles
{
  PBRepeatedUInt32Clear(&self->_rxBinsIdles, a2);
}

- (void)addRxBinsIdle:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rxBinsIdles, *(_QWORD *)&a3);
}

- (unsigned)rxBinsIdleAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rxBinsIdles;
  unint64_t count;
  void *v6;
  void *v7;

  p_rxBinsIdles = &self->_rxBinsIdles;
  count = self->_rxBinsIdles.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rxBinsIdles->list[a3];
}

- (void)setRxBinsIdles:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rxBinsIdles, a3, a4);
}

- (int)minSecRxLevelIdleDbm
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_minSecRxLevelIdleDbm;
  else
    return -121;
}

- (void)setMinSecRxLevelIdleDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_minSecRxLevelIdleDbm = a3;
}

- (void)setHasMinSecRxLevelIdleDbm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMinSecRxLevelIdleDbm
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (unint64_t)secRxBinsIdlesCount
{
  return self->_secRxBinsIdles.count;
}

- (unsigned)secRxBinsIdles
{
  return self->_secRxBinsIdles.list;
}

- (void)clearSecRxBinsIdles
{
  PBRepeatedUInt32Clear(&self->_secRxBinsIdles, a2);
}

- (void)addSecRxBinsIdle:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_secRxBinsIdles, *(_QWORD *)&a3);
}

- (unsigned)secRxBinsIdleAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_secRxBinsIdles;
  unint64_t count;
  void *v6;
  void *v7;

  p_secRxBinsIdles = &self->_secRxBinsIdles;
  count = self->_secRxBinsIdles.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_secRxBinsIdles->list[a3];
}

- (void)setSecRxBinsIdles:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_secRxBinsIdles, a3, a4);
}

- (int)minSecTxLevelDbm
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_minSecTxLevelDbm;
  else
    return -56;
}

- (void)setMinSecTxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_minSecTxLevelDbm = a3;
}

- (void)setHasMinSecTxLevelDbm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMinSecTxLevelDbm
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (unint64_t)secTxBinsCount
{
  return self->_secTxBins.count;
}

- (unsigned)secTxBins
{
  return self->_secTxBins.list;
}

- (void)clearSecTxBins
{
  PBRepeatedUInt32Clear(&self->_secTxBins, a2);
}

- (void)addSecTxBins:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_secTxBins, *(_QWORD *)&a3);
}

- (unsigned)secTxBinsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_secTxBins;
  unint64_t count;
  void *v6;
  void *v7;

  p_secTxBins = &self->_secTxBins;
  count = self->_secTxBins.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_secTxBins->list[a3];
}

- (void)setSecTxBins:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_secTxBins, a3, a4);
}

- (int)minAcTxLevelDbm
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_minAcTxLevelDbm;
  else
    return -56;
}

- (void)setMinAcTxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_minAcTxLevelDbm = a3;
}

- (void)setHasMinAcTxLevelDbm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMinAcTxLevelDbm
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (unint64_t)acTxBinsCount
{
  return self->_acTxBins.count;
}

- (unsigned)acTxBins
{
  return self->_acTxBins.list;
}

- (void)clearAcTxBins
{
  PBRepeatedUInt32Clear(&self->_acTxBins, a2);
}

- (void)addAcTxBins:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_acTxBins, *(_QWORD *)&a3);
}

- (unsigned)acTxBinsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_acTxBins;
  unint64_t count;
  void *v6;
  void *v7;

  p_acTxBins = &self->_acTxBins;
  count = self->_acTxBins.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_acTxBins->list[a3];
}

- (void)setAcTxBins:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_acTxBins, a3, a4);
}

- (int)minAdTxLevelDbm
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_minAdTxLevelDbm;
  else
    return -56;
}

- (void)setMinAdTxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_minAdTxLevelDbm = a3;
}

- (void)setHasMinAdTxLevelDbm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMinAdTxLevelDbm
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (unint64_t)adTxBinsCount
{
  return self->_adTxBins.count;
}

- (unsigned)adTxBins
{
  return self->_adTxBins.list;
}

- (void)clearAdTxBins
{
  PBRepeatedUInt32Clear(&self->_adTxBins, a2);
}

- (void)addAdTxBins:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_adTxBins, *(_QWORD *)&a3);
}

- (unsigned)adTxBinsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_adTxBins;
  unint64_t count;
  void *v6;
  void *v7;

  p_adTxBins = &self->_adTxBins;
  count = self->_adTxBins.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_adTxBins->list[a3];
}

- (void)setAdTxBins:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_adTxBins, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularWcdmaTxRxHist;
  v3 = -[CellularWcdmaTxRxHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularWcdmaTxRxHist dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_duration));
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("duration"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_104;
  }
LABEL_24:
  v32 = CFSTR("SYS_BAND_BC0");
  switch(self->_wcdmaBand)
  {
    case 0:
      break;
    case 1:
      v32 = CFSTR("SYS_BAND_BC1");
      break;
    case 3:
      v32 = CFSTR("SYS_BAND_BC3");
      break;
    case 4:
      v32 = CFSTR("SYS_BAND_BC4");
      break;
    case 5:
      v32 = CFSTR("SYS_BAND_BC5");
      break;
    case 6:
      v32 = CFSTR("SYS_BAND_BC6");
      break;
    case 7:
      v32 = CFSTR("SYS_BAND_BC7");
      break;
    case 8:
      v32 = CFSTR("SYS_BAND_BC8");
      break;
    case 9:
      v32 = CFSTR("SYS_BAND_BC9");
      break;
    case 0xA:
      v32 = CFSTR("SYS_BAND_BC10");
      break;
    case 0xB:
      v32 = CFSTR("SYS_BAND_BC11");
      break;
    case 0xC:
      v32 = CFSTR("SYS_BAND_BC12");
      break;
    case 0xD:
      v32 = CFSTR("SYS_BAND_BC13");
      break;
    case 0xE:
      v32 = CFSTR("SYS_BAND_BC14");
      break;
    case 0xF:
      v32 = CFSTR("SYS_BAND_BC15");
      break;
    case 0x10:
      v32 = CFSTR("SYS_BAND_BC16");
      break;
    case 0x11:
      v32 = CFSTR("SYS_BAND_BC17");
      break;
    case 0x12:
      v32 = CFSTR("SYS_BAND_BC18");
      break;
    case 0x13:
      v32 = CFSTR("SYS_BAND_BC19");
      break;
    case 0x28:
      v32 = CFSTR("SYS_BAND_GSM_450");
      break;
    case 0x29:
      v32 = CFSTR("SYS_BAND_GSM_480");
      break;
    case 0x2A:
      v32 = CFSTR("SYS_BAND_GSM_750");
      break;
    case 0x2B:
      v32 = CFSTR("SYS_BAND_GSM_850");
      break;
    case 0x2C:
      v32 = CFSTR("SYS_BAND_GSM_EGSM_900");
      break;
    case 0x2D:
      v32 = CFSTR("SYS_BAND_GSM_PGSM_900");
      break;
    case 0x2E:
      v32 = CFSTR("SYS_BAND_GSM_RGSM_900");
      break;
    case 0x2F:
      v32 = CFSTR("SYS_BAND_GSM_DCS_1800");
      break;
    case 0x30:
      v32 = CFSTR("SYS_BAND_GSM_PCS_1900");
      break;
    case 0x50:
      v32 = CFSTR("SYS_BAND_WCDMA_I_IMT_2000");
      break;
    case 0x51:
      v32 = CFSTR("SYS_BAND_WCDMA_II_PCS_1900");
      break;
    case 0x52:
      v32 = CFSTR("SYS_BAND_WCDMA_III_1700");
      break;
    case 0x53:
      v32 = CFSTR("SYS_BAND_WCDMA_IV_1700");
      break;
    case 0x54:
      v32 = CFSTR("SYS_BAND_WCDMA_V_850");
      break;
    case 0x55:
      v32 = CFSTR("SYS_BAND_WCDMA_VI_800");
      break;
    case 0x56:
      v32 = CFSTR("SYS_BAND_WCDMA_VII_2600");
      break;
    case 0x57:
      v32 = CFSTR("SYS_BAND_WCDMA_VIII_900");
      break;
    case 0x58:
      v32 = CFSTR("SYS_BAND_WCDMA_IX_1700");
      break;
    case 0x5A:
      v32 = CFSTR("SYS_BAND_WCDMA_XI_1500");
      break;
    case 0x5B:
      v32 = CFSTR("SYS_BAND_WCDMA_XIX_850");
      break;
    case 0x78:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND1");
      break;
    case 0x79:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND2");
      break;
    case 0x7A:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND3");
      break;
    case 0x7B:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND4");
      break;
    case 0x7C:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND5");
      break;
    case 0x7D:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND6");
      break;
    case 0x7E:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND7");
      break;
    case 0x7F:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND8");
      break;
    case 0x80:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND9");
      break;
    case 0x81:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND10");
      break;
    case 0x82:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND11");
      break;
    case 0x83:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND12");
      break;
    case 0x84:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND13");
      break;
    case 0x85:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND14");
      break;
    case 0x88:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND17");
      break;
    case 0x89:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND18");
      break;
    case 0x8A:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND19");
      break;
    case 0x8B:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND20");
      break;
    case 0x8C:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND21");
      break;
    case 0x8F:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND24");
      break;
    case 0x90:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND25");
      break;
    case 0x91:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND26");
      break;
    case 0x98:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND33");
      break;
    case 0x99:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND34");
      break;
    case 0x9A:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND35");
      break;
    case 0x9B:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND36");
      break;
    case 0x9C:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND37");
      break;
    case 0x9D:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND38");
      break;
    case 0x9E:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND39");
      break;
    case 0x9F:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND40");
      break;
    case 0xA0:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND41");
      break;
    case 0xA1:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND42");
      break;
    case 0xA2:
      v32 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND43");
      break;
    case 0xA3:
      v32 = CFSTR("SYS_BAND_UMTS_BAND1");
      break;
    case 0xA4:
      v32 = CFSTR("SYS_BAND_UMTS_BAND2");
      break;
    case 0xA5:
      v32 = CFSTR("SYS_BAND_UMTS_BAND3");
      break;
    case 0xA6:
      v32 = CFSTR("SYS_BAND_UMTS_BAND4");
      break;
    case 0xA7:
      v32 = CFSTR("SYS_BAND_UMTS_BAND5");
      break;
    case 0xA8:
      v32 = CFSTR("SYS_BAND_UMTS_BAND6");
      break;
    default:
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_wcdmaBand));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("wcdma_band"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_104:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_inVoiceCall));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("in_voice_call"));

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minRxLevelDbm));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("min_rx_level_dbm"));

  }
LABEL_7:
  v6 = PBRepeatedUInt32NSArray(&self->_rxBins);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rx_bins"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minSecRxLevelDbm));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("min_sec_rx_level_dbm"));

  }
  v9 = PBRepeatedUInt32NSArray(&self->_secRxBins);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sec_rx_bins"));

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minTxLevelDbm));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("min_tx_level_dbm"));

  }
  v12 = PBRepeatedUInt32NSArray(&self->_txBins);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("tx_bins"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minRxLevelIdleDbm));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("min_rx_level_idle_dbm"));

  }
  v15 = PBRepeatedUInt32NSArray(&self->_rxBinsIdles);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("rx_bins_idle"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minSecRxLevelIdleDbm));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("min_sec_rx_level_idle_dbm"));

  }
  v18 = PBRepeatedUInt32NSArray(&self->_secRxBinsIdles);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("sec_rx_bins_idle"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minSecTxLevelDbm));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("min_sec_tx_level_dbm"));

  }
  v21 = PBRepeatedUInt32NSArray(&self->_secTxBins);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("sec_tx_bins"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minAcTxLevelDbm));
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("min_ac_tx_level_dbm"));

  }
  v24 = PBRepeatedUInt32NSArray(&self->_acTxBins);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("ac_tx_bins"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minAdTxLevelDbm));
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("min_ad_tx_level_dbm"));

  }
  v27 = PBRepeatedUInt32NSArray(&self->_adTxBins);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("ad_tx_bins"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000562E0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  __int16 has;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_adTxBins;
  unint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_64;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_duration, 2);
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt32Field(v5, self->_wcdmaBand, 3);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_65:
  PBDataWriterWriteUint32Field(v5, self->_inVoiceCall, 4);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_6:
    PBDataWriterWriteSint32Field(v5, self->_minRxLevelDbm, 5);
LABEL_7:
  if (self->_rxBins.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 6);
    if (self->_rxBins.count)
    {
      v7 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rxBins.list[v7++], 0xFFFFFFFFLL);
      while (v7 < self->_rxBins.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteSint32Field(v5, self->_minSecRxLevelDbm, 7);
  if (self->_secRxBins.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 8);
    if (self->_secRxBins.count)
    {
      v8 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_secRxBins.list[v8++], 0xFFFFFFFFLL);
      while (v8 < self->_secRxBins.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteSint32Field(v5, self->_minTxLevelDbm, 9);
  if (self->_txBins.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 10);
    if (self->_txBins.count)
    {
      v9 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_txBins.list[v9++], 0xFFFFFFFFLL);
      while (v9 < self->_txBins.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    PBDataWriterWriteSint32Field(v5, self->_minRxLevelIdleDbm, 11);
  if (self->_rxBinsIdles.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 12);
    if (self->_rxBinsIdles.count)
    {
      v10 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rxBinsIdles.list[v10++], 0xFFFFFFFFLL);
      while (v10 < self->_rxBinsIdles.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteSint32Field(v5, self->_minSecRxLevelIdleDbm, 13);
  if (self->_secRxBinsIdles.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 14);
    if (self->_secRxBinsIdles.count)
    {
      v11 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_secRxBinsIdles.list[v11++], 0xFFFFFFFFLL);
      while (v11 < self->_secRxBinsIdles.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    PBDataWriterWriteSint32Field(v5, self->_minSecTxLevelDbm, 15);
  if (self->_secTxBins.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 16);
    if (self->_secTxBins.count)
    {
      v12 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_secTxBins.list[v12++], 0xFFFFFFFFLL);
      while (v12 < self->_secTxBins.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
    PBDataWriterWriteSint32Field(v5, self->_minAcTxLevelDbm, 19);
  if (self->_acTxBins.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 20);
    if (self->_acTxBins.count)
    {
      v13 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_acTxBins.list[v13++], 0xFFFFFFFFLL);
      while (v13 < self->_acTxBins.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    PBDataWriterWriteSint32Field(v5, self->_minAdTxLevelDbm, 21);
  p_adTxBins = &self->_adTxBins;
  if (p_adTxBins->count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 22);
    if (p_adTxBins->count)
    {
      v15 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_adTxBins->list[v15++], 0xFFFFFFFFLL);
      while (v15 < p_adTxBins->count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  unint64_t v18;
  unint64_t v19;
  uint64_t n;
  unint64_t v21;
  unint64_t v22;
  uint64_t ii;
  unint64_t v24;
  unint64_t v25;
  uint64_t jj;
  unint64_t v27;
  unint64_t v28;
  uint64_t kk;
  id v30;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[25] = self->_timestamp;
    *((_WORD *)v4 + 126) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_56;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 52) = self->_duration;
  *((_WORD *)v4 + 126) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_57:
    *((_DWORD *)v4 + 53) = self->_inVoiceCall;
    *((_WORD *)v4 + 126) |= 4u;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_56:
  *((_DWORD *)v4 + 62) = self->_wcdmaBand;
  *((_WORD *)v4 + 126) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_57;
LABEL_5:
  if ((has & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 56) = self->_minRxLevelDbm;
    *((_WORD *)v4 + 126) |= 0x20u;
  }
LABEL_7:
  v30 = v4;
  if (-[CellularWcdmaTxRxHist rxBinsCount](self, "rxBinsCount"))
  {
    objc_msgSend(v30, "clearRxBins");
    v6 = -[CellularWcdmaTxRxHist rxBinsCount](self, "rxBinsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v30, "addRxBins:", -[CellularWcdmaTxRxHist rxBinsAtIndex:](self, "rxBinsAtIndex:", i));
    }
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v30 + 58) = self->_minSecRxLevelDbm;
    *((_WORD *)v30 + 126) |= 0x80u;
  }
  if (-[CellularWcdmaTxRxHist secRxBinsCount](self, "secRxBinsCount"))
  {
    objc_msgSend(v30, "clearSecRxBins");
    v9 = -[CellularWcdmaTxRxHist secRxBinsCount](self, "secRxBinsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v30, "addSecRxBins:", -[CellularWcdmaTxRxHist secRxBinsAtIndex:](self, "secRxBinsAtIndex:", j));
    }
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v30 + 61) = self->_minTxLevelDbm;
    *((_WORD *)v30 + 126) |= 0x400u;
  }
  if (-[CellularWcdmaTxRxHist txBinsCount](self, "txBinsCount"))
  {
    objc_msgSend(v30, "clearTxBins");
    v12 = -[CellularWcdmaTxRxHist txBinsCount](self, "txBinsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(v30, "addTxBins:", -[CellularWcdmaTxRxHist txBinsAtIndex:](self, "txBinsAtIndex:", k));
    }
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v30 + 57) = self->_minRxLevelIdleDbm;
    *((_WORD *)v30 + 126) |= 0x40u;
  }
  if (-[CellularWcdmaTxRxHist rxBinsIdlesCount](self, "rxBinsIdlesCount"))
  {
    objc_msgSend(v30, "clearRxBinsIdles");
    v15 = -[CellularWcdmaTxRxHist rxBinsIdlesCount](self, "rxBinsIdlesCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(v30, "addRxBinsIdle:", -[CellularWcdmaTxRxHist rxBinsIdleAtIndex:](self, "rxBinsIdleAtIndex:", m));
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)v30 + 59) = self->_minSecRxLevelIdleDbm;
    *((_WORD *)v30 + 126) |= 0x100u;
  }
  if (-[CellularWcdmaTxRxHist secRxBinsIdlesCount](self, "secRxBinsIdlesCount"))
  {
    objc_msgSend(v30, "clearSecRxBinsIdles");
    v18 = -[CellularWcdmaTxRxHist secRxBinsIdlesCount](self, "secRxBinsIdlesCount");
    if (v18)
    {
      v19 = v18;
      for (n = 0; n != v19; ++n)
        objc_msgSend(v30, "addSecRxBinsIdle:", -[CellularWcdmaTxRxHist secRxBinsIdleAtIndex:](self, "secRxBinsIdleAtIndex:", n));
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v30 + 60) = self->_minSecTxLevelDbm;
    *((_WORD *)v30 + 126) |= 0x200u;
  }
  if (-[CellularWcdmaTxRxHist secTxBinsCount](self, "secTxBinsCount"))
  {
    objc_msgSend(v30, "clearSecTxBins");
    v21 = -[CellularWcdmaTxRxHist secTxBinsCount](self, "secTxBinsCount");
    if (v21)
    {
      v22 = v21;
      for (ii = 0; ii != v22; ++ii)
        objc_msgSend(v30, "addSecTxBins:", -[CellularWcdmaTxRxHist secTxBinsAtIndex:](self, "secTxBinsAtIndex:", ii));
    }
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v30 + 54) = self->_minAcTxLevelDbm;
    *((_WORD *)v30 + 126) |= 8u;
  }
  if (-[CellularWcdmaTxRxHist acTxBinsCount](self, "acTxBinsCount"))
  {
    objc_msgSend(v30, "clearAcTxBins");
    v24 = -[CellularWcdmaTxRxHist acTxBinsCount](self, "acTxBinsCount");
    if (v24)
    {
      v25 = v24;
      for (jj = 0; jj != v25; ++jj)
        objc_msgSend(v30, "addAcTxBins:", -[CellularWcdmaTxRxHist acTxBinsAtIndex:](self, "acTxBinsAtIndex:", jj));
    }
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v30 + 55) = self->_minAdTxLevelDbm;
    *((_WORD *)v30 + 126) |= 0x10u;
  }
  if (-[CellularWcdmaTxRxHist adTxBinsCount](self, "adTxBinsCount"))
  {
    objc_msgSend(v30, "clearAdTxBins");
    v27 = -[CellularWcdmaTxRxHist adTxBinsCount](self, "adTxBinsCount");
    if (v27)
    {
      v28 = v27;
      for (kk = 0; kk != v28; ++kk)
        objc_msgSend(v30, "addAdTxBins:", -[CellularWcdmaTxRxHist adTxBinsAtIndex:](self, "adTxBinsAtIndex:", kk));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _DWORD *v5;
  __int16 has;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[25] = self->_timestamp;
    *((_WORD *)v4 + 126) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 52) = self->_duration;
  *((_WORD *)v4 + 126) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 62) = self->_wcdmaBand;
  *((_WORD *)v4 + 126) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_25:
  *((_DWORD *)v4 + 53) = self->_inVoiceCall;
  *((_WORD *)v4 + 126) |= 4u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 56) = self->_minRxLevelDbm;
    *((_WORD *)v4 + 126) |= 0x20u;
  }
LABEL_7:
  PBRepeatedUInt32Copy(v4 + 7, &self->_rxBins);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v5[58] = self->_minSecRxLevelDbm;
    *((_WORD *)v5 + 126) |= 0x80u;
  }
  PBRepeatedUInt32Copy(v5 + 26, &self->_secRxBins);
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v5[61] = self->_minTxLevelDbm;
    *((_WORD *)v5 + 126) |= 0x400u;
  }
  PBRepeatedUInt32Copy(v5 + 44, &self->_txBins);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v5[57] = self->_minRxLevelIdleDbm;
    *((_WORD *)v5 + 126) |= 0x40u;
  }
  PBRepeatedUInt32Copy(v5 + 20, &self->_rxBinsIdles);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v5[59] = self->_minSecRxLevelIdleDbm;
    *((_WORD *)v5 + 126) |= 0x100u;
  }
  PBRepeatedUInt32Copy(v5 + 32, &self->_secRxBinsIdles);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v5[60] = self->_minSecTxLevelDbm;
    *((_WORD *)v5 + 126) |= 0x200u;
  }
  PBRepeatedUInt32Copy(v5 + 38, &self->_secTxBins);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v5[54] = self->_minAcTxLevelDbm;
    *((_WORD *)v5 + 126) |= 8u;
  }
  PBRepeatedUInt32Copy(v5 + 2, &self->_acTxBins);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v5[55] = self->_minAdTxLevelDbm;
    *((_WORD *)v5 + 126) |= 0x10u;
  }
  PBRepeatedUInt32Copy(v5 + 8, &self->_adTxBins);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_70;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 126);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 25))
      goto LABEL_70;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_70;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_duration != *((_DWORD *)v4 + 52))
      goto LABEL_70;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x800) == 0 || self->_wcdmaBand != *((_DWORD *)v4 + 62))
      goto LABEL_70;
  }
  else if ((*((_WORD *)v4 + 126) & 0x800) != 0)
  {
    goto LABEL_70;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_inVoiceCall != *((_DWORD *)v4 + 53))
      goto LABEL_70;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_70;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_minRxLevelDbm != *((_DWORD *)v4 + 56))
      goto LABEL_70;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rxBins, v4 + 56))
    goto LABEL_70;
  v8 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_minSecRxLevelDbm != *((_DWORD *)v4 + 58))
      goto LABEL_70;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_secRxBins, v4 + 104))
    goto LABEL_70;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x400) == 0 || self->_minTxLevelDbm != *((_DWORD *)v4 + 61))
      goto LABEL_70;
  }
  else if ((*((_WORD *)v4 + 126) & 0x400) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_txBins, v4 + 176))
    goto LABEL_70;
  v9 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_minRxLevelIdleDbm != *((_DWORD *)v4 + 57))
      goto LABEL_70;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rxBinsIdles, v4 + 80))
    goto LABEL_70;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x100) == 0 || self->_minSecRxLevelIdleDbm != *((_DWORD *)v4 + 59))
      goto LABEL_70;
  }
  else if ((*((_WORD *)v4 + 126) & 0x100) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_secRxBinsIdles, v4 + 128))
    goto LABEL_70;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x200) == 0 || self->_minSecTxLevelDbm != *((_DWORD *)v4 + 60))
      goto LABEL_70;
  }
  else if ((*((_WORD *)v4 + 126) & 0x200) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_secTxBins, v4 + 152))
    goto LABEL_70;
  v10 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_minAcTxLevelDbm != *((_DWORD *)v4 + 54))
      goto LABEL_70;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_acTxBins, v4 + 8))
  {
LABEL_70:
    IsEqual = 0;
    goto LABEL_71;
  }
  v11 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_minAdTxLevelDbm != *((_DWORD *)v4 + 55))
      goto LABEL_70;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_70;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_adTxBins, v4 + 32);
LABEL_71:

  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v23 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      v22 = 2654435761 * self->_duration;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v23 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v22 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    v21 = 2654435761 * self->_wcdmaBand;
    if ((has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v20 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v21 = 0;
  if ((has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v20 = 2654435761 * self->_inVoiceCall;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v19 = 2654435761 * self->_minRxLevelDbm;
    goto LABEL_12;
  }
LABEL_11:
  v19 = 0;
LABEL_12:
  v18 = PBRepeatedUInt32Hash(&self->_rxBins);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v17 = 2654435761 * self->_minSecRxLevelDbm;
  else
    v17 = 0;
  v16 = PBRepeatedUInt32Hash(&self->_secRxBins);
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v15 = 2654435761 * self->_minTxLevelDbm;
  else
    v15 = 0;
  v14 = PBRepeatedUInt32Hash(&self->_txBins);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v4 = 2654435761 * self->_minRxLevelIdleDbm;
  else
    v4 = 0;
  v5 = PBRepeatedUInt32Hash(&self->_rxBinsIdles);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v6 = 2654435761 * self->_minSecRxLevelIdleDbm;
  else
    v6 = 0;
  v7 = PBRepeatedUInt32Hash(&self->_secRxBinsIdles);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    v8 = 2654435761 * self->_minSecTxLevelDbm;
  else
    v8 = 0;
  v9 = PBRepeatedUInt32Hash(&self->_secTxBins);
  if ((*(_WORD *)&self->_has & 8) != 0)
    v10 = 2654435761 * self->_minAcTxLevelDbm;
  else
    v10 = 0;
  v11 = PBRepeatedUInt32Hash(&self->_acTxBins);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    v12 = 2654435761 * self->_minAdTxLevelDbm;
  else
    v12 = 0;
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ PBRepeatedUInt32Hash(&self->_adTxBins);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  char *v6;
  char *v7;
  char *i;
  char *v9;
  char *v10;
  char *j;
  char *v12;
  char *v13;
  char *k;
  char *v15;
  char *v16;
  char *m;
  char *v18;
  char *v19;
  char *n;
  char *v21;
  char *v22;
  char *ii;
  char *v24;
  char *v25;
  char *jj;
  char *v27;
  char *v28;
  char *kk;
  int *v30;

  v4 = a3;
  v5 = *((_WORD *)v4 + 126);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 25);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 126);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_48;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 52);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 126);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_49;
  }
LABEL_48:
  self->_wcdmaBand = *((_DWORD *)v4 + 62);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 126);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_49:
  self->_inVoiceCall = *((_DWORD *)v4 + 53);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 126) & 0x20) != 0)
  {
LABEL_6:
    self->_minRxLevelDbm = *((_DWORD *)v4 + 56);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_7:
  v30 = (int *)v4;
  v6 = (char *)objc_msgSend(v4, "rxBinsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[CellularWcdmaTxRxHist addRxBins:](self, "addRxBins:", objc_msgSend(v30, "rxBinsAtIndex:", i));
  }
  if ((v30[63] & 0x80) != 0)
  {
    self->_minSecRxLevelDbm = v30[58];
    *(_WORD *)&self->_has |= 0x80u;
  }
  v9 = (char *)objc_msgSend(v30, "secRxBinsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[CellularWcdmaTxRxHist addSecRxBins:](self, "addSecRxBins:", objc_msgSend(v30, "secRxBinsAtIndex:", j));
  }
  if ((v30[63] & 0x400) != 0)
  {
    self->_minTxLevelDbm = v30[61];
    *(_WORD *)&self->_has |= 0x400u;
  }
  v12 = (char *)objc_msgSend(v30, "txBinsCount");
  if (v12)
  {
    v13 = v12;
    for (k = 0; k != v13; ++k)
      -[CellularWcdmaTxRxHist addTxBins:](self, "addTxBins:", objc_msgSend(v30, "txBinsAtIndex:", k));
  }
  if ((v30[63] & 0x40) != 0)
  {
    self->_minRxLevelIdleDbm = v30[57];
    *(_WORD *)&self->_has |= 0x40u;
  }
  v15 = (char *)objc_msgSend(v30, "rxBinsIdlesCount");
  if (v15)
  {
    v16 = v15;
    for (m = 0; m != v16; ++m)
      -[CellularWcdmaTxRxHist addRxBinsIdle:](self, "addRxBinsIdle:", objc_msgSend(v30, "rxBinsIdleAtIndex:", m));
  }
  if ((v30[63] & 0x100) != 0)
  {
    self->_minSecRxLevelIdleDbm = v30[59];
    *(_WORD *)&self->_has |= 0x100u;
  }
  v18 = (char *)objc_msgSend(v30, "secRxBinsIdlesCount");
  if (v18)
  {
    v19 = v18;
    for (n = 0; n != v19; ++n)
      -[CellularWcdmaTxRxHist addSecRxBinsIdle:](self, "addSecRxBinsIdle:", objc_msgSend(v30, "secRxBinsIdleAtIndex:", n));
  }
  if ((v30[63] & 0x200) != 0)
  {
    self->_minSecTxLevelDbm = v30[60];
    *(_WORD *)&self->_has |= 0x200u;
  }
  v21 = (char *)objc_msgSend(v30, "secTxBinsCount");
  if (v21)
  {
    v22 = v21;
    for (ii = 0; ii != v22; ++ii)
      -[CellularWcdmaTxRxHist addSecTxBins:](self, "addSecTxBins:", objc_msgSend(v30, "secTxBinsAtIndex:", ii));
  }
  if ((v30[63] & 8) != 0)
  {
    self->_minAcTxLevelDbm = v30[54];
    *(_WORD *)&self->_has |= 8u;
  }
  v24 = (char *)objc_msgSend(v30, "acTxBinsCount");
  if (v24)
  {
    v25 = v24;
    for (jj = 0; jj != v25; ++jj)
      -[CellularWcdmaTxRxHist addAcTxBins:](self, "addAcTxBins:", objc_msgSend(v30, "acTxBinsAtIndex:", jj));
  }
  if ((v30[63] & 0x10) != 0)
  {
    self->_minAdTxLevelDbm = v30[55];
    *(_WORD *)&self->_has |= 0x10u;
  }
  v27 = (char *)objc_msgSend(v30, "adTxBinsCount");
  if (v27)
  {
    v28 = v27;
    for (kk = 0; kk != v28; ++kk)
      -[CellularWcdmaTxRxHist addAdTxBins:](self, "addAdTxBins:", objc_msgSend(v30, "adTxBinsAtIndex:", kk));
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)inVoiceCall
{
  return self->_inVoiceCall;
}

@end
