@implementation KCellularLteSelReselCellInfo

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  PBRepeatedUInt32Clear(&self->_multiBandInfos, a2);
  PBRepeatedUInt32Clear(&self->_intraFreqPcis, v3);
  v4.receiver = self;
  v4.super_class = (Class)KCellularLteSelReselCellInfo;
  -[KCellularLteSelReselCellInfo dealloc](&v4, "dealloc");
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (unint64_t)multiBandInfosCount
{
  return self->_multiBandInfos.count;
}

- (unsigned)multiBandInfos
{
  return self->_multiBandInfos.list;
}

- (void)clearMultiBandInfos
{
  PBRepeatedUInt32Clear(&self->_multiBandInfos, a2);
}

- (void)addMultiBandInfo:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_multiBandInfos, *(_QWORD *)&a3);
}

- (unsigned)multiBandInfoAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_multiBandInfos;
  unint64_t count;
  void *v6;
  void *v7;

  p_multiBandInfos = &self->_multiBandInfos;
  count = self->_multiBandInfos.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_multiBandInfos->list[a3];
}

- (void)setMultiBandInfos:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_multiBandInfos, a3, a4);
}

- (void)setImsEmergencySupport:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_imsEmergencySupport = a3;
}

- (void)setHasImsEmergencySupport:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasImsEmergencySupport
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAcBarringForEmergency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_acBarringForEmergency = a3;
}

- (void)setHasAcBarringForEmergency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAcBarringForEmergency
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMoSignallingAcBarringFactor:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_moSignallingAcBarringFactor = a3;
}

- (void)setHasMoSignallingAcBarringFactor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMoSignallingAcBarringFactor
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setMoSignallingAcBarringTime:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_moSignallingAcBarringTime = a3;
}

- (void)setHasMoSignallingAcBarringTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMoSignallingAcBarringTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMoSignallingAcBarringForSpecialAc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_moSignallingAcBarringForSpecialAc = a3;
}

- (void)setHasMoSignallingAcBarringForSpecialAc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMoSignallingAcBarringForSpecialAc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMoDataAcBarringFactor:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_moDataAcBarringFactor = a3;
}

- (void)setHasMoDataAcBarringFactor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMoDataAcBarringFactor
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setMoDataAcBarringTime:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_moDataAcBarringTime = a3;
}

- (void)setHasMoDataAcBarringTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMoDataAcBarringTime
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setMoDataAcBarringForSpecialAc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_moDataAcBarringForSpecialAc = a3;
}

- (void)setHasMoDataAcBarringForSpecialAc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMoDataAcBarringForSpecialAc
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setQRxLevMin:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_qRxLevMin = a3;
}

- (void)setHasQRxLevMin:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasQRxLevMin
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setQQualMin:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_qQualMin = a3;
}

- (void)setHasQQualMin:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasQQualMin
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setQHyst:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_qHyst = a3;
}

- (void)setHasQHyst:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasQHyst
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSNonIntraSearchP:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_sNonIntraSearchP = a3;
}

- (void)setHasSNonIntraSearchP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSNonIntraSearchP
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSNonIntraSearchQ:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_sNonIntraSearchQ = a3;
}

- (void)setHasSNonIntraSearchQ:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSNonIntraSearchQ
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSIntraSearchP:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_sIntraSearchP = a3;
}

- (void)setHasSIntraSearchP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSIntraSearchP
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSIntraSearchQ:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_sIntraSearchQ = a3;
}

- (void)setHasSIntraSearchQ:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSIntraSearchQ
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setThreshServingLowP:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_threshServingLowP = a3;
}

- (void)setHasThreshServingLowP:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasThreshServingLowP
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setThreshServingLowQ:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_threshServingLowQ = a3;
}

- (void)setHasThreshServingLowQ:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasThreshServingLowQ
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setPriorityOperatingFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_priorityOperatingFreq = a3;
}

- (void)setHasPriorityOperatingFreq:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPriorityOperatingFreq
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)clearNbrEutras
{
  -[NSMutableArray removeAllObjects](self->_nbrEutras, "removeAllObjects");
}

- (void)addNbrEutra:(id)a3
{
  id v4;
  NSMutableArray *nbrEutras;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nbrEutras = self->_nbrEutras;
  v8 = v4;
  if (!nbrEutras)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_nbrEutras;
    self->_nbrEutras = v6;

    v4 = v8;
    nbrEutras = self->_nbrEutras;
  }
  -[NSMutableArray addObject:](nbrEutras, "addObject:", v4);

}

- (unint64_t)nbrEutrasCount
{
  return (unint64_t)-[NSMutableArray count](self->_nbrEutras, "count");
}

- (id)nbrEutraAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_nbrEutras, "objectAtIndex:", a3);
}

+ (Class)nbrEutraType
{
  return (Class)objc_opt_class(NbrEutra, a2);
}

- (void)setDlEarfcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlEarfcn = a3;
}

- (void)setHasDlEarfcn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlEarfcn
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPci:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_pci = a3;
}

- (void)setHasPci:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPci
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setDlRfBand:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlRfBand = a3;
}

- (void)setHasDlRfBand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlRfBand
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDlBandwidth:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_dlBandwidth = a3;
}

- (void)setHasDlBandwidth:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDlBandwidth
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)intraFreqPcisCount
{
  return self->_intraFreqPcis.count;
}

- (unsigned)intraFreqPcis
{
  return self->_intraFreqPcis.list;
}

- (void)clearIntraFreqPcis
{
  PBRepeatedUInt32Clear(&self->_intraFreqPcis, a2);
}

- (void)addIntraFreqPci:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_intraFreqPcis, *(_QWORD *)&a3);
}

- (unsigned)intraFreqPciAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_intraFreqPcis;
  unint64_t count;
  void *v6;
  void *v7;

  p_intraFreqPcis = &self->_intraFreqPcis;
  count = self->_intraFreqPcis.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_intraFreqPcis->list[a3];
}

- (void)setIntraFreqPcis:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_intraFreqPcis, a3, a4);
}

- (BOOL)hasUtraReselInfo
{
  return self->_utraReselInfo != 0;
}

- (BOOL)hasGeraReselInfo
{
  return self->_geraReselInfo != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularLteSelReselCellInfo;
  v3 = -[KCellularLteSelReselCellInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteSelReselCellInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has;
  void *v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  UtraReselectionInfo *utraReselInfo;
  void *v21;
  GeraReselectionInfo *geraReselInfo;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  v5 = PBRepeatedUInt32NSArray(&self->_multiBandInfos);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("multi_band_info"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_imsEmergencySupport));
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("ims_emergency_support"));

    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_45;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_5;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_acBarringForEmergency));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("ac_barring_for_emergency"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_46;
  }
LABEL_45:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_moSignallingAcBarringFactor));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("mo_signalling_ac_barring_factor"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_47;
  }
LABEL_46:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_moSignallingAcBarringTime));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("mo_signalling_ac_barring_time"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_48;
  }
LABEL_47:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_moSignallingAcBarringForSpecialAc));
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("mo_signalling_ac_barring_for_special_ac"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_49;
  }
LABEL_48:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_moDataAcBarringFactor));
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("mo_data_ac_barring_factor"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_50;
  }
LABEL_49:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_moDataAcBarringTime));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("mo_data_ac_barring_time"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_51;
  }
LABEL_50:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_moDataAcBarringForSpecialAc));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("mo_data_ac_barring_for_special_ac"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_13;
    goto LABEL_52;
  }
LABEL_51:
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_qRxLevMin));
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("QRxLevMin"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_53;
  }
LABEL_52:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_qQualMin));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("QQualMin"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_54;
  }
LABEL_53:
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_qHyst));
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("Q_hyst"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_55;
  }
LABEL_54:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sNonIntraSearchP));
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("S_non_intra_search_P"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_56;
  }
LABEL_55:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sNonIntraSearchQ));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("S_non_intra_search_Q"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_57;
  }
LABEL_56:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sIntraSearchP));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("S_intra_search_P"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_58;
  }
LABEL_57:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sIntraSearchQ));
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("S_intra_search_Q"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_20;
    goto LABEL_59;
  }
LABEL_58:
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_threshServingLowP));
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("Thresh_serving_lowP"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_59:
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_threshServingLowQ));
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("Thresh_serving_lowQ"));

  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_21:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_priorityOperatingFreq));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("priority_operating_freq"));

  }
LABEL_22:
  if (-[NSMutableArray count](self->_nbrEutras, "count"))
  {
    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_nbrEutras, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v10 = self->_nbrEutras;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v46));
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("nbr_eutra"));
  }
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 8) != 0)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlEarfcn));
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("dl_earfcn"));

    v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x1000) == 0)
    {
LABEL_33:
      if ((*(_BYTE *)&v16 & 0x10) == 0)
        goto LABEL_34;
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&v16 & 0x1000) == 0)
  {
    goto LABEL_33;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pci, (_QWORD)v46));
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("pci"));

  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x10) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v16 & 4) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_63:
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlRfBand, (_QWORD)v46));
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("dl_rf_band"));

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_35:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBandwidth, (_QWORD)v46));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("dl_bandwidth"));

  }
LABEL_36:
  v18 = PBRepeatedUInt32NSArray(&self->_intraFreqPcis);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("intra_freq_pci"));

  utraReselInfo = self->_utraReselInfo;
  if (utraReselInfo)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UtraReselectionInfo dictionaryRepresentation](utraReselInfo, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("utra_resel_info"));

  }
  geraReselInfo = self->_geraReselInfo;
  if (geraReselInfo)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GeraReselectionInfo dictionaryRepresentation](geraReselInfo, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("gera_resel_info"));

  }
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000BE5FC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v13;
  unint64_t v14;
  UtraReselectionInfo *utraReselInfo;
  GeraReselectionInfo *geraReselInfo;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
  if (self->_multiBandInfos.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 2);
    if (self->_multiBandInfos.count)
    {
      v6 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_multiBandInfos.list[v6++], 0xFFFFFFFFLL);
      while (v6 < self->_multiBandInfos.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_imsEmergencySupport, 3);
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_10:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_11;
      goto LABEL_53;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field(v5, self->_acBarringForEmergency, 4);
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field(v5, self->_moSignallingAcBarringFactor, 5);
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field(v5, self->_moSignallingAcBarringTime, 6);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field(v5, self->_moSignallingAcBarringForSpecialAc, 7);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field(v5, self->_moDataAcBarringFactor, 8);
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field(v5, self->_moDataAcBarringTime, 9);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field(v5, self->_moDataAcBarringForSpecialAc, 10);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteSint32Field(v5, self->_qRxLevMin, 11);
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteSint32Field(v5, self->_qQualMin, 12);
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field(v5, self->_qHyst, 13);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field(v5, self->_sNonIntraSearchP, 14);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field(v5, self->_sNonIntraSearchQ, 15);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field(v5, self->_sIntraSearchP, 16);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field(v5, self->_sIntraSearchQ, 17);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field(v5, self->_threshServingLowP, 18);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_67:
  PBDataWriterWriteUint32Field(v5, self->_threshServingLowQ, 19);
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
LABEL_26:
    PBDataWriterWriteUint32Field(v5, self->_priorityOperatingFreq, 20);
LABEL_27:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_nbrEutras;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), 21);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v10);
  }

  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_dlEarfcn, 22);
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x1000) == 0)
    {
LABEL_36:
      if ((*(_BYTE *)&v13 & 0x10) == 0)
        goto LABEL_37;
      goto LABEL_71;
    }
  }
  else if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteUint32Field(v5, self->_pci, 23);
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x10) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&v13 & 4) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_71:
  PBDataWriterWriteUint32Field(v5, self->_dlRfBand, 24);
  if ((*(_DWORD *)&self->_has & 4) != 0)
LABEL_38:
    PBDataWriterWriteUint32Field(v5, self->_dlBandwidth, 25);
LABEL_39:
  if (self->_intraFreqPcis.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 26);
    if (self->_intraFreqPcis.count)
    {
      v14 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_intraFreqPcis.list[v14++], 0xFFFFFFFFLL);
      while (v14 < self->_intraFreqPcis.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  utraReselInfo = self->_utraReselInfo;
  if (utraReselInfo)
    PBDataWriterWriteSubmessage(v5, utraReselInfo, 27);
  geraReselInfo = self->_geraReselInfo;
  if (geraReselInfo)
    PBDataWriterWriteSubmessage(v5, geraReselInfo, 28);
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 127);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  _DWORD *v17;
  _DWORD *v18;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[7] = self->_timestamp;
    *((_DWORD *)v4 + 46) |= 1u;
  }
  v18 = v4;
  if (-[KCellularLteSelReselCellInfo multiBandInfosCount](self, "multiBandInfosCount"))
  {
    objc_msgSend(v18, "clearMultiBandInfos");
    v5 = -[KCellularLteSelReselCellInfo multiBandInfosCount](self, "multiBandInfosCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v18, "addMultiBandInfo:", -[KCellularLteSelReselCellInfo multiBandInfoAtIndex:](self, "multiBandInfoAtIndex:", i));
    }
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    v18[22] = self->_imsEmergencySupport;
    v18[46] |= 0x20u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_48;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_9;
  }
  v18[16] = self->_acBarringForEmergency;
  v18[46] |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  v18[26] = self->_moSignallingAcBarringFactor;
  v18[46] |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  v18[28] = self->_moSignallingAcBarringTime;
  v18[46] |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  v18[27] = self->_moSignallingAcBarringForSpecialAc;
  v18[46] |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  v18[23] = self->_moDataAcBarringFactor;
  v18[46] |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_53;
  }
LABEL_52:
  v18[25] = self->_moDataAcBarringTime;
  v18[46] |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_53:
  v18[24] = self->_moDataAcBarringForSpecialAc;
  v18[46] |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_55;
  }
LABEL_54:
  v18[36] = self->_qRxLevMin;
  v18[46] |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_56;
  }
LABEL_55:
  v18[35] = self->_qQualMin;
  v18[46] |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_19;
    goto LABEL_57;
  }
LABEL_56:
  v18[34] = self->_qHyst;
  v18[46] |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_57:
  v18[39] = self->_sNonIntraSearchP;
  v18[46] |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_21;
    goto LABEL_59;
  }
LABEL_58:
  v18[40] = self->_sNonIntraSearchQ;
  v18[46] |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_22;
    goto LABEL_60;
  }
LABEL_59:
  v18[37] = self->_sIntraSearchP;
  v18[46] |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_23;
    goto LABEL_61;
  }
LABEL_60:
  v18[38] = self->_sIntraSearchQ;
  v18[46] |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_24;
LABEL_62:
    v18[43] = self->_threshServingLowQ;
    v18[46] |= 0x800000u;
    if ((*(_DWORD *)&self->_has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_61:
  v18[42] = self->_threshServingLowP;
  v18[46] |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
    goto LABEL_62;
LABEL_24:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_25:
    v18[33] = self->_priorityOperatingFreq;
    v18[46] |= 0x2000u;
  }
LABEL_26:
  if (-[KCellularLteSelReselCellInfo nbrEutrasCount](self, "nbrEutrasCount"))
  {
    objc_msgSend(v18, "clearNbrEutras");
    v9 = -[KCellularLteSelReselCellInfo nbrEutrasCount](self, "nbrEutrasCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteSelReselCellInfo nbrEutraAtIndex:](self, "nbrEutraAtIndex:", j));
        objc_msgSend(v18, "addNbrEutra:", v12);

      }
    }
  }
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    v18[18] = self->_dlEarfcn;
    v18[46] |= 8u;
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x1000) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v13 & 0x10) == 0)
        goto LABEL_33;
LABEL_66:
      v18[19] = self->_dlRfBand;
      v18[46] |= 0x10u;
      if ((*(_DWORD *)&self->_has & 4) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
    goto LABEL_32;
  }
  v18[32] = self->_pci;
  v18[46] |= 0x1000u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x10) != 0)
    goto LABEL_66;
LABEL_33:
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
LABEL_34:
    v18[17] = self->_dlBandwidth;
    v18[46] |= 4u;
  }
LABEL_35:
  if (-[KCellularLteSelReselCellInfo intraFreqPcisCount](self, "intraFreqPcisCount"))
  {
    objc_msgSend(v18, "clearIntraFreqPcis");
    v14 = -[KCellularLteSelReselCellInfo intraFreqPcisCount](self, "intraFreqPcisCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
        objc_msgSend(v18, "addIntraFreqPci:", -[KCellularLteSelReselCellInfo intraFreqPciAtIndex:](self, "intraFreqPciAtIndex:", k));
    }
  }
  if (self->_utraReselInfo)
    objc_msgSend(v18, "setUtraReselInfo:");
  v17 = v18;
  if (self->_geraReselInfo)
  {
    objc_msgSend(v18, "setGeraReselInfo:");
    v17 = v18;
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    v17[41] = self->_subsId;
    v17[46] |= 0x200000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _DWORD *v6;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[7] = self->_timestamp;
    *((_DWORD *)v5 + 46) |= 1u;
  }
  PBRepeatedUInt32Copy(v5 + 4, &self->_multiBandInfos);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    v6[22] = self->_imsEmergencySupport;
    v6[46] |= 0x20u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_5;
  }
  v6[16] = self->_acBarringForEmergency;
  v6[46] |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  v6[26] = self->_moSignallingAcBarringFactor;
  v6[46] |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  v6[28] = self->_moSignallingAcBarringTime;
  v6[46] |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  v6[27] = self->_moSignallingAcBarringForSpecialAc;
  v6[46] |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  v6[23] = self->_moDataAcBarringFactor;
  v6[46] |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  v6[25] = self->_moDataAcBarringTime;
  v6[46] |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  v6[24] = self->_moDataAcBarringForSpecialAc;
  v6[46] |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  v6[36] = self->_qRxLevMin;
  v6[46] |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  v6[35] = self->_qQualMin;
  v6[46] |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  v6[34] = self->_qHyst;
  v6[46] |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  v6[39] = self->_sNonIntraSearchP;
  v6[46] |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  v6[40] = self->_sNonIntraSearchQ;
  v6[46] |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  v6[37] = self->_sIntraSearchP;
  v6[46] |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  v6[38] = self->_sIntraSearchQ;
  v6[46] |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  v6[42] = self->_threshServingLowP;
  v6[46] |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_53:
  v6[43] = self->_threshServingLowQ;
  v6[46] |= 0x800000u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_21:
    v6[33] = self->_priorityOperatingFreq;
    v6[46] |= 0x2000u;
  }
LABEL_22:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_nbrEutras;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addNbrEutra:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    v6[18] = self->_dlEarfcn;
    v6[46] |= 8u;
    v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x1000) == 0)
    {
LABEL_31:
      if ((*(_BYTE *)&v14 & 0x10) == 0)
        goto LABEL_32;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
    goto LABEL_31;
  }
  v6[32] = self->_pci;
  v6[46] |= 0x1000u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x10) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v14 & 4) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_57:
  v6[19] = self->_dlRfBand;
  v6[46] |= 0x10u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_33:
    v6[17] = self->_dlBandwidth;
    v6[46] |= 4u;
  }
LABEL_34:
  PBRepeatedUInt32Copy(v6 + 2, &self->_intraFreqPcis);
  v15 = -[UtraReselectionInfo copyWithZone:](self->_utraReselInfo, "copyWithZone:", a3);
  v16 = (void *)*((_QWORD *)v6 + 22);
  *((_QWORD *)v6 + 22) = v15;

  v17 = -[GeraReselectionInfo copyWithZone:](self->_geraReselInfo, "copyWithZone:", a3);
  v18 = (void *)*((_QWORD *)v6 + 10);
  *((_QWORD *)v6 + 10) = v17;

  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    v6[41] = self->_subsId;
    v6[46] |= 0x200000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  int v6;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has;
  int v8;
  NSMutableArray *nbrEutras;
  int v10;
  UtraReselectionInfo *utraReselInfo;
  GeraReselectionInfo *geraReselInfo;
  int v13;
  BOOL v14;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_131;
  v6 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 7))
      goto LABEL_131;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_131;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_multiBandInfos, v4 + 32))
    goto LABEL_131;
  has = self->_has;
  v8 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_imsEmergencySupport != *((_DWORD *)v4 + 22))
      goto LABEL_131;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_acBarringForEmergency != *((_DWORD *)v4 + 16))
      goto LABEL_131;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_moSignallingAcBarringFactor != *((_DWORD *)v4 + 26))
      goto LABEL_131;
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_moSignallingAcBarringTime != *((_DWORD *)v4 + 28))
      goto LABEL_131;
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_moSignallingAcBarringForSpecialAc != *((_DWORD *)v4 + 27))
      goto LABEL_131;
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_moDataAcBarringFactor != *((_DWORD *)v4 + 23))
      goto LABEL_131;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_moDataAcBarringTime != *((_DWORD *)v4 + 25))
      goto LABEL_131;
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_moDataAcBarringForSpecialAc != *((_DWORD *)v4 + 24))
      goto LABEL_131;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_qRxLevMin != *((_DWORD *)v4 + 36))
      goto LABEL_131;
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_qQualMin != *((_DWORD *)v4 + 35))
      goto LABEL_131;
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_qHyst != *((_DWORD *)v4 + 34))
      goto LABEL_131;
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_sNonIntraSearchP != *((_DWORD *)v4 + 39))
      goto LABEL_131;
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_sNonIntraSearchQ != *((_DWORD *)v4 + 40))
      goto LABEL_131;
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_sIntraSearchP != *((_DWORD *)v4 + 37))
      goto LABEL_131;
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_sIntraSearchQ != *((_DWORD *)v4 + 38))
      goto LABEL_131;
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_threshServingLowP != *((_DWORD *)v4 + 42))
      goto LABEL_131;
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_threshServingLowQ != *((_DWORD *)v4 + 43))
      goto LABEL_131;
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_priorityOperatingFreq != *((_DWORD *)v4 + 33))
      goto LABEL_131;
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_131;
  }
  nbrEutras = self->_nbrEutras;
  if ((unint64_t)nbrEutras | *((_QWORD *)v4 + 15))
  {
    if (-[NSMutableArray isEqual:](nbrEutras, "isEqual:"))
    {
      has = self->_has;
      goto LABEL_101;
    }
LABEL_131:
    v14 = 0;
    goto LABEL_132;
  }
LABEL_101:
  v10 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_dlEarfcn != *((_DWORD *)v4 + 18))
      goto LABEL_131;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_pci != *((_DWORD *)v4 + 32))
      goto LABEL_131;
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_dlRfBand != *((_DWORD *)v4 + 19))
      goto LABEL_131;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_dlBandwidth != *((_DWORD *)v4 + 17))
      goto LABEL_131;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_131;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_intraFreqPcis, v4 + 8))
    goto LABEL_131;
  utraReselInfo = self->_utraReselInfo;
  if ((unint64_t)utraReselInfo | *((_QWORD *)v4 + 22))
  {
    if (!-[UtraReselectionInfo isEqual:](utraReselInfo, "isEqual:"))
      goto LABEL_131;
  }
  geraReselInfo = self->_geraReselInfo;
  if ((unint64_t)geraReselInfo | *((_QWORD *)v4 + 10))
  {
    if (!-[GeraReselectionInfo isEqual:](geraReselInfo, "isEqual:"))
      goto LABEL_131;
  }
  v13 = *((_DWORD *)v4 + 46);
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    if ((v13 & 0x200000) == 0 || self->_subsId != *((_DWORD *)v4 + 41))
      goto LABEL_131;
    v14 = 1;
  }
  else
  {
    v14 = (v13 & 0x200000) == 0;
  }
LABEL_132:

  return v14;
}

- (unint64_t)hash
{
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has;
  unint64_t v4;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v34 = 2654435761u * self->_timestamp;
  else
    v34 = 0;
  v33 = PBRepeatedUInt32Hash(&self->_multiBandInfos);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    v32 = 2654435761 * self->_imsEmergencySupport;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_6:
      v31 = 2654435761 * self->_acBarringForEmergency;
      if ((*(_WORD *)&has & 0x200) != 0)
        goto LABEL_7;
      goto LABEL_25;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_6;
  }
  v31 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_7:
    v30 = 2654435761 * self->_moSignallingAcBarringFactor;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  v30 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_8:
    v29 = 2654435761 * self->_moSignallingAcBarringTime;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  v29 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_9:
    v28 = 2654435761 * self->_moSignallingAcBarringForSpecialAc;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  v28 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_10:
    v27 = 2654435761 * self->_moDataAcBarringFactor;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  v27 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_11:
    v26 = 2654435761 * self->_moDataAcBarringTime;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  v26 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_12:
    v25 = 2654435761 * self->_moDataAcBarringForSpecialAc;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  v25 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_13:
    v24 = 2654435761 * self->_qRxLevMin;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  v24 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    v23 = 2654435761 * self->_qQualMin;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  v23 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_15:
    v22 = 2654435761 * self->_qHyst;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_16:
    v21 = 2654435761 * self->_sNonIntraSearchP;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_17:
    v20 = 2654435761 * self->_sNonIntraSearchQ;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_sIntraSearchP;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_36:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_19:
    v18 = 2654435761 * self->_sIntraSearchQ;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_20;
    goto LABEL_38;
  }
LABEL_37:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_20:
    v17 = 2654435761 * self->_threshServingLowP;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_21;
LABEL_39:
    v16 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_22;
    goto LABEL_40;
  }
LABEL_38:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x800000) == 0)
    goto LABEL_39;
LABEL_21:
  v16 = 2654435761 * self->_threshServingLowQ;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_22:
    v15 = 2654435761 * self->_priorityOperatingFreq;
    goto LABEL_41;
  }
LABEL_40:
  v15 = 0;
LABEL_41:
  v4 = (unint64_t)-[NSMutableArray hash](self->_nbrEutras, "hash");
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) != 0)
  {
    v6 = 2654435761 * self->_dlEarfcn;
    if ((*(_WORD *)&v5 & 0x1000) != 0)
    {
LABEL_43:
      v7 = 2654435761 * self->_pci;
      if ((*(_BYTE *)&v5 & 0x10) != 0)
        goto LABEL_44;
LABEL_48:
      v8 = 0;
      if ((*(_BYTE *)&v5 & 4) != 0)
        goto LABEL_45;
      goto LABEL_49;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_WORD *)&v5 & 0x1000) != 0)
      goto LABEL_43;
  }
  v7 = 0;
  if ((*(_BYTE *)&v5 & 0x10) == 0)
    goto LABEL_48;
LABEL_44:
  v8 = 2654435761 * self->_dlRfBand;
  if ((*(_BYTE *)&v5 & 4) != 0)
  {
LABEL_45:
    v9 = 2654435761 * self->_dlBandwidth;
    goto LABEL_50;
  }
LABEL_49:
  v9 = 0;
LABEL_50:
  v10 = PBRepeatedUInt32Hash(&self->_intraFreqPcis);
  v11 = -[UtraReselectionInfo hash](self->_utraReselInfo, "hash");
  v12 = -[GeraReselectionInfo hash](self->_geraReselInfo, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    v13 = 2654435761 * self->_subsId;
  else
    v13 = 0;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v6 ^ v4 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  char *v6;
  char *v7;
  char *i;
  int v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  int v15;
  char *v16;
  char *v17;
  char *k;
  UtraReselectionInfo *utraReselInfo;
  uint64_t v20;
  GeraReselectionInfo *geraReselInfo;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = v4;
  if ((v4[23] & 1) != 0)
  {
    self->_timestamp = v4[7];
    *(_DWORD *)&self->_has |= 1u;
  }
  v6 = (char *)objc_msgSend(v4, "multiBandInfosCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[KCellularLteSelReselCellInfo addMultiBandInfo:](self, "addMultiBandInfo:", objc_msgSend(v5, "multiBandInfoAtIndex:", i));
  }
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x20) != 0)
  {
    self->_imsEmergencySupport = *((_DWORD *)v5 + 22);
    *(_DWORD *)&self->_has |= 0x20u;
    v9 = *((_DWORD *)v5 + 46);
    if ((v9 & 2) == 0)
    {
LABEL_8:
      if ((v9 & 0x200) == 0)
        goto LABEL_9;
      goto LABEL_45;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_8;
  }
  self->_acBarringForEmergency = *((_DWORD *)v5 + 16);
  *(_DWORD *)&self->_has |= 2u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x200) == 0)
  {
LABEL_9:
    if ((v9 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  self->_moSignallingAcBarringFactor = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_has |= 0x200u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x800) == 0)
  {
LABEL_10:
    if ((v9 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  self->_moSignallingAcBarringTime = *((_DWORD *)v5 + 28);
  *(_DWORD *)&self->_has |= 0x800u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x400) == 0)
  {
LABEL_11:
    if ((v9 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  self->_moSignallingAcBarringForSpecialAc = *((_DWORD *)v5 + 27);
  *(_DWORD *)&self->_has |= 0x400u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x40) == 0)
  {
LABEL_12:
    if ((v9 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  self->_moDataAcBarringFactor = *((_DWORD *)v5 + 23);
  *(_DWORD *)&self->_has |= 0x40u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x100) == 0)
  {
LABEL_13:
    if ((v9 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  self->_moDataAcBarringTime = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x100u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x80) == 0)
  {
LABEL_14:
    if ((v9 & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  self->_moDataAcBarringForSpecialAc = *((_DWORD *)v5 + 24);
  *(_DWORD *)&self->_has |= 0x80u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x10000) == 0)
  {
LABEL_15:
    if ((v9 & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  self->_qRxLevMin = *((_DWORD *)v5 + 36);
  *(_DWORD *)&self->_has |= 0x10000u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x8000) == 0)
  {
LABEL_16:
    if ((v9 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  self->_qQualMin = *((_DWORD *)v5 + 35);
  *(_DWORD *)&self->_has |= 0x8000u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x4000) == 0)
  {
LABEL_17:
    if ((v9 & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  self->_qHyst = *((_DWORD *)v5 + 34);
  *(_DWORD *)&self->_has |= 0x4000u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x80000) == 0)
  {
LABEL_18:
    if ((v9 & 0x100000) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  self->_sNonIntraSearchP = *((_DWORD *)v5 + 39);
  *(_DWORD *)&self->_has |= 0x80000u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x100000) == 0)
  {
LABEL_19:
    if ((v9 & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  self->_sNonIntraSearchQ = *((_DWORD *)v5 + 40);
  *(_DWORD *)&self->_has |= 0x100000u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x20000) == 0)
  {
LABEL_20:
    if ((v9 & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  self->_sIntraSearchP = *((_DWORD *)v5 + 37);
  *(_DWORD *)&self->_has |= 0x20000u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x40000) == 0)
  {
LABEL_21:
    if ((v9 & 0x400000) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  self->_sIntraSearchQ = *((_DWORD *)v5 + 38);
  *(_DWORD *)&self->_has |= 0x40000u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x400000) == 0)
  {
LABEL_22:
    if ((v9 & 0x800000) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  self->_threshServingLowP = *((_DWORD *)v5 + 42);
  *(_DWORD *)&self->_has |= 0x400000u;
  v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x800000) == 0)
  {
LABEL_23:
    if ((v9 & 0x2000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_59:
  self->_threshServingLowQ = *((_DWORD *)v5 + 43);
  *(_DWORD *)&self->_has |= 0x800000u;
  if ((*((_DWORD *)v5 + 46) & 0x2000) != 0)
  {
LABEL_24:
    self->_priorityOperatingFreq = *((_DWORD *)v5 + 33);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_25:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = *((id *)v5 + 15);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        -[KCellularLteSelReselCellInfo addNbrEutra:](self, "addNbrEutra:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j), (_QWORD)v23);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  v15 = *((_DWORD *)v5 + 46);
  if ((v15 & 8) != 0)
  {
    self->_dlEarfcn = *((_DWORD *)v5 + 18);
    *(_DWORD *)&self->_has |= 8u;
    v15 = *((_DWORD *)v5 + 46);
    if ((v15 & 0x1000) == 0)
    {
LABEL_34:
      if ((v15 & 0x10) == 0)
        goto LABEL_35;
      goto LABEL_63;
    }
  }
  else if ((v15 & 0x1000) == 0)
  {
    goto LABEL_34;
  }
  self->_pci = *((_DWORD *)v5 + 32);
  *(_DWORD *)&self->_has |= 0x1000u;
  v15 = *((_DWORD *)v5 + 46);
  if ((v15 & 0x10) == 0)
  {
LABEL_35:
    if ((v15 & 4) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_63:
  self->_dlRfBand = *((_DWORD *)v5 + 19);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v5 + 46) & 4) != 0)
  {
LABEL_36:
    self->_dlBandwidth = *((_DWORD *)v5 + 17);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_37:
  v16 = (char *)objc_msgSend(v5, "intraFreqPcisCount", (_QWORD)v23);
  if (v16)
  {
    v17 = v16;
    for (k = 0; k != v17; ++k)
      -[KCellularLteSelReselCellInfo addIntraFreqPci:](self, "addIntraFreqPci:", objc_msgSend(v5, "intraFreqPciAtIndex:", k));
  }
  utraReselInfo = self->_utraReselInfo;
  v20 = *((_QWORD *)v5 + 22);
  if (utraReselInfo)
  {
    if (v20)
      -[UtraReselectionInfo mergeFrom:](utraReselInfo, "mergeFrom:");
  }
  else if (v20)
  {
    -[KCellularLteSelReselCellInfo setUtraReselInfo:](self, "setUtraReselInfo:");
  }
  geraReselInfo = self->_geraReselInfo;
  v22 = *((_QWORD *)v5 + 10);
  if (geraReselInfo)
  {
    if (v22)
      -[GeraReselectionInfo mergeFrom:](geraReselInfo, "mergeFrom:");
  }
  else if (v22)
  {
    -[KCellularLteSelReselCellInfo setGeraReselInfo:](self, "setGeraReselInfo:");
  }
  if ((*((_BYTE *)v5 + 186) & 0x20) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 41);
    *(_DWORD *)&self->_has |= 0x200000u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)imsEmergencySupport
{
  return self->_imsEmergencySupport;
}

- (unsigned)acBarringForEmergency
{
  return self->_acBarringForEmergency;
}

- (unsigned)moSignallingAcBarringFactor
{
  return self->_moSignallingAcBarringFactor;
}

- (unsigned)moSignallingAcBarringTime
{
  return self->_moSignallingAcBarringTime;
}

- (unsigned)moSignallingAcBarringForSpecialAc
{
  return self->_moSignallingAcBarringForSpecialAc;
}

- (unsigned)moDataAcBarringFactor
{
  return self->_moDataAcBarringFactor;
}

- (unsigned)moDataAcBarringTime
{
  return self->_moDataAcBarringTime;
}

- (unsigned)moDataAcBarringForSpecialAc
{
  return self->_moDataAcBarringForSpecialAc;
}

- (int)qRxLevMin
{
  return self->_qRxLevMin;
}

- (int)qQualMin
{
  return self->_qQualMin;
}

- (unsigned)qHyst
{
  return self->_qHyst;
}

- (unsigned)sNonIntraSearchP
{
  return self->_sNonIntraSearchP;
}

- (unsigned)sNonIntraSearchQ
{
  return self->_sNonIntraSearchQ;
}

- (unsigned)sIntraSearchP
{
  return self->_sIntraSearchP;
}

- (unsigned)sIntraSearchQ
{
  return self->_sIntraSearchQ;
}

- (unsigned)threshServingLowP
{
  return self->_threshServingLowP;
}

- (unsigned)threshServingLowQ
{
  return self->_threshServingLowQ;
}

- (unsigned)priorityOperatingFreq
{
  return self->_priorityOperatingFreq;
}

- (NSMutableArray)nbrEutras
{
  return self->_nbrEutras;
}

- (void)setNbrEutras:(id)a3
{
  objc_storeStrong((id *)&self->_nbrEutras, a3);
}

- (unsigned)dlEarfcn
{
  return self->_dlEarfcn;
}

- (unsigned)pci
{
  return self->_pci;
}

- (unsigned)dlRfBand
{
  return self->_dlRfBand;
}

- (unsigned)dlBandwidth
{
  return self->_dlBandwidth;
}

- (UtraReselectionInfo)utraReselInfo
{
  return self->_utraReselInfo;
}

- (void)setUtraReselInfo:(id)a3
{
  objc_storeStrong((id *)&self->_utraReselInfo, a3);
}

- (GeraReselectionInfo)geraReselInfo
{
  return self->_geraReselInfo;
}

- (void)setGeraReselInfo:(id)a3
{
  objc_storeStrong((id *)&self->_geraReselInfo, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utraReselInfo, 0);
  objc_storeStrong((id *)&self->_nbrEutras, 0);
  objc_storeStrong((id *)&self->_geraReselInfo, 0);
}

@end
