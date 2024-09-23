@implementation AWDHomeKitEventsAggregationReport

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasDataSyncState
{
  return self->_dataSyncState != 0;
}

- (void)setProcessLaunchCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_processLaunchCount = a3;
}

- (void)setHasProcessLaunchCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasProcessLaunchCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setJetsamReasonHighwaterCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_jetsamReasonHighwaterCount = a3;
}

- (void)setHasJetsamReasonHighwaterCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasJetsamReasonHighwaterCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setJetsamReasonProcessLimitCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_jetsamReasonProcessLimitCount = a3;
}

- (void)setHasJetsamReasonProcessLimitCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasJetsamReasonProcessLimitCount
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setJetsamReasonUnknownKillCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_jetsamReasonUnknownKillCount = a3;
}

- (void)setHasJetsamReasonUnknownKillCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasJetsamReasonUnknownKillCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setJetsamReasonOtherCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_jetsamReasonOtherCount = a3;
}

- (void)setHasJetsamReasonOtherCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasJetsamReasonOtherCount
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setProcessMemoryPressureStateWarningCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_processMemoryPressureStateWarningCount = a3;
}

- (void)setHasProcessMemoryPressureStateWarningCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasProcessMemoryPressureStateWarningCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setProcessMemoryPressureStateCriticalCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_processMemoryPressureStateCriticalCount = a3;
}

- (void)setHasProcessMemoryPressureStateCriticalCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasProcessMemoryPressureStateCriticalCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setAverageSampledProcessMemoryUsage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_averageSampledProcessMemoryUsage = a3;
}

- (void)setHasAverageSampledProcessMemoryUsage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAverageSampledProcessMemoryUsage
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPeakSampledProcessMemoryUsage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_peakSampledProcessMemoryUsage = a3;
}

- (void)setHasPeakSampledProcessMemoryUsage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPeakSampledProcessMemoryUsage
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRemoteMessagesSentCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_remoteMessagesSentCount = a3;
}

- (void)setHasRemoteMessagesSentCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasRemoteMessagesSentCount
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setRemoteMessagesReceivedCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_remoteMessagesReceivedCount = a3;
}

- (void)setHasRemoteMessagesReceivedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasRemoteMessagesReceivedCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setAcceptedXPCRequestsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_acceptedXPCRequestsCount = a3;
}

- (void)setHasAcceptedXPCRequestsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAcceptedXPCRequestsCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setErroredXPCRequestsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_erroredXPCRequestsCount = a3;
}

- (void)setHasErroredXPCRequestsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasErroredXPCRequestsCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSentXPCNotificationsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_sentXPCNotificationsCount = a3;
}

- (void)setHasSentXPCNotificationsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasSentXPCNotificationsCount
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setFilteredXPCNotificationsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_filteredXPCNotificationsCount = a3;
}

- (void)setHasFilteredXPCNotificationsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasFilteredXPCNotificationsCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHapIPInvalidationCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hapIPInvalidationCount = a3;
}

- (void)setHasHapIPInvalidationCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHapIPInvalidationCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHapIPSentHTTPRequestsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_hapIPSentHTTPRequestsCount = a3;
}

- (void)setHasHapIPSentHTTPRequestsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasHapIPSentHTTPRequestsCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHapIPReceivedHTTPResponsesCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_hapIPReceivedHTTPResponsesCount = a3;
}

- (void)setHasHapIPReceivedHTTPResponsesCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasHapIPReceivedHTTPResponsesCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHapIPReceivedHTTPEventCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hapIPReceivedHTTPEventCount = a3;
}

- (void)setHasHapIPReceivedHTTPEventCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHapIPReceivedHTTPEventCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHapBTLEConnectionsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hapBTLEConnectionsCount = a3;
}

- (void)setHasHapBTLEConnectionsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHapBTLEConnectionsCount
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHapBTLEConnectionPerReasonsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hapBTLEConnectionPerReasonsCount = a3;
}

- (void)setHasHapBTLEConnectionPerReasonsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHapBTLEConnectionPerReasonsCount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHapBTLEDiscoveriesCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hapBTLEDiscoveriesCount = a3;
}

- (void)setHasHapBTLEDiscoveriesCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHapBTLEDiscoveriesCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setActiveDay:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_activeDay = a3;
}

- (void)setHasActiveDay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasActiveDay
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setActiveDaysPerMonthCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_activeDaysPerMonthCount = a3;
}

- (void)setHasActiveDaysPerMonthCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($03ABC8A231E659DB9C7B1376CBFD01FC)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasActiveDaysPerMonthCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitEventsAggregationReport;
  -[AWDHomeKitEventsAggregationReport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitEventsAggregationReport dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *dataSyncState;
  $03ABC8A231E659DB9C7B1376CBFD01FC has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v30;
  void *v31;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  dataSyncState = self->_dataSyncState;
  if (dataSyncState)
    objc_msgSend(v3, "setObject:forKey:", dataSyncState, CFSTR("dataSyncState"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_processLaunchCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("processLaunchCount"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&has & 0x10000) == 0)
        goto LABEL_8;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_jetsamReasonHighwaterCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("jetsamReasonHighwaterCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_jetsamReasonProcessLimitCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("jetsamReasonProcessLimitCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_jetsamReasonUnknownKillCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("jetsamReasonUnknownKillCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_jetsamReasonOtherCount);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("jetsamReasonOtherCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_processMemoryPressureStateWarningCount);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("processMemoryPressureStateWarningCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_processMemoryPressureStateCriticalCount);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("processMemoryPressureStateCriticalCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_averageSampledProcessMemoryUsage);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("averageSampledProcessMemoryUsage"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_peakSampledProcessMemoryUsage);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("peakSampledProcessMemoryUsage"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_remoteMessagesSentCount);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("remoteMessagesSentCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_remoteMessagesReceivedCount);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("remoteMessagesReceivedCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_acceptedXPCRequestsCount);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("acceptedXPCRequestsCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_erroredXPCRequestsCount);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("erroredXPCRequestsCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sentXPCNotificationsCount);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("sentXPCNotificationsCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_filteredXPCNotificationsCount);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("filteredXPCNotificationsCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hapIPInvalidationCount);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("hapIPInvalidationCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hapIPSentHTTPRequestsCount);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("hapIPSentHTTPRequestsCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hapIPReceivedHTTPResponsesCount);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("hapIPReceivedHTTPResponsesCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hapIPReceivedHTTPEventCount);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("hapIPReceivedHTTPEventCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hapBTLEConnectionsCount);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("hapBTLEConnectionsCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hapBTLEConnectionPerReasonsCount);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("hapBTLEConnectionPerReasonsCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_28;
LABEL_53:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_activeDay);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("activeDay"));

    if ((*(_DWORD *)&self->_has & 8) == 0)
      return v3;
    goto LABEL_29;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_hapBTLEDiscoveriesCount);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("hapBTLEDiscoveriesCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_53;
LABEL_28:
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_activeDaysPerMonthCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("activeDaysPerMonthCount"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  NSString *v25;
  NSString *dataSyncState;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  char v63;
  unsigned int v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  unsigned int v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  char v88;
  unsigned int v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  unint64_t v101;
  char v102;
  char v103;
  unsigned int v104;
  uint64_t v105;
  unint64_t v106;
  char v107;
  char v108;
  unsigned int v109;
  uint64_t v110;
  unint64_t v111;
  char v112;
  char v113;
  unsigned int v114;
  uint64_t v115;
  unint64_t v116;
  char v117;
  char v118;
  unsigned int v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  char v123;
  unsigned int v124;
  uint64_t v125;
  unint64_t v126;
  char v127;
  char v128;
  unsigned int v129;
  uint64_t v130;
  unint64_t v131;
  char v132;
  char v133;
  unsigned int v134;
  uint64_t v135;
  unint64_t v136;
  char v137;
  char v138;
  unsigned int v139;
  uint64_t v140;
  unint64_t v141;
  char v142;
  char v143;
  unsigned int v144;
  uint64_t v145;
  unint64_t v146;
  char v147;
  uint64_t v148;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_DWORD *)&self->_has |= 1u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_198;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_200;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_198:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_200:
          self->_timestamp = v20;
          continue;
        case 2u:
          PBReaderReadString();
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();
          dataSyncState = self->_dataSyncState;
          self->_dataSyncState = v25;

          continue;
        case 3u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x80000u;
          while (2)
          {
            v30 = *v4;
            v31 = *(_QWORD *)((char *)a3 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v31);
              *(_QWORD *)((char *)a3 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v15 = v28++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_204;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_204:
          v148 = 96;
          goto LABEL_297;
        case 4u:
          v33 = 0;
          v34 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x4000u;
          while (2)
          {
            v35 = *v4;
            v36 = *(_QWORD *)((char *)a3 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v36);
              *(_QWORD *)((char *)a3 + v35) = v36 + 1;
              v29 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v15 = v34++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_208;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_208:
          v148 = 76;
          goto LABEL_297;
        case 5u:
          v38 = 0;
          v39 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x10000u;
          while (2)
          {
            v40 = *v4;
            v41 = *(_QWORD *)((char *)a3 + v40);
            if (v41 == -1 || v41 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v41);
              *(_QWORD *)((char *)a3 + v40) = v41 + 1;
              v29 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                v15 = v39++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_212;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_212:
          v148 = 84;
          goto LABEL_297;
        case 6u:
          v43 = 0;
          v44 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x20000u;
          while (2)
          {
            v45 = *v4;
            v46 = *(_QWORD *)((char *)a3 + v45);
            if (v46 == -1 || v46 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v46);
              *(_QWORD *)((char *)a3 + v45) = v46 + 1;
              v29 |= (unint64_t)(v47 & 0x7F) << v43;
              if (v47 < 0)
              {
                v43 += 7;
                v15 = v44++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_216;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_216:
          v148 = 88;
          goto LABEL_297;
        case 7u:
          v48 = 0;
          v49 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x8000u;
          while (2)
          {
            v50 = *v4;
            v51 = *(_QWORD *)((char *)a3 + v50);
            if (v51 == -1 || v51 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v52 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v51);
              *(_QWORD *)((char *)a3 + v50) = v51 + 1;
              v29 |= (unint64_t)(v52 & 0x7F) << v48;
              if (v52 < 0)
              {
                v48 += 7;
                v15 = v49++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_220;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_220:
          v148 = 80;
          goto LABEL_297;
        case 8u:
          v53 = 0;
          v54 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x200000u;
          while (2)
          {
            v55 = *v4;
            v56 = *(_QWORD *)((char *)a3 + v55);
            if (v56 == -1 || v56 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v56);
              *(_QWORD *)((char *)a3 + v55) = v56 + 1;
              v29 |= (unint64_t)(v57 & 0x7F) << v53;
              if (v57 < 0)
              {
                v53 += 7;
                v15 = v54++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_224;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_224:
          v148 = 104;
          goto LABEL_297;
        case 9u:
          v58 = 0;
          v59 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x100000u;
          while (2)
          {
            v60 = *v4;
            v61 = *(_QWORD *)((char *)a3 + v60);
            if (v61 == -1 || v61 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v62 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v61);
              *(_QWORD *)((char *)a3 + v60) = v61 + 1;
              v29 |= (unint64_t)(v62 & 0x7F) << v58;
              if (v62 < 0)
              {
                v58 += 7;
                v15 = v59++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_228;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_228:
          v148 = 100;
          goto LABEL_297;
        case 0xAu:
          v63 = 0;
          v64 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x10u;
          while (2)
          {
            v65 = *v4;
            v66 = *(_QWORD *)((char *)a3 + v65);
            if (v66 == -1 || v66 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v67 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v66);
              *(_QWORD *)((char *)a3 + v65) = v66 + 1;
              v29 |= (unint64_t)(v67 & 0x7F) << v63;
              if (v67 < 0)
              {
                v63 += 7;
                v15 = v64++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_232;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_232:
          v148 = 28;
          goto LABEL_297;
        case 0xBu:
          v68 = 0;
          v69 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x40000u;
          while (2)
          {
            v70 = *v4;
            v71 = *(_QWORD *)((char *)a3 + v70);
            if (v71 == -1 || v71 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v72 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v71);
              *(_QWORD *)((char *)a3 + v70) = v71 + 1;
              v29 |= (unint64_t)(v72 & 0x7F) << v68;
              if (v72 < 0)
              {
                v68 += 7;
                v15 = v69++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_236;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_236:
          v148 = 92;
          goto LABEL_297;
        case 0xCu:
          v73 = 0;
          v74 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x800000u;
          while (2)
          {
            v75 = *v4;
            v76 = *(_QWORD *)((char *)a3 + v75);
            if (v76 == -1 || v76 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v77 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v76);
              *(_QWORD *)((char *)a3 + v75) = v76 + 1;
              v29 |= (unint64_t)(v77 & 0x7F) << v73;
              if (v77 < 0)
              {
                v73 += 7;
                v15 = v74++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_240;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_240:
          v148 = 112;
          goto LABEL_297;
        case 0xDu:
          v78 = 0;
          v79 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x400000u;
          while (2)
          {
            v80 = *v4;
            v81 = *(_QWORD *)((char *)a3 + v80);
            if (v81 == -1 || v81 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v82 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v81);
              *(_QWORD *)((char *)a3 + v80) = v81 + 1;
              v29 |= (unint64_t)(v82 & 0x7F) << v78;
              if (v82 < 0)
              {
                v78 += 7;
                v15 = v79++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_244;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_244:
          v148 = 108;
          goto LABEL_297;
        case 0xEu:
          v83 = 0;
          v84 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 2u;
          while (2)
          {
            v85 = *v4;
            v86 = *(_QWORD *)((char *)a3 + v85);
            if (v86 == -1 || v86 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v87 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v86);
              *(_QWORD *)((char *)a3 + v85) = v86 + 1;
              v29 |= (unint64_t)(v87 & 0x7F) << v83;
              if (v87 < 0)
              {
                v83 += 7;
                v15 = v84++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_248;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_248:
          v148 = 16;
          goto LABEL_297;
        case 0xFu:
          v88 = 0;
          v89 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x20u;
          while (2)
          {
            v90 = *v4;
            v91 = *(_QWORD *)((char *)a3 + v90);
            if (v91 == -1 || v91 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v92 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v91);
              *(_QWORD *)((char *)a3 + v90) = v91 + 1;
              v29 |= (unint64_t)(v92 & 0x7F) << v88;
              if (v92 < 0)
              {
                v88 += 7;
                v15 = v89++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_252;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_252:
          v148 = 40;
          goto LABEL_297;
        case 0x10u:
          v93 = 0;
          v94 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x1000000u;
          while (2)
          {
            v95 = *v4;
            v96 = *(_QWORD *)((char *)a3 + v95);
            if (v96 == -1 || v96 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v97 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v96);
              *(_QWORD *)((char *)a3 + v95) = v96 + 1;
              v29 |= (unint64_t)(v97 & 0x7F) << v93;
              if (v97 < 0)
              {
                v93 += 7;
                v15 = v94++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_256;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_256:
          v148 = 116;
          goto LABEL_297;
        case 0x11u:
          v98 = 0;
          v99 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x40u;
          while (2)
          {
            v100 = *v4;
            v101 = *(_QWORD *)((char *)a3 + v100);
            if (v101 == -1 || v101 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v102 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v101);
              *(_QWORD *)((char *)a3 + v100) = v101 + 1;
              v29 |= (unint64_t)(v102 & 0x7F) << v98;
              if (v102 < 0)
              {
                v98 += 7;
                v15 = v99++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_260;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_260:
          v148 = 44;
          goto LABEL_297;
        case 0x12u:
          v103 = 0;
          v104 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x400u;
          while (2)
          {
            v105 = *v4;
            v106 = *(_QWORD *)((char *)a3 + v105);
            if (v106 == -1 || v106 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v107 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v106);
              *(_QWORD *)((char *)a3 + v105) = v106 + 1;
              v29 |= (unint64_t)(v107 & 0x7F) << v103;
              if (v107 < 0)
              {
                v103 += 7;
                v15 = v104++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_264;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_264:
          v148 = 60;
          goto LABEL_297;
        case 0x13u:
          v108 = 0;
          v109 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x2000u;
          while (2)
          {
            v110 = *v4;
            v111 = *(_QWORD *)((char *)a3 + v110);
            if (v111 == -1 || v111 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v112 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v111);
              *(_QWORD *)((char *)a3 + v110) = v111 + 1;
              v29 |= (unint64_t)(v112 & 0x7F) << v108;
              if (v112 < 0)
              {
                v108 += 7;
                v15 = v109++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_268;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_268:
          v148 = 72;
          goto LABEL_297;
        case 0x14u:
          v113 = 0;
          v114 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x1000u;
          while (2)
          {
            v115 = *v4;
            v116 = *(_QWORD *)((char *)a3 + v115);
            if (v116 == -1 || v116 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v117 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v116);
              *(_QWORD *)((char *)a3 + v115) = v116 + 1;
              v29 |= (unint64_t)(v117 & 0x7F) << v113;
              if (v117 < 0)
              {
                v113 += 7;
                v15 = v114++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_272;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_272:
          v148 = 68;
          goto LABEL_297;
        case 0x15u:
          v118 = 0;
          v119 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x800u;
          while (2)
          {
            v120 = *v4;
            v121 = *(_QWORD *)((char *)a3 + v120);
            if (v121 == -1 || v121 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v122 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v121);
              *(_QWORD *)((char *)a3 + v120) = v121 + 1;
              v29 |= (unint64_t)(v122 & 0x7F) << v118;
              if (v122 < 0)
              {
                v118 += 7;
                v15 = v119++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_276;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_276:
          v148 = 64;
          goto LABEL_297;
        case 0x16u:
          v123 = 0;
          v124 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x100u;
          while (2)
          {
            v125 = *v4;
            v126 = *(_QWORD *)((char *)a3 + v125);
            if (v126 == -1 || v126 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v127 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v126);
              *(_QWORD *)((char *)a3 + v125) = v126 + 1;
              v29 |= (unint64_t)(v127 & 0x7F) << v123;
              if (v127 < 0)
              {
                v123 += 7;
                v15 = v124++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_280;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_280:
          v148 = 52;
          goto LABEL_297;
        case 0x17u:
          v128 = 0;
          v129 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x80u;
          while (2)
          {
            v130 = *v4;
            v131 = *(_QWORD *)((char *)a3 + v130);
            if (v131 == -1 || v131 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v132 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v131);
              *(_QWORD *)((char *)a3 + v130) = v131 + 1;
              v29 |= (unint64_t)(v132 & 0x7F) << v128;
              if (v132 < 0)
              {
                v128 += 7;
                v15 = v129++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_284;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_284:
          v148 = 48;
          goto LABEL_297;
        case 0x18u:
          v133 = 0;
          v134 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 0x200u;
          while (2)
          {
            v135 = *v4;
            v136 = *(_QWORD *)((char *)a3 + v135);
            if (v136 == -1 || v136 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v137 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v136);
              *(_QWORD *)((char *)a3 + v135) = v136 + 1;
              v29 |= (unint64_t)(v137 & 0x7F) << v133;
              if (v137 < 0)
              {
                v133 += 7;
                v15 = v134++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_288;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_288:
          v148 = 56;
          goto LABEL_297;
        case 0x19u:
          v138 = 0;
          v139 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 4u;
          while (2)
          {
            v140 = *v4;
            v141 = *(_QWORD *)((char *)a3 + v140);
            if (v141 == -1 || v141 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v142 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v141);
              *(_QWORD *)((char *)a3 + v140) = v141 + 1;
              v29 |= (unint64_t)(v142 & 0x7F) << v138;
              if (v142 < 0)
              {
                v138 += 7;
                v15 = v139++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_292;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_292:
          v148 = 20;
          goto LABEL_297;
        case 0x1Au:
          v143 = 0;
          v144 = 0;
          v29 = 0;
          *(_DWORD *)&self->_has |= 8u;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v145 = *v4;
        v146 = *(_QWORD *)((char *)a3 + v145);
        if (v146 == -1 || v146 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v147 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v146);
        *(_QWORD *)((char *)a3 + v145) = v146 + 1;
        v29 |= (unint64_t)(v147 & 0x7F) << v143;
        if ((v147 & 0x80) == 0)
          goto LABEL_294;
        v143 += 7;
        v15 = v144++ >= 9;
        if (v15)
        {
          LODWORD(v29) = 0;
          goto LABEL_296;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_294:
      if (*((_BYTE *)a3 + *v6))
        LODWORD(v29) = 0;
LABEL_296:
      v148 = 24;
LABEL_297:
      *(_DWORD *)((char *)&self->super.super.isa + v148) = v29;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  $03ABC8A231E659DB9C7B1376CBFD01FC has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_dataSyncState)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&has & 0x10000) == 0)
        goto LABEL_8;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_28;
LABEL_53:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_has & 8) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_53;
LABEL_28:
  if ((*(_BYTE *)&has & 8) != 0)
LABEL_29:
    PBDataWriterWriteUint32Field();
LABEL_30:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $03ABC8A231E659DB9C7B1376CBFD01FC has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 30) |= 1u;
  }
  if (self->_dataSyncState)
  {
    v6 = v4;
    objc_msgSend(v4, "setDataSyncState:");
    v4 = v6;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_processLaunchCount;
    *((_DWORD *)v4 + 30) |= 0x80000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&has & 0x10000) == 0)
        goto LABEL_8;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 19) = self->_jetsamReasonHighwaterCount;
  *((_DWORD *)v4 + 30) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 21) = self->_jetsamReasonProcessLimitCount;
  *((_DWORD *)v4 + 30) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 22) = self->_jetsamReasonUnknownKillCount;
  *((_DWORD *)v4 + 30) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 20) = self->_jetsamReasonOtherCount;
  *((_DWORD *)v4 + 30) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 26) = self->_processMemoryPressureStateWarningCount;
  *((_DWORD *)v4 + 30) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 25) = self->_processMemoryPressureStateCriticalCount;
  *((_DWORD *)v4 + 30) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 7) = self->_averageSampledProcessMemoryUsage;
  *((_DWORD *)v4 + 30) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 23) = self->_peakSampledProcessMemoryUsage;
  *((_DWORD *)v4 + 30) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 28) = self->_remoteMessagesSentCount;
  *((_DWORD *)v4 + 30) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 27) = self->_remoteMessagesReceivedCount;
  *((_DWORD *)v4 + 30) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 4) = self->_acceptedXPCRequestsCount;
  *((_DWORD *)v4 + 30) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 10) = self->_erroredXPCRequestsCount;
  *((_DWORD *)v4 + 30) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 29) = self->_sentXPCNotificationsCount;
  *((_DWORD *)v4 + 30) |= 0x1000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 11) = self->_filteredXPCNotificationsCount;
  *((_DWORD *)v4 + 30) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 15) = self->_hapIPInvalidationCount;
  *((_DWORD *)v4 + 30) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 18) = self->_hapIPSentHTTPRequestsCount;
  *((_DWORD *)v4 + 30) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 17) = self->_hapIPReceivedHTTPResponsesCount;
  *((_DWORD *)v4 + 30) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 16) = self->_hapIPReceivedHTTPEventCount;
  *((_DWORD *)v4 + 30) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 13) = self->_hapBTLEConnectionsCount;
  *((_DWORD *)v4 + 30) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 12) = self->_hapBTLEConnectionPerReasonsCount;
  *((_DWORD *)v4 + 30) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_28;
LABEL_53:
    *((_DWORD *)v4 + 5) = self->_activeDay;
    *((_DWORD *)v4 + 30) |= 4u;
    if ((*(_DWORD *)&self->_has & 8) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_52:
  *((_DWORD *)v4 + 14) = self->_hapBTLEDiscoveriesCount;
  *((_DWORD *)v4 + 30) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_53;
LABEL_28:
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_29:
    *((_DWORD *)v4 + 6) = self->_activeDaysPerMonthCount;
    *((_DWORD *)v4 + 30) |= 8u;
  }
LABEL_30:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  $03ABC8A231E659DB9C7B1376CBFD01FC has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 120) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_dataSyncState, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_processLaunchCount;
    *(_DWORD *)(v6 + 120) |= 0x80000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x10000) == 0)
        goto LABEL_6;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 76) = self->_jetsamReasonHighwaterCount;
  *(_DWORD *)(v6 + 120) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v6 + 84) = self->_jetsamReasonProcessLimitCount;
  *(_DWORD *)(v6 + 120) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v6 + 88) = self->_jetsamReasonUnknownKillCount;
  *(_DWORD *)(v6 + 120) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v6 + 80) = self->_jetsamReasonOtherCount;
  *(_DWORD *)(v6 + 120) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v6 + 104) = self->_processMemoryPressureStateWarningCount;
  *(_DWORD *)(v6 + 120) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v6 + 100) = self->_processMemoryPressureStateCriticalCount;
  *(_DWORD *)(v6 + 120) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v6 + 28) = self->_averageSampledProcessMemoryUsage;
  *(_DWORD *)(v6 + 120) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v6 + 92) = self->_peakSampledProcessMemoryUsage;
  *(_DWORD *)(v6 + 120) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v6 + 112) = self->_remoteMessagesSentCount;
  *(_DWORD *)(v6 + 120) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v6 + 108) = self->_remoteMessagesReceivedCount;
  *(_DWORD *)(v6 + 120) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v6 + 16) = self->_acceptedXPCRequestsCount;
  *(_DWORD *)(v6 + 120) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v6 + 40) = self->_erroredXPCRequestsCount;
  *(_DWORD *)(v6 + 120) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v6 + 116) = self->_sentXPCNotificationsCount;
  *(_DWORD *)(v6 + 120) |= 0x1000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v6 + 44) = self->_filteredXPCNotificationsCount;
  *(_DWORD *)(v6 + 120) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 60) = self->_hapIPInvalidationCount;
  *(_DWORD *)(v6 + 120) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v6 + 72) = self->_hapIPSentHTTPRequestsCount;
  *(_DWORD *)(v6 + 120) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 68) = self->_hapIPReceivedHTTPResponsesCount;
  *(_DWORD *)(v6 + 120) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v6 + 64) = self->_hapIPReceivedHTTPEventCount;
  *(_DWORD *)(v6 + 120) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 52) = self->_hapBTLEConnectionsCount;
  *(_DWORD *)(v6 + 120) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v6 + 48) = self->_hapBTLEConnectionPerReasonsCount;
  *(_DWORD *)(v6 + 120) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_26;
LABEL_51:
    *(_DWORD *)(v6 + 20) = self->_activeDay;
    *(_DWORD *)(v6 + 120) |= 4u;
    if ((*(_DWORD *)&self->_has & 8) == 0)
      return (id)v6;
    goto LABEL_27;
  }
LABEL_50:
  *(_DWORD *)(v6 + 56) = self->_hapBTLEDiscoveriesCount;
  *(_DWORD *)(v6 + 120) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
    goto LABEL_51;
LABEL_26:
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_27:
    *(_DWORD *)(v6 + 24) = self->_activeDaysPerMonthCount;
    *(_DWORD *)(v6 + 120) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $03ABC8A231E659DB9C7B1376CBFD01FC has;
  int v6;
  NSString *dataSyncState;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_130;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 30);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_130;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_130;
  }
  dataSyncState = self->_dataSyncState;
  if ((unint64_t)dataSyncState | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](dataSyncState, "isEqual:"))
    {
LABEL_130:
      v8 = 0;
      goto LABEL_131;
    }
    has = self->_has;
    v6 = *((_DWORD *)v4 + 30);
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_processLaunchCount != *((_DWORD *)v4 + 24))
      goto LABEL_130;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_jetsamReasonHighwaterCount != *((_DWORD *)v4 + 19))
      goto LABEL_130;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_jetsamReasonProcessLimitCount != *((_DWORD *)v4 + 21))
      goto LABEL_130;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_jetsamReasonUnknownKillCount != *((_DWORD *)v4 + 22))
      goto LABEL_130;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_jetsamReasonOtherCount != *((_DWORD *)v4 + 20))
      goto LABEL_130;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_processMemoryPressureStateWarningCount != *((_DWORD *)v4 + 26))
      goto LABEL_130;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_processMemoryPressureStateCriticalCount != *((_DWORD *)v4 + 25))
      goto LABEL_130;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_averageSampledProcessMemoryUsage != *((_DWORD *)v4 + 7))
      goto LABEL_130;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_peakSampledProcessMemoryUsage != *((_DWORD *)v4 + 23))
      goto LABEL_130;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_remoteMessagesSentCount != *((_DWORD *)v4 + 28))
      goto LABEL_130;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_remoteMessagesReceivedCount != *((_DWORD *)v4 + 27))
      goto LABEL_130;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_acceptedXPCRequestsCount != *((_DWORD *)v4 + 4))
      goto LABEL_130;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_erroredXPCRequestsCount != *((_DWORD *)v4 + 10))
      goto LABEL_130;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_sentXPCNotificationsCount != *((_DWORD *)v4 + 29))
      goto LABEL_130;
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_filteredXPCNotificationsCount != *((_DWORD *)v4 + 11))
      goto LABEL_130;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_hapIPInvalidationCount != *((_DWORD *)v4 + 15))
      goto LABEL_130;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_hapIPSentHTTPRequestsCount != *((_DWORD *)v4 + 18))
      goto LABEL_130;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_hapIPReceivedHTTPResponsesCount != *((_DWORD *)v4 + 17))
      goto LABEL_130;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_hapIPReceivedHTTPEventCount != *((_DWORD *)v4 + 16))
      goto LABEL_130;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_hapBTLEConnectionsCount != *((_DWORD *)v4 + 13))
      goto LABEL_130;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_hapBTLEConnectionPerReasonsCount != *((_DWORD *)v4 + 12))
      goto LABEL_130;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_hapBTLEDiscoveriesCount != *((_DWORD *)v4 + 14))
      goto LABEL_130;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_activeDay != *((_DWORD *)v4 + 5))
      goto LABEL_130;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_activeDaysPerMonthCount != *((_DWORD *)v4 + 6))
      goto LABEL_130;
    v8 = 1;
  }
  else
  {
    v8 = (v6 & 8) == 0;
  }
LABEL_131:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  $03ABC8A231E659DB9C7B1376CBFD01FC has;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_dataSyncState, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    v6 = 2654435761 * self->_processLaunchCount;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_jetsamReasonHighwaterCount;
      if ((*(_DWORD *)&has & 0x10000) != 0)
        goto LABEL_7;
      goto LABEL_31;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_jetsamReasonProcessLimitCount;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_jetsamReasonUnknownKillCount;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  v9 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_jetsamReasonOtherCount;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_processMemoryPressureStateWarningCount;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  v11 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_processMemoryPressureStateCriticalCount;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  v12 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_averageSampledProcessMemoryUsage;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  v13 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_peakSampledProcessMemoryUsage;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_remoteMessagesSentCount;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  v15 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_remoteMessagesReceivedCount;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  v16 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_acceptedXPCRequestsCount;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  v17 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_erroredXPCRequestsCount;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_sentXPCNotificationsCount;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  v19 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_19:
    v20 = 2654435761 * self->_filteredXPCNotificationsCount;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  v20 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_20:
    v21 = 2654435761 * self->_hapIPInvalidationCount;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  v21 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_21:
    v22 = 2654435761 * self->_hapIPSentHTTPRequestsCount;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  v22 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_22:
    v23 = 2654435761 * self->_hapIPReceivedHTTPResponsesCount;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  v23 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_23:
    v24 = 2654435761 * self->_hapIPReceivedHTTPEventCount;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_24;
    goto LABEL_48;
  }
LABEL_47:
  v24 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_24:
    v25 = 2654435761 * self->_hapBTLEConnectionsCount;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_25;
    goto LABEL_49;
  }
LABEL_48:
  v25 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_25:
    v26 = 2654435761 * self->_hapBTLEConnectionPerReasonsCount;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_26;
    goto LABEL_50;
  }
LABEL_49:
  v26 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_26:
    v27 = 2654435761 * self->_hapBTLEDiscoveriesCount;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_27;
LABEL_51:
    v28 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_28;
LABEL_52:
    v29 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_50:
  v27 = 0;
  if ((*(_BYTE *)&has & 4) == 0)
    goto LABEL_51;
LABEL_27:
  v28 = 2654435761 * self->_activeDay;
  if ((*(_BYTE *)&has & 8) == 0)
    goto LABEL_52;
LABEL_28:
  v29 = 2654435761 * self->_activeDaysPerMonthCount;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[AWDHomeKitEventsAggregationReport setDataSyncState:](self, "setDataSyncState:");
    v4 = v6;
  }
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x80000) != 0)
  {
    self->_processLaunchCount = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_has |= 0x80000u;
    v5 = *((_DWORD *)v4 + 30);
    if ((v5 & 0x4000) == 0)
    {
LABEL_7:
      if ((v5 & 0x10000) == 0)
        goto LABEL_8;
      goto LABEL_33;
    }
  }
  else if ((v5 & 0x4000) == 0)
  {
    goto LABEL_7;
  }
  self->_jetsamReasonHighwaterCount = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x10000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  self->_jetsamReasonProcessLimitCount = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x20000) == 0)
  {
LABEL_9:
    if ((v5 & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  self->_jetsamReasonUnknownKillCount = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((v5 & 0x200000) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  self->_jetsamReasonOtherCount = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x200000) == 0)
  {
LABEL_11:
    if ((v5 & 0x100000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  self->_processMemoryPressureStateWarningCount = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x100000) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  self->_processMemoryPressureStateCriticalCount = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  self->_averageSampledProcessMemoryUsage = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x40000) == 0)
  {
LABEL_14:
    if ((v5 & 0x800000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  self->_peakSampledProcessMemoryUsage = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x800000) == 0)
  {
LABEL_15:
    if ((v5 & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  self->_remoteMessagesSentCount = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x400000) == 0)
  {
LABEL_16:
    if ((v5 & 2) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  self->_remoteMessagesReceivedCount = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_17:
    if ((v5 & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  self->_acceptedXPCRequestsCount = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_18:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  self->_erroredXPCRequestsCount = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  self->_sentXPCNotificationsCount = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_20:
    if ((v5 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  self->_filteredXPCNotificationsCount = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_21:
    if ((v5 & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  self->_hapIPInvalidationCount = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x2000) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  self->_hapIPSentHTTPRequestsCount = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  self->_hapIPReceivedHTTPResponsesCount = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_24:
    if ((v5 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_50;
  }
LABEL_49:
  self->_hapIPReceivedHTTPEventCount = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_25:
    if ((v5 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_51;
  }
LABEL_50:
  self->_hapBTLEConnectionsCount = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_26:
    if ((v5 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_52;
  }
LABEL_51:
  self->_hapBTLEConnectionPerReasonsCount = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_27:
    if ((v5 & 4) == 0)
      goto LABEL_28;
LABEL_53:
    self->_activeDay = *((_DWORD *)v4 + 5);
    *(_DWORD *)&self->_has |= 4u;
    if ((*((_DWORD *)v4 + 30) & 8) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_52:
  self->_hapBTLEDiscoveriesCount = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 30);
  if ((v5 & 4) != 0)
    goto LABEL_53;
LABEL_28:
  if ((v5 & 8) != 0)
  {
LABEL_29:
    self->_activeDaysPerMonthCount = *((_DWORD *)v4 + 6);
    *(_DWORD *)&self->_has |= 8u;
  }
LABEL_30:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)dataSyncState
{
  return self->_dataSyncState;
}

- (void)setDataSyncState:(id)a3
{
  objc_storeStrong((id *)&self->_dataSyncState, a3);
}

- (unsigned)processLaunchCount
{
  return self->_processLaunchCount;
}

- (unsigned)jetsamReasonHighwaterCount
{
  return self->_jetsamReasonHighwaterCount;
}

- (unsigned)jetsamReasonProcessLimitCount
{
  return self->_jetsamReasonProcessLimitCount;
}

- (unsigned)jetsamReasonUnknownKillCount
{
  return self->_jetsamReasonUnknownKillCount;
}

- (unsigned)jetsamReasonOtherCount
{
  return self->_jetsamReasonOtherCount;
}

- (unsigned)processMemoryPressureStateWarningCount
{
  return self->_processMemoryPressureStateWarningCount;
}

- (unsigned)processMemoryPressureStateCriticalCount
{
  return self->_processMemoryPressureStateCriticalCount;
}

- (unsigned)averageSampledProcessMemoryUsage
{
  return self->_averageSampledProcessMemoryUsage;
}

- (unsigned)peakSampledProcessMemoryUsage
{
  return self->_peakSampledProcessMemoryUsage;
}

- (unsigned)remoteMessagesSentCount
{
  return self->_remoteMessagesSentCount;
}

- (unsigned)remoteMessagesReceivedCount
{
  return self->_remoteMessagesReceivedCount;
}

- (unsigned)acceptedXPCRequestsCount
{
  return self->_acceptedXPCRequestsCount;
}

- (unsigned)erroredXPCRequestsCount
{
  return self->_erroredXPCRequestsCount;
}

- (unsigned)sentXPCNotificationsCount
{
  return self->_sentXPCNotificationsCount;
}

- (unsigned)filteredXPCNotificationsCount
{
  return self->_filteredXPCNotificationsCount;
}

- (unsigned)hapIPInvalidationCount
{
  return self->_hapIPInvalidationCount;
}

- (unsigned)hapIPSentHTTPRequestsCount
{
  return self->_hapIPSentHTTPRequestsCount;
}

- (unsigned)hapIPReceivedHTTPResponsesCount
{
  return self->_hapIPReceivedHTTPResponsesCount;
}

- (unsigned)hapIPReceivedHTTPEventCount
{
  return self->_hapIPReceivedHTTPEventCount;
}

- (unsigned)hapBTLEConnectionsCount
{
  return self->_hapBTLEConnectionsCount;
}

- (unsigned)hapBTLEConnectionPerReasonsCount
{
  return self->_hapBTLEConnectionPerReasonsCount;
}

- (unsigned)hapBTLEDiscoveriesCount
{
  return self->_hapBTLEDiscoveriesCount;
}

- (unsigned)activeDay
{
  return self->_activeDay;
}

- (unsigned)activeDaysPerMonthCount
{
  return self->_activeDaysPerMonthCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSyncState, 0);
}

@end
