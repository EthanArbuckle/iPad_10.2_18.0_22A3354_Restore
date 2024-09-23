@implementation NWStatsSnapshot

- (NSString)attributedEntity
{
  return self->_attributedEntity;
}

- (BOOL)isSilent
{
  return self->_isSilent;
}

- (NSString)delegateName
{
  return self->_delegateName;
}

- (NSString)attributedExtension
{
  return self->_attributedExtension;
}

- (BOOL)startAppStateIsForeground
{
  return self->_startAppStateIsForeground;
}

- (BOOL)snapshotAppStateIsForeground
{
  return self->_snapshotAppStateIsForeground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAttributedBundleId, 0);
  objc_storeStrong((id *)&self->_domainTrackerContext, 0);
  objc_storeStrong((id *)&self->_domainOwner, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_lookupResults, 0);
  objc_storeStrong((id *)&self->_delegateName, 0);
  objc_storeStrong((id *)&self->_attributedExtension, 0);
  objc_storeStrong((id *)&self->_attributedEntity, 0);
  objc_storeStrong((id *)&self->_snapshotTypeLowerCase, 0);
  objc_storeStrong((id *)&self->_snapshotType, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_extensionDictionaries, 0);
}

- (int)snapshotReason
{
  return self->_snapshotReason;
}

- (void)setAttributionReason:(int)a3
{
  self->_attributionReason = a3;
}

- (void)setAttributedEntity:(id)a3
{
  objc_storeStrong((id *)&self->_attributedEntity, a3);
}

- (void)setDelegateName:(id)a3
{
  objc_storeStrong((id *)&self->_delegateName, a3);
}

- (BOOL)isADaemon
{
  if (-[NWStatsSnapshot delegateAttributionReason](self, "delegateAttributionReason"))
    return 1;
  else
    return attributionReasonImpliesBundleName(-[NWStatsSnapshot attributionReason](self, "attributionReason")) ^ 1;
}

- (int)attributionReason
{
  return self->_attributionReason;
}

- (void)setStartScreenStateOn:(BOOL)a3
{
  self->_startScreenStateOn = a3;
}

- (void)setSnapshotReason:(int)a3
{
  self->_snapshotReason = a3;
}

- (void)setFirstOccurrence:(BOOL)a3
{
  self->_firstOccurrence = a3;
}

- (void)setStartAppStateIsForeground:(BOOL)a3
{
  self->_startAppStateIsForeground = a3;
}

- (void)setSnapshotScreenStateOn:(BOOL)a3
{
  self->_snapshotScreenStateOn = a3;
}

- (void)setSnapshotAppStateIsForeground:(BOOL)a3
{
  self->_snapshotAppStateIsForeground = a3;
}

- (void)setDomainOwner:(id)a3
{
  objc_storeStrong((id *)&self->_domainOwner, a3);
}

- (void)setDomainTrackerContext:(id)a3
{
  objc_storeStrong((id *)&self->_domainTrackerContext, a3);
}

- (void)setIsTracker:(BOOL)a3
{
  self->_isTracker = a3;
}

- (void)setIsSilent:(BOOL)a3
{
  self->_isSilent = a3;
}

- (void)setIsNonAppInitiated:(BOOL)a3
{
  self->_isNonAppInitiated = a3;
}

- (void)setDomainName:(id)a3
{
  objc_storeStrong((id *)&self->_domainName, a3);
}

- (void)setDomainAttributedBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_domainAttributedBundleId, a3);
}

- (void)setDomainName:(id)a3 owner:(id)a4 context:(id)a5 attributedBundleId:(id)a6 isTracker:(BOOL)a7 isNonAppInitiated:(BOOL)a8 isSilent:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v9 = a8;
  v10 = a7;
  v22 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (v22)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v22);
    -[NWStatsSnapshot setDomainName:](self, "setDomainName:", v18);

    if (v15)
      goto LABEL_3;
  }
  else
  {
    -[NWStatsSnapshot setDomainName:](self, "setDomainName:", 0);
    if (v15)
    {
LABEL_3:
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v15);
      -[NWStatsSnapshot setDomainOwner:](self, "setDomainOwner:", v19);

      if (v16)
        goto LABEL_4;
LABEL_8:
      -[NWStatsSnapshot setDomainTrackerContext:](self, "setDomainTrackerContext:", 0);
      if (v17)
        goto LABEL_5;
LABEL_9:
      -[NWStatsSnapshot setDomainAttributedBundleId:](self, "setDomainAttributedBundleId:", 0);
      goto LABEL_10;
    }
  }
  -[NWStatsSnapshot setDomainOwner:](self, "setDomainOwner:", 0);
  if (!v16)
    goto LABEL_8;
LABEL_4:
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v16);
  -[NWStatsSnapshot setDomainTrackerContext:](self, "setDomainTrackerContext:", v20);

  if (!v17)
    goto LABEL_9;
LABEL_5:
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v17);
  -[NWStatsSnapshot setDomainAttributedBundleId:](self, "setDomainAttributedBundleId:", v21);

LABEL_10:
  -[NWStatsSnapshot setIsTracker:](self, "setIsTracker:", v10);
  -[NWStatsSnapshot setIsNonAppInitiated:](self, "setIsNonAppInitiated:", v9);
  -[NWStatsSnapshot setIsSilent:](self, "setIsSilent:", a9);

}

- (void)setAppStateIsForeground:(BOOL)a3 screenStateOn:(BOOL)a4 startAppStateIsForeground:(BOOL)a5 startScreenStateOn:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  -[NWStatsSnapshot setSnapshotAppStateIsForeground:](self, "setSnapshotAppStateIsForeground:", a3);
  -[NWStatsSnapshot setSnapshotScreenStateOn:](self, "setSnapshotScreenStateOn:", v8);
  -[NWStatsSnapshot setStartAppStateIsForeground:](self, "setStartAppStateIsForeground:", v7);
  -[NWStatsSnapshot setStartScreenStateOn:](self, "setStartScreenStateOn:", v6);
}

- (NSString)snapshotReasonString
{
  int v2;

  v2 = self->_snapshotReason - 1;
  if (v2 > 3)
    return (NSString *)CFSTR("unknown");
  else
    return (NSString *)*(&off_24CBD2DE8 + v2);
}

- (BOOL)lastOccurrence
{
  return -[NWStatsSnapshot snapshotReason](self, "snapshotReason") == 2;
}

- (BOOL)changedOwnership
{
  return (self->_flags & 0x21F000) != 0;
}

- (BOOL)changedUUID
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (BOOL)changedEUUID
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (BOOL)changedEUUIDFromUUID
{
  return (BYTE1(self->_flags) >> 6) & 1;
}

- (BOOL)changedEpid
{
  return BYTE2(self->_flags) & 1;
}

- (BOOL)changedPid
{
  return BYTE1(self->_flags) >> 7;
}

- (BOOL)changedProcname
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16]
{
  void *v4;

  if (uuid_is_null(a3))
    v4 = 0;
  else
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  return v4;
}

- (void)setAttribution:(id)a3 derivation:(int)a4 delegateName:(id)a5 delegateDerivation:(int)a6 extensionName:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a4;
  v18 = a5;
  v12 = a7;
  v13 = (objc_class *)MEMORY[0x24BDD17C8];
  v14 = a3;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithString:", v14);

  -[NWStatsSnapshot setAttributedEntity:](self, "setAttributedEntity:", v15);
  -[NWStatsSnapshot setAttributionReason:](self, "setAttributionReason:", v9);
  -[NWStatsSnapshot setDelegateAttributionReason:](self, "setDelegateAttributionReason:", v8);
  if (v12)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v12);
    -[NWStatsSnapshot setAttributedExtension:](self, "setAttributedExtension:", v16);

  }
  if (v18)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v18);
    -[NWStatsSnapshot setDelegateName:](self, "setDelegateName:", v17);

  }
}

- (NSString)attributionReasonString
{
  return (NSString *)attributionReasonString(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (NSString)delegateAttributionReasonString
{
  return (NSString *)attributionReasonString(-[NWStatsSnapshot delegateAttributionReason](self, "delegateAttributionReason"));
}

- (BOOL)attributedEntityIsBundleName
{
  return attributionReasonImpliesBundleName(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

- (BOOL)attributedEntityIsProcessName
{
  return attributionReasonImpliesProcessName(-[NWStatsSnapshot attributionReason](self, "attributionReason"));
}

+ (double)_intervalWithContinuousTime:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;

  LODWORD(v3) = timebase_info_1;
  LODWORD(v4) = *(_DWORD *)algn_253D924D4;
  return (double)a3 * (double)v3 / (double)v4 / 1000000000.0;
}

+ (double)_referenceIntervalWithContinuousTime:(unint64_t)a3
{
  int v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v12;
  double v13;
  double v15;

  v5 = 9;
  do
  {
    v6 = mach_continuous_time();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v8 = v7;
    v9 = mach_continuous_time() - v6;
    objc_msgSend(a1, "_intervalWithContinuousTime:", v9);
  }
  while (v10 * 1000000.0 >= 50.0 && v5-- != 0);
  v12 = v6 + (v9 >> 1);
  if (v12 <= a3)
  {
    objc_msgSend(a1, "_intervalWithContinuousTime:", a3 - v12);
    return v8 + v15;
  }
  else
  {
    objc_msgSend(a1, "_intervalWithContinuousTime:", v12 - a3);
    return v8 - v13;
  }
}

+ (void)initialize
{
  kern_return_t v2;
  kern_return_t v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = mach_timebase_info((mach_timebase_info_t)&timebase_info_1);
  if (v2)
  {
    v3 = v2;
    NStatGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_211429000, v4, OS_LOG_TYPE_ERROR, "mach_timebase_info failed %d", (uint8_t *)v5, 8u);
    }

  }
}

- (id)extensionDictionaries
{
  NSDictionary *extensionDictionaries;
  NSDictionary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  extensionDictionaries = self->_extensionDictionaries;
  if (extensionDictionaries)
    return extensionDictionaries;
  if (!self->_extensions)
  {
    extensionDictionaries = 0;
    return extensionDictionaries;
  }
  v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NWStatsSnapshot extensions](self, "extensions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[NWStatsSnapshot extensions](self, "extensions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = self->_extensionDictionaries;
  self->_extensionDictionaries = v4;

  return self->_extensionDictionaries;
}

- (unint64_t)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (BOOL)firstOccurrence
{
  return self->_firstOccurrence;
}

- (unint64_t)eventFlags
{
  return self->_eventFlags;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)euuid
{
  return self->_euuid;
}

- (unint64_t)eupid
{
  return self->_eupid;
}

- (int)epid
{
  return self->_epid;
}

- (int)processID
{
  return self->_processID;
}

- (unsigned)personaID
{
  return self->_personaID;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)uniqueProcessID
{
  return self->_uniqueProcessID;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)snapshotType
{
  return self->_snapshotType;
}

- (NSString)snapshotTypeLowerCase
{
  return self->_snapshotTypeLowerCase;
}

- (void)setAttributedExtension:(id)a3
{
  objc_storeStrong((id *)&self->_attributedExtension, a3);
}

- (int)delegateAttributionReason
{
  return self->_delegateAttributionReason;
}

- (void)setDelegateAttributionReason:(int)a3
{
  self->_delegateAttributionReason = a3;
}

- (NSDictionary)lookupResults
{
  return self->_lookupResults;
}

- (void)setLookupResults:(id)a3
{
  objc_storeStrong((id *)&self->_lookupResults, a3);
}

- (NSDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (BOOL)startScreenStateOn
{
  return self->_startScreenStateOn;
}

- (BOOL)snapshotScreenStateOn
{
  return self->_snapshotScreenStateOn;
}

- (BOOL)isTracker
{
  return self->_isTracker;
}

- (BOOL)isNonAppInitiated
{
  return self->_isNonAppInitiated;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)domainOwner
{
  return self->_domainOwner;
}

- (NSString)domainTrackerContext
{
  return self->_domainTrackerContext;
}

- (NSString)domainAttributedBundleId
{
  return self->_domainAttributedBundleId;
}

@end
