@implementation CellularRegAttempt

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasHplmn
{
  return self->_hplmn != 0;
}

- (BOOL)hasAttemptedPlmn
{
  return self->_attemptedPlmn != 0;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCellId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAttemptedPlmnCategory:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_attemptedPlmnCategory = a3;
}

- (void)setHasAttemptedPlmnCategory:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAttemptedPlmnCategory
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)regServiceDomain
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_regServiceDomain;
  else
    return -1;
}

- (void)setRegServiceDomain:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_regServiceDomain = a3;
}

- (void)setHasRegServiceDomain:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRegServiceDomain
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)regServiceDomainAsString:(int)a3
{
  if ((a3 + 1) >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EE60 + a3 + 1);
}

- (int)StringAsRegServiceDomain:(id)a3
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

- (int)activeRat
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_activeRat;
  else
    return 0;
}

- (void)setActiveRat:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activeRat = a3;
}

- (void)setHasActiveRat:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActiveRat
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)activeRatAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EE98 + a3);
}

- (int)StringAsActiveRat:(id)a3
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

- (int)serviceStatus
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_serviceStatus;
  else
    return -1;
}

- (void)setServiceStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_serviceStatus = a3;
}

- (void)setHasServiceStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasServiceStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)serviceStatusAsString:(int)a3
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

- (int)StringAsServiceStatus:(id)a3
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

- (void)setRejectCause:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rejectCause = a3;
}

- (void)setHasRejectCause:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRejectCause
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setDlFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlFreq = a3;
}

- (void)setHasDlFreq:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlFreq
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasFreqBandInd
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLac
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setIsRegAccepted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isRegAccepted = a3;
}

- (void)setHasIsRegAccepted:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsRegAccepted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setIsHplmn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isHplmn = a3;
}

- (void)setHasIsHplmn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsHplmn
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setIsEhplmn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isEhplmn = a3;
}

- (void)setHasIsEhplmn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsEhplmn
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsPlmnForbiden:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isPlmnForbiden = a3;
}

- (void)setHasIsPlmnForbiden:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsPlmnForbiden
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setIsRoamingSteererPlmn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isRoamingSteererPlmn = a3;
}

- (void)setHasIsRoamingSteererPlmn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsRoamingSteererPlmn
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIsHplmnScanTriggered:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isHplmnScanTriggered = a3;
}

- (void)setHasIsHplmnScanTriggered:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsHplmnScanTriggered
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRoamingDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_roamingDuration = a3;
}

- (void)setHasRoamingDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRoamingDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHplmnScanDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hplmnScanDuration = a3;
}

- (void)setHasHplmnScanDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHplmnScanDuration
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHplmnScanNumOfAttempts:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hplmnScanNumOfAttempts = a3;
}

- (void)setHasHplmnScanNumOfAttempts:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHplmnScanNumOfAttempts
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHplmnSearchPeriod:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hplmnSearchPeriod = a3;
}

- (void)setHasHplmnSearchPeriod:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHplmnSearchPeriod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHplmnScanAttemptsDisallowedDueToBl:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hplmnScanAttemptsDisallowedDueToBl = a3;
}

- (void)setHasHplmnScanAttemptsDisallowedDueToBl:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHplmnScanAttemptsDisallowedDueToBl
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasBdStat
{
  return self->_bdStat != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularRegAttempt;
  v3 = -[CellularRegAttempt description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularRegAttempt dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *hplmn;
  NSData *attemptedPlmn;
  $B059C026A2D9336AAF1D1040F5C73324 has;
  void *v8;
  BorderDbStat *bdStat;
  void *v10;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t activeRat;
  void *v17;
  int serviceStatus;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  hplmn = self->_hplmn;
  if (hplmn)
    objc_msgSend(v3, "setObject:forKey:", hplmn, CFSTR("hplmn"));
  attemptedPlmn = self->_attemptedPlmn;
  if (attemptedPlmn)
    objc_msgSend(v3, "setObject:forKey:", attemptedPlmn, CFSTR("attempted_plmn"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("cell_id"));

    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_attemptedPlmnCategory));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("attempted_plmn_category"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_33:
  v14 = self->_regServiceDomain + 1;
  if (v14 >= 7)
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_regServiceDomain));
  else
    v15 = *(&off_10025EE60 + v14);
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("reg_service_domain"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_37:
  activeRat = self->_activeRat;
  if (activeRat >= 5)
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_activeRat));
  else
    v17 = *(&off_10025EE98 + activeRat);
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("active_rat"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_54;
  }
LABEL_41:
  serviceStatus = self->_serviceStatus;
  v19 = CFSTR("SYS_SRV_STATUS_NONE");
  switch(serviceStatus)
  {
    case -1:
      break;
    case 0:
      v19 = CFSTR("SYS_SRV_STATUS_NO_SRV");
      break;
    case 1:
      v19 = CFSTR("SYS_SRV_STATUS_LIMITED");
      break;
    case 2:
      v19 = CFSTR("SYS_SRV_STATUS_SRV");
      break;
    case 3:
      v19 = CFSTR("SYS_SRV_STATUS_LIMITED_REGIONAL");
      break;
    case 4:
      v19 = CFSTR("SYS_SRV_STATUS_PWR_SAVE");
      break;
    case 5:
      v19 = CFSTR("SYS_SRV_STATUS_MAX");
      break;
    default:
      if (serviceStatus == 100)
      {
        v19 = CFSTR("SYS_SRV_STATUS_LOW_POWER_MODE");
      }
      else if (serviceStatus == 101)
      {
        v19 = CFSTR("SYS_SRV_STATUS_CMAS_ONLY_MODE");
      }
      else
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_serviceStatus));
      }
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("service_status"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_55;
  }
LABEL_54:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rejectCause));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("reject_cause"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_56;
  }
LABEL_55:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlFreq));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("dl_freq"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_57;
  }
LABEL_56:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqBandInd));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("freq_band_ind"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_58;
  }
LABEL_57:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("lac"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_59;
  }
LABEL_58:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isRegAccepted));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("is_reg_accepted"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_60;
  }
LABEL_59:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isHplmn));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("is_hplmn"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_61;
  }
LABEL_60:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isEhplmn));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("is_ehplmn"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_62;
  }
LABEL_61:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isPlmnForbiden));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("is_plmn_forbiden"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_63;
  }
LABEL_62:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isRoamingSteererPlmn));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("is_roaming_steerer_plmn"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_64;
  }
LABEL_63:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isHplmnScanTriggered));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("is_hplmn_scan_triggered"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_65;
  }
LABEL_64:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_roamingDuration));
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("roaming_duration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_66;
  }
LABEL_65:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hplmnScanDuration));
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("hplmn_scan_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_26;
    goto LABEL_67;
  }
LABEL_66:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hplmnScanNumOfAttempts));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("hplmn_scan_num_of_attempts"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_67:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hplmnSearchPeriod));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("hplmn_search_period"));

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hplmnScanAttemptsDisallowedDueToBl));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("hplmn_scan_attempts_disallowed_due_to_bl"));

  }
LABEL_28:
  bdStat = self->_bdStat;
  if (bdStat)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BorderDbStat dictionaryRepresentation](bdStat, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("bd_stat"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006CF60((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *hplmn;
  NSData *attemptedPlmn;
  $B059C026A2D9336AAF1D1040F5C73324 has;
  BorderDbStat *bdStat;
  id v9;

  v4 = a3;
  v9 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    v4 = v9;
  }
  hplmn = self->_hplmn;
  if (hplmn)
  {
    PBDataWriterWriteDataField(v9, hplmn, 4);
    v4 = v9;
  }
  attemptedPlmn = self->_attemptedPlmn;
  if (attemptedPlmn)
  {
    PBDataWriterWriteDataField(v9, attemptedPlmn, 5);
    v4 = v9;
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_cellId, 6);
    v4 = v9;
    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field(v9, self->_attemptedPlmnCategory, 8);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field(v9, self->_regServiceDomain, 9);
  v4 = v9;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field(v9, self->_activeRat, 10);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field(v9, self->_serviceStatus, 11);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field(v9, self->_rejectCause, 12);
  v4 = v9;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field(v9, self->_dlFreq, 13);
  v4 = v9;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v9, self->_freqBandInd, 14);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field(v9, self->_lac, 15);
  v4 = v9;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField(v9, self->_isRegAccepted, 16);
  v4 = v9;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField(v9, self->_isHplmn, 17);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField(v9, self->_isEhplmn, 18);
  v4 = v9;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField(v9, self->_isPlmnForbiden, 19);
  v4 = v9;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField(v9, self->_isRoamingSteererPlmn, 20);
  v4 = v9;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField(v9, self->_isHplmnScanTriggered, 21);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field(v9, self->_roamingDuration, 25);
  v4 = v9;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field(v9, self->_hplmnScanDuration, 26);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field(v9, self->_hplmnScanNumOfAttempts, 27);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_49:
  PBDataWriterWriteUint32Field(v9, self->_hplmnSearchPeriod, 28);
  v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    PBDataWriterWriteUint32Field(v9, self->_hplmnScanAttemptsDisallowedDueToBl, 29);
    v4 = v9;
  }
LABEL_28:
  bdStat = self->_bdStat;
  if (bdStat)
  {
    PBDataWriterWriteSubmessage(v9, bdStat, 32);
    v4 = v9;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $B059C026A2D9336AAF1D1040F5C73324 has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 29) |= 1u;
  }
  v6 = v4;
  if (self->_hplmn)
  {
    objc_msgSend(v4, "setHplmn:");
    v4 = v6;
  }
  if (self->_attemptedPlmn)
  {
    objc_msgSend(v6, "setAttemptedPlmn:");
    v4 = v6;
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_cellId;
    *((_DWORD *)v4 + 29) |= 8u;
    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 8) = self->_attemptedPlmnCategory;
  *((_DWORD *)v4 + 29) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 23) = self->_regServiceDomain;
  *((_DWORD *)v4 + 29) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 4) = self->_activeRat;
  *((_DWORD *)v4 + 29) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 26) = self->_serviceStatus;
  *((_DWORD *)v4 + 29) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 24) = self->_rejectCause;
  *((_DWORD *)v4 + 29) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 13) = self->_dlFreq;
  *((_DWORD *)v4 + 29) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 14) = self->_freqBandInd;
  *((_DWORD *)v4 + 29) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 22) = self->_lac;
  *((_DWORD *)v4 + 29) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)v4 + 112) = self->_isRegAccepted;
  *((_DWORD *)v4 + 29) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *((_BYTE *)v4 + 109) = self->_isHplmn;
  *((_DWORD *)v4 + 29) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *((_BYTE *)v4 + 108) = self->_isEhplmn;
  *((_DWORD *)v4 + 29) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *((_BYTE *)v4 + 111) = self->_isPlmnForbiden;
  *((_DWORD *)v4 + 29) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *((_BYTE *)v4 + 113) = self->_isRoamingSteererPlmn;
  *((_DWORD *)v4 + 29) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  *((_BYTE *)v4 + 110) = self->_isHplmnScanTriggered;
  *((_DWORD *)v4 + 29) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 25) = self->_roamingDuration;
  *((_DWORD *)v4 + 29) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 19) = self->_hplmnScanDuration;
  *((_DWORD *)v4 + 29) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 20) = self->_hplmnScanNumOfAttempts;
  *((_DWORD *)v4 + 29) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_49:
  *((_DWORD *)v4 + 21) = self->_hplmnSearchPeriod;
  *((_DWORD *)v4 + 29) |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    *((_DWORD *)v4 + 18) = self->_hplmnScanAttemptsDisallowedDueToBl;
    *((_DWORD *)v4 + 29) |= 0x40u;
  }
LABEL_28:
  if (self->_bdStat)
  {
    objc_msgSend(v6, "setBdStat:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  $B059C026A2D9336AAF1D1040F5C73324 has;
  id v12;
  void *v13;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 29) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_hplmn, "copyWithZone:", a3);
  v8 = (void *)v6[8];
  v6[8] = v7;

  v9 = -[NSData copyWithZone:](self->_attemptedPlmn, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_cellId;
    *((_DWORD *)v6 + 29) |= 8u;
    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_6;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 8) = self->_attemptedPlmnCategory;
  *((_DWORD *)v6 + 29) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v6 + 23) = self->_regServiceDomain;
  *((_DWORD *)v6 + 29) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v6 + 4) = self->_activeRat;
  *((_DWORD *)v6 + 29) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v6 + 26) = self->_serviceStatus;
  *((_DWORD *)v6 + 29) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v6 + 24) = self->_rejectCause;
  *((_DWORD *)v6 + 29) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v6 + 13) = self->_dlFreq;
  *((_DWORD *)v6 + 29) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v6 + 14) = self->_freqBandInd;
  *((_DWORD *)v6 + 29) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v6 + 22) = self->_lac;
  *((_DWORD *)v6 + 29) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  *((_BYTE *)v6 + 112) = self->_isRegAccepted;
  *((_DWORD *)v6 + 29) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  *((_BYTE *)v6 + 109) = self->_isHplmn;
  *((_DWORD *)v6 + 29) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  *((_BYTE *)v6 + 108) = self->_isEhplmn;
  *((_DWORD *)v6 + 29) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  *((_BYTE *)v6 + 111) = self->_isPlmnForbiden;
  *((_DWORD *)v6 + 29) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)v6 + 113) = self->_isRoamingSteererPlmn;
  *((_DWORD *)v6 + 29) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  *((_BYTE *)v6 + 110) = self->_isHplmnScanTriggered;
  *((_DWORD *)v6 + 29) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v6 + 25) = self->_roamingDuration;
  *((_DWORD *)v6 + 29) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v6 + 19) = self->_hplmnScanDuration;
  *((_DWORD *)v6 + 29) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
LABEL_43:
    *((_DWORD *)v6 + 21) = self->_hplmnSearchPeriod;
    *((_DWORD *)v6 + 29) |= 0x200u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_42:
  *((_DWORD *)v6 + 20) = self->_hplmnScanNumOfAttempts;
  *((_DWORD *)v6 + 29) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
    goto LABEL_43;
LABEL_22:
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_23:
    *((_DWORD *)v6 + 18) = self->_hplmnScanAttemptsDisallowedDueToBl;
    *((_DWORD *)v6 + 29) |= 0x40u;
  }
LABEL_24:
  v12 = -[BorderDbStat copyWithZone:](self->_bdStat, "copyWithZone:", a3);
  v13 = (void *)v6[5];
  v6[5] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  NSData *hplmn;
  NSData *attemptedPlmn;
  $B059C026A2D9336AAF1D1040F5C73324 has;
  int v10;
  BorderDbStat *bdStat;
  unsigned __int8 v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_131;
  v6 = *((_DWORD *)v4 + 29);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_131;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_131;
  }
  hplmn = self->_hplmn;
  if ((unint64_t)hplmn | *((_QWORD *)v4 + 8) && !-[NSData isEqual:](hplmn, "isEqual:"))
    goto LABEL_131;
  attemptedPlmn = self->_attemptedPlmn;
  if ((unint64_t)attemptedPlmn | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](attemptedPlmn, "isEqual:"))
      goto LABEL_131;
  }
  has = self->_has;
  v10 = *((_DWORD *)v4 + 29);
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_cellId != *((_DWORD *)v4 + 12))
      goto LABEL_131;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_attemptedPlmnCategory != *((_DWORD *)v4 + 8))
      goto LABEL_131;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_regServiceDomain != *((_DWORD *)v4 + 23))
      goto LABEL_131;
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_activeRat != *((_DWORD *)v4 + 4))
      goto LABEL_131;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_serviceStatus != *((_DWORD *)v4 + 26))
      goto LABEL_131;
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_rejectCause != *((_DWORD *)v4 + 24))
      goto LABEL_131;
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_dlFreq != *((_DWORD *)v4 + 13))
      goto LABEL_131;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 14))
      goto LABEL_131;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_lac != *((_DWORD *)v4 + 22))
      goto LABEL_131;
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0)
      goto LABEL_131;
    if (self->_isRegAccepted)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_131;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_131;
    }
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0)
      goto LABEL_131;
    if (self->_isHplmn)
    {
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_131;
    }
    else if (*((_BYTE *)v4 + 109))
    {
      goto LABEL_131;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0)
      goto LABEL_131;
    if (self->_isEhplmn)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_131;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_131;
    }
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0)
      goto LABEL_131;
    if (self->_isPlmnForbiden)
    {
      if (!*((_BYTE *)v4 + 111))
        goto LABEL_131;
    }
    else if (*((_BYTE *)v4 + 111))
    {
      goto LABEL_131;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0)
      goto LABEL_131;
    if (self->_isRoamingSteererPlmn)
    {
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_131;
    }
    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_131;
    }
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v10 & 0x20000) != 0)
    {
      if (self->_isHplmnScanTriggered)
      {
        if (!*((_BYTE *)v4 + 110))
          goto LABEL_131;
        goto LABEL_104;
      }
      if (!*((_BYTE *)v4 + 110))
        goto LABEL_104;
    }
LABEL_131:
    v12 = 0;
    goto LABEL_132;
  }
  if ((v10 & 0x20000) != 0)
    goto LABEL_131;
LABEL_104:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_roamingDuration != *((_DWORD *)v4 + 25))
      goto LABEL_131;
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_hplmnScanDuration != *((_DWORD *)v4 + 19))
      goto LABEL_131;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_hplmnScanNumOfAttempts != *((_DWORD *)v4 + 20))
      goto LABEL_131;
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_hplmnSearchPeriod != *((_DWORD *)v4 + 21))
      goto LABEL_131;
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_hplmnScanAttemptsDisallowedDueToBl != *((_DWORD *)v4 + 18))
      goto LABEL_131;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_131;
  }
  bdStat = self->_bdStat;
  if ((unint64_t)bdStat | *((_QWORD *)v4 + 5))
    v12 = -[BorderDbStat isEqual:](bdStat, "isEqual:");
  else
    v12 = 1;
LABEL_132:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  $B059C026A2D9336AAF1D1040F5C73324 has;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSData hash](self->_hplmn, "hash");
  v5 = (unint64_t)-[NSData hash](self->_attemptedPlmn, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    v7 = 2654435761 * self->_cellId;
    if ((*(_BYTE *)&has & 4) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_attemptedPlmnCategory;
      if ((*(_WORD *)&has & 0x800) != 0)
        goto LABEL_7;
      goto LABEL_27;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_6;
  }
  v8 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_regServiceDomain;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  v9 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_activeRat;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  v10 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    v11 = 2654435761 * self->_serviceStatus;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  v11 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_10:
    v12 = 2654435761 * self->_rejectCause;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  v12 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_11:
    v13 = 2654435761 * self->_dlFreq;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  v13 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_12:
    v14 = 2654435761 * self->_freqBandInd;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  v14 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_13:
    v15 = 2654435761 * self->_lac;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_14:
    v16 = 2654435761 * self->_isRegAccepted;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  v16 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    v17 = 2654435761 * self->_isHplmn;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  v17 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_16:
    v18 = 2654435761 * self->_isEhplmn;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_17:
    v19 = 2654435761 * self->_isPlmnForbiden;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_18:
    v20 = 2654435761 * self->_isRoamingSteererPlmn;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    v21 = 2654435761 * self->_isHplmnScanTriggered;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_20;
    goto LABEL_40;
  }
LABEL_39:
  v21 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_20:
    v22 = 2654435761 * self->_roamingDuration;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_21;
    goto LABEL_41;
  }
LABEL_40:
  v22 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_21:
    v23 = 2654435761 * self->_hplmnScanDuration;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_22;
    goto LABEL_42;
  }
LABEL_41:
  v23 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_22:
    v24 = 2654435761 * self->_hplmnScanNumOfAttempts;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_23;
LABEL_43:
    v25 = 0;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_24;
LABEL_44:
    v26 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ -[BorderDbStat hash](self->_bdStat, "hash");
  }
LABEL_42:
  v24 = 0;
  if ((*(_WORD *)&has & 0x200) == 0)
    goto LABEL_43;
LABEL_23:
  v25 = 2654435761 * self->_hplmnSearchPeriod;
  if ((*(_BYTE *)&has & 0x40) == 0)
    goto LABEL_44;
LABEL_24:
  v26 = 2654435761 * self->_hplmnScanAttemptsDisallowedDueToBl;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ -[BorderDbStat hash](self->_bdStat, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  int v6;
  BorderDbStat *bdStat;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 116) & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_DWORD *)&self->_has |= 1u;
  }
  v9 = v4;
  if (v4[8])
  {
    -[CellularRegAttempt setHplmn:](self, "setHplmn:");
    v5 = v9;
  }
  if (*((_QWORD *)v5 + 3))
  {
    -[CellularRegAttempt setAttemptedPlmn:](self, "setAttemptedPlmn:");
    v5 = v9;
  }
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 8) != 0)
  {
    self->_cellId = *((_DWORD *)v5 + 12);
    *(_DWORD *)&self->_has |= 8u;
    v6 = *((_DWORD *)v5 + 29);
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_33;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_attemptedPlmnCategory = *((_DWORD *)v5 + 8);
  *(_DWORD *)&self->_has |= 4u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x800) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  self->_regServiceDomain = *((_DWORD *)v5 + 23);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 2) == 0)
  {
LABEL_11:
    if ((v6 & 0x4000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  self->_activeRat = *((_DWORD *)v5 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x4000) == 0)
  {
LABEL_12:
    if ((v6 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  self->_serviceStatus = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_has |= 0x4000u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x1000) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  self->_rejectCause = *((_DWORD *)v5 + 24);
  *(_DWORD *)&self->_has |= 0x1000u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  self->_dlFreq = *((_DWORD *)v5 + 13);
  *(_DWORD *)&self->_has |= 0x10u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x20) == 0)
  {
LABEL_15:
    if ((v6 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  self->_freqBandInd = *((_DWORD *)v5 + 14);
  *(_DWORD *)&self->_has |= 0x20u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x400) == 0)
  {
LABEL_16:
    if ((v6 & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  self->_lac = *((_DWORD *)v5 + 22);
  *(_DWORD *)&self->_has |= 0x400u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x80000) == 0)
  {
LABEL_17:
    if ((v6 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  self->_isRegAccepted = *((_BYTE *)v5 + 112);
  *(_DWORD *)&self->_has |= 0x80000u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x10000) == 0)
  {
LABEL_18:
    if ((v6 & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  self->_isHplmn = *((_BYTE *)v5 + 109);
  *(_DWORD *)&self->_has |= 0x10000u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x8000) == 0)
  {
LABEL_19:
    if ((v6 & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  self->_isEhplmn = *((_BYTE *)v5 + 108);
  *(_DWORD *)&self->_has |= 0x8000u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x40000) == 0)
  {
LABEL_20:
    if ((v6 & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  self->_isPlmnForbiden = *((_BYTE *)v5 + 111);
  *(_DWORD *)&self->_has |= 0x40000u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x100000) == 0)
  {
LABEL_21:
    if ((v6 & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  self->_isRoamingSteererPlmn = *((_BYTE *)v5 + 113);
  *(_DWORD *)&self->_has |= 0x100000u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x20000) == 0)
  {
LABEL_22:
    if ((v6 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  self->_isHplmnScanTriggered = *((_BYTE *)v5 + 110);
  *(_DWORD *)&self->_has |= 0x20000u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x2000) == 0)
  {
LABEL_23:
    if ((v6 & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  self->_roamingDuration = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x2000u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x80) == 0)
  {
LABEL_24:
    if ((v6 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  self->_hplmnScanDuration = *((_DWORD *)v5 + 19);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x100) == 0)
  {
LABEL_25:
    if ((v6 & 0x200) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  self->_hplmnScanNumOfAttempts = *((_DWORD *)v5 + 20);
  *(_DWORD *)&self->_has |= 0x100u;
  v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x200) == 0)
  {
LABEL_26:
    if ((v6 & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_49:
  self->_hplmnSearchPeriod = *((_DWORD *)v5 + 21);
  *(_DWORD *)&self->_has |= 0x200u;
  if ((*((_DWORD *)v5 + 29) & 0x40) != 0)
  {
LABEL_27:
    self->_hplmnScanAttemptsDisallowedDueToBl = *((_DWORD *)v5 + 18);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_28:
  bdStat = self->_bdStat;
  v8 = *((_QWORD *)v5 + 5);
  if (bdStat)
  {
    if (v8)
    {
      -[BorderDbStat mergeFrom:](bdStat, "mergeFrom:");
LABEL_53:
      v5 = v9;
    }
  }
  else if (v8)
  {
    -[CellularRegAttempt setBdStat:](self, "setBdStat:");
    goto LABEL_53;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)hplmn
{
  return self->_hplmn;
}

- (void)setHplmn:(id)a3
{
  objc_storeStrong((id *)&self->_hplmn, a3);
}

- (NSData)attemptedPlmn
{
  return self->_attemptedPlmn;
}

- (void)setAttemptedPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_attemptedPlmn, a3);
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)attemptedPlmnCategory
{
  return self->_attemptedPlmnCategory;
}

- (unsigned)rejectCause
{
  return self->_rejectCause;
}

- (unsigned)dlFreq
{
  return self->_dlFreq;
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
}

- (unsigned)lac
{
  return self->_lac;
}

- (BOOL)isRegAccepted
{
  return self->_isRegAccepted;
}

- (BOOL)isHplmn
{
  return self->_isHplmn;
}

- (BOOL)isEhplmn
{
  return self->_isEhplmn;
}

- (BOOL)isPlmnForbiden
{
  return self->_isPlmnForbiden;
}

- (BOOL)isRoamingSteererPlmn
{
  return self->_isRoamingSteererPlmn;
}

- (BOOL)isHplmnScanTriggered
{
  return self->_isHplmnScanTriggered;
}

- (unsigned)roamingDuration
{
  return self->_roamingDuration;
}

- (unsigned)hplmnScanDuration
{
  return self->_hplmnScanDuration;
}

- (unsigned)hplmnScanNumOfAttempts
{
  return self->_hplmnScanNumOfAttempts;
}

- (unsigned)hplmnSearchPeriod
{
  return self->_hplmnSearchPeriod;
}

- (unsigned)hplmnScanAttemptsDisallowedDueToBl
{
  return self->_hplmnScanAttemptsDisallowedDueToBl;
}

- (BorderDbStat)bdStat
{
  return self->_bdStat;
}

- (void)setBdStat:(id)a3
{
  objc_storeStrong((id *)&self->_bdStat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hplmn, 0);
  objc_storeStrong((id *)&self->_bdStat, 0);
  objc_storeStrong((id *)&self->_attemptedPlmn, 0);
}

@end
