@implementation NWStatsTCPSource

- (NWStatsTCPSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8;
  NWStatsTCPSource *v9;
  NWStatsTCPSource *v10;
  uint64_t v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NWStatsTCPSource;
  v9 = -[NWStatsTCPSource init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    memcpy(&v9->_nstatTCPUpdate, a3, sizeof(v9->_nstatTCPUpdate));
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:](NWStatsProtocolSnapshot, "_referenceIntervalWithContinuousTime:", v10->_nstatTCPUpdate.tcp_desc.start_timestamp);
    -[NWStatsSource setCreationTimestamp:](v10, "setCreationTimestamp:");
    -[NWStatsSource setFlowFlags:](v10, "setFlowFlags:", -[NWStatsSource flagsForProvider:sockaddr:](v10, "flagsForProvider:sockaddr:", v10->_nstatTCPUpdate.provider, &v10->_nstatTCPUpdate.tcp_desc.remote));
    -[NWStatsTCPSource deriveAttribution:](v10, "deriveAttribution:", v8);
    v11 = objc_msgSend(v8, "currentForegroundStateForProcessWithPid:", v10->_nstatTCPUpdate.tcp_desc.epid);
    -[NWStatsSource setStartAppStateIsForeground:](v10, "setStartAppStateIsForeground:", v11);
    -[NWStatsSource setUpdateAppStateIsForeground:](v10, "setUpdateAppStateIsForeground:", v11);
    if (a3->hdr.hdr.type == 10007)
      -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:](v10, "processExtendedUpdate:length:bluetoothCounts:", &a3[1], a4 - 496, &v10->_nstatBluetoothCounts);
  }

  return v10;
}

- (void)deriveAttribution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;
  NSDictionary *v12;
  NSDictionary *lookupResults;
  uint64_t v14;

  v4 = a3;
  v14 = 0;
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_nstatTCPUpdate.tcp_desc.uuid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_nstatTCPUpdate.tcp_desc.euuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestIdentifierForUUID:EUUID:pid:epid:procname:derivation:", v5, v6, self->_nstatTCPUpdate.tcp_desc.pid, self->_nstatTCPUpdate.tcp_desc.epid, self->_nstatTCPUpdate.tcp_desc.pname, (char *)&v14 + 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource setAttributedEntity:](self, "setAttributedEntity:", v7);
  -[NWStatsSource setAttributionReason:](self, "setAttributionReason:", HIDWORD(v14));
  if (HIDWORD(v14) == 2)
  {
    objc_msgSend(v4, "extensionNameForUUID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsSource setAttributedExtension:](self, "setAttributedExtension:", v8);

  }
  if (*(_QWORD *)self->_nstatTCPUpdate.tcp_desc.uuid == *(_QWORD *)self->_nstatTCPUpdate.tcp_desc.euuid
    && *(_QWORD *)&self->_nstatTCPUpdate.tcp_desc.uuid[8] == *(_QWORD *)&self->_nstatTCPUpdate.tcp_desc.euuid[8])
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "bestIdentifierForUUID:EUUID:pid:epid:procname:derivation:", v5, 0, self->_nstatTCPUpdate.tcp_desc.pid, 0, self->_nstatTCPUpdate.tcp_desc.pname, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsSource setDelegateName:](self, "setDelegateName:", v10);

    v11 = v14;
  }
  -[NWStatsSource setDelegateAttributionReason:](self, "setDelegateAttributionReason:", v11);
  if (objc_msgSend(v4, "debugMode"))
  {
    objc_msgSend(v4, "allIdentifiersForUUID:EUUID:pid:epid:procname:", v5, v6, self->_nstatTCPUpdate.tcp_desc.pid, self->_nstatTCPUpdate.tcp_desc.epid, self->_nstatTCPUpdate.tcp_desc.pname);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    lookupResults = self->_lookupResults;
    self->_lookupResults = v12;

  }
}

- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8;
  unsigned int type;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;

  v8 = a5;
  type = a3->hdr.hdr.type;
  if (type != 10007 && !memcmp(&a3->var0, &self->_nstatTCPUpdate, 0x158uLL))
  {
    v16 = 0;
  }
  else
  {
    if (a3->var0.tcp.pid != self->_nstatTCPUpdate.tcp_desc.pid
      || a3->var0.tcp.epid != self->_nstatTCPUpdate.tcp_desc.epid
      || uuid_compare(a3->var0.tcp.uuid, self->_nstatTCPUpdate.tcp_desc.uuid)
      || uuid_compare(a3->var0.tcp.euuid, self->_nstatTCPUpdate.tcp_desc.euuid)
      || (*(_QWORD *)a3->var0.conn.euuid == *(_QWORD *)&self->_nstatTCPUpdate.tcp_desc.local.v4.sin_len
        ? (v10 = *(_QWORD *)&a3->var0.conn.euuid[8] == *(_QWORD *)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr8)
        : (v10 = 0),
          v10
        ? (v11 = *(_QWORD *)a3->var0.conn.cuuid == *(_QWORD *)&self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr32[2])
        : (v11 = 0),
          v11
        ? (v12 = a3->var0.tcp.local.v6.sin6_scope_id == (unint64_t)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_scope_id)
        : (v12 = 0),
          !v12
       || (*(_QWORD *)&a3->var0.conn.cuuid[12] == *(_QWORD *)&self->_nstatTCPUpdate.tcp_desc.remote.v4.sin_len
         ? (v13 = *(_QWORD *)&a3->var0.conn.puuid[4] == *(_QWORD *)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr8)
         : (v13 = 0),
           v13
         ? (v14 = *(_QWORD *)&a3->var0.conn.puuid[12] == *(_QWORD *)&self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr32[2])
         : (v14 = 0),
           v14
         ? (v15 = a3->var0.tcp.remote.v6.sin6_scope_id == (unint64_t)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_scope_id)
         : (v15 = 0),
           !v15)))
    {
      -[NWStatsTCPSource significantMetadataChange:monitor:](self, "significantMetadataChange:monitor:", &a3->var0, v8);
    }
    -[NWStatsSource saveOldValues:](self, "saveOldValues:", &self->_nstatTCPUpdate.counts);
    memcpy(&self->_nstatTCPUpdate, a3, sizeof(self->_nstatTCPUpdate));
    -[NWStatsSource setUpdateAppStateIsForeground:](self, "setUpdateAppStateIsForeground:", objc_msgSend(v8, "currentForegroundStateForProcessWithPid:", a3->var0.tcp.epid));
    if (type == 10007)
    {
      -[NWStatsSource saveOldBTCounts:](self, "saveOldBTCounts:", &self->_nstatBluetoothCounts);
      v16 = -[NWStatsSource processExtendedUpdate:length:bluetoothCounts:](self, "processExtendedUpdate:length:bluetoothCounts:", &a3[1], a4 - 496, &self->_nstatBluetoothCounts);
    }
    else
    {
      v16 = 1;
    }
  }

  return v16;
}

- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  NWStatsTCPSnapshot *v7;
  double v8;
  NWStatsTCPSnapshot *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = [NWStatsTCPSnapshot alloc];
  -[NWStatsSource creationTimestamp](self, "creationTimestamp");
  v9 = -[NWStatsTCPSnapshot initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:](v7, "initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:", &self->_nstatTCPUpdate, -[NWStatsSource flowFlags](self, "flowFlags"), -[NWStatsSource prevItemsPtr](self, "prevItemsPtr"), &self->_nstatBluetoothCounts, 0, v8);
  -[NWStatsSource setFlowFlags:](self, "setFlowFlags:", -[NWStatsSource flowFlags](self, "flowFlags") & 0xFFC00FFFLL);
  -[NWStatsSource saveOldValues:](self, "saveOldValues:", &self->_nstatTCPUpdate.counts);
  -[NWStatsSource saveOldBTCounts:](self, "saveOldBTCounts:", &self->_nstatBluetoothCounts);
  -[NWStatsSnapshot setSnapshotReason:](v9, "setSnapshotReason:", v5);
  -[NWStatsSnapshot setFirstOccurrence:](v9, "setFirstOccurrence:", v4);
  -[NWStatsSource attributedEntity](self, "attributedEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NWStatsSource attributionReason](self, "attributionReason");
  -[NWStatsSource delegateName](self, "delegateName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NWStatsSource delegateAttributionReason](self, "delegateAttributionReason");
  -[NWStatsSource attributedExtension](self, "attributedExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSnapshot setAttribution:derivation:delegateName:delegateDerivation:extensionName:](v9, "setAttribution:derivation:delegateName:delegateDerivation:extensionName:", v10, v11, v12, v13, v14);

  -[NWStatsSource domainName](self, "domainName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource domainOwner](self, "domainOwner");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource domainTrackerContext](self, "domainTrackerContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource domainAttributedBundleId](self, "domainAttributedBundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NWStatsSource isTracker](self, "isTracker");
  -[NWStatsSource attributedEntity](self, "attributedEntity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[NWStatsSource bundleNameImpliesNonAppInitiated:](self, "bundleNameImpliesNonAppInitiated:", v20)
     || -[NWStatsSource isNonAppInitiated](self, "isNonAppInitiated");
  LOBYTE(v28) = -[NWStatsSource isSilent](self, "isSilent");
  -[NWStatsProtocolSnapshot setDomainName:owner:context:attributedBundleId:isTracker:isNonAppInitiated:isSilent:](v9, "setDomainName:owner:context:attributedBundleId:isTracker:isNonAppInitiated:isSilent:", v15, v16, v17, v18, v19, v21, v28);

  -[NWStatsProtocolSnapshot setAppStateIsForeground:screenStateOn:startAppStateIsForeground:startScreenStateOn:](v9, "setAppStateIsForeground:screenStateOn:startAppStateIsForeground:startScreenStateOn:", -[NWStatsSource updateAppStateIsForeground](self, "updateAppStateIsForeground"), -[NWStatsSource updateScreenStateOn](self, "updateScreenStateOn"), -[NWStatsSource startAppStateIsForeground](self, "startAppStateIsForeground"), -[NWStatsSource startScreenStateOn](self, "startScreenStateOn"));
  if (self->_lookupResults)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", self->_lookupResults);
    -[NWStatsSnapshot setLookupResults:](v9, "setLookupResults:", v22);

  }
  -[NWStatsSource extensions](self, "extensions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc(MEMORY[0x24BDBCE70]);
    -[NWStatsSource extensions](self, "extensions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithDictionary:", v25);
    -[NWStatsSnapshot setExtensions:](v9, "setExtensions:", v26);

  }
  -[NWStatsProtocolSnapshot runConsistencyChecks](v9, "runConsistencyChecks");
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupResults, 0);
}

- (id)description
{
  nstat_msg_src_update_tcp *p_nstatTCPUpdate;
  id v4;
  char *pname;
  void *v6;
  uint64_t pid;
  uint64_t epid;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;

  p_nstatTCPUpdate = &self->_nstatTCPUpdate;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  pname = p_nstatTCPUpdate->tcp_desc.pname;
  -[NWStatsSource attributedEntity](self, "attributedEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pid = p_nstatTCPUpdate->tcp_desc.pid;
  epid = p_nstatTCPUpdate->tcp_desc.epid;
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatTCPUpdate->tcp_desc.uuid);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatTCPUpdate->tcp_desc.euuid);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatTCPUpdate->tcp_desc.fuuid);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource creationTimestamp](self, "creationTimestamp");
  dateStringMillisecondsFromReferenceInterval(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("NWStatsTCPSource %s attributed %@ pid %d epid %d uuid %@ euuid %@ fuuid %@ started %@"), pname, v6, pid, epid, v9, v10, v11, v13);

  return v14;
}

- (void)significantMetadataChange:(nstat_tcp_descriptor *)a3 monitor:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  _BOOL4 HavePortDiffOnly;
  int v16;
  const __CFString *v17;
  _BOOL4 v21;
  int v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v25 = v6;
  if (a3->pid == self->_nstatTCPUpdate.tcp_desc.pid)
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("newPid"));

    v7 = 0x8000;
  }
  if (a3->epid == self->_nstatTCPUpdate.tcp_desc.epid)
    v10 = v7;
  else
    v10 = v7 | 0x10000;
  if (uuid_compare(a3->uuid, self->_nstatTCPUpdate.tcp_desc.uuid))
    v10 |= 0x1000u;
  if (uuid_compare(a3->euuid, self->_nstatTCPUpdate.tcp_desc.euuid))
  {
    if (uuid_compare(self->_nstatTCPUpdate.tcp_desc.uuid, self->_nstatTCPUpdate.tcp_desc.euuid))
      v10 |= 0x2000u;
    else
      v10 |= 0x4000u;
  }
  if (!memcmp(a3->pname, self->_nstatTCPUpdate.tcp_desc.pname, 0x40uLL))
    v11 = v10;
  else
    v11 = v10 | 0x200000;
  if (*(_QWORD *)&a3->local.v4.sin_len != *(_QWORD *)&self->_nstatTCPUpdate.tcp_desc.local.v4.sin_len
    || *(_QWORD *)a3->local.v6.sin6_addr.__u6_addr8 != *(_QWORD *)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr8
    || *(_QWORD *)&a3->local.v6.sin6_addr.__u6_addr32[2] != *(_QWORD *)&self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_addr.__u6_addr32[2]
    || a3->local.v6.sin6_scope_id != (unint64_t)self->_nstatTCPUpdate.tcp_desc.local.v6.sin6_scope_id)
  {
    HavePortDiffOnly = sockaddrsHavePortDiffOnly((uint64_t)&self->_nstatTCPUpdate.tcp_desc.local, (uint64_t)&a3->local);
    if (HavePortDiffOnly)
      v16 = 0x80000;
    else
      v16 = 0x20000;
    if (HavePortDiffOnly)
      v17 = CFSTR("TCP local port");
    else
      v17 = CFSTR("TCP local address");
    v11 |= v16;
    -[NWStatsSource logAddressChangeOn:procName:variant:oldAddress:newAddress:](self, "logAddressChangeOn:procName:variant:oldAddress:newAddress:", self->_nstatTCPUpdate.srcref, a3->pname, v17, &self->_nstatTCPUpdate.tcp_desc.local, &a3->local);
  }
  if (*(_QWORD *)&a3->remote.v4.sin_len != *(_QWORD *)&self->_nstatTCPUpdate.tcp_desc.remote.v4.sin_len
    || *(_QWORD *)a3->remote.v6.sin6_addr.__u6_addr8 != *(_QWORD *)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr8
    || *(_QWORD *)&a3->remote.v6.sin6_addr.__u6_addr32[2] != *(_QWORD *)&self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_addr.__u6_addr32[2]
    || a3->remote.v6.sin6_scope_id != (unint64_t)self->_nstatTCPUpdate.tcp_desc.remote.v6.sin6_scope_id)
  {
    v21 = sockaddrsHavePortDiffOnly((uint64_t)&self->_nstatTCPUpdate.tcp_desc.remote, (uint64_t)&a3->remote);
    if (v21)
      v22 = 0x100000;
    else
      v22 = 0x40000;
    if (v21)
      v23 = CFSTR("TCP remote port");
    else
      v23 = CFSTR("TCP remote address");
    v11 |= v22;
    -[NWStatsSource logAddressChangeOn:procName:variant:oldAddress:newAddress:](self, "logAddressChangeOn:procName:variant:oldAddress:newAddress:", self->_nstatTCPUpdate.srcref, a3->pname, v23, &self->_nstatTCPUpdate.tcp_desc.remote, &a3->remote);
  }
  if ((v11 & 0x21F000) != 0)
  {
    LODWORD(v24) = a3->epid;
    -[NWStatsSource logAttributionChangeOn:oldProcName:newProcName:oldPid:newPid:oldEPid:newEPid:oldUUID:newUUID:oldEUUID:newEUUID:monitor:](self, "logAttributionChangeOn:oldProcName:newProcName:oldPid:newPid:oldEPid:newEPid:oldUUID:newUUID:oldEUUID:newEUUID:monitor:", self->_nstatTCPUpdate.srcref, self->_nstatTCPUpdate.tcp_desc.pname, a3->pname, self->_nstatTCPUpdate.tcp_desc.pid, a3->pid, self->_nstatTCPUpdate.tcp_desc.epid, v24, self->_nstatTCPUpdate.tcp_desc.uuid, a3->uuid, self->_nstatTCPUpdate.tcp_desc.euuid, a3->euuid, v26);
    -[NWStatsTCPSource deriveAttribution:](self, "deriveAttribution:", v26);
  }
  -[NWStatsSource setFlowFlags:](self, "setFlowFlags:", -[NWStatsSource flowFlags](self, "flowFlags") | v11);

}

@end
