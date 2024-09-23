@implementation CellularServiceStatus

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

- (int)sysMode
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_sysMode;
  else
    return 0;
}

- (void)setSysMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSysMode
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)sysModeAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025EC00 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsSysMode:(id)a3
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
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_srvStatus;
  else
    return -1;
}

- (void)setSrvStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_srvStatus = a3;
}

- (void)setHasSrvStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSrvStatus
{
  return (*(_WORD *)&self->_has >> 6) & 1;
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
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_srvDomain;
  else
    return -1;
}

- (void)setSrvDomain:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_srvDomain = a3;
}

- (void)setHasSrvDomain:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSrvDomain
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)srvDomainAsString:(int)a3
{
  if ((a3 + 1) >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EC80 + a3 + 1);
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

- (int)roamStatus
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_roamStatus;
  else
    return -1;
}

- (void)setRoamStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_roamStatus = a3;
}

- (void)setHasRoamStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRoamStatus
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)roamStatusAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("SYS_ROAM_STATUS_NONE");
  switch(a3)
  {
    case -1:
      return v3;
    case 0:
      v3 = CFSTR("SYS_ROAM_STATUS_OFF");
      return v3;
    case 1:
      return CFSTR("SYS_ROAM_STATUS_ON");
    case 2:
      return CFSTR("SYS_ROAM_STATUS_BLINK");
    case 3:
      return CFSTR("SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD");
    case 4:
      return CFSTR("SYS_ROAM_STATUS_OUT_OF_BLDG");
    case 5:
      return CFSTR("SYS_ROAM_STATUS_PREF_SYS");
    case 6:
      return CFSTR("SYS_ROAM_STATUS_AVAIL_SYS");
    case 7:
      return CFSTR("SYS_ROAM_STATUS_ALLIANCE_PARTNER");
    case 8:
      return CFSTR("SYS_ROAM_STATUS_PREMIUM_PARTNER");
    case 9:
      return CFSTR("SYS_ROAM_STATUS_FULL_SVC");
    case 10:
      return CFSTR("SYS_ROAM_STATUS_PARTIAL_SVC");
    case 11:
      return CFSTR("SYS_ROAM_STATUS_BANNER_ON");
    case 12:
      return CFSTR("SYS_ROAM_STATUS_BANNER_OFF");
    default:
      if (a3 == 64)
        return CFSTR("SYS_ROAM_STATUS_HOME_SYSTEM");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsRoamStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_NONE")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_OFF")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_ON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_BLINK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_OUT_OF_BLDG")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_PREF_SYS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_AVAIL_SYS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_ALLIANCE_PARTNER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_PREMIUM_PARTNER")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_FULL_SVC")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_PARTIAL_SVC")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_BANNER_ON")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_BANNER_OFF")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_HOME_SYSTEM")))
  {
    v4 = 64;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)CellularServiceStatus;
  v3 = -[CellularServiceStatus description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularServiceStatus dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSData *simHplmn;
  __int16 v7;
  void *v8;
  NSData *plmn;
  void *v11;
  uint64_t sysMode;
  void *v13;
  void *v14;
  void *v15;
  int srvStatus;
  __CFString *v17;
  int v18;
  void *v19;
  int roamStatus;
  __CFString *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  sysMode = self->_sysMode;
  if (sysMode < 0x10 && ((0x9FFFu >> sysMode) & 1) != 0)
    v13 = *(&off_10025EC00 + sysMode);
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sysMode));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("sys_mode"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_26:
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

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_43;
  }
LABEL_39:
  v18 = self->_srvDomain + 1;
  if (v18 >= 7)
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_srvDomain));
  else
    v19 = *(&off_10025EC80 + v18);
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("srv_domain"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_43:
  roamStatus = self->_roamStatus;
  v21 = CFSTR("SYS_ROAM_STATUS_NONE");
  switch(roamStatus)
  {
    case -1:
      break;
    case 0:
      v21 = CFSTR("SYS_ROAM_STATUS_OFF");
      break;
    case 1:
      v21 = CFSTR("SYS_ROAM_STATUS_ON");
      break;
    case 2:
      v21 = CFSTR("SYS_ROAM_STATUS_BLINK");
      break;
    case 3:
      v21 = CFSTR("SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD");
      break;
    case 4:
      v21 = CFSTR("SYS_ROAM_STATUS_OUT_OF_BLDG");
      break;
    case 5:
      v21 = CFSTR("SYS_ROAM_STATUS_PREF_SYS");
      break;
    case 6:
      v21 = CFSTR("SYS_ROAM_STATUS_AVAIL_SYS");
      break;
    case 7:
      v21 = CFSTR("SYS_ROAM_STATUS_ALLIANCE_PARTNER");
      break;
    case 8:
      v21 = CFSTR("SYS_ROAM_STATUS_PREMIUM_PARTNER");
      break;
    case 9:
      v21 = CFSTR("SYS_ROAM_STATUS_FULL_SVC");
      break;
    case 10:
      v21 = CFSTR("SYS_ROAM_STATUS_PARTIAL_SVC");
      break;
    case 11:
      v21 = CFSTR("SYS_ROAM_STATUS_BANNER_ON");
      break;
    case 12:
      v21 = CFSTR("SYS_ROAM_STATUS_BANNER_OFF");
      break;
    default:
      if (roamStatus == 64)
        v21 = CFSTR("SYS_ROAM_STATUS_HOME_SYSTEM");
      else
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_roamStatus));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("roam_status"));

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationMs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("duration_ms"));

  }
LABEL_8:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    objc_msgSend(v3, "setObject:forKey:", simHplmn, CFSTR("sim_hplmn"));
  v7 = (__int16)self->_has;
  if ((v7 & 0x80) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("subs_id"));

    v7 = (__int16)self->_has;
    if ((v7 & 4) == 0)
    {
LABEL_12:
      if ((v7 & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_12;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("num_subs"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ps_pref"));

  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004A4D4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSData *simHplmn;
  __int16 v7;
  NSData *plmn;
  id v9;

  v4 = a3;
  has = (__int16)self->_has;
  v9 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    v4 = v9;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v9, self->_sysMode, 2);
  v4 = v9;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field(v9, self->_srvStatus, 3);
  v4 = v9;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field(v9, self->_srvDomain, 4);
  v4 = v9;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  PBDataWriterWriteInt32Field(v9, self->_roamStatus, 5);
  v4 = v9;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field(v9, self->_durationMs, 6);
    v4 = v9;
  }
LABEL_8:
  simHplmn = self->_simHplmn;
  if (simHplmn)
  {
    PBDataWriterWriteDataField(v9, simHplmn, 7);
    v4 = v9;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_subsId, 8);
    v4 = v9;
    v7 = (__int16)self->_has;
    if ((v7 & 4) == 0)
    {
LABEL_12:
      if ((v7 & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteUint32Field(v9, self->_numSubs, 9);
  v4 = v9;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    PBDataWriterWriteUint32Field(v9, self->_psPref, 10);
    v4 = v9;
  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn)
  {
    PBDataWriterWriteDataField(v9, plmn, 11);
    v4 = v9;
  }

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
    *((_WORD *)v4 + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 15) = self->_sysMode;
  *((_WORD *)v4 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 13) = self->_srvStatus;
  *((_WORD *)v4 + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 12) = self->_srvDomain;
  *((_WORD *)v4 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  *((_DWORD *)v4 + 9) = self->_roamStatus;
  *((_WORD *)v4 + 32) |= 0x10u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 4) = self->_durationMs;
    *((_WORD *)v4 + 32) |= 2u;
  }
LABEL_8:
  v7 = v4;
  if (self->_simHplmn)
  {
    objc_msgSend(v4, "setSimHplmn:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_subsId;
    *((_WORD *)v4 + 32) |= 0x80u;
    v6 = (__int16)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_12:
      if ((v6 & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v4 + 5) = self->_numSubs;
  *((_WORD *)v4 + 32) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 8) = self->_psPref;
    *((_WORD *)v4 + 32) |= 8u;
  }
LABEL_14:
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
  __int16 has;
  id v8;
  void *v9;
  __int16 v10;
  id v11;
  void *v12;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 15) = self->_sysMode;
  *((_WORD *)v5 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 13) = self->_srvStatus;
  *((_WORD *)v5 + 32) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 12) = self->_srvDomain;
  *((_WORD *)v5 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  *((_DWORD *)v5 + 9) = self->_roamStatus;
  *((_WORD *)v5 + 32) |= 0x10u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 4) = self->_durationMs;
    *((_WORD *)v5 + 32) |= 2u;
  }
LABEL_8:
  v8 = -[NSData copyWithZone:](self->_simHplmn, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x80) == 0)
  {
    if ((v10 & 4) == 0)
      goto LABEL_10;
LABEL_20:
    *((_DWORD *)v6 + 5) = self->_numSubs;
    *((_WORD *)v6 + 32) |= 4u;
    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  *((_DWORD *)v6 + 14) = self->_subsId;
  *((_WORD *)v6 + 32) |= 0x80u;
  v10 = (__int16)self->_has;
  if ((v10 & 4) != 0)
    goto LABEL_20;
LABEL_10:
  if ((v10 & 8) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((_WORD *)v6 + 32) |= 8u;
  }
LABEL_12:
  v11 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  NSData *simHplmn;
  __int16 v9;
  NSData *plmn;
  unsigned __int8 v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_52;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 32);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_52;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_sysMode != *((_DWORD *)v4 + 15))
      goto LABEL_52;
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_srvStatus != *((_DWORD *)v4 + 13))
      goto LABEL_52;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_srvDomain != *((_DWORD *)v4 + 12))
      goto LABEL_52;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_roamStatus != *((_DWORD *)v4 + 9))
      goto LABEL_52;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 4))
      goto LABEL_52;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_52;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:"))
    {
LABEL_52:
      v11 = 0;
      goto LABEL_53;
    }
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)v4 + 32);
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_subsId != *((_DWORD *)v4 + 14))
      goto LABEL_52;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 5))
      goto LABEL_52;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_psPref != *((_DWORD *)v4 + 8))
      goto LABEL_52;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_52;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 3))
    v11 = -[NSData isEqual:](plmn, "isEqual:");
  else
    v11 = 1;
LABEL_53:

  return v11;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_sysMode;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_srvStatus;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_srvDomain;
    if ((has & 0x10) != 0)
      goto LABEL_6;
LABEL_12:
    v8 = 0;
    if ((has & 2) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v7 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_12;
LABEL_6:
  v8 = 2654435761 * self->_roamStatus;
  if ((has & 2) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_durationMs;
    goto LABEL_14;
  }
LABEL_13:
  v9 = 0;
LABEL_14:
  v10 = (unint64_t)-[NSData hash](self->_simHplmn, "hash");
  v11 = (__int16)self->_has;
  if ((v11 & 0x80) == 0)
  {
    v12 = 0;
    if ((v11 & 4) != 0)
      goto LABEL_16;
LABEL_19:
    v13 = 0;
    if ((v11 & 8) != 0)
      goto LABEL_17;
LABEL_20:
    v14 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v12 ^ v13 ^ v14 ^ v10 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
  }
  v12 = 2654435761 * self->_subsId;
  if ((v11 & 4) == 0)
    goto LABEL_19;
LABEL_16:
  v13 = 2654435761 * self->_numSubs;
  if ((v11 & 8) == 0)
    goto LABEL_20;
LABEL_17:
  v14 = 2654435761 * self->_psPref;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v12 ^ v13 ^ v14 ^ v10 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 32);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_sysMode = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  self->_srvStatus = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  self->_srvDomain = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  self->_roamStatus = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 32) & 2) != 0)
  {
LABEL_7:
    self->_durationMs = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_8:
  v7 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[CellularServiceStatus setSimHplmn:](self, "setSimHplmn:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x80) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x80u;
    v6 = *((_WORD *)v4 + 32);
    if ((v6 & 4) == 0)
    {
LABEL_12:
      if ((v6 & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  self->_numSubs = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 32) & 8) != 0)
  {
LABEL_13:
    self->_psPref = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 3))
  {
    -[CellularServiceStatus setPlmn:](self, "setPlmn:");
    v4 = v7;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
  objc_storeStrong((id *)&self->_simHplmn, a3);
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
  objc_storeStrong((id *)&self->_simHplmn, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
