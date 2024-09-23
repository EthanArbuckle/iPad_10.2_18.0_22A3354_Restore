@implementation CellularHealthMonitor

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_countOfInvalidationReasons, a2);
  v3.receiver = self;
  v3.super_class = (Class)CellularHealthMonitor;
  -[CellularHealthMonitor dealloc](&v3, "dealloc");
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasImei
{
  return self->_imei != 0;
}

- (int)rat
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_rat;
  else
    return 0;
}

- (void)setRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRat
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)ratAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025F7F8 + a3);
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

- (int)dataStallType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_dataStallType;
  else
    return 0;
}

- (void)setDataStallType:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_dataStallType = a3;
}

- (void)setHasDataStallType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDataStallType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)dataStallTypeAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F7C8 + a3);
}

- (int)StringAsDataStallType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_DL_DATA_STALL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_UL_DATA_STALL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_WRITE_ERROR_STALL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BB_DL_AS_DATA_STALL_VIA_QSH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BB_UL_AS_DATA_STALL_VIA_QSH")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAX_STALL_TYPE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)lastSearchRat
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_lastSearchRat;
  else
    return 0;
}

- (void)setLastSearchRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_lastSearchRat = a3;
}

- (void)setHasLastSearchRat:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLastSearchRat
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)lastSearchRatAsString:(int)a3
{
  void *v3;

  if (a3 < 0x10 && ((0x9FFFu >> a3) & 1) != 0)
    v3 = *(&off_10025F7F8 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsLastSearchRat:(id)a3
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

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setRepeatedScgFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_repeatedScgFailures = a3;
}

- (void)setHasRepeatedScgFailures:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRepeatedScgFailures
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRepeatedBeamFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_repeatedBeamFailures = a3;
}

- (void)setHasRepeatedBeamFailures:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRepeatedBeamFailures
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (int)hmType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_hmType;
  else
    return 0;
}

- (void)setHmType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_hmType = a3;
}

- (void)setHasHmType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHmType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)hmTypeAsString:(int)a3
{
  if (a3 >= 0x12)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F878 + a3);
}

- (int)StringAsHmType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_TYPE_NO_SEARCH")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_TYPE_DATA_STALLED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_TYPE_DATA_IN_SLEEP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_TYPE_STUCK_IN_DCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_TYPE_NO_TCXO_SHUTDOWN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_TYPE_SIM_ERROR")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_TYPE_5G_ACCESS_WHEN_RESTRICTED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_TYPE_5G_REPEATED_SCG_FAILURES")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_TYPE_5G_REPEATED_BEAM_FAILURES")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_FREQUENT_LTE_RLF")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITO_FREQUENT_LTE_RACH_FAILURES")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_FREQUENT_NR_RLF")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_FREQUENT_NR_RACH_FAILURES")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_FREQUENT_NR_CELL_INVALIDATION")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_BAD_FBRX_MEASUREMENT")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_BAD_PDET_MEASUREMENT")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_LTE_RSRP_FLOOR")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HEALTH_MONITOR_NR5G_RSRP_FLOOR")))
  {
    v4 = 17;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNumSubs
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setDcActive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_dcActive = a3;
}

- (void)setHasDcActive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasDcActive
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setLacTac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_lacTac = a3;
}

- (void)setHasLacTac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLacTac
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCellId:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCellId
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRepeatedLteRlfFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_repeatedLteRlfFailures = a3;
}

- (void)setHasRepeatedLteRlfFailures:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRepeatedLteRlfFailures
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRepeatedLteRachFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_repeatedLteRachFailures = a3;
}

- (void)setHasRepeatedLteRachFailures:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRepeatedLteRachFailures
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRepeatedNrRlfFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_repeatedNrRlfFailures = a3;
}

- (void)setHasRepeatedNrRlfFailures:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRepeatedNrRlfFailures
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setRepeatedNrRachFailures:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_repeatedNrRachFailures = a3;
}

- (void)setHasRepeatedNrRachFailures:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasRepeatedNrRachFailures
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRepeatedNrCellInvalidationOccurences:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_repeatedNrCellInvalidationOccurences = a3;
}

- (void)setHasRepeatedNrCellInvalidationOccurences:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRepeatedNrCellInvalidationOccurences
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setRepeatedNrCellInvalidationPci:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_repeatedNrCellInvalidationPci = a3;
}

- (void)setHasRepeatedNrCellInvalidationPci:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRepeatedNrCellInvalidationPci
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRepeatedNrCellInvalidationArfcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_repeatedNrCellInvalidationArfcn = a3;
}

- (void)setHasRepeatedNrCellInvalidationArfcn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRepeatedNrCellInvalidationArfcn
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRepeatedNrCellInvalidationBand:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_repeatedNrCellInvalidationBand = a3;
}

- (void)setHasRepeatedNrCellInvalidationBand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRepeatedNrCellInvalidationBand
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (unint64_t)countOfInvalidationReasonsCount
{
  return self->_countOfInvalidationReasons.count;
}

- (unsigned)countOfInvalidationReasons
{
  return self->_countOfInvalidationReasons.list;
}

- (void)clearCountOfInvalidationReasons
{
  PBRepeatedUInt32Clear(&self->_countOfInvalidationReasons, a2);
}

- (void)addCountOfInvalidationReason:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_countOfInvalidationReasons, *(_QWORD *)&a3);
}

- (unsigned)countOfInvalidationReasonAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_countOfInvalidationReasons;
  unint64_t count;
  void *v6;
  void *v7;

  p_countOfInvalidationReasons = &self->_countOfInvalidationReasons;
  count = self->_countOfInvalidationReasons.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_countOfInvalidationReasons->list[a3];
}

- (void)setCountOfInvalidationReasons:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_countOfInvalidationReasons, a3, a4);
}

- (void)setRxChain:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_rxChain = a3;
}

- (void)setHasRxChain:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRxChain
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setFreqRange:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_freqRange = a3;
}

- (void)setHasFreqRange:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasFreqRange
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)fbrxRsrpRat
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_fbrxRsrpRat;
  else
    return 0;
}

- (void)setFbrxRsrpRat:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_fbrxRsrpRat = a3;
}

- (void)setHasFbrxRsrpRat:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($2B764557029E21ADF691D3FFD146E5E8)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFbrxRsrpRat
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)fbrxRsrpRatAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F908 + a3);
}

- (int)StringAsFbrxRsrpRat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RF_TECH_ID_LTE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RF_TECH_ID_1x")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RF_TECH_ID_HDR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RF_TECH_ID_GSM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RF_TECH_ID_WCDMA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RF_TECH_ID_TDSCDMA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RF_TECH_ID_NR5G")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularHealthMonitor;
  v3 = -[CellularHealthMonitor description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularHealthMonitor dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *imei;
  $2B764557029E21ADF691D3FFD146E5E8 has;
  void *v7;
  NSData *plmn;
  void *v9;
  NSData *simHplmn;
  $2B764557029E21ADF691D3FFD146E5E8 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  $2B764557029E21ADF691D3FFD146E5E8 v15;
  uint64_t rat;
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
  void *v28;
  void *v29;
  uint64_t fbrxRsrpRat;
  void *v31;
  id v32;
  uint64_t dataStallType;
  void *v35;
  uint64_t lastSearchRat;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t hmType;
  void *v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  imei = self->_imei;
  if (imei)
    objc_msgSend(v3, "setObject:forKey:", imei, CFSTR("imei"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    rat = self->_rat;
    if (rat < 0x10 && ((0x9FFFu >> rat) & 1) != 0)
      v17 = *(&off_10025F7F8 + rat);
    else
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rat));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("rat"));

    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_63;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_7;
  }
  dataStallType = self->_dataStallType;
  if (dataStallType >= 6)
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dataStallType));
  else
    v35 = *(&off_10025F7C8 + dataStallType);
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("data_stall_type"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_9;
    goto LABEL_68;
  }
LABEL_63:
  lastSearchRat = self->_lastSearchRat;
  if (lastSearchRat < 0x10 && ((0x9FFFu >> lastSearchRat) & 1) != 0)
    v37 = *(&off_10025F7F8 + lastSearchRat);
  else
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_lastSearchRat));
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("last_search_rat"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_69;
  }
LABEL_68:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("subs_id"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_70;
  }
LABEL_69:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_repeatedScgFailures));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("repeated_scg_failures"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_71;
  }
LABEL_70:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_repeatedBeamFailures));
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("repeated_beam_failures"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_71:
  hmType = self->_hmType;
  if (hmType >= 0x12)
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hmType));
  else
    v42 = *(&off_10025F878 + hmType);
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("hm_type"));

  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("num_subs"));

  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("ps_pref"));

  }
  simHplmn = self->_simHplmn;
  if (simHplmn)
    objc_msgSend(v3, "setObject:forKey:", simHplmn, CFSTR("sim_hplmn"));
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_dcActive));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("dc_active"));

    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 0x40) == 0)
    {
LABEL_22:
      if ((*(_BYTE *)&v11 & 1) == 0)
        goto LABEL_23;
      goto LABEL_41;
    }
  }
  else if ((*(_BYTE *)&v11 & 0x40) == 0)
  {
    goto LABEL_22;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lacTac));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("lac_tac"));

  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 1) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v11 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_42;
  }
LABEL_41:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("cell_id"));

  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v11 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_43;
  }
LABEL_42:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_repeatedLteRlfFailures));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("repeated_lte_rlf_failures"));

  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v11 & 0x80000) == 0)
      goto LABEL_26;
    goto LABEL_44;
  }
LABEL_43:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_repeatedLteRachFailures));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("repeated_lte_rach_failures"));

  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v11 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_45;
  }
LABEL_44:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_repeatedNrRlfFailures));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("repeated_nr_rlf_failures"));

  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v11 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_46;
  }
LABEL_45:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_repeatedNrRachFailures));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("repeated_nr_rach_failures"));

  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v11 & 0x20000) == 0)
      goto LABEL_29;
    goto LABEL_47;
  }
LABEL_46:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_repeatedNrCellInvalidationOccurences));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("repeated_nr_cell_invalidation_occurences"));

  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v11 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_48;
  }
LABEL_47:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_repeatedNrCellInvalidationPci));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("repeated_nr_cell_invalidation_pci"));

  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v11 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_48:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_repeatedNrCellInvalidationArfcn));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("repeated_nr_cell_invalidation_arfcn"));

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_31:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_repeatedNrCellInvalidationBand));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("repeated_nr_cell_invalidation_band"));

  }
LABEL_32:
  v13 = PBRepeatedUInt32NSArray(&self->_countOfInvalidationReasons);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("count_of_invalidation_reason"));

  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x200000) == 0)
  {
    if ((*(_BYTE *)&v15 & 0x10) == 0)
      goto LABEL_34;
LABEL_51:
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqRange));
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("freq_range"));

    if ((*(_DWORD *)&self->_has & 8) == 0)
      goto LABEL_56;
    goto LABEL_52;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rxChain));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("rx_chain"));

  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x10) != 0)
    goto LABEL_51;
LABEL_34:
  if ((*(_BYTE *)&v15 & 8) == 0)
    goto LABEL_56;
LABEL_52:
  fbrxRsrpRat = self->_fbrxRsrpRat;
  if (fbrxRsrpRat >= 7)
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_fbrxRsrpRat));
  else
    v31 = *(&off_10025F908 + fbrxRsrpRat);
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("fbrx_rsrp_rat"));

LABEL_56:
  v32 = v3;

  return v32;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000DBC38((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *imei;
  $2B764557029E21ADF691D3FFD146E5E8 has;
  NSData *plmn;
  NSData *simHplmn;
  $2B764557029E21ADF691D3FFD146E5E8 v9;
  unint64_t v10;
  $2B764557029E21ADF691D3FFD146E5E8 v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    v4 = v12;
  }
  imei = self->_imei;
  if (imei)
  {
    PBDataWriterWriteDataField(v12, imei, 2);
    v4 = v12;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field(v12, self->_rat, 3);
    v4 = v12;
    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field(v12, self->_dataStallType, 4);
  v4 = v12;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field(v12, self->_lastSearchRat, 5);
  v4 = v12;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field(v12, self->_subsId, 6);
  v4 = v12;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field(v12, self->_repeatedScgFailures, 7);
  v4 = v12;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field(v12, self->_repeatedBeamFailures, 8);
  v4 = v12;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_46:
  PBDataWriterWriteInt32Field(v12, self->_hmType, 9);
  v4 = v12;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    PBDataWriterWriteUint32Field(v12, self->_numSubs, 10);
    v4 = v12;
  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn)
  {
    PBDataWriterWriteDataField(v12, plmn, 11);
    v4 = v12;
  }
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v12, self->_psPref, 12);
    v4 = v12;
  }
  simHplmn = self->_simHplmn;
  if (simHplmn)
  {
    PBDataWriterWriteDataField(v12, simHplmn, 13);
    v4 = v12;
  }
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField(v12, self->_dcActive, 14);
    v4 = v12;
    v9 = self->_has;
    if ((*(_BYTE *)&v9 & 0x40) == 0)
    {
LABEL_22:
      if ((*(_BYTE *)&v9 & 1) == 0)
        goto LABEL_23;
      goto LABEL_50;
    }
  }
  else if ((*(_BYTE *)&v9 & 0x40) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteUint32Field(v12, self->_lacTac, 15);
  v4 = v12;
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 1) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v9 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint64Field(v12, self->_cellId, 16);
  v4 = v12;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v9 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field(v12, self->_repeatedLteRlfFailures, 17);
  v4 = v12;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v9 & 0x80000) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field(v12, self->_repeatedLteRachFailures, 18);
  v4 = v12;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v9 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field(v12, self->_repeatedNrRlfFailures, 19);
  v4 = v12;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field(v12, self->_repeatedNrRachFailures, 20);
  v4 = v12;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v9 & 0x20000) == 0)
      goto LABEL_29;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field(v12, self->_repeatedNrCellInvalidationOccurences, 21);
  v4 = v12;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v9 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field(v12, self->_repeatedNrCellInvalidationPci, 22);
  v4 = v12;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v9 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_57:
  PBDataWriterWriteUint32Field(v12, self->_repeatedNrCellInvalidationArfcn, 23);
  v4 = v12;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_31:
    PBDataWriterWriteUint32Field(v12, self->_repeatedNrCellInvalidationBand, 24);
    v4 = v12;
  }
LABEL_32:
  if (self->_countOfInvalidationReasons.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v12, self->_countOfInvalidationReasons.list[v10], 25);
      v4 = v12;
      ++v10;
    }
    while (v10 < self->_countOfInvalidationReasons.count);
  }
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x200000) == 0)
  {
    if ((*(_BYTE *)&v11 & 0x10) == 0)
      goto LABEL_37;
LABEL_60:
    PBDataWriterWriteUint32Field(v12, self->_freqRange, 27);
    v4 = v12;
    if ((*(_DWORD *)&self->_has & 8) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
  PBDataWriterWriteUint32Field(v12, self->_rxChain, 26);
  v4 = v12;
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x10) != 0)
    goto LABEL_60;
LABEL_37:
  if ((*(_BYTE *)&v11 & 8) != 0)
  {
LABEL_38:
    PBDataWriterWriteInt32Field(v12, self->_fbrxRsrpRat, 28);
    v4 = v12;
  }
LABEL_39:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $2B764557029E21ADF691D3FFD146E5E8 has;
  $2B764557029E21ADF691D3FFD146E5E8 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  $2B764557029E21ADF691D3FFD146E5E8 v10;
  _DWORD *v11;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[5] = self->_timestamp;
    *((_DWORD *)v4 + 42) |= 2u;
  }
  v11 = v4;
  if (self->_imei)
  {
    objc_msgSend(v4, "setImei:");
    v4 = v11;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_rat;
    *((_DWORD *)v4 + 42) |= 0x400u;
    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_43;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 12) = self->_dataStallType;
  *((_DWORD *)v4 + 42) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 19) = self->_lastSearchRat;
  *((_DWORD *)v4 + 42) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 40) = self->_subsId;
  *((_DWORD *)v4 + 42) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 35) = self->_repeatedScgFailures;
  *((_DWORD *)v4 + 42) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 26) = self->_repeatedBeamFailures;
  *((_DWORD *)v4 + 42) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_47:
  *((_DWORD *)v4 + 15) = self->_hmType;
  *((_DWORD *)v4 + 42) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 20) = self->_numSubs;
    *((_DWORD *)v4 + 42) |= 0x100u;
  }
LABEL_14:
  if (self->_plmn)
  {
    objc_msgSend(v11, "setPlmn:");
    v4 = v11;
  }
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_psPref;
    *((_DWORD *)v4 + 42) |= 0x200u;
  }
  if (self->_simHplmn)
  {
    objc_msgSend(v11, "setSimHplmn:");
    v4 = v11;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    *((_BYTE *)v4 + 164) = self->_dcActive;
    *((_DWORD *)v4 + 42) |= 0x800000u;
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 0x40) == 0)
    {
LABEL_22:
      if ((*(_BYTE *)&v6 & 1) == 0)
        goto LABEL_23;
      goto LABEL_51;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
    goto LABEL_22;
  }
  *((_DWORD *)v4 + 18) = self->_lacTac;
  *((_DWORD *)v4 + 42) |= 0x40u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  v4[4] = self->_cellId;
  *((_DWORD *)v4 + 42) |= 1u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 28) = self->_repeatedLteRlfFailures;
  *((_DWORD *)v4 + 42) |= 0x2000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_26;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 27) = self->_repeatedLteRachFailures;
  *((_DWORD *)v4 + 42) |= 0x1000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 34) = self->_repeatedNrRlfFailures;
  *((_DWORD *)v4 + 42) |= 0x80000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 33) = self->_repeatedNrRachFailures;
  *((_DWORD *)v4 + 42) |= 0x40000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x20000) == 0)
      goto LABEL_29;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 31) = self->_repeatedNrCellInvalidationOccurences;
  *((_DWORD *)v4 + 42) |= 0x10000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_30;
LABEL_58:
    *((_DWORD *)v4 + 29) = self->_repeatedNrCellInvalidationArfcn;
    *((_DWORD *)v4 + 42) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_57:
  *((_DWORD *)v4 + 32) = self->_repeatedNrCellInvalidationPci;
  *((_DWORD *)v4 + 42) |= 0x20000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
    goto LABEL_58;
LABEL_30:
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
LABEL_31:
    *((_DWORD *)v4 + 30) = self->_repeatedNrCellInvalidationBand;
    *((_DWORD *)v4 + 42) |= 0x8000u;
  }
LABEL_32:
  if (-[CellularHealthMonitor countOfInvalidationReasonsCount](self, "countOfInvalidationReasonsCount"))
  {
    objc_msgSend(v11, "clearCountOfInvalidationReasons");
    v7 = -[CellularHealthMonitor countOfInvalidationReasonsCount](self, "countOfInvalidationReasonsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(v11, "addCountOfInvalidationReason:", -[CellularHealthMonitor countOfInvalidationReasonAtIndex:](self, "countOfInvalidationReasonAtIndex:", i));
    }
  }
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
    if ((*(_BYTE *)&v10 & 0x10) == 0)
      goto LABEL_38;
LABEL_61:
    v11[14] = self->_freqRange;
    v11[42] |= 0x10u;
    if ((*(_DWORD *)&self->_has & 8) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
  v11[36] = self->_rxChain;
  v11[42] |= 0x200000u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x10) != 0)
    goto LABEL_61;
LABEL_38:
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
LABEL_39:
    v11[13] = self->_fbrxRsrpRat;
    v11[42] |= 8u;
  }
LABEL_40:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  $2B764557029E21ADF691D3FFD146E5E8 has;
  id v10;
  void *v11;
  id v12;
  void *v13;
  $2B764557029E21ADF691D3FFD146E5E8 v14;
  $2B764557029E21ADF691D3FFD146E5E8 v15;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[5] = self->_timestamp;
    *((_DWORD *)v5 + 42) |= 2u;
  }
  v7 = -[NSData copyWithZone:](self->_imei, "copyWithZone:", a3);
  v8 = (void *)v6[8];
  v6[8] = v7;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((_DWORD *)v6 + 25) = self->_rat;
    *((_DWORD *)v6 + 42) |= 0x400u;
    has = self->_has;
    if ((*(_BYTE *)&has & 4) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 12) = self->_dataStallType;
  *((_DWORD *)v6 + 42) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v6 + 19) = self->_lastSearchRat;
  *((_DWORD *)v6 + 42) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v6 + 40) = self->_subsId;
  *((_DWORD *)v6 + 42) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v6 + 35) = self->_repeatedScgFailures;
  *((_DWORD *)v6 + 42) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v6 + 26) = self->_repeatedBeamFailures;
  *((_DWORD *)v6 + 42) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_37:
  *((_DWORD *)v6 + 15) = self->_hmType;
  *((_DWORD *)v6 + 42) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 20) = self->_numSubs;
    *((_DWORD *)v6 + 42) |= 0x100u;
  }
LABEL_12:
  v10 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v11 = (void *)v6[11];
  v6[11] = v10;

  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    *((_DWORD *)v6 + 24) = self->_psPref;
    *((_DWORD *)v6 + 42) |= 0x200u;
  }
  v12 = -[NSData copyWithZone:](self->_simHplmn, "copyWithZone:", a3);
  v13 = (void *)v6[19];
  v6[19] = v12;

  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
    *((_BYTE *)v6 + 164) = self->_dcActive;
    *((_DWORD *)v6 + 42) |= 0x800000u;
    v14 = self->_has;
    if ((*(_BYTE *)&v14 & 0x40) == 0)
    {
LABEL_16:
      if ((*(_BYTE *)&v14 & 1) == 0)
        goto LABEL_17;
      goto LABEL_41;
    }
  }
  else if ((*(_BYTE *)&v14 & 0x40) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v6 + 18) = self->_lacTac;
  *((_DWORD *)v6 + 42) |= 0x40u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 1) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v14 & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  v6[4] = self->_cellId;
  *((_DWORD *)v6 + 42) |= 1u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v14 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v6 + 28) = self->_repeatedLteRlfFailures;
  *((_DWORD *)v6 + 42) |= 0x2000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v14 & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v6 + 27) = self->_repeatedLteRachFailures;
  *((_DWORD *)v6 + 42) |= 0x1000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v14 & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 34) = self->_repeatedNrRlfFailures;
  *((_DWORD *)v6 + 42) |= 0x80000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v14 & 0x10000) == 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v6 + 33) = self->_repeatedNrRachFailures;
  *((_DWORD *)v6 + 42) |= 0x40000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v14 & 0x20000) == 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v6 + 31) = self->_repeatedNrCellInvalidationOccurences;
  *((_DWORD *)v6 + 42) |= 0x10000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v14 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v6 + 32) = self->_repeatedNrCellInvalidationPci;
  *((_DWORD *)v6 + 42) |= 0x20000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v14 & 0x8000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_48:
  *((_DWORD *)v6 + 29) = self->_repeatedNrCellInvalidationArfcn;
  *((_DWORD *)v6 + 42) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_25:
    *((_DWORD *)v6 + 30) = self->_repeatedNrCellInvalidationBand;
    *((_DWORD *)v6 + 42) |= 0x8000u;
  }
LABEL_26:
  PBRepeatedUInt32Copy(v6 + 1, &self->_countOfInvalidationReasons);
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x200000) == 0)
  {
    if ((*(_BYTE *)&v15 & 0x10) == 0)
      goto LABEL_28;
LABEL_51:
    *((_DWORD *)v6 + 14) = self->_freqRange;
    *((_DWORD *)v6 + 42) |= 0x10u;
    if ((*(_DWORD *)&self->_has & 8) == 0)
      return v6;
    goto LABEL_29;
  }
  *((_DWORD *)v6 + 36) = self->_rxChain;
  *((_DWORD *)v6 + 42) |= 0x200000u;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x10) != 0)
    goto LABEL_51;
LABEL_28:
  if ((*(_BYTE *)&v15 & 8) != 0)
  {
LABEL_29:
    *((_DWORD *)v6 + 13) = self->_fbrxRsrpRat;
    *((_DWORD *)v6 + 42) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  $2B764557029E21ADF691D3FFD146E5E8 has;
  int v7;
  NSData *imei;
  int v9;
  NSData *plmn;
  int v11;
  NSData *simHplmn;
  int v13;
  $2B764557029E21ADF691D3FFD146E5E8 v14;
  int v15;
  BOOL v16;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_135;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 42);
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 5))
      goto LABEL_135;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_135;
  }
  imei = self->_imei;
  if ((unint64_t)imei | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](imei, "isEqual:"))
      goto LABEL_135;
    has = self->_has;
  }
  v9 = *((_DWORD *)v4 + 42);
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_rat != *((_DWORD *)v4 + 25))
      goto LABEL_135;
  }
  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_dataStallType != *((_DWORD *)v4 + 12))
      goto LABEL_135;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_lastSearchRat != *((_DWORD *)v4 + 19))
      goto LABEL_135;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v9 & 0x400000) == 0 || self->_subsId != *((_DWORD *)v4 + 40))
      goto LABEL_135;
  }
  else if ((v9 & 0x400000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) == 0 || self->_repeatedScgFailures != *((_DWORD *)v4 + 35))
      goto LABEL_135;
  }
  else if ((v9 & 0x100000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_repeatedBeamFailures != *((_DWORD *)v4 + 26))
      goto LABEL_135;
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_hmType != *((_DWORD *)v4 + 15))
      goto LABEL_135;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_numSubs != *((_DWORD *)v4 + 20))
      goto LABEL_135;
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_135;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
      goto LABEL_135;
    has = self->_has;
  }
  v11 = *((_DWORD *)v4 + 42);
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0 || self->_psPref != *((_DWORD *)v4 + 24))
      goto LABEL_135;
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_135;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((_QWORD *)v4 + 19))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:"))
      goto LABEL_135;
    has = self->_has;
  }
  v13 = *((_DWORD *)v4 + 42);
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v13 & 0x800000) == 0)
      goto LABEL_135;
    if (self->_dcActive)
    {
      if (!v4[164])
        goto LABEL_135;
    }
    else if (v4[164])
    {
      goto LABEL_135;
    }
  }
  else if ((v13 & 0x800000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_lacTac != *((_DWORD *)v4 + 18))
      goto LABEL_135;
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_cellId != *((_QWORD *)v4 + 4))
      goto LABEL_135;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v13 & 0x2000) == 0 || self->_repeatedLteRlfFailures != *((_DWORD *)v4 + 28))
      goto LABEL_135;
  }
  else if ((v13 & 0x2000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v13 & 0x1000) == 0 || self->_repeatedLteRachFailures != *((_DWORD *)v4 + 27))
      goto LABEL_135;
  }
  else if ((v13 & 0x1000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v13 & 0x80000) == 0 || self->_repeatedNrRlfFailures != *((_DWORD *)v4 + 34))
      goto LABEL_135;
  }
  else if ((v13 & 0x80000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v13 & 0x40000) == 0 || self->_repeatedNrRachFailures != *((_DWORD *)v4 + 33))
      goto LABEL_135;
  }
  else if ((v13 & 0x40000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v13 & 0x10000) == 0 || self->_repeatedNrCellInvalidationOccurences != *((_DWORD *)v4 + 31))
      goto LABEL_135;
  }
  else if ((v13 & 0x10000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v13 & 0x20000) == 0 || self->_repeatedNrCellInvalidationPci != *((_DWORD *)v4 + 32))
      goto LABEL_135;
  }
  else if ((v13 & 0x20000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v13 & 0x4000) == 0 || self->_repeatedNrCellInvalidationArfcn != *((_DWORD *)v4 + 29))
      goto LABEL_135;
  }
  else if ((v13 & 0x4000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v13 & 0x8000) == 0 || self->_repeatedNrCellInvalidationBand != *((_DWORD *)v4 + 30))
      goto LABEL_135;
  }
  else if ((v13 & 0x8000) != 0)
  {
    goto LABEL_135;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_countOfInvalidationReasons, v4 + 8))
  {
LABEL_135:
    v16 = 0;
    goto LABEL_136;
  }
  v14 = self->_has;
  v15 = *((_DWORD *)v4 + 42);
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    if ((v15 & 0x200000) == 0 || self->_rxChain != *((_DWORD *)v4 + 36))
      goto LABEL_135;
  }
  else if ((v15 & 0x200000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_BYTE *)&v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_freqRange != *((_DWORD *)v4 + 14))
      goto LABEL_135;
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_fbrxRsrpRat != *((_DWORD *)v4 + 13))
      goto LABEL_135;
    v16 = 1;
  }
  else
  {
    v16 = (*((_DWORD *)v4 + 42) & 8) == 0;
  }
LABEL_136:

  return v16;
}

- (unint64_t)hash
{
  $2B764557029E21ADF691D3FFD146E5E8 has;
  $2B764557029E21ADF691D3FFD146E5E8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $2B764557029E21ADF691D3FFD146E5E8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v34 = 2654435761u * self->_timestamp;
  else
    v34 = 0;
  v33 = (unint64_t)-[NSData hash](self->_imei, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v32 = 2654435761 * self->_rat;
    if ((*(_BYTE *)&has & 4) != 0)
    {
LABEL_6:
      v31 = 2654435761 * self->_dataStallType;
      if ((*(_BYTE *)&has & 0x80) != 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_6;
  }
  v31 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_7:
    v30 = 2654435761 * self->_lastSearchRat;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_8:
    v29 = 2654435761 * self->_subsId;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  v29 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_9:
    v28 = 2654435761 * self->_repeatedScgFailures;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v28 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_10:
    v27 = 2654435761 * self->_repeatedBeamFailures;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_11;
LABEL_19:
    v26 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_18:
  v27 = 0;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_19;
LABEL_11:
  v26 = 2654435761 * self->_hmType;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_12:
    v25 = 2654435761 * self->_numSubs;
    goto LABEL_21;
  }
LABEL_20:
  v25 = 0;
LABEL_21:
  v24 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    v23 = 2654435761 * self->_psPref;
  else
    v23 = 0;
  v22 = (unint64_t)-[NSData hash](self->_simHplmn, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x800000) != 0)
  {
    v21 = 2654435761 * self->_dcActive;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
    {
LABEL_26:
      v20 = 2654435761 * self->_lacTac;
      if ((*(_BYTE *)&v4 & 1) != 0)
        goto LABEL_27;
      goto LABEL_38;
    }
  }
  else
  {
    v21 = 0;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_26;
  }
  v20 = 0;
  if ((*(_BYTE *)&v4 & 1) != 0)
  {
LABEL_27:
    v19 = 2654435761u * self->_cellId;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_28;
    goto LABEL_39;
  }
LABEL_38:
  v19 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_28:
    v18 = 2654435761 * self->_repeatedLteRlfFailures;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_29;
    goto LABEL_40;
  }
LABEL_39:
  v18 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_29:
    v5 = 2654435761 * self->_repeatedLteRachFailures;
    if ((*(_DWORD *)&v4 & 0x80000) != 0)
      goto LABEL_30;
    goto LABEL_41;
  }
LABEL_40:
  v5 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_30:
    v6 = 2654435761 * self->_repeatedNrRlfFailures;
    if ((*(_DWORD *)&v4 & 0x40000) != 0)
      goto LABEL_31;
    goto LABEL_42;
  }
LABEL_41:
  v6 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_31:
    v7 = 2654435761 * self->_repeatedNrRachFailures;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
      goto LABEL_32;
    goto LABEL_43;
  }
LABEL_42:
  v7 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_32:
    v8 = 2654435761 * self->_repeatedNrCellInvalidationOccurences;
    if ((*(_DWORD *)&v4 & 0x20000) != 0)
      goto LABEL_33;
    goto LABEL_44;
  }
LABEL_43:
  v8 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_33:
    v9 = 2654435761 * self->_repeatedNrCellInvalidationPci;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_34;
LABEL_45:
    v10 = 0;
    if ((*(_WORD *)&v4 & 0x8000) != 0)
      goto LABEL_35;
    goto LABEL_46;
  }
LABEL_44:
  v9 = 0;
  if ((*(_WORD *)&v4 & 0x4000) == 0)
    goto LABEL_45;
LABEL_34:
  v10 = 2654435761 * self->_repeatedNrCellInvalidationArfcn;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_35:
    v11 = 2654435761 * self->_repeatedNrCellInvalidationBand;
    goto LABEL_47;
  }
LABEL_46:
  v11 = 0;
LABEL_47:
  v12 = PBRepeatedUInt32Hash(&self->_countOfInvalidationReasons);
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
    v14 = 0;
    if ((*(_BYTE *)&v13 & 0x10) != 0)
      goto LABEL_49;
LABEL_52:
    v15 = 0;
    if ((*(_BYTE *)&v13 & 8) != 0)
      goto LABEL_50;
LABEL_53:
    v16 = 0;
    return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
  }
  v14 = 2654435761 * self->_rxChain;
  if ((*(_BYTE *)&v13 & 0x10) == 0)
    goto LABEL_52;
LABEL_49:
  v15 = 2654435761 * self->_freqRange;
  if ((*(_BYTE *)&v13 & 8) == 0)
    goto LABEL_53;
LABEL_50:
  v16 = 2654435761 * self->_fbrxRsrpRat;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  char *v7;
  char *v8;
  char *i;
  int v10;
  _DWORD *v11;

  v4 = a3;
  if ((*((_BYTE *)v4 + 168) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 5);
    *(_DWORD *)&self->_has |= 2u;
  }
  v11 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[CellularHealthMonitor setImei:](self, "setImei:");
    v4 = v11;
  }
  v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x400) != 0)
  {
    self->_rat = *((_DWORD *)v4 + 25);
    *(_DWORD *)&self->_has |= 0x400u;
    v5 = *((_DWORD *)v4 + 42);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_42;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_dataStallType = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x400000) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  self->_lastSearchRat = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x400000) == 0)
  {
LABEL_9:
    if ((v5 & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  self->_subsId = *((_DWORD *)v4 + 40);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x100000) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  self->_repeatedScgFailures = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_45:
  self->_repeatedBeamFailures = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 42);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_46:
  self->_hmType = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 42) & 0x100) != 0)
  {
LABEL_13:
    self->_numSubs = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x100u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 11))
  {
    -[CellularHealthMonitor setPlmn:](self, "setPlmn:");
    v4 = v11;
  }
  if ((*((_BYTE *)v4 + 169) & 2) != 0)
  {
    self->_psPref = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((_QWORD *)v4 + 19))
  {
    -[CellularHealthMonitor setSimHplmn:](self, "setSimHplmn:");
    v4 = v11;
  }
  v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x800000) != 0)
  {
    self->_dcActive = *((_BYTE *)v4 + 164);
    *(_DWORD *)&self->_has |= 0x800000u;
    v6 = *((_DWORD *)v4 + 42);
    if ((v6 & 0x40) == 0)
    {
LABEL_22:
      if ((v6 & 1) == 0)
        goto LABEL_23;
      goto LABEL_50;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_22;
  }
  self->_lacTac = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x40u;
  v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 1) == 0)
  {
LABEL_23:
    if ((v6 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  self->_cellId = *((_QWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 1u;
  v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((v6 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  self->_repeatedLteRlfFailures = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x2000u;
  v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((v6 & 0x80000) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  self->_repeatedLteRachFailures = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x1000u;
  v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x80000) == 0)
  {
LABEL_26:
    if ((v6 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  self->_repeatedNrRlfFailures = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_has |= 0x80000u;
  v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((v6 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  self->_repeatedNrRachFailures = *((_DWORD *)v4 + 33);
  *(_DWORD *)&self->_has |= 0x40000u;
  v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x10000) == 0)
  {
LABEL_28:
    if ((v6 & 0x20000) == 0)
      goto LABEL_29;
    goto LABEL_56;
  }
LABEL_55:
  self->_repeatedNrCellInvalidationOccurences = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x10000u;
  v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x20000) == 0)
  {
LABEL_29:
    if ((v6 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_57;
  }
LABEL_56:
  self->_repeatedNrCellInvalidationPci = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_has |= 0x20000u;
  v6 = *((_DWORD *)v4 + 42);
  if ((v6 & 0x4000) == 0)
  {
LABEL_30:
    if ((v6 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_57:
  self->_repeatedNrCellInvalidationArfcn = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 42) & 0x8000) != 0)
  {
LABEL_31:
    self->_repeatedNrCellInvalidationBand = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_32:
  v7 = (char *)objc_msgSend(v4, "countOfInvalidationReasonsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[CellularHealthMonitor addCountOfInvalidationReason:](self, "addCountOfInvalidationReason:", objc_msgSend(v11, "countOfInvalidationReasonAtIndex:", i));
  }
  v10 = v11[42];
  if ((v10 & 0x200000) == 0)
  {
    if ((v10 & 0x10) == 0)
      goto LABEL_37;
LABEL_60:
    self->_freqRange = v11[14];
    *(_DWORD *)&self->_has |= 0x10u;
    if ((v11[42] & 8) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
  self->_rxChain = v11[36];
  *(_DWORD *)&self->_has |= 0x200000u;
  v10 = v11[42];
  if ((v10 & 0x10) != 0)
    goto LABEL_60;
LABEL_37:
  if ((v10 & 8) != 0)
  {
LABEL_38:
    self->_fbrxRsrpRat = v11[13];
    *(_DWORD *)&self->_has |= 8u;
  }
LABEL_39:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)imei
{
  return self->_imei;
}

- (void)setImei:(id)a3
{
  objc_storeStrong((id *)&self->_imei, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)repeatedScgFailures
{
  return self->_repeatedScgFailures;
}

- (unsigned)repeatedBeamFailures
{
  return self->_repeatedBeamFailures;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
  objc_storeStrong((id *)&self->_simHplmn, a3);
}

- (BOOL)dcActive
{
  return self->_dcActive;
}

- (unsigned)lacTac
{
  return self->_lacTac;
}

- (unint64_t)cellId
{
  return self->_cellId;
}

- (unsigned)repeatedLteRlfFailures
{
  return self->_repeatedLteRlfFailures;
}

- (unsigned)repeatedLteRachFailures
{
  return self->_repeatedLteRachFailures;
}

- (unsigned)repeatedNrRlfFailures
{
  return self->_repeatedNrRlfFailures;
}

- (unsigned)repeatedNrRachFailures
{
  return self->_repeatedNrRachFailures;
}

- (unsigned)repeatedNrCellInvalidationOccurences
{
  return self->_repeatedNrCellInvalidationOccurences;
}

- (unsigned)repeatedNrCellInvalidationPci
{
  return self->_repeatedNrCellInvalidationPci;
}

- (unsigned)repeatedNrCellInvalidationArfcn
{
  return self->_repeatedNrCellInvalidationArfcn;
}

- (unsigned)repeatedNrCellInvalidationBand
{
  return self->_repeatedNrCellInvalidationBand;
}

- (unsigned)rxChain
{
  return self->_rxChain;
}

- (unsigned)freqRange
{
  return self->_freqRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simHplmn, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_imei, 0);
}

@end
