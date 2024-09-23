@implementation CellularRatLacSrvInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
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
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setStandbyPref:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_standbyPref = a3;
}

- (void)setHasStandbyPref:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasStandbyPref
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSid:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_sid = a3;
}

- (void)setHasSid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSid
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNid:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_nid = a3;
}

- (void)setHasNid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCellId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLac
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setGizmoMode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_gizmoMode = a3;
}

- (void)setHasGizmoMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasGizmoMode
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCompanionType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_companionType = a3;
}

- (void)setHasCompanionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCompanionType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSysMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSysMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSrvStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_srvStatus = a3;
}

- (void)setHasSrvStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSrvStatus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSrvDomain:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_srvDomain = a3;
}

- (void)setHasSrvDomain:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSrvDomain
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (int)roamStatus
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_roamStatus;
  else
    return -1;
}

- (void)setRoamStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_roamStatus = a3;
}

- (void)setHasRoamStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRoamStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
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

- (void)setAsubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_asubsId = a3;
}

- (void)setHasAsubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAsubsId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSimPlmn
{
  return self->_simPlmn != 0;
}

- (BOOL)hasPlmn2nd
{
  return self->_plmn2nd != 0;
}

- (void)setLac2nd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_lac2nd = a3;
}

- (void)setHasLac2nd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLac2nd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSysMode2nd:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_sysMode2nd = a3;
}

- (void)setHasSysMode2nd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSysMode2nd
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSrvStatus2nd:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_srvStatus2nd = a3;
}

- (void)setHasSrvStatus2nd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSrvStatus2nd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSrvDomain2nd:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_srvDomain2nd = a3;
}

- (void)setHasSrvDomain2nd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSrvDomain2nd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCellId2nd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cellId2nd = a3;
}

- (void)setHasCellId2nd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCellId2nd
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHdrPersonality:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hdrPersonality = a3;
}

- (void)setHasHdrPersonality:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHdrPersonality
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setElapsedMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_elapsedMs = a3;
}

- (void)setHasElapsedMs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasElapsedMs
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setUpperLayerIndication:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_upperLayerIndication = a3;
}

- (void)setHasUpperLayerIndication:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasUpperLayerIndication
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setScgEverConfigured:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_scgEverConfigured = a3;
}

- (void)setHasScgEverConfigured:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasScgEverConfigured
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setUiNr5gSwitch:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_uiNr5gSwitch = a3;
}

- (void)setHasUiNr5gSwitch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasUiNr5gSwitch
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setDynNr5gEnabling:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dynNr5gEnabling = a3;
}

- (void)setHasDynNr5gEnabling:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDynNr5gEnabling
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularRatLacSrvInfo;
  v3 = -[CellularRatLacSrvInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularRatLacSrvInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $38D75A67934D4523D3B2DC0696C465DD has;
  void *v5;
  NSData *simHplmn;
  void *v7;
  NSData *plmn;
  $38D75A67934D4523D3B2DC0696C465DD v9;
  void *v10;
  NSData *simPlmn;
  NSData *plmn2nd;
  $38D75A67934D4523D3B2DC0696C465DD v13;
  void *v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int roamStatus;
  __CFString *v29;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("version"));

  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
LABEL_5:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    objc_msgSend(v3, "setObject:forKey:", simHplmn, CFSTR("sim_hplmn"));
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_standbyPref));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("standby_pref"));

  }
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sid));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("sid"));

    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x800) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v9 & 4) == 0)
        goto LABEL_14;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v9 & 0x800) == 0)
  {
    goto LABEL_13;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nid));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("nid"));

  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v9 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("cell_id"));

  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v9 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("lac"));

  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v9 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_gizmoMode));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("gizmo_mode"));

  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x10) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v9 & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_companionType));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("companion_type"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v9 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sysMode));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("sys_mode"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v9 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_srvStatus));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("srv_status"));

  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v9 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_srvDomain));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("srv_domain"));

  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v9 & 2) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_54:
  roamStatus = self->_roamStatus;
  v29 = CFSTR("SYS_ROAM_STATUS_NONE");
  switch(roamStatus)
  {
    case -1:
      break;
    case 0:
      v29 = CFSTR("SYS_ROAM_STATUS_OFF");
      break;
    case 1:
      v29 = CFSTR("SYS_ROAM_STATUS_ON");
      break;
    case 2:
      v29 = CFSTR("SYS_ROAM_STATUS_BLINK");
      break;
    case 3:
      v29 = CFSTR("SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD");
      break;
    case 4:
      v29 = CFSTR("SYS_ROAM_STATUS_OUT_OF_BLDG");
      break;
    case 5:
      v29 = CFSTR("SYS_ROAM_STATUS_PREF_SYS");
      break;
    case 6:
      v29 = CFSTR("SYS_ROAM_STATUS_AVAIL_SYS");
      break;
    case 7:
      v29 = CFSTR("SYS_ROAM_STATUS_ALLIANCE_PARTNER");
      break;
    case 8:
      v29 = CFSTR("SYS_ROAM_STATUS_PREMIUM_PARTNER");
      break;
    case 9:
      v29 = CFSTR("SYS_ROAM_STATUS_FULL_SVC");
      break;
    case 10:
      v29 = CFSTR("SYS_ROAM_STATUS_PARTIAL_SVC");
      break;
    case 11:
      v29 = CFSTR("SYS_ROAM_STATUS_BANNER_ON");
      break;
    case 12:
      v29 = CFSTR("SYS_ROAM_STATUS_BANNER_OFF");
      break;
    default:
      if (roamStatus == 64)
        v29 = CFSTR("SYS_ROAM_STATUS_HOME_SYSTEM");
      else
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_roamStatus));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("roam_status"));

  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_22:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_asubsId));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("asubs_id"));

  }
LABEL_23:
  simPlmn = self->_simPlmn;
  if (simPlmn)
    objc_msgSend(v3, "setObject:forKey:", simPlmn, CFSTR("sim_plmn"));
  plmn2nd = self->_plmn2nd;
  if (plmn2nd)
    objc_msgSend(v3, "setObject:forKey:", plmn2nd, CFSTR("plmn_2nd"));
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lac2nd));
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("lac_2nd"));

    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x800000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v13 & 0x80000) == 0)
        goto LABEL_30;
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sysMode2nd));
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("sys_mode_2nd"));

  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v13 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_59;
  }
LABEL_58:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_srvStatus2nd));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("srv_status_2nd"));

  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v13 & 8) == 0)
      goto LABEL_32;
    goto LABEL_60;
  }
LABEL_59:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_srvDomain2nd));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("srv_domain_2nd"));

  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 8) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v13 & 0x100) == 0)
      goto LABEL_33;
    goto LABEL_61;
  }
LABEL_60:
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId2nd));
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("cell_id_2nd"));

  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v13 & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_62;
  }
LABEL_61:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_hdrPersonality));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("hdr_personality"));

  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v13 & 0x1000) == 0)
      goto LABEL_35;
    goto LABEL_63;
  }
LABEL_62:
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elapsedMs));
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("elapsed_ms"));

  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v13 & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_64;
  }
LABEL_63:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("num_subs"));

  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v13 & 0x4000000) == 0)
      goto LABEL_37;
    goto LABEL_65;
  }
LABEL_64:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_upperLayerIndication));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("upper_layer_indication"));

  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v13 & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_66;
  }
LABEL_65:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_scgEverConfigured));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("scg_ever_configured"));

  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v13 & 0x1000000) == 0)
      goto LABEL_39;
LABEL_67:
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_uiNr5gSwitch));
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("ui_nr5g_switch"));

    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_66:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("ps_pref"));

  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) != 0)
    goto LABEL_67;
LABEL_39:
  if ((*(_BYTE *)&v13 & 0x20) != 0)
  {
LABEL_40:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dynNr5gEnabling));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dyn_nr5g_enabling"));

  }
LABEL_41:
  v15 = v3;

  return v15;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10011667C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $38D75A67934D4523D3B2DC0696C465DD has;
  NSData *simHplmn;
  NSData *plmn;
  $38D75A67934D4523D3B2DC0696C465DD v7;
  NSData *simPlmn;
  NSData *plmn2nd;
  $38D75A67934D4523D3B2DC0696C465DD v10;
  id v11;

  v11 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v11, self->_timestamp, 1);
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v11, self->_version, 2);
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field(v11, self->_subsId, 3);
LABEL_5:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    PBDataWriterWriteDataField(v11, simHplmn, 4);
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    PBDataWriterWriteInt32Field(v11, self->_standbyPref, 5);
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v11, plmn, 6);
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) != 0)
  {
    PBDataWriterWriteUint32Field(v11, self->_sid, 7);
    v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x800) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v7 & 4) == 0)
        goto LABEL_14;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v7 & 0x800) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field(v11, self->_nid, 8);
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field(v11, self->_cellId, 9);
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field(v11, self->_lac, 10);
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field(v11, self->_gizmoMode, 11);
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v7 & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field(v11, self->_companionType, 12);
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field(v11, self->_sysMode, 16);
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field(v11, self->_srvStatus, 17);
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field(v11, self->_srvDomain, 18);
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v7 & 2) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_54:
  PBDataWriterWriteInt32Field(v11, self->_roamStatus, 19);
  if ((*(_DWORD *)&self->_has & 2) != 0)
LABEL_22:
    PBDataWriterWriteUint32Field(v11, self->_asubsId, 22);
LABEL_23:
  simPlmn = self->_simPlmn;
  if (simPlmn)
    PBDataWriterWriteDataField(v11, simPlmn, 23);
  plmn2nd = self->_plmn2nd;
  if (plmn2nd)
    PBDataWriterWriteDataField(v11, plmn2nd, 24);
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field(v11, self->_lac2nd, 25);
    v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x800000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v10 & 0x80000) == 0)
        goto LABEL_30;
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteInt32Field(v11, self->_sysMode2nd, 26);
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v10 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field(v11, self->_srvStatus2nd, 27);
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v10 & 8) == 0)
      goto LABEL_32;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field(v11, self->_srvDomain2nd, 28);
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v10 & 0x100) == 0)
      goto LABEL_33;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field(v11, self->_cellId2nd, 29);
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v10 & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field(v11, self->_hdrPersonality, 30);
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v10 & 0x1000) == 0)
      goto LABEL_35;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field(v11, self->_elapsedMs, 32);
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v10 & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field(v11, self->_numSubs, 33);
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v10 & 0x4000000) == 0)
      goto LABEL_37;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField(v11, self->_upperLayerIndication, 34);
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x4000000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v10 & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteBOOLField(v11, self->_scgEverConfigured, 35);
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v10 & 0x1000000) == 0)
      goto LABEL_39;
LABEL_67:
    PBDataWriterWriteUint32Field(v11, self->_uiNr5gSwitch, 37);
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_66:
  PBDataWriterWriteUint32Field(v11, self->_psPref, 36);
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x1000000) != 0)
    goto LABEL_67;
LABEL_39:
  if ((*(_BYTE *)&v10 & 0x20) != 0)
LABEL_40:
    PBDataWriterWriteUint32Field(v11, self->_dynNr5gEnabling, 38);
LABEL_41:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $38D75A67934D4523D3B2DC0696C465DD has;
  $38D75A67934D4523D3B2DC0696C465DD v6;
  $38D75A67934D4523D3B2DC0696C465DD v7;
  _QWORD *v8;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 39) |= 1u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 37) = self->_version;
  *((_DWORD *)v4 + 39) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 33) = self->_subsId;
    *((_DWORD *)v4 + 39) |= 0x200000u;
  }
LABEL_5:
  v8 = v4;
  if (self->_simHplmn)
  {
    objc_msgSend(v4, "setSimHplmn:");
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    *((_DWORD *)v4 + 32) = self->_standbyPref;
    *((_DWORD *)v4 + 39) |= 0x100000u;
  }
  if (self->_plmn)
  {
    objc_msgSend(v8, "setPlmn:");
    v4 = v8;
  }
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_sid;
    *((_DWORD *)v4 + 39) |= 0x8000u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v6 & 4) == 0)
        goto LABEL_14;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 14) = self->_nid;
  *((_DWORD *)v4 + 39) |= 0x800u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 5) = self->_cellId;
  *((_DWORD *)v4 + 39) |= 4u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 12) = self->_lac;
  *((_DWORD *)v4 + 39) |= 0x200u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 10) = self->_gizmoMode;
  *((_DWORD *)v4 + 39) |= 0x80u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 7) = self->_companionType;
  *((_DWORD *)v4 + 39) |= 0x10u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 34) = self->_sysMode;
  *((_DWORD *)v4 + 39) |= 0x400000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 30) = self->_srvStatus;
  *((_DWORD *)v4 + 39) |= 0x40000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 28) = self->_srvDomain;
  *((_DWORD *)v4 + 39) |= 0x10000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_54:
  *((_DWORD *)v4 + 21) = self->_roamStatus;
  *((_DWORD *)v4 + 39) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_22:
    *((_DWORD *)v4 + 4) = self->_asubsId;
    *((_DWORD *)v4 + 39) |= 2u;
  }
LABEL_23:
  if (self->_simPlmn)
  {
    objc_msgSend(v8, "setSimPlmn:");
    v4 = v8;
  }
  if (self->_plmn2nd)
  {
    objc_msgSend(v8, "setPlmn2nd:");
    v4 = v8;
  }
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_lac2nd;
    *((_DWORD *)v4 + 39) |= 0x400u;
    v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x800000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v7 & 0x80000) == 0)
        goto LABEL_30;
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  *((_DWORD *)v4 + 35) = self->_sysMode2nd;
  *((_DWORD *)v4 + 39) |= 0x800000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 31) = self->_srvStatus2nd;
  *((_DWORD *)v4 + 39) |= 0x80000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v7 & 8) == 0)
      goto LABEL_32;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 29) = self->_srvDomain2nd;
  *((_DWORD *)v4 + 39) |= 0x20000u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_33;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 6) = self->_cellId2nd;
  *((_DWORD *)v4 + 39) |= 8u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 11) = self->_hdrPersonality;
  *((_DWORD *)v4 + 39) |= 0x100u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v7 & 0x1000) == 0)
      goto LABEL_35;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 9) = self->_elapsedMs;
  *((_DWORD *)v4 + 39) |= 0x40u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v7 & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 15) = self->_numSubs;
  *((_DWORD *)v4 + 39) |= 0x1000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v7 & 0x4000000) == 0)
      goto LABEL_37;
    goto LABEL_65;
  }
LABEL_64:
  *((_BYTE *)v4 + 153) = self->_upperLayerIndication;
  *((_DWORD *)v4 + 39) |= 0x8000000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x4000000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_66;
  }
LABEL_65:
  *((_BYTE *)v4 + 152) = self->_scgEverConfigured;
  *((_DWORD *)v4 + 39) |= 0x4000000u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0)
      goto LABEL_39;
LABEL_67:
    *((_DWORD *)v4 + 36) = self->_uiNr5gSwitch;
    *((_DWORD *)v4 + 39) |= 0x1000000u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_66:
  *((_DWORD *)v4 + 20) = self->_psPref;
  *((_DWORD *)v4 + 39) |= 0x2000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) != 0)
    goto LABEL_67;
LABEL_39:
  if ((*(_BYTE *)&v7 & 0x20) != 0)
  {
LABEL_40:
    *((_DWORD *)v4 + 8) = self->_dynNr5gEnabling;
    *((_DWORD *)v4 + 39) |= 0x20u;
  }
LABEL_41:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  $38D75A67934D4523D3B2DC0696C465DD has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  $38D75A67934D4523D3B2DC0696C465DD v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  $38D75A67934D4523D3B2DC0696C465DD v17;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 39) |= 1u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 37) = self->_version;
  *((_DWORD *)v5 + 39) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 33) = self->_subsId;
    *((_DWORD *)v5 + 39) |= 0x200000u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_simHplmn, "copyWithZone:", a3);
  v9 = (void *)v6[12];
  v6[12] = v8;

  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    *((_DWORD *)v6 + 32) = self->_standbyPref;
    *((_DWORD *)v6 + 39) |= 0x100000u;
  }
  v10 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v11 = (void *)v6[8];
  v6[8] = v10;

  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
    *((_DWORD *)v6 + 22) = self->_sid;
    *((_DWORD *)v6 + 39) |= 0x8000u;
    v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x800) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&v12 & 4) == 0)
        goto LABEL_10;
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&v12 & 0x800) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v6 + 14) = self->_nid;
  *((_DWORD *)v6 + 39) |= 0x800u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v12 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v6 + 5) = self->_cellId;
  *((_DWORD *)v6 + 39) |= 4u;
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x200) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&v12 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v6 + 12) = self->_lac;
  *((_DWORD *)v6 + 39) |= 0x200u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&v12 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v6 + 10) = self->_gizmoMode;
  *((_DWORD *)v6 + 39) |= 0x80u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v12 & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v6 + 7) = self->_companionType;
  *((_DWORD *)v6 + 39) |= 0x10u;
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v12 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v6 + 34) = self->_sysMode;
  *((_DWORD *)v6 + 39) |= 0x400000u;
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v12 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 30) = self->_srvStatus;
  *((_DWORD *)v6 + 39) |= 0x40000u;
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v12 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v6 + 28) = self->_srvDomain;
  *((_DWORD *)v6 + 39) |= 0x10000u;
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v12 & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_46:
  *((_DWORD *)v6 + 21) = self->_roamStatus;
  *((_DWORD *)v6 + 39) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_18:
    *((_DWORD *)v6 + 4) = self->_asubsId;
    *((_DWORD *)v6 + 39) |= 2u;
  }
LABEL_19:
  v13 = -[NSData copyWithZone:](self->_simPlmn, "copyWithZone:", a3);
  v14 = (void *)v6[13];
  v6[13] = v13;

  v15 = -[NSData copyWithZone:](self->_plmn2nd, "copyWithZone:", a3);
  v16 = (void *)v6[9];
  v6[9] = v15;

  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x400) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_lac2nd;
    *((_DWORD *)v6 + 39) |= 0x400u;
    v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x800000) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v17 & 0x80000) == 0)
        goto LABEL_22;
      goto LABEL_50;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x800000) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v6 + 35) = self->_sysMode2nd;
  *((_DWORD *)v6 + 39) |= 0x800000u;
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x80000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v17 & 0x20000) == 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v6 + 31) = self->_srvStatus2nd;
  *((_DWORD *)v6 + 39) |= 0x80000u;
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x20000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v17 & 8) == 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v6 + 29) = self->_srvDomain2nd;
  *((_DWORD *)v6 + 39) |= 0x20000u;
  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 8) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v17 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v6 + 6) = self->_cellId2nd;
  *((_DWORD *)v6 + 39) |= 8u;
  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x100) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v17 & 0x40) == 0)
      goto LABEL_26;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v6 + 11) = self->_hdrPersonality;
  *((_DWORD *)v6 + 39) |= 0x100u;
  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 0x40) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v17 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v6 + 9) = self->_elapsedMs;
  *((_DWORD *)v6 + 39) |= 0x40u;
  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v17 & 0x8000000) == 0)
      goto LABEL_28;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v6 + 15) = self->_numSubs;
  *((_DWORD *)v6 + 39) |= 0x1000u;
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v17 & 0x4000000) == 0)
      goto LABEL_29;
    goto LABEL_57;
  }
LABEL_56:
  *((_BYTE *)v6 + 153) = self->_upperLayerIndication;
  *((_DWORD *)v6 + 39) |= 0x8000000u;
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x4000000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v17 & 0x2000) == 0)
      goto LABEL_30;
    goto LABEL_58;
  }
LABEL_57:
  *((_BYTE *)v6 + 152) = self->_scgEverConfigured;
  *((_DWORD *)v6 + 39) |= 0x4000000u;
  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x2000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v17 & 0x1000000) == 0)
      goto LABEL_31;
LABEL_59:
    *((_DWORD *)v6 + 36) = self->_uiNr5gSwitch;
    *((_DWORD *)v6 + 39) |= 0x1000000u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      return v6;
    goto LABEL_32;
  }
LABEL_58:
  *((_DWORD *)v6 + 20) = self->_psPref;
  *((_DWORD *)v6 + 39) |= 0x2000u;
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x1000000) != 0)
    goto LABEL_59;
LABEL_31:
  if ((*(_BYTE *)&v17 & 0x20) != 0)
  {
LABEL_32:
    *((_DWORD *)v6 + 8) = self->_dynNr5gEnabling;
    *((_DWORD *)v6 + 39) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $38D75A67934D4523D3B2DC0696C465DD has;
  int v7;
  NSData *simHplmn;
  int v9;
  NSData *plmn;
  int v11;
  NSData *simPlmn;
  NSData *plmn2nd;
  $38D75A67934D4523D3B2DC0696C465DD v14;
  int v15;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_158;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_158;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_version != *((_DWORD *)v4 + 37))
      goto LABEL_158;
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_subsId != *((_DWORD *)v4 + 33))
      goto LABEL_158;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_158;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:"))
      goto LABEL_158;
    has = self->_has;
  }
  v9 = *((_DWORD *)v4 + 39);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) == 0 || self->_standbyPref != *((_DWORD *)v4 + 32))
      goto LABEL_158;
  }
  else if ((v9 & 0x100000) != 0)
  {
    goto LABEL_158;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
      goto LABEL_158;
    has = self->_has;
  }
  v11 = *((_DWORD *)v4 + 39);
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_sid != *((_DWORD *)v4 + 22))
      goto LABEL_158;
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_nid != *((_DWORD *)v4 + 14))
      goto LABEL_158;
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_cellId != *((_DWORD *)v4 + 5))
      goto LABEL_158;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0 || self->_lac != *((_DWORD *)v4 + 12))
      goto LABEL_158;
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_gizmoMode != *((_DWORD *)v4 + 10))
      goto LABEL_158;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_companionType != *((_DWORD *)v4 + 7))
      goto LABEL_158;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v11 & 0x400000) == 0 || self->_sysMode != *((_DWORD *)v4 + 34))
      goto LABEL_158;
  }
  else if ((v11 & 0x400000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v11 & 0x40000) == 0 || self->_srvStatus != *((_DWORD *)v4 + 30))
      goto LABEL_158;
  }
  else if ((v11 & 0x40000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_srvDomain != *((_DWORD *)v4 + 28))
      goto LABEL_158;
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_roamStatus != *((_DWORD *)v4 + 21))
      goto LABEL_158;
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_asubsId != *((_DWORD *)v4 + 4))
      goto LABEL_158;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_158;
  }
  simPlmn = self->_simPlmn;
  if ((unint64_t)simPlmn | *((_QWORD *)v4 + 13) && !-[NSData isEqual:](simPlmn, "isEqual:"))
    goto LABEL_158;
  plmn2nd = self->_plmn2nd;
  if ((unint64_t)plmn2nd | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](plmn2nd, "isEqual:"))
      goto LABEL_158;
  }
  v14 = self->_has;
  v15 = *((_DWORD *)v4 + 39);
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v15 & 0x400) == 0 || self->_lac2nd != *((_DWORD *)v4 + 13))
      goto LABEL_158;
  }
  else if ((v15 & 0x400) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
    if ((v15 & 0x800000) == 0 || self->_sysMode2nd != *((_DWORD *)v4 + 35))
      goto LABEL_158;
  }
  else if ((v15 & 0x800000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0 || self->_srvStatus2nd != *((_DWORD *)v4 + 31))
      goto LABEL_158;
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    if ((v15 & 0x20000) == 0 || self->_srvDomain2nd != *((_DWORD *)v4 + 29))
      goto LABEL_158;
  }
  else if ((v15 & 0x20000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_cellId2nd != *((_DWORD *)v4 + 6))
      goto LABEL_158;
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_hdrPersonality != *((_DWORD *)v4 + 11))
      goto LABEL_158;
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_elapsedMs != *((_DWORD *)v4 + 9))
      goto LABEL_158;
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    if ((v15 & 0x1000) == 0 || self->_numSubs != *((_DWORD *)v4 + 15))
      goto LABEL_158;
  }
  else if ((v15 & 0x1000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v14 & 0x8000000) != 0)
  {
    if ((v15 & 0x8000000) == 0)
      goto LABEL_158;
    if (self->_upperLayerIndication)
    {
      if (!*((_BYTE *)v4 + 153))
        goto LABEL_158;
    }
    else if (*((_BYTE *)v4 + 153))
    {
      goto LABEL_158;
    }
  }
  else if ((v15 & 0x8000000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v14 & 0x4000000) != 0)
  {
    if ((v15 & 0x4000000) != 0)
    {
      if (self->_scgEverConfigured)
      {
        if (!*((_BYTE *)v4 + 152))
          goto LABEL_158;
        goto LABEL_143;
      }
      if (!*((_BYTE *)v4 + 152))
        goto LABEL_143;
    }
LABEL_158:
    v16 = 0;
    goto LABEL_159;
  }
  if ((v15 & 0x4000000) != 0)
    goto LABEL_158;
LABEL_143:
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0 || self->_psPref != *((_DWORD *)v4 + 20))
      goto LABEL_158;
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v14 & 0x1000000) != 0)
  {
    if ((v15 & 0x1000000) == 0 || self->_uiNr5gSwitch != *((_DWORD *)v4 + 36))
      goto LABEL_158;
  }
  else if ((v15 & 0x1000000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_dynNr5gEnabling != *((_DWORD *)v4 + 8))
      goto LABEL_158;
    v16 = 1;
  }
  else
  {
    v16 = (*((_DWORD *)v4 + 39) & 0x20) == 0;
  }
LABEL_159:

  return v16;
}

- (unint64_t)hash
{
  $38D75A67934D4523D3B2DC0696C465DD has;
  $38D75A67934D4523D3B2DC0696C465DD v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  $38D75A67934D4523D3B2DC0696C465DD v13;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
    v38 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_3;
LABEL_6:
    v37 = 0;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v38 = 2654435761u * self->_timestamp;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
    goto LABEL_6;
LABEL_3:
  v37 = 2654435761 * self->_version;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_4:
    v36 = 2654435761 * self->_subsId;
    goto LABEL_8;
  }
LABEL_7:
  v36 = 0;
LABEL_8:
  v35 = (unint64_t)-[NSData hash](self->_simHplmn, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    v34 = 2654435761 * self->_standbyPref;
  else
    v34 = 0;
  v33 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
    v32 = 2654435761 * self->_sid;
    if ((*(_WORD *)&v4 & 0x800) != 0)
    {
LABEL_13:
      v31 = 2654435761 * self->_nid;
      if ((*(_BYTE *)&v4 & 4) != 0)
        goto LABEL_14;
      goto LABEL_25;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_WORD *)&v4 & 0x800) != 0)
      goto LABEL_13;
  }
  v31 = 0;
  if ((*(_BYTE *)&v4 & 4) != 0)
  {
LABEL_14:
    v30 = 2654435761 * self->_cellId;
    if ((*(_WORD *)&v4 & 0x200) != 0)
      goto LABEL_15;
    goto LABEL_26;
  }
LABEL_25:
  v30 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_15:
    v29 = 2654435761 * self->_lac;
    if ((*(_BYTE *)&v4 & 0x80) != 0)
      goto LABEL_16;
    goto LABEL_27;
  }
LABEL_26:
  v29 = 0;
  if ((*(_BYTE *)&v4 & 0x80) != 0)
  {
LABEL_16:
    v28 = 2654435761 * self->_gizmoMode;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
      goto LABEL_17;
    goto LABEL_28;
  }
LABEL_27:
  v28 = 0;
  if ((*(_BYTE *)&v4 & 0x10) != 0)
  {
LABEL_17:
    v5 = 2654435761 * self->_companionType;
    if ((*(_DWORD *)&v4 & 0x400000) != 0)
      goto LABEL_18;
    goto LABEL_29;
  }
LABEL_28:
  v5 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_18:
    v6 = 2654435761 * self->_sysMode;
    if ((*(_DWORD *)&v4 & 0x40000) != 0)
      goto LABEL_19;
    goto LABEL_30;
  }
LABEL_29:
  v6 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_19:
    v7 = 2654435761 * self->_srvStatus;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
      goto LABEL_20;
    goto LABEL_31;
  }
LABEL_30:
  v7 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_20:
    v8 = 2654435761 * self->_srvDomain;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_21;
LABEL_32:
    v9 = 0;
    if ((*(_BYTE *)&v4 & 2) != 0)
      goto LABEL_22;
    goto LABEL_33;
  }
LABEL_31:
  v8 = 0;
  if ((*(_WORD *)&v4 & 0x4000) == 0)
    goto LABEL_32;
LABEL_21:
  v9 = 2654435761 * self->_roamStatus;
  if ((*(_BYTE *)&v4 & 2) != 0)
  {
LABEL_22:
    v10 = 2654435761 * self->_asubsId;
    goto LABEL_34;
  }
LABEL_33:
  v10 = 0;
LABEL_34:
  v11 = (unint64_t)-[NSData hash](self->_simPlmn, "hash");
  v12 = (unint64_t)-[NSData hash](self->_plmn2nd, "hash");
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
    v14 = 2654435761 * self->_lac2nd;
    if ((*(_DWORD *)&v13 & 0x800000) != 0)
    {
LABEL_36:
      v15 = 2654435761 * self->_sysMode2nd;
      if ((*(_DWORD *)&v13 & 0x80000) != 0)
        goto LABEL_37;
      goto LABEL_50;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_DWORD *)&v13 & 0x800000) != 0)
      goto LABEL_36;
  }
  v15 = 0;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
LABEL_37:
    v16 = 2654435761 * self->_srvStatus2nd;
    if ((*(_DWORD *)&v13 & 0x20000) != 0)
      goto LABEL_38;
    goto LABEL_51;
  }
LABEL_50:
  v16 = 0;
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
LABEL_38:
    v17 = 2654435761 * self->_srvDomain2nd;
    if ((*(_BYTE *)&v13 & 8) != 0)
      goto LABEL_39;
    goto LABEL_52;
  }
LABEL_51:
  v17 = 0;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
LABEL_39:
    v18 = 2654435761 * self->_cellId2nd;
    if ((*(_WORD *)&v13 & 0x100) != 0)
      goto LABEL_40;
    goto LABEL_53;
  }
LABEL_52:
  v18 = 0;
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
LABEL_40:
    v19 = 2654435761 * self->_hdrPersonality;
    if ((*(_BYTE *)&v13 & 0x40) != 0)
      goto LABEL_41;
    goto LABEL_54;
  }
LABEL_53:
  v19 = 0;
  if ((*(_BYTE *)&v13 & 0x40) != 0)
  {
LABEL_41:
    v20 = 2654435761 * self->_elapsedMs;
    if ((*(_WORD *)&v13 & 0x1000) != 0)
      goto LABEL_42;
    goto LABEL_55;
  }
LABEL_54:
  v20 = 0;
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
LABEL_42:
    v21 = 2654435761 * self->_numSubs;
    if ((*(_DWORD *)&v13 & 0x8000000) != 0)
      goto LABEL_43;
    goto LABEL_56;
  }
LABEL_55:
  v21 = 0;
  if ((*(_DWORD *)&v13 & 0x8000000) != 0)
  {
LABEL_43:
    v22 = 2654435761 * self->_upperLayerIndication;
    if ((*(_DWORD *)&v13 & 0x4000000) != 0)
      goto LABEL_44;
    goto LABEL_57;
  }
LABEL_56:
  v22 = 0;
  if ((*(_DWORD *)&v13 & 0x4000000) != 0)
  {
LABEL_44:
    v23 = 2654435761 * self->_scgEverConfigured;
    if ((*(_WORD *)&v13 & 0x2000) != 0)
      goto LABEL_45;
    goto LABEL_58;
  }
LABEL_57:
  v23 = 0;
  if ((*(_WORD *)&v13 & 0x2000) != 0)
  {
LABEL_45:
    v24 = 2654435761 * self->_psPref;
    if ((*(_DWORD *)&v13 & 0x1000000) != 0)
      goto LABEL_46;
LABEL_59:
    v25 = 0;
    if ((*(_BYTE *)&v13 & 0x20) != 0)
      goto LABEL_47;
LABEL_60:
    v26 = 0;
    return v37 ^ v38 ^ v36 ^ v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
  }
LABEL_58:
  v24 = 0;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
    goto LABEL_59;
LABEL_46:
  v25 = 2654435761 * self->_uiNr5gSwitch;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
    goto LABEL_60;
LABEL_47:
  v26 = 2654435761 * self->_dynNr5gEnabling;
  return v37 ^ v38 ^ v36 ^ v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 39);
    if ((v5 & 0x2000000) == 0)
    {
LABEL_3:
      if ((v5 & 0x200000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)v4 + 39) & 0x200000) != 0)
  {
LABEL_4:
    self->_subsId = *((_DWORD *)v4 + 33);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_5:
  v8 = v4;
  if (*((_QWORD *)v4 + 12))
  {
    -[CellularRatLacSrvInfo setSimHplmn:](self, "setSimHplmn:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 158) & 0x10) != 0)
  {
    self->_standbyPref = *((_DWORD *)v4 + 32);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[CellularRatLacSrvInfo setPlmn:](self, "setPlmn:");
    v4 = v8;
  }
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x8000) != 0)
  {
    self->_sid = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x8000u;
    v6 = *((_DWORD *)v4 + 39);
    if ((v6 & 0x800) == 0)
    {
LABEL_13:
      if ((v6 & 4) == 0)
        goto LABEL_14;
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_13;
  }
  self->_nid = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 4) == 0)
  {
LABEL_14:
    if ((v6 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  self->_cellId = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x200) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  self->_lac = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x80) == 0)
  {
LABEL_16:
    if ((v6 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  self->_gizmoMode = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x10) == 0)
  {
LABEL_17:
    if ((v6 & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  self->_companionType = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x400000) == 0)
  {
LABEL_18:
    if ((v6 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  self->_sysMode = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_has |= 0x400000u;
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x40000) == 0)
  {
LABEL_19:
    if ((v6 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  self->_srvStatus = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x40000u;
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((v6 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  self->_srvDomain = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x10000u;
  v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((v6 & 2) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_54:
  self->_roamStatus = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 39) & 2) != 0)
  {
LABEL_22:
    self->_asubsId = *((_DWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 2u;
  }
LABEL_23:
  if (*((_QWORD *)v4 + 13))
  {
    -[CellularRatLacSrvInfo setSimPlmn:](self, "setSimPlmn:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[CellularRatLacSrvInfo setPlmn2nd:](self, "setPlmn2nd:");
    v4 = v8;
  }
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x400) != 0)
  {
    self->_lac2nd = *((_DWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
    v7 = *((_DWORD *)v4 + 39);
    if ((v7 & 0x800000) == 0)
    {
LABEL_29:
      if ((v7 & 0x80000) == 0)
        goto LABEL_30;
      goto LABEL_58;
    }
  }
  else if ((v7 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  self->_sysMode2nd = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_has |= 0x800000u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x80000) == 0)
  {
LABEL_30:
    if ((v7 & 0x20000) == 0)
      goto LABEL_31;
    goto LABEL_59;
  }
LABEL_58:
  self->_srvStatus2nd = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x80000u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x20000) == 0)
  {
LABEL_31:
    if ((v7 & 8) == 0)
      goto LABEL_32;
    goto LABEL_60;
  }
LABEL_59:
  self->_srvDomain2nd = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x20000u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 8) == 0)
  {
LABEL_32:
    if ((v7 & 0x100) == 0)
      goto LABEL_33;
    goto LABEL_61;
  }
LABEL_60:
  self->_cellId2nd = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x100) == 0)
  {
LABEL_33:
    if ((v7 & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_62;
  }
LABEL_61:
  self->_hdrPersonality = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x40) == 0)
  {
LABEL_34:
    if ((v7 & 0x1000) == 0)
      goto LABEL_35;
    goto LABEL_63;
  }
LABEL_62:
  self->_elapsedMs = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x1000) == 0)
  {
LABEL_35:
    if ((v7 & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_64;
  }
LABEL_63:
  self->_numSubs = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x8000000) == 0)
  {
LABEL_36:
    if ((v7 & 0x4000000) == 0)
      goto LABEL_37;
    goto LABEL_65;
  }
LABEL_64:
  self->_upperLayerIndication = *((_BYTE *)v4 + 153);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x4000000) == 0)
  {
LABEL_37:
    if ((v7 & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_66;
  }
LABEL_65:
  self->_scgEverConfigured = *((_BYTE *)v4 + 152);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x2000) == 0)
  {
LABEL_38:
    if ((v7 & 0x1000000) == 0)
      goto LABEL_39;
LABEL_67:
    self->_uiNr5gSwitch = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_has |= 0x1000000u;
    if ((*((_DWORD *)v4 + 39) & 0x20) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_66:
  self->_psPref = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x2000u;
  v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x1000000) != 0)
    goto LABEL_67;
LABEL_39:
  if ((v7 & 0x20) != 0)
  {
LABEL_40:
    self->_dynNr5gEnabling = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_41:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
  objc_storeStrong((id *)&self->_simHplmn, a3);
}

- (int)standbyPref
{
  return self->_standbyPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (unsigned)sid
{
  return self->_sid;
}

- (unsigned)nid
{
  return self->_nid;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)lac
{
  return self->_lac;
}

- (unsigned)gizmoMode
{
  return self->_gizmoMode;
}

- (unsigned)companionType
{
  return self->_companionType;
}

- (int)sysMode
{
  return self->_sysMode;
}

- (int)srvStatus
{
  return self->_srvStatus;
}

- (int)srvDomain
{
  return self->_srvDomain;
}

- (unsigned)asubsId
{
  return self->_asubsId;
}

- (NSData)simPlmn
{
  return self->_simPlmn;
}

- (void)setSimPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_simPlmn, a3);
}

- (NSData)plmn2nd
{
  return self->_plmn2nd;
}

- (void)setPlmn2nd:(id)a3
{
  objc_storeStrong((id *)&self->_plmn2nd, a3);
}

- (unsigned)lac2nd
{
  return self->_lac2nd;
}

- (int)sysMode2nd
{
  return self->_sysMode2nd;
}

- (int)srvStatus2nd
{
  return self->_srvStatus2nd;
}

- (int)srvDomain2nd
{
  return self->_srvDomain2nd;
}

- (unsigned)cellId2nd
{
  return self->_cellId2nd;
}

- (int)hdrPersonality
{
  return self->_hdrPersonality;
}

- (unsigned)elapsedMs
{
  return self->_elapsedMs;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (BOOL)upperLayerIndication
{
  return self->_upperLayerIndication;
}

- (BOOL)scgEverConfigured
{
  return self->_scgEverConfigured;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)uiNr5gSwitch
{
  return self->_uiNr5gSwitch;
}

- (unsigned)dynNr5gEnabling
{
  return self->_dynNr5gEnabling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simPlmn, 0);
  objc_storeStrong((id *)&self->_simHplmn, 0);
  objc_storeStrong((id *)&self->_plmn2nd, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
