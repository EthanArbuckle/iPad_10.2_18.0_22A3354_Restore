@implementation NWStatsConnSource

- (BOOL)updateWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8;
  unsigned int type;
  BOOL v10;

  v8 = a5;
  type = a3->hdr.hdr.type;
  if (type != 10007 && !memcmp(&a3->var0, &self->_nstatConnUpdate, 0xC8uLL))
  {
    v10 = 0;
  }
  else
  {
    if (a3->var0.route.dst.v6.sin6_addr.__u6_addr32[0] != self->_nstatConnUpdate.conn_desc.pid
      || a3->var0.route.dst.v6.sin6_addr.__u6_addr32[1] != self->_nstatConnUpdate.conn_desc.epid
      || uuid_compare(a3->var0.conn.uuid, self->_nstatConnUpdate.conn_desc.uuid)
      || uuid_compare(&a3->var0.tcp.local.v4.sin_len, self->_nstatConnUpdate.conn_desc.euuid))
    {
      -[NWStatsConnSource significantMetadataChange:monitor:](self, "significantMetadataChange:monitor:", &a3->var0, v8);
    }
    -[NWStatsSource saveOldValues:](self, "saveOldValues:", &self->_nstatConnUpdate.counts);
    memcpy(&self->_nstatConnUpdate, a3, sizeof(self->_nstatConnUpdate));
    -[NWStatsSource setUpdateAppStateIsForeground:](self, "setUpdateAppStateIsForeground:", objc_msgSend(v8, "currentForegroundStateForProcessWithPid:", a3->var0.route.dst.v6.sin6_addr.__u6_addr32[1]));
    v10 = type != 10007
       || -[NWStatsConnSource processExtendedUpdate:length:](self, "processExtendedUpdate:length:", &a3->var0.conn + 1, a4 - 352);
  }

  return v10;
}

- (NWStatsConnSource)initWithUpdate:(nstat_msg_src_update_convenient *)a3 length:(int64_t)a4 monitor:(id)a5
{
  id v8;
  NWStatsConnSource *v9;
  NWStatsConnSource *v10;
  uint64_t v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NWStatsConnSource;
  v9 = -[NWStatsConnSource init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    memcpy(&v9->_nstatConnUpdate, a3, sizeof(v9->_nstatConnUpdate));
    -[NWStatsSource setFlowFlags:](v10, "setFlowFlags:", -[NWStatsSource flagsForProvider:](v10, "flagsForProvider:", v10->_nstatConnUpdate.provider));
    -[NWStatsConnSource deriveAttribution:](v10, "deriveAttribution:", v8);
    v11 = objc_msgSend(v8, "currentForegroundStateForProcessWithPid:", v10->_nstatConnUpdate.conn_desc.epid);
    -[NWStatsSource setStartAppStateIsForeground:](v10, "setStartAppStateIsForeground:", v11);
    -[NWStatsSource setUpdateAppStateIsForeground:](v10, "setUpdateAppStateIsForeground:", v11);
    if (a3->hdr.hdr.type == 10007)
      -[NWStatsConnSource processExtendedUpdate:length:](v10, "processExtendedUpdate:length:", &a3->var0.conn + 1, a4 - 352);
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
  NSDictionary *v11;
  NSDictionary *lookupResults;
  uint64_t v13;

  v4 = a3;
  v13 = 0;
  +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:](NWStatsProtocolSnapshot, "_referenceIntervalWithContinuousTime:", self->_nstatConnUpdate.conn_desc.start_timestamp);
  -[NWStatsSource setCreationTimestamp:](self, "setCreationTimestamp:");
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_nstatConnUpdate.conn_desc.uuid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_nstatConnUpdate.conn_desc.euuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestIdentifierForUUID:EUUID:pid:epid:procname:derivation:", v5, v6, self->_nstatConnUpdate.conn_desc.pid, self->_nstatConnUpdate.conn_desc.epid, self->_nstatConnUpdate.conn_desc.pname, (char *)&v13 + 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource setAttributedEntity:](self, "setAttributedEntity:", v7);
  -[NWStatsSource setAttributionReason:](self, "setAttributionReason:", HIDWORD(v13));
  if (HIDWORD(v13) == 2)
  {
    objc_msgSend(v4, "extensionNameForUUID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsSource setAttributedExtension:](self, "setAttributedExtension:", v8);

  }
  if (*(_QWORD *)self->_nstatConnUpdate.conn_desc.uuid != *(_QWORD *)self->_nstatConnUpdate.conn_desc.euuid
    || *(_QWORD *)&self->_nstatConnUpdate.conn_desc.uuid[8] != *(_QWORD *)&self->_nstatConnUpdate.conn_desc.euuid[8])
  {
    objc_msgSend(v4, "bestIdentifierForUUID:EUUID:pid:epid:procname:derivation:", v5, 0, self->_nstatConnUpdate.conn_desc.pid, 0, self->_nstatConnUpdate.conn_desc.pname, &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsSource setDelegateName:](self, "setDelegateName:", v10);

  }
  -[NWStatsSource setDelegateAttributionReason:](self, "setDelegateAttributionReason:", HIDWORD(v13));
  if (objc_msgSend(v4, "debugMode"))
  {
    objc_msgSend(v4, "allIdentifiersForUUID:EUUID:pid:epid:procname:", v5, v6, self->_nstatConnUpdate.conn_desc.pid, self->_nstatConnUpdate.conn_desc.epid, self->_nstatConnUpdate.conn_desc.pname);
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    lookupResults = self->_lookupResults;
    self->_lookupResults = v11;

  }
}

- (BOOL)processExtendedUpdate:(nstat_msg_src_extended_item_hdr *)a3 length:(int64_t)a4
{
  NWStatsConnSource *v4;
  nstat_msg_src_extended_item_hdr *v5;
  uint64_t var0;
  int64_t v7;
  unint64_t var1;
  NWStatsConnProperties *v10;
  int *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v17;
  uint64_t v18;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = self;
  v26 = *MEMORY[0x24BDAC8D0];
  LOBYTE(self) = 1;
  if ((unint64_t)a4 >= 8)
  {
    v5 = a3;
    if (a3)
    {
      while (1)
      {
        var0 = v5->var0;
        v7 = a4 - 8;
        if (a4 - 8 >= (unint64_t)v5->var1)
          var1 = v5->var1;
        else
          var1 = a4 - 8;
        if ((_DWORD)var0 == 4 || (_DWORD)var0 == 1)
        {
          if (var1 <= 0x41F)
            -[NWStatsConnSource processExtendedUpdate:length:].cold.1();
          LODWORD(self) = -[NWStatsSource handleDomainUpdate:](v4, "handleDomainUpdate:", &v5[1]);
          if (!(_DWORD)self)
            return (char)self;
          v10 = objc_alloc_init(NWStatsConnProperties);
          -[NWStatsConnSource populateConnProperties:fromDomainInfo:](v4, "populateConnProperties:fromDomainInfo:", v10, &v5[1]);
          if ((_DWORD)var0 == 1)
            v11 = &OBJC_IVAR___NWStatsConnSource__currentProperties;
          else
            v11 = &OBJC_IVAR___NWStatsConnSource__ancestralProperties;
          v12 = *v11;
          v13 = *(Class *)((char *)&v4->super.super.isa + v12);
          *(Class *)((char *)&v4->super.super.isa + v12) = (Class)v10;

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v5[1], var1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          NStatGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109634;
            v21 = var0;
            v22 = 2048;
            v23 = var1;
            v24 = 2112;
            v25 = v14;
            _os_log_impl(&dword_211429000, v15, OS_LOG_TYPE_ERROR, "NWStatsConn Unexpected extended item type: %d, length: %zd contents %@", buf, 0x1Cu);
          }

          v17 = -[NWStatsSource handleUnknownExtension:data:](v4, "handleUnknownExtension:data:", var0, v14);
          if (!v17)
          {
            LOBYTE(self) = 0;
            return (char)self;
          }
        }
        v18 = (var1 + 7) & 0x1FFFFFFF8;
        a4 = v7 - v18;
        v5 = (nstat_msg_src_extended_item_hdr *)((char *)v5 + v18 + 8);
        if ((unint64_t)(v7 - v18) <= 7)
        {
          LOBYTE(self) = 1;
          return (char)self;
        }
      }
    }
  }
  return (char)self;
}

- (void)populateConnProperties:(id)a3 fromDomainInfo:(nstat_domain_info *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "setIsSilent:", a4->var7);
  objc_msgSend(v10, "setIsTracker:", a4->var5);
  objc_msgSend(v10, "setIsNonAppInitiated:", a4->var6);
  if ((objc_msgSend(v10, "isSilent") & 1) == 0)
  {
    if (a4->var0[0])
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a4);
      objc_msgSend(v10, "setDomainName:", v5);

    }
    else
    {
      objc_msgSend(v10, "setDomainName:", 0);
    }
    if (a4->var1[0])
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a4->var1);
      objc_msgSend(v10, "setDomainOwner:", v6);

    }
    else
    {
      objc_msgSend(v10, "setDomainOwner:", 0);
    }
    if (a4->var2[0])
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a4->var2);
      objc_msgSend(v10, "setDomainTrackerContext:", v7);

    }
    else
    {
      objc_msgSend(v10, "setDomainTrackerContext:", 0);
    }
    if (a4->var3[0])
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a4->var3);
      objc_msgSend(v10, "setDomainAttributedBundleId:", v8);

    }
    else
    {
      objc_msgSend(v10, "setDomainAttributedBundleId:", 0);
    }
    if (a4->var4.var0.sin_len)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &a4->var4, a4->var4.var0.sin_len);
      objc_msgSend(v10, "setRemoteAddress:", v9);

    }
    else
    {
      objc_msgSend(v10, "setRemoteAddress:", 0);
    }
  }

}

- (id)createSnapshot:(int)a3 firstOccurrence:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  NWStatsConnSnapshot *v7;
  double v8;
  NWStatsConnSnapshot *v9;
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
  NWStatsConnProperties *currentProperties;
  NWStatsConnProperties *ancestralProperties;
  uint64_t v30;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = [NWStatsConnSnapshot alloc];
  -[NWStatsSource creationTimestamp](self, "creationTimestamp");
  v9 = -[NWStatsConnSnapshot initWithConnUpdate:startTime:flowFlags:](v7, "initWithConnUpdate:startTime:flowFlags:", &self->_nstatConnUpdate, -[NWStatsSource flowFlags](self, "flowFlags"), v8);
  -[NWStatsSource setFlowFlags:](self, "setFlowFlags:", -[NWStatsSource flowFlags](self, "flowFlags") & 0xFFC00FFFLL);
  -[NWStatsSource saveOldValues:](self, "saveOldValues:", &self->_nstatConnUpdate.counts);
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
  LOBYTE(v30) = -[NWStatsSource isSilent](self, "isSilent");
  -[NWStatsSnapshot setDomainName:owner:context:attributedBundleId:isTracker:isNonAppInitiated:isSilent:](v9, "setDomainName:owner:context:attributedBundleId:isTracker:isNonAppInitiated:isSilent:", v15, v16, v17, v18, v19, v21, v30);

  -[NWStatsSnapshot setAppStateIsForeground:screenStateOn:startAppStateIsForeground:startScreenStateOn:](v9, "setAppStateIsForeground:screenStateOn:startAppStateIsForeground:startScreenStateOn:", -[NWStatsSource updateAppStateIsForeground](self, "updateAppStateIsForeground"), -[NWStatsSource updateScreenStateOn](self, "updateScreenStateOn"), -[NWStatsSource startAppStateIsForeground](self, "startAppStateIsForeground"), -[NWStatsSource startScreenStateOn](self, "startScreenStateOn"));
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
  -[NWStatsConnSnapshot setCurrentProperties:](v9, "setCurrentProperties:", self->_currentProperties);
  -[NWStatsConnSnapshot setAncestralProperties:](v9, "setAncestralProperties:", self->_ancestralProperties);
  currentProperties = self->_currentProperties;
  self->_currentProperties = 0;

  ancestralProperties = self->_ancestralProperties;
  self->_ancestralProperties = 0;

  return v9;
}

- (id)description
{
  nstat_msg_src_update_conn *p_nstatConnUpdate;
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

  p_nstatConnUpdate = &self->_nstatConnUpdate;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  pname = p_nstatConnUpdate->conn_desc.pname;
  -[NWStatsSource attributedEntity](self, "attributedEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pid = p_nstatConnUpdate->conn_desc.pid;
  epid = p_nstatConnUpdate->conn_desc.epid;
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatConnUpdate->conn_desc.uuid);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatConnUpdate->conn_desc.euuid);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", p_nstatConnUpdate->conn_desc.fuuid);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSource creationTimestamp](self, "creationTimestamp");
  dateStringMillisecondsFromReferenceInterval(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("NWStatsConnSource %s attributed %@ pid %d epid %d uuid %@ euuid %@ fuuid %@ started %@"), pname, v6, pid, epid, v9, v10, v11, v13);

  return v14;
}

- (void)significantMetadataChange:(nstat_connection_descriptor *)a3 monitor:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = v6;
  if (a3->pid == self->_nstatConnUpdate.conn_desc.pid)
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
  if (a3->epid == self->_nstatConnUpdate.conn_desc.epid)
    v10 = v7;
  else
    v10 = v7 | 0x10000;
  if (uuid_compare(a3->uuid, self->_nstatConnUpdate.conn_desc.uuid))
    v10 |= 0x1000u;
  if (uuid_compare(a3->euuid, self->_nstatConnUpdate.conn_desc.euuid))
  {
    if (uuid_compare(self->_nstatConnUpdate.conn_desc.uuid, self->_nstatConnUpdate.conn_desc.euuid))
      v10 |= 0x2000u;
    else
      v10 |= 0x4000u;
  }
  if (memcmp(a3->pname, self->_nstatConnUpdate.conn_desc.pname, 0x40uLL))
    v10 |= 0x200000u;
  if ((v10 & 0xFFFFF000) != 0)
  {
    LODWORD(v11) = a3->epid;
    -[NWStatsSource logAttributionChangeOn:oldProcName:newProcName:oldPid:newPid:oldEPid:newEPid:oldUUID:newUUID:oldEUUID:newEUUID:monitor:](self, "logAttributionChangeOn:oldProcName:newProcName:oldPid:newPid:oldEPid:newEPid:oldUUID:newUUID:oldEUUID:newEUUID:monitor:", self->_nstatConnUpdate.srcref, self->_nstatConnUpdate.conn_desc.pname, a3->pname, self->_nstatConnUpdate.conn_desc.pid, a3->pid, self->_nstatConnUpdate.conn_desc.epid, v11, self->_nstatConnUpdate.conn_desc.uuid, a3->uuid, self->_nstatConnUpdate.conn_desc.euuid, a3->euuid, v13, v12);
    -[NWStatsConnSource deriveAttribution:](self, "deriveAttribution:", v13);
  }
  -[NWStatsSource setFlowFlags:](self, "setFlowFlags:", -[NWStatsSource flowFlags](self, "flowFlags") | v10);

}

- (int)epid
{
  return self->_epid;
}

- (void)setEpid:(int)a3
{
  self->_epid = a3;
}

- (NSUUID)euuid
{
  return self->_euuid;
}

- (void)setEuuid:(id)a3
{
  objc_storeStrong((id *)&self->_euuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_ancestralProperties, 0);
  objc_storeStrong((id *)&self->_currentProperties, 0);
  objc_storeStrong((id *)&self->_lookupResults, 0);
}

- (void)processExtendedUpdate:length:.cold.1()
{
  __assert_rtn("-[NWStatsConnSource processExtendedUpdate:length:]", "NWStatsSource.m", 1286, "itemLength >= sizeof(nstat_domain_info)");
}

@end
