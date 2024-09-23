@implementation HMAccessoryDiagnosticInfoProtoSetupInfo

- (void)setVersion:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasVersion
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setSessionSetupOpenMSHH1:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_sessionSetupOpenMSHH1 = a3;
}

- (void)setHasSessionSetupOpenMSHH1:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasSessionSetupOpenMSHH1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setControllerKeyExchangeMSHH1:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_controllerKeyExchangeMSHH1 = a3;
}

- (void)setHasControllerKeyExchangeMSHH1:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasControllerKeyExchangeMSHH1
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNewAccessoryTransferMSHH1:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_newAccessoryTransferMSHH1 = a3;
}

- (void)setHasNewAccessoryTransferMSHH1:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasNewAccessoryTransferMSHH1
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSessionSetupCloseMSHH1:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_sessionSetupCloseMSHH1 = a3;
}

- (void)setHasSessionSetupCloseMSHH1:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasSessionSetupCloseMSHH1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSentinelZoneFetchMSHH1:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_sentinelZoneFetchMSHH1 = a3;
}

- (void)setHasSentinelZoneFetchMSHH1:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasSentinelZoneFetchMSHH1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTotalDurationMSHH1:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_totalDurationMSHH1 = a3;
}

- (void)setHasTotalDurationMSHH1:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasTotalDurationMSHH1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setAccountSettleWaitMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_accountSettleWaitMSHH2 = a3;
}

- (void)setHasAccountSettleWaitMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAccountSettleWaitMSHH2
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCurrentDeviceIDSWaitMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_currentDeviceIDSWaitMSHH2 = a3;
}

- (void)setHasCurrentDeviceIDSWaitMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasCurrentDeviceIDSWaitMSHH2
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHomeManagerReadyMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_homeManagerReadyMSHH2 = a3;
}

- (void)setHasHomeManagerReadyMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasHomeManagerReadyMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setFirstCoreDataImportMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_firstCoreDataImportMSHH2 = a3;
}

- (void)setHasFirstCoreDataImportMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasFirstCoreDataImportMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setAccessoryAddMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_accessoryAddMSHH2 = a3;
}

- (void)setHasAccessoryAddMSHH2:(BOOL)a3
{
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAccessoryAddMSHH2
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSettingsCreationMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_settingsCreationMSHH2 = a3;
}

- (void)setHasSettingsCreationMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSettingsCreationMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setPairingIdentityCreationMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_pairingIdentityCreationMSHH2 = a3;
}

- (void)setHasPairingIdentityCreationMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasPairingIdentityCreationMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSiriReadyMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_siriReadyMSHH2 = a3;
}

- (void)setHasSiriReadyMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSiriReadyMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setEventRouterServerConnectionMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_eventRouterServerConnectionMSHH2 = a3;
}

- (void)setHasEventRouterServerConnectionMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasEventRouterServerConnectionMSHH2
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPrimaryResidentElectionMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_primaryResidentElectionMSHH2 = a3;
}

- (void)setHasPrimaryResidentElectionMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasPrimaryResidentElectionMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setEventRouterFirstEventPushMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_eventRouterFirstEventPushMSHH2 = a3;
}

- (void)setHasEventRouterFirstEventPushMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasEventRouterFirstEventPushMSHH2
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTotalDurationMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_totalDurationMSHH2 = a3;
}

- (void)setHasTotalDurationMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasTotalDurationMSHH2
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (int)iCloudAvailableINT
{
  if ((*((_BYTE *)&self->_has + 4) & 4) != 0)
    return self->_iCloudAvailableINT;
  else
    return 0;
}

- (void)setICloudAvailableINT:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_iCloudAvailableINT = a3;
}

- (void)setHasICloudAvailableINT:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasICloudAvailableINT
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (id)iCloudAvailableINTAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Unknown");
  if (a3 == 1)
  {
    v3 = CFSTR("Good");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsICloudAvailableINT:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Good"));

  return v4;
}

- (int)iDSAvailableINT
{
  if ((*((_BYTE *)&self->_has + 4) & 8) != 0)
    return self->_iDSAvailableINT;
  else
    return 0;
}

- (void)setIDSAvailableINT:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_iDSAvailableINT = a3;
}

- (void)setHasIDSAvailableINT:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasIDSAvailableINT
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (id)iDSAvailableINTAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Unknown");
  if (a3 == 1)
  {
    v3 = CFSTR("Good");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsIDSAvailableINT:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Good"));

  return v4;
}

- (int)manateeAvailableINT
{
  if ((*((_BYTE *)&self->_has + 4) & 0x40) != 0)
    return self->_manateeAvailableINT;
  else
    return 0;
}

- (void)setManateeAvailableINT:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_manateeAvailableINT = a3;
}

- (void)setHasManateeAvailableINT:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasManateeAvailableINT
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (id)manateeAvailableINTAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Unknown");
  if (a3 == 1)
  {
    v3 = CFSTR("Good");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsManateeAvailableINT:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Good"));

  return v4;
}

- (int)networkAvailableINT
{
  if ((*((_BYTE *)&self->_has + 4) & 0x80) != 0)
    return self->_networkAvailableINT;
  else
    return 0;
}

- (void)setNetworkAvailableINT:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_networkAvailableINT = a3;
}

- (void)setHasNetworkAvailableINT:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasNetworkAvailableINT
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (id)networkAvailableINTAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Unknown");
  if (a3 == 1)
  {
    v3 = CFSTR("Good");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsNetworkAvailableINT:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Good"));

  return v4;
}

- (void)setLastKnownStageErrorCode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_lastKnownStageErrorCode = a3;
}

- (void)setHasLastKnownStageErrorCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasLastKnownStageErrorCode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasLastKnownStageErrorDomain
{
  return self->_lastKnownStageErrorDomain != 0;
}

- (BOOL)hasLastKnownStageErrorString
{
  return self->_lastKnownStageErrorString != 0;
}

- (void)setLastKnownStageUnderlyingErrorCode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_lastKnownStageUnderlyingErrorCode = a3;
}

- (void)setHasLastKnownStageUnderlyingErrorCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasLastKnownStageUnderlyingErrorCode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasLastKnownStageUnderlyingErrorDomain
{
  return self->_lastKnownStageUnderlyingErrorDomain != 0;
}

- (void)setSavedEventState:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_savedEventState = a3;
}

- (void)setHasSavedEventState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasSavedEventState
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (int)lastKnownControllerHH2Mode
{
  if ((*((_BYTE *)&self->_has + 4) & 0x10) != 0)
    return self->_lastKnownControllerHH2Mode;
  else
    return 0;
}

- (void)setLastKnownControllerHH2Mode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_lastKnownControllerHH2Mode = a3;
}

- (void)setHasLastKnownControllerHH2Mode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasLastKnownControllerHH2Mode
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (id)lastKnownControllerHH2ModeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E3AAD9D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLastKnownControllerHH2Mode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HH1State")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HH2State")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)lastKnownControllerSentinelZoneExistence
{
  if ((*((_BYTE *)&self->_has + 4) & 0x20) != 0)
    return self->_lastKnownControllerSentinelZoneExistence;
  else
    return 0;
}

- (void)setLastKnownControllerSentinelZoneExistence:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_lastKnownControllerSentinelZoneExistence = a3;
}

- (void)setHasLastKnownControllerSentinelZoneExistence:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasLastKnownControllerSentinelZoneExistence
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (id)lastKnownControllerSentinelZoneExistenceAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Unknown");
  if (a3 == 1)
  {
    v3 = CFSTR("Good");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsLastKnownControllerSentinelZoneExistence:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Good"));

  return v4;
}

- (BOOL)hasControllerSetupSessionIdentifier
{
  return self->_controllerSetupSessionIdentifier != 0;
}

- (void)setNumberOfTimesPrimaryResidentChangedHH2:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_numberOfTimesPrimaryResidentChangedHH2 = a3;
}

- (void)setHasNumberOfTimesPrimaryResidentChangedHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasNumberOfTimesPrimaryResidentChangedHH2
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setLastPrimaryClientConnectedTimeHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_lastPrimaryClientConnectedTimeHH2 = a3;
}

- (void)setHasLastPrimaryClientConnectedTimeHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasLastPrimaryClientConnectedTimeHH2
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumberOfTimesPrimaryClientConnectedHH2:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_numberOfTimesPrimaryClientConnectedHH2 = a3;
}

- (void)setHasNumberOfTimesPrimaryClientConnectedHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasNumberOfTimesPrimaryClientConnectedHH2
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setNumberOfTimesPrimaryClientDisconnectedHH2:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_numberOfTimesPrimaryClientDisconnectedHH2 = a3;
}

- (void)setHasNumberOfTimesPrimaryClientDisconnectedHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasNumberOfTimesPrimaryClientDisconnectedHH2
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setNumberOfTimesPrimaryClientConnectMessageFailedHH2:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_numberOfTimesPrimaryClientConnectMessageFailedHH2 = a3;
}

- (void)setHasNumberOfTimesPrimaryClientConnectMessageFailedHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasNumberOfTimesPrimaryClientConnectMessageFailedHH2
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setCurrentDeviceConfirmedPrimaryResidentINT:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_currentDeviceConfirmedPrimaryResidentINT = a3;
}

- (void)setHasCurrentDeviceConfirmedPrimaryResidentINT:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasCurrentDeviceConfirmedPrimaryResidentINT
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setLastPrimaryClientConnectMessageFailErrorCodeHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_lastPrimaryClientConnectMessageFailErrorCodeHH2 = a3;
}

- (void)setHasLastPrimaryClientConnectMessageFailErrorCodeHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasLastPrimaryClientConnectMessageFailErrorCodeHH2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasLastPrimaryClientConnectMessageFailErrorDomainHH2
{
  return self->_lastPrimaryClientConnectMessageFailErrorDomainHH2 != 0;
}

- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2 = a3;
}

- (void)setHasLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2
{
  return self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 != 0;
}

- (void)setPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2 = a3;
}

- (void)setHasPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2 = a3;
}

- (void)setHasPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2 = a3;
}

- (void)setHasPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2 = a3;
}

- (void)setHasPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setPrimaryResidentElectionJoinMeshMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_primaryResidentElectionJoinMeshMSHH2 = a3;
}

- (void)setHasPrimaryResidentElectionJoinMeshMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasPrimaryResidentElectionJoinMeshMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setFirstCoreDataContainerSetupDurationMSHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_firstCoreDataContainerSetupDurationMSHH2 = a3;
}

- (void)setHasFirstCoreDataContainerSetupDurationMSHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasFirstCoreDataContainerSetupDurationMSHH2
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setFirstCoreDataContainerSetupErrorCodeHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_firstCoreDataContainerSetupErrorCodeHH2 = a3;
}

- (void)setHasFirstCoreDataContainerSetupErrorCodeHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasFirstCoreDataContainerSetupErrorCodeHH2
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasFirstCoreDataContainerSetupErrorDomainHH2
{
  return self->_firstCoreDataContainerSetupErrorDomainHH2 != 0;
}

- (void)setFirstCoreDataContainerSetupUnderlyingErrorCodeHH2:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2 = a3;
}

- (void)setHasFirstCoreDataContainerSetupUnderlyingErrorCodeHH2:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($14E84874AB12F438965F2E1C57E118F4)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasFirstCoreDataContainerSetupUnderlyingErrorCodeHH2
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasFirstCoreDataContainerSetupUnderlyingErrorDomainHH2
{
  return self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2 != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoSetupInfo;
  -[HMAccessoryDiagnosticInfoProtoSetupInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfoProtoSetupInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $14E84874AB12F438965F2E1C57E118F4 has;
  void *v5;
  NSString *lastKnownStageErrorDomain;
  NSString *lastKnownStageErrorString;
  void *v8;
  NSString *lastKnownStageUnderlyingErrorDomain;
  $14E84874AB12F438965F2E1C57E118F4 v10;
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
  int iCloudAvailableINT;
  __CFString *v31;
  void *v32;
  uint64_t lastKnownControllerHH2Mode;
  __CFString *v34;
  int lastKnownControllerSentinelZoneExistence;
  __CFString *v36;
  int iDSAvailableINT;
  __CFString *v38;
  NSString *controllerSetupSessionIdentifier;
  $14E84874AB12F438965F2E1C57E118F4 v40;
  void *v41;
  NSString *lastPrimaryClientConnectMessageFailErrorDomainHH2;
  void *v43;
  NSString *lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2;
  $14E84874AB12F438965F2E1C57E118F4 v45;
  void *v46;
  NSString *firstCoreDataContainerSetupErrorDomainHH2;
  void *v48;
  NSString *firstCoreDataContainerSetupUnderlyingErrorDomainHH2;
  id v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int manateeAvailableINT;
  __CFString *v65;
  int networkAvailableINT;
  __CFString *v67;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_version);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("version"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sessionSetupOpenMSHH1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sessionSetupOpenMS_HH1"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_controllerKeyExchangeMSHH1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("controllerKeyExchangeMS_HH1"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_newAccessoryTransferMSHH1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("newAccessoryTransferMS_HH1"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sessionSetupCloseMSHH1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("sessionSetupCloseMS_HH1"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sentinelZoneFetchMSHH1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("sentinelZoneFetchMS_HH1"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_totalDurationMSHH1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("totalDurationMS_HH1"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_accountSettleWaitMSHH2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("accountSettleWaitMS_HH2"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_currentDeviceIDSWaitMSHH2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("currentDeviceIDSWaitMS_HH2"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_homeManagerReadyMSHH2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("homeManagerReadyMS_HH2"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_firstCoreDataImportMSHH2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("firstCoreDataImportMS_HH2"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_accessoryAddMSHH2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("accessoryAddMS_HH2"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_settingsCreationMSHH2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("settingsCreationMS_HH2"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_pairingIdentityCreationMSHH2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("pairingIdentityCreationMS_HH2"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_siriReadyMSHH2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("siriReadyMS_HH2"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_eventRouterServerConnectionMSHH2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("eventRouterServerConnectionMS_HH2"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_primaryResidentElectionMSHH2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("primaryResidentElectionMS_HH2"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_eventRouterFirstEventPushMSHH2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("eventRouterFirstEventPushMS_HH2"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_totalDurationMSHH2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("totalDurationMS_HH2"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_22;
    goto LABEL_71;
  }
LABEL_57:
  iCloudAvailableINT = self->_iCloudAvailableINT;
  if (iCloudAvailableINT)
  {
    if (iCloudAvailableINT == 1)
    {
      v31 = CFSTR("Good");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_iCloudAvailableINT);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v31 = CFSTR("Unknown");
  }
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("iCloudAvailable_INT"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_23;
    goto LABEL_125;
  }
LABEL_71:
  iDSAvailableINT = self->_iDSAvailableINT;
  if (iDSAvailableINT)
  {
    if (iDSAvailableINT == 1)
    {
      v38 = CFSTR("Good");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_iDSAvailableINT);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v38 = CFSTR("Unknown");
  }
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("IDSAvailable_INT"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_24;
    goto LABEL_131;
  }
LABEL_125:
  manateeAvailableINT = self->_manateeAvailableINT;
  if (manateeAvailableINT)
  {
    if (manateeAvailableINT == 1)
    {
      v65 = CFSTR("Good");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_manateeAvailableINT);
      v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v65 = CFSTR("Unknown");
  }
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("manateeAvailable_INT"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_131:
  networkAvailableINT = self->_networkAvailableINT;
  if (networkAvailableINT)
  {
    if (networkAvailableINT == 1)
    {
      v67 = CFSTR("Good");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_networkAvailableINT);
      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v67 = CFSTR("Unknown");
  }
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("networkAvailable_INT"));

  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastKnownStageErrorCode);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("lastKnownStageErrorCode"));

  }
LABEL_26:
  lastKnownStageErrorDomain = self->_lastKnownStageErrorDomain;
  if (lastKnownStageErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", lastKnownStageErrorDomain, CFSTR("lastKnownStageErrorDomain"));
  lastKnownStageErrorString = self->_lastKnownStageErrorString;
  if (lastKnownStageErrorString)
    objc_msgSend(v3, "setObject:forKey:", lastKnownStageErrorString, CFSTR("lastKnownStageErrorString"));
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastKnownStageUnderlyingErrorCode);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("lastKnownStageUnderlyingErrorCode"));

  }
  lastKnownStageUnderlyingErrorDomain = self->_lastKnownStageUnderlyingErrorDomain;
  if (lastKnownStageUnderlyingErrorDomain)
    objc_msgSend(v3, "setObject:forKey:", lastKnownStageUnderlyingErrorDomain, CFSTR("lastKnownStageUnderlyingErrorDomain"));
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x1000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_savedEventState);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("savedEventState"));

    v10 = self->_has;
    if ((*(_QWORD *)&v10 & 0x1000000000) == 0)
    {
LABEL_36:
      if ((*(_QWORD *)&v10 & 0x2000000000) == 0)
        goto LABEL_77;
      goto LABEL_65;
    }
  }
  else if ((*(_QWORD *)&v10 & 0x1000000000) == 0)
  {
    goto LABEL_36;
  }
  lastKnownControllerHH2Mode = self->_lastKnownControllerHH2Mode;
  if (lastKnownControllerHH2Mode >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_lastKnownControllerHH2Mode);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = off_1E3AAD9D8[lastKnownControllerHH2Mode];
  }
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("lastKnownControllerHH2Mode"));

  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
  {
LABEL_65:
    lastKnownControllerSentinelZoneExistence = self->_lastKnownControllerSentinelZoneExistence;
    if (lastKnownControllerSentinelZoneExistence)
    {
      if (lastKnownControllerSentinelZoneExistence == 1)
      {
        v36 = CFSTR("Good");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_lastKnownControllerSentinelZoneExistence);
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v36 = CFSTR("Unknown");
    }
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("lastKnownControllerSentinelZoneExistence"));

  }
LABEL_77:
  controllerSetupSessionIdentifier = self->_controllerSetupSessionIdentifier;
  if (controllerSetupSessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", controllerSetupSessionIdentifier, CFSTR("controllerSetupSessionIdentifier"));
  v40 = self->_has;
  if ((*(_QWORD *)&v40 & 0x80000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfTimesPrimaryResidentChangedHH2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("numberOfTimesPrimaryResidentChanged_HH2"));

    v40 = self->_has;
    if ((*(_WORD *)&v40 & 0x8000) == 0)
    {
LABEL_81:
      if ((*(_QWORD *)&v40 & 0x20000000000) == 0)
        goto LABEL_82;
      goto LABEL_110;
    }
  }
  else if ((*(_WORD *)&v40 & 0x8000) == 0)
  {
    goto LABEL_81;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastPrimaryClientConnectedTimeHH2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("lastPrimaryClientConnectedTime_HH2"));

  v40 = self->_has;
  if ((*(_QWORD *)&v40 & 0x20000000000) == 0)
  {
LABEL_82:
    if ((*(_QWORD *)&v40 & 0x40000000000) == 0)
      goto LABEL_83;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfTimesPrimaryClientConnectedHH2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("numberOfTimesPrimaryClientConnected_HH2"));

  v40 = self->_has;
  if ((*(_QWORD *)&v40 & 0x40000000000) == 0)
  {
LABEL_83:
    if ((*(_QWORD *)&v40 & 0x10000000000) == 0)
      goto LABEL_84;
    goto LABEL_112;
  }
LABEL_111:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfTimesPrimaryClientDisconnectedHH2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("numberOfTimesPrimaryClientDisconnected_HH2"));

  v40 = self->_has;
  if ((*(_QWORD *)&v40 & 0x10000000000) == 0)
  {
LABEL_84:
    if ((*(_QWORD *)&v40 & 0x200000000) == 0)
      goto LABEL_85;
    goto LABEL_113;
  }
LABEL_112:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfTimesPrimaryClientConnectMessageFailedHH2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("numberOfTimesPrimaryClientConnectMessageFailed_HH2"));

  v40 = self->_has;
  if ((*(_QWORD *)&v40 & 0x200000000) == 0)
  {
LABEL_85:
    if ((*(_WORD *)&v40 & 0x2000) == 0)
      goto LABEL_87;
    goto LABEL_86;
  }
LABEL_113:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentDeviceConfirmedPrimaryResidentINT);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("currentDeviceConfirmedPrimaryResident_INT"));

  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_86:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastPrimaryClientConnectMessageFailErrorCodeHH2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("lastPrimaryClientConnectMessageFailErrorCode_HH2"));

  }
LABEL_87:
  lastPrimaryClientConnectMessageFailErrorDomainHH2 = self->_lastPrimaryClientConnectMessageFailErrorDomainHH2;
  if (lastPrimaryClientConnectMessageFailErrorDomainHH2)
    objc_msgSend(v3, "setObject:forKey:", lastPrimaryClientConnectMessageFailErrorDomainHH2, CFSTR("lastPrimaryClientConnectMessageFailErrorDomain_HH2"));
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2"));

  }
  lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 = self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2;
  if (lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2)
    objc_msgSend(v3, "setObject:forKey:", lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2, CFSTR("lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2"));
  v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("primaryResidentElectionPeerDeviceFutureResolvedMS_HH2"));

    v45 = self->_has;
    if ((*(_DWORD *)&v45 & 0x40000) == 0)
    {
LABEL_95:
      if ((*(_DWORD *)&v45 & 0x200000) == 0)
        goto LABEL_96;
      goto LABEL_117;
    }
  }
  else if ((*(_DWORD *)&v45 & 0x40000) == 0)
  {
    goto LABEL_95;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2"));

  v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x200000) == 0)
  {
LABEL_96:
    if ((*(_DWORD *)&v45 & 0x400000) == 0)
      goto LABEL_97;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2"));

  v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x400000) == 0)
  {
LABEL_97:
    if ((*(_DWORD *)&v45 & 0x80000) == 0)
      goto LABEL_98;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2"));

  v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x80000) == 0)
  {
LABEL_98:
    if ((*(_BYTE *)&v45 & 0x40) == 0)
      goto LABEL_99;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_primaryResidentElectionJoinMeshMSHH2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("primaryResidentElectionJoinMeshMS_HH2"));

  v45 = self->_has;
  if ((*(_BYTE *)&v45 & 0x40) == 0)
  {
LABEL_99:
    if ((*(_BYTE *)&v45 & 0x80) == 0)
      goto LABEL_101;
    goto LABEL_100;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_firstCoreDataContainerSetupDurationMSHH2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("firstCoreDataContainerSetupDurationMS_HH2"));

  if ((*(_QWORD *)&self->_has & 0x80) != 0)
  {
LABEL_100:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_firstCoreDataContainerSetupErrorCodeHH2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("firstCoreDataContainerSetupErrorCode_HH2"));

  }
LABEL_101:
  firstCoreDataContainerSetupErrorDomainHH2 = self->_firstCoreDataContainerSetupErrorDomainHH2;
  if (firstCoreDataContainerSetupErrorDomainHH2)
    objc_msgSend(v3, "setObject:forKey:", firstCoreDataContainerSetupErrorDomainHH2, CFSTR("firstCoreDataContainerSetupErrorDomain_HH2"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("firstCoreDataContainerSetupUnderlyingErrorCode_HH2"));

  }
  firstCoreDataContainerSetupUnderlyingErrorDomainHH2 = self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2;
  if (firstCoreDataContainerSetupUnderlyingErrorDomainHH2)
    objc_msgSend(v3, "setObject:forKey:", firstCoreDataContainerSetupUnderlyingErrorDomainHH2, CFSTR("firstCoreDataContainerSetupUnderlyingErrorDomain_HH2"));
  v50 = v3;

  return v50;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoSetupInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $14E84874AB12F438965F2E1C57E118F4 has;
  $14E84874AB12F438965F2E1C57E118F4 v5;
  $14E84874AB12F438965F2E1C57E118F4 v6;
  $14E84874AB12F438965F2E1C57E118F4 v7;
  id v8;

  v8 = a3;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_72;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_6;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_8;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_9;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_13;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_14;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_16;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_21;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_22;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_23;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_24;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_92:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
LABEL_25:
    PBDataWriterWriteInt64Field();
LABEL_26:
  if (self->_lastKnownStageErrorDomain)
    PBDataWriterWriteStringField();
  if (self->_lastKnownStageErrorString)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_lastKnownStageUnderlyingErrorDomain)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = self->_has;
    if ((*(_QWORD *)&v5 & 0x1000000000) == 0)
    {
LABEL_36:
      if ((*(_QWORD *)&v5 & 0x2000000000) == 0)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  else if ((*(_QWORD *)&v5 & 0x1000000000) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
LABEL_37:
    PBDataWriterWriteInt32Field();
LABEL_38:
  if (self->_controllerSetupSessionIdentifier)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x80000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x8000) == 0)
    {
LABEL_42:
      if ((*(_QWORD *)&v6 & 0x20000000000) == 0)
        goto LABEL_43;
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
    goto LABEL_42;
  }
  PBDataWriterWriteInt64Field();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&v6 & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&v6 & 0x10000000000) == 0)
      goto LABEL_45;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&v6 & 0x200000000) == 0)
      goto LABEL_46;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x200000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
LABEL_47:
    PBDataWriterWriteInt64Field();
LABEL_48:
  if (self->_lastPrimaryClientConnectMessageFailErrorDomainHH2)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
    {
LABEL_56:
      if ((*(_DWORD *)&v7 & 0x200000) == 0)
        goto LABEL_57;
      goto LABEL_106;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
    goto LABEL_56;
  }
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
      goto LABEL_58;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_58:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_59;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_61;
    goto LABEL_60;
  }
LABEL_108:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x80) != 0)
LABEL_60:
    PBDataWriterWriteInt64Field();
LABEL_61:
  if (self->_firstCoreDataContainerSetupErrorDomainHH2)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $14E84874AB12F438965F2E1C57E118F4 has;
  $14E84874AB12F438965F2E1C57E118F4 v6;
  $14E84874AB12F438965F2E1C57E118F4 v7;
  $14E84874AB12F438965F2E1C57E118F4 v8;
  _QWORD *v9;

  v4 = a3;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    v4[33] = self->_version;
    v4[48] |= 0x100000000uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_71;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  v4[28] = self->_sessionSetupOpenMSHH1;
  v4[48] |= 0x8000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_72;
  }
LABEL_71:
  v4[3] = self->_controllerKeyExchangeMSHH1;
  v4[48] |= 4uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_6;
    goto LABEL_73;
  }
LABEL_72:
  v4[17] = self->_newAccessoryTransferMSHH1;
  v4[48] |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_74;
  }
LABEL_73:
  v4[27] = self->_sessionSetupCloseMSHH1;
  v4[48] |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_8;
    goto LABEL_75;
  }
LABEL_74:
  v4[26] = self->_sentinelZoneFetchMSHH1;
  v4[48] |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_9;
    goto LABEL_76;
  }
LABEL_75:
  v4[31] = self->_totalDurationMSHH1;
  v4[48] |= 0x40000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_77;
  }
LABEL_76:
  v4[2] = self->_accountSettleWaitMSHH2;
  v4[48] |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_78;
  }
LABEL_77:
  v4[4] = self->_currentDeviceIDSWaitMSHH2;
  v4[48] |= 8uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_79;
  }
LABEL_78:
  v4[11] = self->_homeManagerReadyMSHH2;
  v4[48] |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_13;
    goto LABEL_80;
  }
LABEL_79:
  v4[10] = self->_firstCoreDataImportMSHH2;
  v4[48] |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_14;
    goto LABEL_81;
  }
LABEL_80:
  v4[1] = self->_accessoryAddMSHH2;
  v4[48] |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_82;
  }
LABEL_81:
  v4[29] = self->_settingsCreationMSHH2;
  v4[48] |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_16;
    goto LABEL_83;
  }
LABEL_82:
  v4[18] = self->_pairingIdentityCreationMSHH2;
  v4[48] |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_84;
  }
LABEL_83:
  v4[30] = self->_siriReadyMSHH2;
  v4[48] |= 0x20000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_85;
  }
LABEL_84:
  v4[6] = self->_eventRouterServerConnectionMSHH2;
  v4[48] |= 0x20uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_86;
  }
LABEL_85:
  v4[21] = self->_primaryResidentElectionMSHH2;
  v4[48] |= 0x100000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_87;
  }
LABEL_86:
  v4[5] = self->_eventRouterFirstEventPushMSHH2;
  v4[48] |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_21;
    goto LABEL_88;
  }
LABEL_87:
  v4[32] = self->_totalDurationMSHH2;
  v4[48] |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_22;
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v4 + 76) = self->_iCloudAvailableINT;
  v4[48] |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_23;
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v4 + 77) = self->_iDSAvailableINT;
  v4[48] |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_24;
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v4 + 90) = self->_manateeAvailableINT;
  v4[48] |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_91:
  *((_DWORD *)v4 + 91) = self->_networkAvailableINT;
  v4[48] |= 0x8000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_25:
    v4[12] = self->_lastKnownStageErrorCode;
    v4[48] |= 0x800uLL;
  }
LABEL_26:
  v9 = v4;
  if (self->_lastKnownStageErrorDomain)
  {
    objc_msgSend(v4, "setLastKnownStageErrorDomain:");
    v4 = v9;
  }
  if (self->_lastKnownStageErrorString)
  {
    objc_msgSend(v9, "setLastKnownStageErrorString:");
    v4 = v9;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    v4[13] = self->_lastKnownStageUnderlyingErrorCode;
    v4[48] |= 0x1000uLL;
  }
  if (self->_lastKnownStageUnderlyingErrorDomain)
  {
    objc_msgSend(v9, "setLastKnownStageUnderlyingErrorDomain:");
    v4 = v9;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) != 0)
  {
    v4[25] = self->_savedEventState;
    v4[48] |= 0x1000000uLL;
    v6 = self->_has;
    if ((*(_QWORD *)&v6 & 0x1000000000) == 0)
    {
LABEL_36:
      if ((*(_QWORD *)&v6 & 0x2000000000) == 0)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  else if ((*(_QWORD *)&v6 & 0x1000000000) == 0)
  {
    goto LABEL_36;
  }
  *((_DWORD *)v4 + 78) = self->_lastKnownControllerHH2Mode;
  v4[48] |= 0x1000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
  {
LABEL_37:
    *((_DWORD *)v4 + 79) = self->_lastKnownControllerSentinelZoneExistence;
    v4[48] |= 0x2000000000uLL;
  }
LABEL_38:
  if (self->_controllerSetupSessionIdentifier)
  {
    objc_msgSend(v9, "setControllerSetupSessionIdentifier:");
    v4 = v9;
  }
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x80000000000) != 0)
  {
    *((_DWORD *)v4 + 95) = self->_numberOfTimesPrimaryResidentChangedHH2;
    v4[48] |= 0x80000000000uLL;
    v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x8000) == 0)
    {
LABEL_42:
      if ((*(_QWORD *)&v7 & 0x20000000000) == 0)
        goto LABEL_43;
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
    goto LABEL_42;
  }
  v4[16] = self->_lastPrimaryClientConnectedTimeHH2;
  v4[48] |= 0x8000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&v7 & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v4 + 93) = self->_numberOfTimesPrimaryClientConnectedHH2;
  v4[48] |= 0x20000000000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&v7 & 0x10000000000) == 0)
      goto LABEL_45;
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v4 + 94) = self->_numberOfTimesPrimaryClientDisconnectedHH2;
  v4[48] |= 0x40000000000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&v7 & 0x200000000) == 0)
      goto LABEL_46;
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v4 + 92) = self->_numberOfTimesPrimaryClientConnectMessageFailedHH2;
  v4[48] |= 0x10000000000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x200000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
LABEL_101:
  *((_DWORD *)v4 + 70) = self->_currentDeviceConfirmedPrimaryResidentINT;
  v4[48] |= 0x200000000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_47:
    v4[14] = self->_lastPrimaryClientConnectMessageFailErrorCodeHH2;
    v4[48] |= 0x2000uLL;
  }
LABEL_48:
  if (self->_lastPrimaryClientConnectMessageFailErrorDomainHH2)
  {
    objc_msgSend(v9, "setLastPrimaryClientConnectMessageFailErrorDomainHH2:");
    v4 = v9;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    v4[15] = self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2;
    v4[48] |= 0x4000uLL;
  }
  if (self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2)
  {
    objc_msgSend(v9, "setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:");
    v4 = v9;
  }
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) != 0)
  {
    v4[24] = self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2;
    v4[48] |= 0x800000uLL;
    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x40000) == 0)
    {
LABEL_56:
      if ((*(_DWORD *)&v8 & 0x200000) == 0)
        goto LABEL_57;
      goto LABEL_105;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
    goto LABEL_56;
  }
  v4[19] = self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2;
  v4[48] |= 0x40000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v8 & 0x400000) == 0)
      goto LABEL_58;
    goto LABEL_106;
  }
LABEL_105:
  v4[22] = self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2;
  v4[48] |= 0x200000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&v8 & 0x80000) == 0)
      goto LABEL_59;
    goto LABEL_107;
  }
LABEL_106:
  v4[23] = self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2;
  v4[48] |= 0x400000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_60;
    goto LABEL_108;
  }
LABEL_107:
  v4[20] = self->_primaryResidentElectionJoinMeshMSHH2;
  v4[48] |= 0x80000uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x40) == 0)
  {
LABEL_60:
    if ((*(_BYTE *)&v8 & 0x80) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_108:
  v4[7] = self->_firstCoreDataContainerSetupDurationMSHH2;
  v4[48] |= 0x40uLL;
  if ((*(_QWORD *)&self->_has & 0x80) != 0)
  {
LABEL_61:
    v4[8] = self->_firstCoreDataContainerSetupErrorCodeHH2;
    v4[48] |= 0x80uLL;
  }
LABEL_62:
  if (self->_firstCoreDataContainerSetupErrorDomainHH2)
  {
    objc_msgSend(v9, "setFirstCoreDataContainerSetupErrorDomainHH2:");
    v4 = v9;
  }
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    v4[9] = self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2;
    v4[48] |= 0x100uLL;
  }
  if (self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2)
  {
    objc_msgSend(v9, "setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:");
    v4 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $14E84874AB12F438965F2E1C57E118F4 has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  $14E84874AB12F438965F2E1C57E118F4 v14;
  uint64_t v15;
  void *v16;
  $14E84874AB12F438965F2E1C57E118F4 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  $14E84874AB12F438965F2E1C57E118F4 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    *(_QWORD *)(v5 + 264) = self->_version;
    *(_QWORD *)(v5 + 384) |= 0x100000000uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 224) = self->_sessionSetupOpenMSHH1;
  *(_QWORD *)(v5 + 384) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_56;
  }
LABEL_55:
  *(_QWORD *)(v5 + 24) = self->_controllerKeyExchangeMSHH1;
  *(_QWORD *)(v5 + 384) |= 4uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_6;
    goto LABEL_57;
  }
LABEL_56:
  *(_QWORD *)(v5 + 136) = self->_newAccessoryTransferMSHH1;
  *(_QWORD *)(v5 + 384) |= 0x10000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_58;
  }
LABEL_57:
  *(_QWORD *)(v5 + 216) = self->_sessionSetupCloseMSHH1;
  *(_QWORD *)(v5 + 384) |= 0x4000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_8;
    goto LABEL_59;
  }
LABEL_58:
  *(_QWORD *)(v5 + 208) = self->_sentinelZoneFetchMSHH1;
  *(_QWORD *)(v5 + 384) |= 0x2000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_9;
    goto LABEL_60;
  }
LABEL_59:
  *(_QWORD *)(v5 + 248) = self->_totalDurationMSHH1;
  *(_QWORD *)(v5 + 384) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_61;
  }
LABEL_60:
  *(_QWORD *)(v5 + 16) = self->_accountSettleWaitMSHH2;
  *(_QWORD *)(v5 + 384) |= 2uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_62;
  }
LABEL_61:
  *(_QWORD *)(v5 + 32) = self->_currentDeviceIDSWaitMSHH2;
  *(_QWORD *)(v5 + 384) |= 8uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_63;
  }
LABEL_62:
  *(_QWORD *)(v5 + 88) = self->_homeManagerReadyMSHH2;
  *(_QWORD *)(v5 + 384) |= 0x400uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_13;
    goto LABEL_64;
  }
LABEL_63:
  *(_QWORD *)(v5 + 80) = self->_firstCoreDataImportMSHH2;
  *(_QWORD *)(v5 + 384) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_14;
    goto LABEL_65;
  }
LABEL_64:
  *(_QWORD *)(v5 + 8) = self->_accessoryAddMSHH2;
  *(_QWORD *)(v5 + 384) |= 1uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_66;
  }
LABEL_65:
  *(_QWORD *)(v5 + 232) = self->_settingsCreationMSHH2;
  *(_QWORD *)(v5 + 384) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_16;
    goto LABEL_67;
  }
LABEL_66:
  *(_QWORD *)(v5 + 144) = self->_pairingIdentityCreationMSHH2;
  *(_QWORD *)(v5 + 384) |= 0x20000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_68;
  }
LABEL_67:
  *(_QWORD *)(v5 + 240) = self->_siriReadyMSHH2;
  *(_QWORD *)(v5 + 384) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_69;
  }
LABEL_68:
  *(_QWORD *)(v5 + 48) = self->_eventRouterServerConnectionMSHH2;
  *(_QWORD *)(v5 + 384) |= 0x20uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_70;
  }
LABEL_69:
  *(_QWORD *)(v5 + 168) = self->_primaryResidentElectionMSHH2;
  *(_QWORD *)(v5 + 384) |= 0x100000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_71;
  }
LABEL_70:
  *(_QWORD *)(v5 + 40) = self->_eventRouterFirstEventPushMSHH2;
  *(_QWORD *)(v5 + 384) |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_21;
    goto LABEL_72;
  }
LABEL_71:
  *(_QWORD *)(v5 + 256) = self->_totalDurationMSHH2;
  *(_QWORD *)(v5 + 384) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_22;
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v5 + 304) = self->_iCloudAvailableINT;
  *(_QWORD *)(v5 + 384) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_23;
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 308) = self->_iDSAvailableINT;
  *(_QWORD *)(v5 + 384) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_24;
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 360) = self->_manateeAvailableINT;
  *(_QWORD *)(v5 + 384) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_75:
  *(_DWORD *)(v5 + 364) = self->_networkAvailableINT;
  *(_QWORD *)(v5 + 384) |= 0x8000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_25:
    *(_QWORD *)(v5 + 96) = self->_lastKnownStageErrorCode;
    *(_QWORD *)(v5 + 384) |= 0x800uLL;
  }
LABEL_26:
  v8 = -[NSString copyWithZone:](self->_lastKnownStageErrorDomain, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 320);
  *(_QWORD *)(v6 + 320) = v8;

  v10 = -[NSString copyWithZone:](self->_lastKnownStageErrorString, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 328);
  *(_QWORD *)(v6 + 328) = v10;

  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *(_QWORD *)(v6 + 104) = self->_lastKnownStageUnderlyingErrorCode;
    *(_QWORD *)(v6 + 384) |= 0x1000uLL;
  }
  v12 = -[NSString copyWithZone:](self->_lastKnownStageUnderlyingErrorDomain, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 336);
  *(_QWORD *)(v6 + 336) = v12;

  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) != 0)
  {
    *(_QWORD *)(v6 + 200) = self->_savedEventState;
    *(_QWORD *)(v6 + 384) |= 0x1000000uLL;
    v14 = self->_has;
    if ((*(_QWORD *)&v14 & 0x1000000000) == 0)
    {
LABEL_30:
      if ((*(_QWORD *)&v14 & 0x2000000000) == 0)
        goto LABEL_32;
      goto LABEL_31;
    }
  }
  else if ((*(_QWORD *)&v14 & 0x1000000000) == 0)
  {
    goto LABEL_30;
  }
  *(_DWORD *)(v6 + 312) = self->_lastKnownControllerHH2Mode;
  *(_QWORD *)(v6 + 384) |= 0x1000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
  {
LABEL_31:
    *(_DWORD *)(v6 + 316) = self->_lastKnownControllerSentinelZoneExistence;
    *(_QWORD *)(v6 + 384) |= 0x2000000000uLL;
  }
LABEL_32:
  v15 = -[NSString copyWithZone:](self->_controllerSetupSessionIdentifier, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 272);
  *(_QWORD *)(v6 + 272) = v15;

  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x80000000000) != 0)
  {
    *(_DWORD *)(v6 + 380) = self->_numberOfTimesPrimaryResidentChangedHH2;
    *(_QWORD *)(v6 + 384) |= 0x80000000000uLL;
    v17 = self->_has;
    if ((*(_WORD *)&v17 & 0x8000) == 0)
    {
LABEL_34:
      if ((*(_QWORD *)&v17 & 0x20000000000) == 0)
        goto LABEL_35;
      goto LABEL_82;
    }
  }
  else if ((*(_WORD *)&v17 & 0x8000) == 0)
  {
    goto LABEL_34;
  }
  *(_QWORD *)(v6 + 128) = self->_lastPrimaryClientConnectedTimeHH2;
  *(_QWORD *)(v6 + 384) |= 0x8000uLL;
  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x20000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&v17 & 0x40000000000) == 0)
      goto LABEL_36;
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v6 + 372) = self->_numberOfTimesPrimaryClientConnectedHH2;
  *(_QWORD *)(v6 + 384) |= 0x20000000000uLL;
  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x40000000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&v17 & 0x10000000000) == 0)
      goto LABEL_37;
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v6 + 376) = self->_numberOfTimesPrimaryClientDisconnectedHH2;
  *(_QWORD *)(v6 + 384) |= 0x40000000000uLL;
  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x10000000000) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&v17 & 0x200000000) == 0)
      goto LABEL_38;
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v6 + 368) = self->_numberOfTimesPrimaryClientConnectMessageFailedHH2;
  *(_QWORD *)(v6 + 384) |= 0x10000000000uLL;
  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x200000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v17 & 0x2000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_85:
  *(_DWORD *)(v6 + 280) = self->_currentDeviceConfirmedPrimaryResidentINT;
  *(_QWORD *)(v6 + 384) |= 0x200000000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_39:
    *(_QWORD *)(v6 + 112) = self->_lastPrimaryClientConnectMessageFailErrorCodeHH2;
    *(_QWORD *)(v6 + 384) |= 0x2000uLL;
  }
LABEL_40:
  v18 = -[NSString copyWithZone:](self->_lastPrimaryClientConnectMessageFailErrorDomainHH2, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 344);
  *(_QWORD *)(v6 + 344) = v18;

  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *(_QWORD *)(v6 + 120) = self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2;
    *(_QWORD *)(v6 + 384) |= 0x4000uLL;
  }
  v20 = -[NSString copyWithZone:](self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 352);
  *(_QWORD *)(v6 + 352) = v20;

  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x800000) != 0)
  {
    *(_QWORD *)(v6 + 192) = self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2;
    *(_QWORD *)(v6 + 384) |= 0x800000uLL;
    v22 = self->_has;
    if ((*(_DWORD *)&v22 & 0x40000) == 0)
    {
LABEL_44:
      if ((*(_DWORD *)&v22 & 0x200000) == 0)
        goto LABEL_45;
      goto LABEL_89;
    }
  }
  else if ((*(_DWORD *)&v22 & 0x40000) == 0)
  {
    goto LABEL_44;
  }
  *(_QWORD *)(v6 + 152) = self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2;
  *(_QWORD *)(v6 + 384) |= 0x40000uLL;
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x200000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v22 & 0x400000) == 0)
      goto LABEL_46;
    goto LABEL_90;
  }
LABEL_89:
  *(_QWORD *)(v6 + 176) = self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2;
  *(_QWORD *)(v6 + 384) |= 0x200000uLL;
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x400000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v22 & 0x80000) == 0)
      goto LABEL_47;
    goto LABEL_91;
  }
LABEL_90:
  *(_QWORD *)(v6 + 184) = self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2;
  *(_QWORD *)(v6 + 384) |= 0x400000uLL;
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000) == 0)
  {
LABEL_47:
    if ((*(_BYTE *)&v22 & 0x40) == 0)
      goto LABEL_48;
    goto LABEL_92;
  }
LABEL_91:
  *(_QWORD *)(v6 + 160) = self->_primaryResidentElectionJoinMeshMSHH2;
  *(_QWORD *)(v6 + 384) |= 0x80000uLL;
  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 0x40) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&v22 & 0x80) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_92:
  *(_QWORD *)(v6 + 56) = self->_firstCoreDataContainerSetupDurationMSHH2;
  *(_QWORD *)(v6 + 384) |= 0x40uLL;
  if ((*(_QWORD *)&self->_has & 0x80) != 0)
  {
LABEL_49:
    *(_QWORD *)(v6 + 64) = self->_firstCoreDataContainerSetupErrorCodeHH2;
    *(_QWORD *)(v6 + 384) |= 0x80uLL;
  }
LABEL_50:
  v23 = -[NSString copyWithZone:](self->_firstCoreDataContainerSetupErrorDomainHH2, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 288);
  *(_QWORD *)(v6 + 288) = v23;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_QWORD *)(v6 + 72) = self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2;
    *(_QWORD *)(v6 + 384) |= 0x100uLL;
  }
  v25 = -[NSString copyWithZone:](self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 296);
  *(_QWORD *)(v6 + 296) = v25;

  v27 = (id)v6;
  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $14E84874AB12F438965F2E1C57E118F4 has;
  uint64_t v6;
  NSString *lastKnownStageErrorDomain;
  NSString *lastKnownStageErrorString;
  $14E84874AB12F438965F2E1C57E118F4 v9;
  uint64_t v10;
  NSString *lastKnownStageUnderlyingErrorDomain;
  NSString *controllerSetupSessionIdentifier;
  NSString *lastPrimaryClientConnectMessageFailErrorDomainHH2;
  NSString *lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2;
  NSString *firstCoreDataContainerSetupErrorDomainHH2;
  NSString *firstCoreDataContainerSetupUnderlyingErrorDomainHH2;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_243;
  has = self->_has;
  v6 = *((_QWORD *)v4 + 48);
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0 || self->_version != *((_QWORD *)v4 + 33))
      goto LABEL_243;
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_sessionSetupOpenMSHH1 != *((_QWORD *)v4 + 28))
      goto LABEL_243;
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_controllerKeyExchangeMSHH1 != *((_QWORD *)v4 + 3))
      goto LABEL_243;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_newAccessoryTransferMSHH1 != *((_QWORD *)v4 + 17))
      goto LABEL_243;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_sessionSetupCloseMSHH1 != *((_QWORD *)v4 + 27))
      goto LABEL_243;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_sentinelZoneFetchMSHH1 != *((_QWORD *)v4 + 26))
      goto LABEL_243;
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_totalDurationMSHH1 != *((_QWORD *)v4 + 31))
      goto LABEL_243;
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accountSettleWaitMSHH2 != *((_QWORD *)v4 + 2))
      goto LABEL_243;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_currentDeviceIDSWaitMSHH2 != *((_QWORD *)v4 + 4))
      goto LABEL_243;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_homeManagerReadyMSHH2 != *((_QWORD *)v4 + 11))
      goto LABEL_243;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_firstCoreDataImportMSHH2 != *((_QWORD *)v4 + 10))
      goto LABEL_243;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_accessoryAddMSHH2 != *((_QWORD *)v4 + 1))
      goto LABEL_243;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_settingsCreationMSHH2 != *((_QWORD *)v4 + 29))
      goto LABEL_243;
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_pairingIdentityCreationMSHH2 != *((_QWORD *)v4 + 18))
      goto LABEL_243;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_siriReadyMSHH2 != *((_QWORD *)v4 + 30))
      goto LABEL_243;
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_eventRouterServerConnectionMSHH2 != *((_QWORD *)v4 + 6))
      goto LABEL_243;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_primaryResidentElectionMSHH2 != *((_QWORD *)v4 + 21))
      goto LABEL_243;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_eventRouterFirstEventPushMSHH2 != *((_QWORD *)v4 + 5))
      goto LABEL_243;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_totalDurationMSHH2 != *((_QWORD *)v4 + 32))
      goto LABEL_243;
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0 || self->_iCloudAvailableINT != *((_DWORD *)v4 + 76))
      goto LABEL_243;
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_iDSAvailableINT != *((_DWORD *)v4 + 77))
      goto LABEL_243;
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0 || self->_manateeAvailableINT != *((_DWORD *)v4 + 90))
      goto LABEL_243;
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    if ((v6 & 0x8000000000) == 0 || self->_networkAvailableINT != *((_DWORD *)v4 + 91))
      goto LABEL_243;
  }
  else if ((v6 & 0x8000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_lastKnownStageErrorCode != *((_QWORD *)v4 + 12))
      goto LABEL_243;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_243;
  }
  lastKnownStageErrorDomain = self->_lastKnownStageErrorDomain;
  if ((unint64_t)lastKnownStageErrorDomain | *((_QWORD *)v4 + 40)
    && !-[NSString isEqual:](lastKnownStageErrorDomain, "isEqual:"))
  {
    goto LABEL_243;
  }
  lastKnownStageErrorString = self->_lastKnownStageErrorString;
  if ((unint64_t)lastKnownStageErrorString | *((_QWORD *)v4 + 41))
  {
    if (!-[NSString isEqual:](lastKnownStageErrorString, "isEqual:"))
      goto LABEL_243;
  }
  v9 = self->_has;
  v10 = *((_QWORD *)v4 + 48);
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_lastKnownStageUnderlyingErrorCode != *((_QWORD *)v4 + 13))
      goto LABEL_243;
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_243;
  }
  lastKnownStageUnderlyingErrorDomain = self->_lastKnownStageUnderlyingErrorDomain;
  if ((unint64_t)lastKnownStageUnderlyingErrorDomain | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](lastKnownStageUnderlyingErrorDomain, "isEqual:"))
      goto LABEL_243;
    v9 = self->_has;
    v10 = *((_QWORD *)v4 + 48);
  }
  if ((*(_DWORD *)&v9 & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_savedEventState != *((_QWORD *)v4 + 25))
      goto LABEL_243;
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_QWORD *)&v9 & 0x1000000000) != 0)
  {
    if ((v10 & 0x1000000000) == 0 || self->_lastKnownControllerHH2Mode != *((_DWORD *)v4 + 78))
      goto LABEL_243;
  }
  else if ((v10 & 0x1000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_QWORD *)&v9 & 0x2000000000) != 0)
  {
    if ((v10 & 0x2000000000) == 0 || self->_lastKnownControllerSentinelZoneExistence != *((_DWORD *)v4 + 79))
      goto LABEL_243;
  }
  else if ((v10 & 0x2000000000) != 0)
  {
    goto LABEL_243;
  }
  controllerSetupSessionIdentifier = self->_controllerSetupSessionIdentifier;
  if ((unint64_t)controllerSetupSessionIdentifier | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](controllerSetupSessionIdentifier, "isEqual:"))
      goto LABEL_243;
    v9 = self->_has;
    v10 = *((_QWORD *)v4 + 48);
  }
  if ((*(_QWORD *)&v9 & 0x80000000000) != 0)
  {
    if ((v10 & 0x80000000000) == 0 || self->_numberOfTimesPrimaryResidentChangedHH2 != *((_DWORD *)v4 + 95))
      goto LABEL_243;
  }
  else if ((v10 & 0x80000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_lastPrimaryClientConnectedTimeHH2 != *((_QWORD *)v4 + 16))
      goto LABEL_243;
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_QWORD *)&v9 & 0x20000000000) != 0)
  {
    if ((v10 & 0x20000000000) == 0 || self->_numberOfTimesPrimaryClientConnectedHH2 != *((_DWORD *)v4 + 93))
      goto LABEL_243;
  }
  else if ((v10 & 0x20000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_QWORD *)&v9 & 0x40000000000) != 0)
  {
    if ((v10 & 0x40000000000) == 0 || self->_numberOfTimesPrimaryClientDisconnectedHH2 != *((_DWORD *)v4 + 94))
      goto LABEL_243;
  }
  else if ((v10 & 0x40000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_QWORD *)&v9 & 0x10000000000) != 0)
  {
    if ((v10 & 0x10000000000) == 0
      || self->_numberOfTimesPrimaryClientConnectMessageFailedHH2 != *((_DWORD *)v4 + 92))
    {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x10000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_QWORD *)&v9 & 0x200000000) != 0)
  {
    if ((v10 & 0x200000000) == 0 || self->_currentDeviceConfirmedPrimaryResidentINT != *((_DWORD *)v4 + 70))
      goto LABEL_243;
  }
  else if ((v10 & 0x200000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_WORD *)&v9 & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_lastPrimaryClientConnectMessageFailErrorCodeHH2 != *((_QWORD *)v4 + 14))
      goto LABEL_243;
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_243;
  }
  lastPrimaryClientConnectMessageFailErrorDomainHH2 = self->_lastPrimaryClientConnectMessageFailErrorDomainHH2;
  if ((unint64_t)lastPrimaryClientConnectMessageFailErrorDomainHH2 | *((_QWORD *)v4 + 43))
  {
    if (!-[NSString isEqual:](lastPrimaryClientConnectMessageFailErrorDomainHH2, "isEqual:"))
      goto LABEL_243;
    v9 = self->_has;
    v10 = *((_QWORD *)v4 + 48);
  }
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2 != *((_QWORD *)v4 + 15))
      goto LABEL_243;
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_243;
  }
  lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 = self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2;
  if ((unint64_t)lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 | *((_QWORD *)v4 + 44))
  {
    if (!-[NSString isEqual:](lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2, "isEqual:"))
      goto LABEL_243;
    v9 = self->_has;
    v10 = *((_QWORD *)v4 + 48);
  }
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2 != *((_QWORD *)v4 + 24))
      goto LABEL_243;
  }
  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0
      || self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2 != *((_QWORD *)v4 + 19))
    {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&v9 & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0
      || self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2 != *((_QWORD *)v4 + 22))
    {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&v9 & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0
      || self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2 != *((_QWORD *)v4 + 23))
    {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&v9 & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_primaryResidentElectionJoinMeshMSHH2 != *((_QWORD *)v4 + 20))
      goto LABEL_243;
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_firstCoreDataContainerSetupDurationMSHH2 != *((_QWORD *)v4 + 7))
      goto LABEL_243;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_BYTE *)&v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_firstCoreDataContainerSetupErrorCodeHH2 != *((_QWORD *)v4 + 8))
      goto LABEL_243;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_243;
  }
  firstCoreDataContainerSetupErrorDomainHH2 = self->_firstCoreDataContainerSetupErrorDomainHH2;
  if ((unint64_t)firstCoreDataContainerSetupErrorDomainHH2 | *((_QWORD *)v4 + 36))
  {
    if (-[NSString isEqual:](firstCoreDataContainerSetupErrorDomainHH2, "isEqual:"))
    {
      v9 = self->_has;
      v10 = *((_QWORD *)v4 + 48);
      goto LABEL_236;
    }
LABEL_243:
    v17 = 0;
    goto LABEL_244;
  }
LABEL_236:
  if ((*(_WORD *)&v9 & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2 != *((_QWORD *)v4 + 9))
      goto LABEL_243;
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_243;
  }
  firstCoreDataContainerSetupUnderlyingErrorDomainHH2 = self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2;
  if ((unint64_t)firstCoreDataContainerSetupUnderlyingErrorDomainHH2 | *((_QWORD *)v4 + 37))
    v17 = -[NSString isEqual:](firstCoreDataContainerSetupUnderlyingErrorDomainHH2, "isEqual:");
  else
    v17 = 1;
LABEL_244:

  return v17;
}

- (unint64_t)hash
{
  $14E84874AB12F438965F2E1C57E118F4 has;
  $14E84874AB12F438965F2E1C57E118F4 v4;
  $14E84874AB12F438965F2E1C57E118F4 v5;
  $14E84874AB12F438965F2E1C57E118F4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSUInteger v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSUInteger v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    v58 = 2654435761u * self->_version;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
LABEL_3:
      v57 = 2654435761 * self->_sessionSetupOpenMSHH1;
      if ((*(_BYTE *)&has & 4) != 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else
  {
    v58 = 0;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_3;
  }
  v57 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_4:
    v56 = 2654435761 * self->_controllerKeyExchangeMSHH1;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  v56 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_5:
    v55 = 2654435761 * self->_newAccessoryTransferMSHH1;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  v55 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_6:
    v54 = 2654435761 * self->_sessionSetupCloseMSHH1;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  v54 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_7:
    v53 = 2654435761 * self->_sentinelZoneFetchMSHH1;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  v53 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_8:
    v52 = 2654435761 * self->_totalDurationMSHH1;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  v52 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_9:
    v51 = 2654435761 * self->_accountSettleWaitMSHH2;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  v51 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_10:
    v50 = 2654435761 * self->_currentDeviceIDSWaitMSHH2;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  v50 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_11:
    v49 = 2654435761 * self->_homeManagerReadyMSHH2;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  v49 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_12:
    v48 = 2654435761 * self->_firstCoreDataImportMSHH2;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  v48 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_13:
    v47 = 2654435761 * self->_accessoryAddMSHH2;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  v47 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_14:
    v46 = 2654435761 * self->_settingsCreationMSHH2;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  v46 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_15:
    v45 = 2654435761 * self->_pairingIdentityCreationMSHH2;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  v45 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_16:
    v44 = 2654435761 * self->_siriReadyMSHH2;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  v44 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_17:
    v43 = 2654435761 * self->_eventRouterServerConnectionMSHH2;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  v43 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_18:
    v42 = 2654435761 * self->_primaryResidentElectionMSHH2;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  v42 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_19:
    v41 = 2654435761 * self->_eventRouterFirstEventPushMSHH2;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  v41 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_20:
    v40 = 2654435761 * self->_totalDurationMSHH2;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  v40 = 0;
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
LABEL_21:
    v39 = 2654435761 * self->_iCloudAvailableINT;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  v39 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_22:
    v38 = 2654435761 * self->_iDSAvailableINT;
    if ((*(_QWORD *)&has & 0x4000000000) != 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  v38 = 0;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
LABEL_23:
    v37 = 2654435761 * self->_manateeAvailableINT;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_24;
LABEL_48:
    v36 = 0;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_25;
    goto LABEL_49;
  }
LABEL_47:
  v37 = 0;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
    goto LABEL_48;
LABEL_24:
  v36 = 2654435761 * self->_networkAvailableINT;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_25:
    v35 = 2654435761 * self->_lastKnownStageErrorCode;
    goto LABEL_50;
  }
LABEL_49:
  v35 = 0;
LABEL_50:
  v34 = -[NSString hash](self->_lastKnownStageErrorDomain, "hash");
  v33 = -[NSString hash](self->_lastKnownStageErrorString, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    v32 = 2654435761 * self->_lastKnownStageUnderlyingErrorCode;
  else
    v32 = 0;
  v31 = -[NSString hash](self->_lastKnownStageUnderlyingErrorDomain, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x1000000) == 0)
  {
    v30 = 0;
    if ((*(_QWORD *)&v4 & 0x1000000000) != 0)
      goto LABEL_55;
LABEL_58:
    v29 = 0;
    if ((*(_QWORD *)&v4 & 0x2000000000) != 0)
      goto LABEL_56;
    goto LABEL_59;
  }
  v30 = 2654435761u * self->_savedEventState;
  if ((*(_QWORD *)&v4 & 0x1000000000) == 0)
    goto LABEL_58;
LABEL_55:
  v29 = 2654435761 * self->_lastKnownControllerHH2Mode;
  if ((*(_QWORD *)&v4 & 0x2000000000) != 0)
  {
LABEL_56:
    v28 = 2654435761 * self->_lastKnownControllerSentinelZoneExistence;
    goto LABEL_60;
  }
LABEL_59:
  v28 = 0;
LABEL_60:
  v27 = -[NSString hash](self->_controllerSetupSessionIdentifier, "hash");
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x80000000000) != 0)
  {
    v26 = 2654435761 * self->_numberOfTimesPrimaryResidentChangedHH2;
    if ((*(_WORD *)&v5 & 0x8000) != 0)
    {
LABEL_62:
      v25 = 2654435761 * self->_lastPrimaryClientConnectedTimeHH2;
      if ((*(_QWORD *)&v5 & 0x20000000000) != 0)
        goto LABEL_63;
      goto LABEL_70;
    }
  }
  else
  {
    v26 = 0;
    if ((*(_WORD *)&v5 & 0x8000) != 0)
      goto LABEL_62;
  }
  v25 = 0;
  if ((*(_QWORD *)&v5 & 0x20000000000) != 0)
  {
LABEL_63:
    v24 = 2654435761 * self->_numberOfTimesPrimaryClientConnectedHH2;
    if ((*(_QWORD *)&v5 & 0x40000000000) != 0)
      goto LABEL_64;
    goto LABEL_71;
  }
LABEL_70:
  v24 = 0;
  if ((*(_QWORD *)&v5 & 0x40000000000) != 0)
  {
LABEL_64:
    v23 = 2654435761 * self->_numberOfTimesPrimaryClientDisconnectedHH2;
    if ((*(_QWORD *)&v5 & 0x10000000000) != 0)
      goto LABEL_65;
    goto LABEL_72;
  }
LABEL_71:
  v23 = 0;
  if ((*(_QWORD *)&v5 & 0x10000000000) != 0)
  {
LABEL_65:
    v22 = 2654435761 * self->_numberOfTimesPrimaryClientConnectMessageFailedHH2;
    if ((*(_QWORD *)&v5 & 0x200000000) != 0)
      goto LABEL_66;
LABEL_73:
    v21 = 0;
    if ((*(_WORD *)&v5 & 0x2000) != 0)
      goto LABEL_67;
    goto LABEL_74;
  }
LABEL_72:
  v22 = 0;
  if ((*(_QWORD *)&v5 & 0x200000000) == 0)
    goto LABEL_73;
LABEL_66:
  v21 = 2654435761 * self->_currentDeviceConfirmedPrimaryResidentINT;
  if ((*(_WORD *)&v5 & 0x2000) != 0)
  {
LABEL_67:
    v20 = 2654435761 * self->_lastPrimaryClientConnectMessageFailErrorCodeHH2;
    goto LABEL_75;
  }
LABEL_74:
  v20 = 0;
LABEL_75:
  v19 = -[NSString hash](self->_lastPrimaryClientConnectMessageFailErrorDomainHH2, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    v18 = 2654435761 * self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2;
  else
    v18 = 0;
  v17 = -[NSString hash](self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2, "hash");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    v7 = 2654435761 * self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2;
    if ((*(_DWORD *)&v6 & 0x40000) != 0)
    {
LABEL_80:
      v8 = 2654435761 * self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2;
      if ((*(_DWORD *)&v6 & 0x200000) != 0)
        goto LABEL_81;
      goto LABEL_88;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_DWORD *)&v6 & 0x40000) != 0)
      goto LABEL_80;
  }
  v8 = 0;
  if ((*(_DWORD *)&v6 & 0x200000) != 0)
  {
LABEL_81:
    v9 = 2654435761 * self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2;
    if ((*(_DWORD *)&v6 & 0x400000) != 0)
      goto LABEL_82;
    goto LABEL_89;
  }
LABEL_88:
  v9 = 0;
  if ((*(_DWORD *)&v6 & 0x400000) != 0)
  {
LABEL_82:
    v10 = 2654435761 * self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2;
    if ((*(_DWORD *)&v6 & 0x80000) != 0)
      goto LABEL_83;
    goto LABEL_90;
  }
LABEL_89:
  v10 = 0;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
LABEL_83:
    v11 = 2654435761 * self->_primaryResidentElectionJoinMeshMSHH2;
    if ((*(_BYTE *)&v6 & 0x40) != 0)
      goto LABEL_84;
LABEL_91:
    v12 = 0;
    if ((*(_BYTE *)&v6 & 0x80) != 0)
      goto LABEL_85;
    goto LABEL_92;
  }
LABEL_90:
  v11 = 0;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
    goto LABEL_91;
LABEL_84:
  v12 = 2654435761 * self->_firstCoreDataContainerSetupDurationMSHH2;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
LABEL_85:
    v13 = 2654435761 * self->_firstCoreDataContainerSetupErrorCodeHH2;
    goto LABEL_93;
  }
LABEL_92:
  v13 = 0;
LABEL_93:
  v14 = -[NSString hash](self->_firstCoreDataContainerSetupErrorDomainHH2, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v15 = 2654435761 * self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2;
  else
    v15 = 0;
  return v57 ^ v58 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x100000000) != 0)
  {
    self->_version = *((_QWORD *)v4 + 33);
    *(_QWORD *)&self->_has |= 0x100000000uLL;
    v5 = *((_QWORD *)v4 + 48);
    if ((v5 & 0x8000000) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_71;
    }
  }
  else if ((v5 & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionSetupOpenMSHH1 = *((_QWORD *)v4 + 28);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10000) == 0)
      goto LABEL_5;
    goto LABEL_72;
  }
LABEL_71:
  self->_controllerKeyExchangeMSHH1 = *((_QWORD *)v4 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x10000) == 0)
  {
LABEL_5:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_6;
    goto LABEL_73;
  }
LABEL_72:
  self->_newAccessoryTransferMSHH1 = *((_QWORD *)v4 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_74;
  }
LABEL_73:
  self->_sessionSetupCloseMSHH1 = *((_QWORD *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_8;
    goto LABEL_75;
  }
LABEL_74:
  self->_sentinelZoneFetchMSHH1 = *((_QWORD *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_76;
  }
LABEL_75:
  self->_totalDurationMSHH1 = *((_QWORD *)v4 + 31);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_77;
  }
LABEL_76:
  self->_accountSettleWaitMSHH2 = *((_QWORD *)v4 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_78;
  }
LABEL_77:
  self->_currentDeviceIDSWaitMSHH2 = *((_QWORD *)v4 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_79;
  }
LABEL_78:
  self->_homeManagerReadyMSHH2 = *((_QWORD *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0)
      goto LABEL_13;
    goto LABEL_80;
  }
LABEL_79:
  self->_firstCoreDataImportMSHH2 = *((_QWORD *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_13:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_14;
    goto LABEL_81;
  }
LABEL_80:
  self->_accessoryAddMSHH2 = *((_QWORD *)v4 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x20000) == 0)
      goto LABEL_15;
    goto LABEL_82;
  }
LABEL_81:
  self->_settingsCreationMSHH2 = *((_QWORD *)v4 + 29);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x20000) == 0)
  {
LABEL_15:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_16;
    goto LABEL_83;
  }
LABEL_82:
  self->_pairingIdentityCreationMSHH2 = *((_QWORD *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_84;
  }
LABEL_83:
  self->_siriReadyMSHH2 = *((_QWORD *)v4 + 30);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_85;
  }
LABEL_84:
  self->_eventRouterServerConnectionMSHH2 = *((_QWORD *)v4 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x100000) == 0)
  {
LABEL_18:
    if ((v5 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_86;
  }
LABEL_85:
  self->_primaryResidentElectionMSHH2 = *((_QWORD *)v4 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_87;
  }
LABEL_86:
  self->_eventRouterFirstEventPushMSHH2 = *((_QWORD *)v4 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_21;
    goto LABEL_88;
  }
LABEL_87:
  self->_totalDurationMSHH2 = *((_QWORD *)v4 + 32);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_22;
    goto LABEL_89;
  }
LABEL_88:
  self->_iCloudAvailableINT = *((_DWORD *)v4 + 76);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_23;
    goto LABEL_90;
  }
LABEL_89:
  self->_iDSAvailableINT = *((_DWORD *)v4 + 77);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_24;
    goto LABEL_91;
  }
LABEL_90:
  self->_manateeAvailableINT = *((_DWORD *)v4 + 90);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v5 = *((_QWORD *)v4 + 48);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_91:
  self->_networkAvailableINT = *((_DWORD *)v4 + 91);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  if ((*((_QWORD *)v4 + 48) & 0x800) != 0)
  {
LABEL_25:
    self->_lastKnownStageErrorCode = *((_QWORD *)v4 + 12);
    *(_QWORD *)&self->_has |= 0x800uLL;
  }
LABEL_26:
  v9 = v4;
  if (*((_QWORD *)v4 + 40))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setLastKnownStageErrorDomain:](self, "setLastKnownStageErrorDomain:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 41))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setLastKnownStageErrorString:](self, "setLastKnownStageErrorString:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 385) & 0x10) != 0)
  {
    self->_lastKnownStageUnderlyingErrorCode = *((_QWORD *)v4 + 13);
    *(_QWORD *)&self->_has |= 0x1000uLL;
  }
  if (*((_QWORD *)v4 + 42))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setLastKnownStageUnderlyingErrorDomain:](self, "setLastKnownStageUnderlyingErrorDomain:");
    v4 = v9;
  }
  v6 = *((_QWORD *)v4 + 48);
  if ((v6 & 0x1000000) != 0)
  {
    self->_savedEventState = *((_QWORD *)v4 + 25);
    *(_QWORD *)&self->_has |= 0x1000000uLL;
    v6 = *((_QWORD *)v4 + 48);
    if ((v6 & 0x1000000000) == 0)
    {
LABEL_36:
      if ((v6 & 0x2000000000) == 0)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  else if ((v6 & 0x1000000000) == 0)
  {
    goto LABEL_36;
  }
  self->_lastKnownControllerHH2Mode = *((_DWORD *)v4 + 78);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  if ((*((_QWORD *)v4 + 48) & 0x2000000000) != 0)
  {
LABEL_37:
    self->_lastKnownControllerSentinelZoneExistence = *((_DWORD *)v4 + 79);
    *(_QWORD *)&self->_has |= 0x2000000000uLL;
  }
LABEL_38:
  if (*((_QWORD *)v4 + 34))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setControllerSetupSessionIdentifier:](self, "setControllerSetupSessionIdentifier:");
    v4 = v9;
  }
  v7 = *((_QWORD *)v4 + 48);
  if ((v7 & 0x80000000000) != 0)
  {
    self->_numberOfTimesPrimaryResidentChangedHH2 = *((_DWORD *)v4 + 95);
    *(_QWORD *)&self->_has |= 0x80000000000uLL;
    v7 = *((_QWORD *)v4 + 48);
    if ((v7 & 0x8000) == 0)
    {
LABEL_42:
      if ((v7 & 0x20000000000) == 0)
        goto LABEL_43;
      goto LABEL_98;
    }
  }
  else if ((v7 & 0x8000) == 0)
  {
    goto LABEL_42;
  }
  self->_lastPrimaryClientConnectedTimeHH2 = *((_QWORD *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v7 = *((_QWORD *)v4 + 48);
  if ((v7 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v7 & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_99;
  }
LABEL_98:
  self->_numberOfTimesPrimaryClientConnectedHH2 = *((_DWORD *)v4 + 93);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v7 = *((_QWORD *)v4 + 48);
  if ((v7 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_45;
    goto LABEL_100;
  }
LABEL_99:
  self->_numberOfTimesPrimaryClientDisconnectedHH2 = *((_DWORD *)v4 + 94);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v7 = *((_QWORD *)v4 + 48);
  if ((v7 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_46;
    goto LABEL_101;
  }
LABEL_100:
  self->_numberOfTimesPrimaryClientConnectMessageFailedHH2 = *((_DWORD *)v4 + 92);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v7 = *((_QWORD *)v4 + 48);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_46:
    if ((v7 & 0x2000) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
LABEL_101:
  self->_currentDeviceConfirmedPrimaryResidentINT = *((_DWORD *)v4 + 70);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  if ((*((_QWORD *)v4 + 48) & 0x2000) != 0)
  {
LABEL_47:
    self->_lastPrimaryClientConnectMessageFailErrorCodeHH2 = *((_QWORD *)v4 + 14);
    *(_QWORD *)&self->_has |= 0x2000uLL;
  }
LABEL_48:
  if (*((_QWORD *)v4 + 43))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setLastPrimaryClientConnectMessageFailErrorDomainHH2:](self, "setLastPrimaryClientConnectMessageFailErrorDomainHH2:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 385) & 0x40) != 0)
  {
    self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2 = *((_QWORD *)v4 + 15);
    *(_QWORD *)&self->_has |= 0x4000uLL;
  }
  if (*((_QWORD *)v4 + 44))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:](self, "setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:");
    v4 = v9;
  }
  v8 = *((_QWORD *)v4 + 48);
  if ((v8 & 0x800000) != 0)
  {
    self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2 = *((_QWORD *)v4 + 24);
    *(_QWORD *)&self->_has |= 0x800000uLL;
    v8 = *((_QWORD *)v4 + 48);
    if ((v8 & 0x40000) == 0)
    {
LABEL_56:
      if ((v8 & 0x200000) == 0)
        goto LABEL_57;
      goto LABEL_105;
    }
  }
  else if ((v8 & 0x40000) == 0)
  {
    goto LABEL_56;
  }
  self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2 = *((_QWORD *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v8 = *((_QWORD *)v4 + 48);
  if ((v8 & 0x200000) == 0)
  {
LABEL_57:
    if ((v8 & 0x400000) == 0)
      goto LABEL_58;
    goto LABEL_106;
  }
LABEL_105:
  self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2 = *((_QWORD *)v4 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v8 = *((_QWORD *)v4 + 48);
  if ((v8 & 0x400000) == 0)
  {
LABEL_58:
    if ((v8 & 0x80000) == 0)
      goto LABEL_59;
    goto LABEL_107;
  }
LABEL_106:
  self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2 = *((_QWORD *)v4 + 23);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v8 = *((_QWORD *)v4 + 48);
  if ((v8 & 0x80000) == 0)
  {
LABEL_59:
    if ((v8 & 0x40) == 0)
      goto LABEL_60;
    goto LABEL_108;
  }
LABEL_107:
  self->_primaryResidentElectionJoinMeshMSHH2 = *((_QWORD *)v4 + 20);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v8 = *((_QWORD *)v4 + 48);
  if ((v8 & 0x40) == 0)
  {
LABEL_60:
    if ((v8 & 0x80) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_108:
  self->_firstCoreDataContainerSetupDurationMSHH2 = *((_QWORD *)v4 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  if ((*((_QWORD *)v4 + 48) & 0x80) != 0)
  {
LABEL_61:
    self->_firstCoreDataContainerSetupErrorCodeHH2 = *((_QWORD *)v4 + 8);
    *(_QWORD *)&self->_has |= 0x80uLL;
  }
LABEL_62:
  if (*((_QWORD *)v4 + 36))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setFirstCoreDataContainerSetupErrorDomainHH2:](self, "setFirstCoreDataContainerSetupErrorDomainHH2:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 385) & 1) != 0)
  {
    self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2 = *((_QWORD *)v4 + 9);
    *(_QWORD *)&self->_has |= 0x100uLL;
  }
  if (*((_QWORD *)v4 + 37))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:](self, "setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:");
    v4 = v9;
  }

}

- (unint64_t)version
{
  return self->_version;
}

- (int64_t)sessionSetupOpenMSHH1
{
  return self->_sessionSetupOpenMSHH1;
}

- (int64_t)controllerKeyExchangeMSHH1
{
  return self->_controllerKeyExchangeMSHH1;
}

- (int64_t)newAccessoryTransferMSHH1
{
  return self->_newAccessoryTransferMSHH1;
}

- (int64_t)sessionSetupCloseMSHH1
{
  return self->_sessionSetupCloseMSHH1;
}

- (int64_t)sentinelZoneFetchMSHH1
{
  return self->_sentinelZoneFetchMSHH1;
}

- (int64_t)totalDurationMSHH1
{
  return self->_totalDurationMSHH1;
}

- (int64_t)accountSettleWaitMSHH2
{
  return self->_accountSettleWaitMSHH2;
}

- (int64_t)currentDeviceIDSWaitMSHH2
{
  return self->_currentDeviceIDSWaitMSHH2;
}

- (int64_t)homeManagerReadyMSHH2
{
  return self->_homeManagerReadyMSHH2;
}

- (int64_t)firstCoreDataImportMSHH2
{
  return self->_firstCoreDataImportMSHH2;
}

- (int64_t)accessoryAddMSHH2
{
  return self->_accessoryAddMSHH2;
}

- (int64_t)settingsCreationMSHH2
{
  return self->_settingsCreationMSHH2;
}

- (int64_t)pairingIdentityCreationMSHH2
{
  return self->_pairingIdentityCreationMSHH2;
}

- (int64_t)siriReadyMSHH2
{
  return self->_siriReadyMSHH2;
}

- (int64_t)eventRouterServerConnectionMSHH2
{
  return self->_eventRouterServerConnectionMSHH2;
}

- (int64_t)primaryResidentElectionMSHH2
{
  return self->_primaryResidentElectionMSHH2;
}

- (int64_t)eventRouterFirstEventPushMSHH2
{
  return self->_eventRouterFirstEventPushMSHH2;
}

- (int64_t)totalDurationMSHH2
{
  return self->_totalDurationMSHH2;
}

- (int64_t)lastKnownStageErrorCode
{
  return self->_lastKnownStageErrorCode;
}

- (NSString)lastKnownStageErrorDomain
{
  return self->_lastKnownStageErrorDomain;
}

- (void)setLastKnownStageErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownStageErrorDomain, a3);
}

- (NSString)lastKnownStageErrorString
{
  return self->_lastKnownStageErrorString;
}

- (void)setLastKnownStageErrorString:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownStageErrorString, a3);
}

- (int64_t)lastKnownStageUnderlyingErrorCode
{
  return self->_lastKnownStageUnderlyingErrorCode;
}

- (NSString)lastKnownStageUnderlyingErrorDomain
{
  return self->_lastKnownStageUnderlyingErrorDomain;
}

- (void)setLastKnownStageUnderlyingErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownStageUnderlyingErrorDomain, a3);
}

- (unint64_t)savedEventState
{
  return self->_savedEventState;
}

- (NSString)controllerSetupSessionIdentifier
{
  return self->_controllerSetupSessionIdentifier;
}

- (void)setControllerSetupSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_controllerSetupSessionIdentifier, a3);
}

- (unsigned)numberOfTimesPrimaryResidentChangedHH2
{
  return self->_numberOfTimesPrimaryResidentChangedHH2;
}

- (int64_t)lastPrimaryClientConnectedTimeHH2
{
  return self->_lastPrimaryClientConnectedTimeHH2;
}

- (unsigned)numberOfTimesPrimaryClientConnectedHH2
{
  return self->_numberOfTimesPrimaryClientConnectedHH2;
}

- (unsigned)numberOfTimesPrimaryClientDisconnectedHH2
{
  return self->_numberOfTimesPrimaryClientDisconnectedHH2;
}

- (unsigned)numberOfTimesPrimaryClientConnectMessageFailedHH2
{
  return self->_numberOfTimesPrimaryClientConnectMessageFailedHH2;
}

- (unsigned)currentDeviceConfirmedPrimaryResidentINT
{
  return self->_currentDeviceConfirmedPrimaryResidentINT;
}

- (int64_t)lastPrimaryClientConnectMessageFailErrorCodeHH2
{
  return self->_lastPrimaryClientConnectMessageFailErrorCodeHH2;
}

- (NSString)lastPrimaryClientConnectMessageFailErrorDomainHH2
{
  return self->_lastPrimaryClientConnectMessageFailErrorDomainHH2;
}

- (void)setLastPrimaryClientConnectMessageFailErrorDomainHH2:(id)a3
{
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailErrorDomainHH2, a3);
}

- (int64_t)lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2
{
  return self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2;
}

- (NSString)lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2
{
  return self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2;
}

- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:(id)a3
{
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2, a3);
}

- (int64_t)primaryResidentElectionPeerDeviceFutureResolvedMSHH2
{
  return self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2;
}

- (int64_t)primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2
{
  return self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2;
}

- (int64_t)primaryResidentElectionModernTransportStartedFutureResolvedMSHH2
{
  return self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2;
}

- (int64_t)primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2
{
  return self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2;
}

- (int64_t)primaryResidentElectionJoinMeshMSHH2
{
  return self->_primaryResidentElectionJoinMeshMSHH2;
}

- (int64_t)firstCoreDataContainerSetupDurationMSHH2
{
  return self->_firstCoreDataContainerSetupDurationMSHH2;
}

- (int64_t)firstCoreDataContainerSetupErrorCodeHH2
{
  return self->_firstCoreDataContainerSetupErrorCodeHH2;
}

- (NSString)firstCoreDataContainerSetupErrorDomainHH2
{
  return self->_firstCoreDataContainerSetupErrorDomainHH2;
}

- (void)setFirstCoreDataContainerSetupErrorDomainHH2:(id)a3
{
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupErrorDomainHH2, a3);
}

- (int64_t)firstCoreDataContainerSetupUnderlyingErrorCodeHH2
{
  return self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2;
}

- (NSString)firstCoreDataContainerSetupUnderlyingErrorDomainHH2
{
  return self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2;
}

- (void)setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:(id)a3
{
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2, 0);
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailErrorDomainHH2, 0);
  objc_storeStrong((id *)&self->_lastKnownStageUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_lastKnownStageErrorString, 0);
  objc_storeStrong((id *)&self->_lastKnownStageErrorDomain, 0);
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2, 0);
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupErrorDomainHH2, 0);
  objc_storeStrong((id *)&self->_controllerSetupSessionIdentifier, 0);
}

@end
