@implementation NWStatsSource

- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16]
{
  void *v4;

  if (uuid_is_null(a3))
    v4 = 0;
  else
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  return v4;
}

- (BOOL)bundleNameImpliesNonAppInitiated:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (bundleNameImpliesNonAppInitiated__onceToken != -1)
  {
    dispatch_once(&bundleNameImpliesNonAppInitiated__onceToken, &__block_literal_global_2);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = objc_msgSend((id)bundleNameImpliesNonAppInitiated__nonAppInitiatedBundleIDs, "containsObject:", v4);
LABEL_6:

  return v5;
}

- (void)setCreationTimestamp:(double)a3
{
  self->_creationTimestamp = a3;
}

- (void)setAttributionReason:(int)a3
{
  self->_attributionReason = a3;
}

- (void)setAttributedEntity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void)setDelegateName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)removing
{
  return self->_removing;
}

- (void)setUpdateAppStateIsForeground:(BOOL)a3
{
  self->_updateAppStateIsForeground = a3;
}

- (void)setStartAppStateIsForeground:(BOOL)a3
{
  self->_startAppStateIsForeground = a3;
}

- (unsigned)flagsForProvider:(unsigned int)a3 sockaddr:(sockaddr *)a4
{
  signed int v4;
  unsigned int v5;
  int sa_family;
  unsigned int v7;

  v4 = a3 - 2;
  if (a3 - 2 >= 9 || ((0x1CFu >> v4) & 1) == 0)
    -[NWStatsSource flagsForProvider:sockaddr:].cold.1();
  v5 = dword_211459B18[v4];
  sa_family = a4->sa_family;
  v7 = v5 | 8;
  if (sa_family == 2)
    v5 |= 4u;
  if (sa_family == 30)
    return v7;
  else
    return v5;
}

- (unsigned)flagsForProvider:(unsigned int)a3
{
  unsigned int v3;

  v3 = a3 - 2;
  if (a3 - 2 >= 9 || ((0x1CFu >> v3) & 1) == 0)
    -[NWStatsSource flagsForProvider:].cold.1();
  return dword_211459B18[v3];
}

- (unsigned)flowFlags
{
  return self->_flowFlags;
}

- (NSString)attributedEntity
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFlowFlags:(unsigned int)a3
{
  self->_flowFlags = a3;
}

- (void)saveOldValues:(nstat_counts *)a3
{
  unint64_t nstat_cell_txbytes;
  unint64_t nstat_wifi_rxbytes;
  unint64_t nstat_wifi_txbytes;
  unint64_t nstat_wired_txbytes;

  *(_OWORD *)&self->_prevItems.savedRxPackets = *(_OWORD *)&a3->nstat_rxpackets;
  *(_OWORD *)&self->_prevItems.savedTxPackets = *(_OWORD *)&a3->nstat_txpackets;
  nstat_cell_txbytes = a3->nstat_cell_txbytes;
  nstat_wifi_rxbytes = a3->nstat_wifi_rxbytes;
  nstat_wifi_txbytes = a3->nstat_wifi_txbytes;
  self->_prevItems.savedRxCellularBytes = a3->nstat_cell_rxbytes;
  self->_prevItems.savedRxWiFiBytes = nstat_wifi_rxbytes;
  nstat_wired_txbytes = a3->nstat_wired_txbytes;
  self->_prevItems.savedRxWiredBytes = a3->nstat_wired_rxbytes;
  self->_prevItems.savedTxCellularBytes = nstat_cell_txbytes;
  self->_prevItems.savedTxWiFiBytes = nstat_wifi_txbytes;
  self->_prevItems.savedTxWiredBytes = nstat_wired_txbytes;
  *(_QWORD *)&self->_prevItems.savedRxDuplicateBytes = *(_QWORD *)&a3->nstat_rxduplicatebytes;
  self->_prevItems.savedTxRetransmittedBytes = a3->nstat_txretransmit;
}

- (BOOL)isTracker
{
  return self->_isTracker;
}

- (BOOL)updateScreenStateOn
{
  return self->_updateScreenStateOn;
}

- (BOOL)updateAppStateIsForeground
{
  return self->_updateAppStateIsForeground;
}

- (BOOL)startScreenStateOn
{
  return self->_startScreenStateOn;
}

- (BOOL)startAppStateIsForeground
{
  return self->_startAppStateIsForeground;
}

- (BOOL)isNonAppInitiated
{
  return self->_isNonAppInitiated;
}

- (NSMutableDictionary)extensions
{
  return self->_extensions;
}

- (NSString)domainTrackerContext
{
  return self->_domainTrackerContext;
}

- (NSString)domainOwner
{
  return self->_domainOwner;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)domainAttributedBundleId
{
  return self->_domainAttributedBundleId;
}

- (NSString)delegateName
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (int)attributionReason
{
  return self->_attributionReason;
}

- (NSString)attributedExtension
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (update_subset_for_deltas)prevItemsPtr
{
  return &self->_prevItems;
}

- (BOOL)handleDomainUpdate:(nstat_domain_info *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!a3)
    -[NWStatsSource handleDomainUpdate:].cold.1();
  if (a3->var0[0])
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3);
    -[NWStatsSource setDomainName:](self, "setDomainName:", v5);

  }
  else
  {
    -[NWStatsSource setDomainName:](self, "setDomainName:", 0);
  }
  if (a3->var1[0])
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3->var1);
    -[NWStatsSource setDomainOwner:](self, "setDomainOwner:", v6);

  }
  else
  {
    -[NWStatsSource setDomainOwner:](self, "setDomainOwner:", 0);
  }
  if (a3->var2[0])
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3->var2);
    -[NWStatsSource setDomainTrackerContext:](self, "setDomainTrackerContext:", v7);

  }
  else
  {
    -[NWStatsSource setDomainTrackerContext:](self, "setDomainTrackerContext:", 0);
  }
  if (a3->var3[0])
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3->var3);
    -[NWStatsSource setDomainAttributedBundleId:](self, "setDomainAttributedBundleId:", v8);

  }
  else
  {
    -[NWStatsSource setDomainAttributedBundleId:](self, "setDomainAttributedBundleId:", 0);
  }
  -[NWStatsSource setIsTracker:](self, "setIsTracker:", a3->var5);
  -[NWStatsSource setIsNonAppInitiated:](self, "setIsNonAppInitiated:", a3->var6);
  -[NWStatsSource setIsSilent:](self, "setIsSilent:", a3->var7);
  -[NWStatsSource isSilent](self, "isSilent");
  return 1;
}

- (BOOL)isSilent
{
  return self->_isSilent;
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

- (void)setDomainTrackerContext:(id)a3
{
  objc_storeStrong((id *)&self->_domainTrackerContext, a3);
}

- (void)setDomainOwner:(id)a3
{
  objc_storeStrong((id *)&self->_domainOwner, a3);
}

- (void)setDomainName:(id)a3
{
  objc_storeStrong((id *)&self->_domainName, a3);
}

- (void)setDomainAttributedBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_domainAttributedBundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAttributedBundleId, 0);
  objc_storeStrong((id *)&self->_domainTrackerContext, 0);
  objc_storeStrong((id *)&self->_domainOwner, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_delegateName, 0);
  objc_storeStrong((id *)&self->_attributedExtension, 0);
  objc_storeStrong((id *)&self->_attributedEntity, 0);
}

- (void)setRemoving:(BOOL)a3
{
  self->_removing = a3;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4
{
  return 0;
}

- (void)logAttributionChangeOn:(unint64_t)a3 oldProcName:(char *)a4 newProcName:(char *)a5 oldPid:(int)a6 newPid:(int)a7 oldEPid:(int)a8 newEPid:(int)a9 oldUUID:(unsigned __int8)a10[16] newUUID:(unsigned __int8)a11[16] oldEUUID:(unsigned __int8)a12[16] newEUUID:(unsigned __int8)a13[16] monitor:(id)a14
{
  uint64_t v14;
  objc_class *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  char *v29;
  void *v30;
  NWStatsSource *v31;
  void *v32;
  void *v36;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  char *v41;
  __int16 v42;
  _BYTE v43[10];
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v14 = *(_QWORD *)&a7;
  v58 = *MEMORY[0x24BDAC8D0];
  v17 = (objc_class *)MEMORY[0x24BDD1880];
  v18 = a14;
  v19 = (void *)objc_msgSend([v17 alloc], "initWithUUIDBytes:", a11);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a13);
  objc_msgSend(v18, "bestIdentifierForUUID:EUUID:pid:epid:procname:derivation:", v19, v20, v14, a9, a5, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  NStatGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a10);
    objc_msgSend(v30, "UUIDString");
    v32 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = self;
    v23 = v19;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a12);
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134220546;
    v39 = a3;
    v40 = 2080;
    v41 = a4;
    v42 = 1024;
    *(_DWORD *)v43 = a6;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = a8;
    v44 = 2112;
    v45 = v22;
    v46 = 2112;
    v47 = v25;
    v48 = 2080;
    v49 = a5;
    v50 = 1024;
    v51 = v14;
    v52 = 1024;
    v53 = a9;
    v54 = 2112;
    v55 = v26;
    v56 = 2112;
    v57 = v27;
    _os_log_impl(&dword_211429000, v21, OS_LOG_TYPE_DEFAULT, "Source %lld attribution change, was procname %s pid %d epid %d uuid %@ euuid %@  now %s %d %d %@ %@", buf, 0x60u);

    v19 = v23;
    self = v31;

    v20 = v32;
  }

  NStatGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    -[NWStatsSource attributedEntity](self, "attributedEntity");
    v29 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v39 = a3;
    v40 = 2112;
    v41 = v29;
    v42 = 2112;
    *(_QWORD *)v43 = v36;
    _os_log_impl(&dword_211429000, v28, OS_LOG_TYPE_DEFAULT, "Source %lld old attribution %@ new attribution %@", buf, 0x20u);

  }
}

- (void)logAddressChangeOn:(unint64_t)a3 procName:(char *)a4 variant:(id)a5 oldAddress:(sockaddr *)a6 newAddress:(sockaddr *)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  NStatGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[NWStatsSource attributedEntity](self, "attributedEntity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sockaddrForLogging(a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sockaddrForLogging(a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413570;
    v18 = v12;
    v19 = 2048;
    v20 = a3;
    v21 = 2080;
    v22 = a4;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    _os_log_impl(&dword_211429000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected %@ on flow %lld for process %s attributed %@, was %@ now %@", (uint8_t *)&v17, 0x3Eu);

  }
}

- (BOOL)saveOldBTCounts:(nstat_interface_counts *)a3
{
  if (!a3)
    -[NWStatsSource saveOldBTCounts:].cold.1();
  self->_prevItems.savedRxCompanionLinkBluetoothBytes = a3->nstat_rxbytes;
  self->_prevItems.savedTxCompanionLinkBluetoothBytes = a3->nstat_txbytes;
  return 1;
}

- (BOOL)handleUnknownExtension:(unsigned int)a3 data:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (!v6)
    -[NWStatsSource handleUnknownExtension:data:].cold.1();
  v7 = v6;
  -[NWStatsSource extensions](self, "extensions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NWStatsSource setExtensions:](self, "setExtensions:", v9);

  }
  -[NWStatsSource extensions](self, "extensions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v11);

  return 1;
}

- (BOOL)processExtendedUpdate:(nstat_msg_src_extended_item_hdr *)a3 length:(int64_t)a4 bluetoothCounts:(nstat_interface_counts *)a5
{
  BOOL result;
  nstat_msg_src_extended_item_hdr *v7;
  unint64_t var1;
  uint64_t var0;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  unint64_t v16;
  uint8_t buf[4];
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  result = 1;
  if ((unint64_t)a4 >= 8)
  {
    v7 = a3;
    if (a3)
    {
      while (1)
      {
        var0 = v7->var0;
        var1 = v7->var1;
        v11 = a4 - 8;
        if (a4 - 8 < var1)
        {
          NStatGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v18 = var1;
            *(_WORD *)&v18[8] = 2048;
            *(_QWORD *)&v18[10] = v11;
            _os_log_impl(&dword_211429000, v12, OS_LOG_TYPE_ERROR, "Parsing extensions, item length %zd > remaining size for extensions %zd", buf, 0x16u);
          }

          var1 = v11;
        }
        if ((_DWORD)var0 == 6)
        {
          if (var1 <= 0x1F)
            -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:].cold.4();
          if (v11 <= 0x1F)
            -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:].cold.3();
          if (a5)
          {
            a5->nstat_txbytes = (unint64_t)v7[4];
            *(_OWORD *)&a5->nstat_rxpackets = *(_OWORD *)&v7[1].var0;
            a5->nstat_txpackets = (unint64_t)v7[3];
          }
        }
        else if ((_DWORD)var0 == 1)
        {
          if (var1 <= 0x41F)
            -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:].cold.2();
          if (v11 <= 0x41F)
            -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:].cold.1();
          if (!-[NWStatsSource handleDomainUpdate:](self, "handleDomainUpdate:", &v7[1]))
            return 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v7[1], var1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          NStatGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v18 = var0;
            *(_WORD *)&v18[4] = 2048;
            *(_QWORD *)&v18[6] = var1;
            *(_WORD *)&v18[14] = 2112;
            *(_QWORD *)&v18[16] = v13;
            _os_log_impl(&dword_211429000, v14, OS_LOG_TYPE_ERROR, "Unexpected extended item type: %d, length: %zd contents %@", buf, 0x1Cu);
          }

          v15 = -[NWStatsSource handleUnknownExtension:data:](self, "handleUnknownExtension:data:", var0, v13);
          if (!v15)
            return 0;
        }
        v16 = (var1 + 7) & 0xFFFFFFFFFFFFFFF8;
        a4 = v11 - v16;
        v7 = (nstat_msg_src_extended_item_hdr *)((char *)v7 + v16 + 8);
        if (v11 - v16 <= 7)
          return 1;
      }
    }
  }
  return result;
}

- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  return 0;
}

- (NWStatsSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{

  return 0;
}

void __50__NWStatsSource_bundleNameImpliesNonAppInitiated___block_invoke()
{
  void *v0;

  v0 = (void *)bundleNameImpliesNonAppInitiated__nonAppInitiatedBundleIDs;
  bundleNameImpliesNonAppInitiated__nonAppInitiatedBundleIDs = (uint64_t)&unk_24CBE2800;

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

  -[NWStatsSource setAttributedEntity:](self, "setAttributedEntity:", v15);
  -[NWStatsSource setAttributionReason:](self, "setAttributionReason:", v9);
  -[NWStatsSource setDelegateAttributionReason:](self, "setDelegateAttributionReason:", v8);
  if (v18)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v18);
    -[NWStatsSource setDelegateName:](self, "setDelegateName:", v16);

  }
  if (v12)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v12);
    -[NWStatsSource setAttributedExtension:](self, "setAttributedExtension:", v17);

  }
}

- (unint64_t)snapshotRevision
{
  return self->_snapshotRevision;
}

- (void)setSnapshotRevision:(unint64_t)a3
{
  self->_snapshotRevision = a3;
}

- (BOOL)removed
{
  return self->_removed;
}

- (void)setAttributedExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (int)delegateAttributionReason
{
  return self->_delegateAttributionReason;
}

- (void)setDelegateAttributionReason:(int)a3
{
  self->_delegateAttributionReason = a3;
}

- (void)setStartScreenStateOn:(BOOL)a3
{
  self->_startScreenStateOn = a3;
}

- (void)setUpdateScreenStateOn:(BOOL)a3
{
  self->_updateScreenStateOn = a3;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (void)flagsForProvider:.cold.1()
{
  __assert_rtn("-[NWStatsSource flagsForProvider:]", "NWStatsSource.m", 106, "0");
}

- (void)flagsForProvider:sockaddr:.cold.1()
{
  __assert_rtn("-[NWStatsSource flagsForProvider:sockaddr:]", "NWStatsSource.m", 139, "0");
}

- (void)handleDomainUpdate:.cold.1()
{
  __assert_rtn("-[NWStatsSource handleDomainUpdate:]", "NWStatsSource.m", 243, "info != NULL");
}

- (void)saveOldBTCounts:.cold.1()
{
  __assert_rtn("-[NWStatsSource saveOldBTCounts:]", "NWStatsSource.m", 268, "counts != NULL");
}

- (void)handleUnknownExtension:data:.cold.1()
{
  __assert_rtn("-[NWStatsSource handleUnknownExtension:data:]", "NWStatsSource.m", 282, "data != nil");
}

- (void)processExtendedUpdate:length:bluetoothCounts:.cold.1()
{
  __assert_rtn("-[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]", "NWStatsSource.m", 364, "length >= sizeof(nstat_domain_info)");
}

- (void)processExtendedUpdate:length:bluetoothCounts:.cold.2()
{
  __assert_rtn("-[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]", "NWStatsSource.m", 363, "itemLength >= sizeof(nstat_domain_info)");
}

- (void)processExtendedUpdate:length:bluetoothCounts:.cold.3()
{
  __assert_rtn("-[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]", "NWStatsSource.m", 379, "length >= sizeof(nstat_interface_counts)");
}

- (void)processExtendedUpdate:length:bluetoothCounts:.cold.4()
{
  __assert_rtn("-[NWStatsSource processExtendedUpdate:length:bluetoothCounts:]", "NWStatsSource.m", 378, "itemLength >= sizeof(nstat_interface_counts)");
}

@end
