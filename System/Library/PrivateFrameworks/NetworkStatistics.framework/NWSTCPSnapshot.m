@implementation NWSTCPSnapshot

- (unsigned)rxDuplicateBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  return -[NWSSnapshot _rxDuplicateBytes](&v3, sel__rxDuplicateBytes);
}

- (unsigned)rxOutOfOrderBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  return -[NWSSnapshot _rxOutOfOrderBytes](&v3, sel__rxOutOfOrderBytes);
}

- (unsigned)txRetransmittedBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  return -[NWSSnapshot _txRetransmittedBytes](&v3, sel__txRetransmittedBytes);
}

- (unsigned)connectAttempts
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  return -[NWSSnapshot _connectAttempts](&v3, sel__connectAttempts);
}

- (unsigned)connectSuccesses
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  return -[NWSSnapshot _connectSuccesses](&v3, sel__connectSuccesses);
}

- (double)rttMinimum
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  -[NWSSnapshot _rttMinimum](&v3, sel__rttMinimum);
  return result;
}

- (double)rttAverage
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  -[NWSSnapshot _rttAverage](&v3, sel__rttAverage);
  return result;
}

- (double)rttVariation
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWSTCPSnapshot;
  -[NWSSnapshot _rttVariation](&v3, sel__rttVariation);
  return result;
}

- (id)provider
{
  return CFSTR("TCP");
}

- (unsigned)interfaceIndex
{
  return self->_descriptor.ifindex;
}

- (unsigned)sendBufferSize
{
  return self->_descriptor.sndbufsize;
}

- (unsigned)sendBufferUsed
{
  return self->_descriptor.sndbufused;
}

- (unsigned)receiveBufferSize
{
  return self->_descriptor.rcvbufsize;
}

- (unsigned)receiveBufferUsed
{
  return self->_descriptor.rcvbufused;
}

- (unsigned)txUnacked
{
  return self->_descriptor.txunacked;
}

- (unsigned)txWindow
{
  return self->_descriptor.txwindow;
}

- (unsigned)txCongestionWindow
{
  return self->_descriptor.txcwindow;
}

- (unsigned)trafficClass
{
  return self->_descriptor.traffic_class;
}

- (unsigned)trafficManagementFlags
{
  return self->_descriptor.traffic_mgt_flags;
}

- (unint64_t)uniqueProcessID
{
  return self->_descriptor.upid;
}

- (int)processID
{
  return self->_descriptor.pid;
}

- (unint64_t)eupid
{
  return self->_descriptor.eupid;
}

- (int)epid
{
  return self->_descriptor.epid;
}

- (unsigned)connstatusProbeActivated
{
  return self->_descriptor.var0.__pad_connstatus[0] & 1;
}

- (unsigned)connstatusConnProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 3) & 1;
}

- (unsigned)connstatusReadProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 2) & 1;
}

- (unsigned)connstatusWriteProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 1) & 1;
}

- (id)flowStartTimestamp
{
  return -[NWSProtocolSnapshot _dateWithContinuousTime:](self, "_dateWithContinuousTime:", self->_descriptor.start_timestamp);
}

- (unint64_t)flowStartContinuousTime
{
  return self->_descriptor.start_timestamp;
}

- (double)flowDuration
{
  double result;

  -[NWSProtocolSnapshot _intervalWithContinuousTime:](self, "_intervalWithContinuousTime:", self->_descriptor.timestamp - self->_descriptor.start_timestamp);
  return result;
}

- (BOOL)interfaceUnknown
{
  return self->_descriptor.ifnet_properties & 1 | ((self->_descriptor.ifnet_properties & 0x21E) == 0);
}

- (BOOL)interfaceLoopback
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 1) & 1;
}

- (BOOL)interfaceCellular
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 2) & 1;
}

- (BOOL)interfaceCellularViaFallback
{
  if ((~self->_descriptor.ifnet_properties & 0x104) != 0)
    return 0;
  if ((self->_descriptor.fallback_mode & 0xFE) == 2)
    return 1;
  return self->_provider == 2;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  return (~self->_descriptor.ifnet_properties & 0x104) == 0 && self->_descriptor.fallback_mode == 4;
}

- (BOOL)interfaceWifi
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 3) & 1;
}

- (BOOL)interfaceWired
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 4) & 1;
}

- (BOOL)interfaceAWDL
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 5) & 1;
}

- (BOOL)interfaceExpensive
{
  return (LOBYTE(self->_descriptor.ifnet_properties) >> 6) & 1;
}

- (BOOL)interfaceCompanionLink
{
  return (BYTE1(self->_descriptor.ifnet_properties) >> 1) & 1;
}

- (BOOL)flowIsLocal
{
  return (BYTE1(self->_descriptor.ifnet_properties) >> 3) & 1;
}

- (BOOL)flowIsNonLocal
{
  return (BYTE1(self->_descriptor.ifnet_properties) >> 4) & 1;
}

- (NSString)TCPState
{
  uint64_t state;
  id v3;
  uint64_t i;
  _OWORD v6[5];
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  state = self->_descriptor.state;
  v6[2] = xmmword_24CBD2E80;
  v6[3] = *(_OWORD *)&off_24CBD2E90;
  v6[4] = xmmword_24CBD2EA0;
  v7 = CFSTR("TimeWait");
  v6[0] = xmmword_24CBD2E60;
  v6[1] = *(_OWORD *)&off_24CBD2E70;
  if (state > 0xA)
    v3 = 0;
  else
    v3 = *((id *)v6 + state);
  for (i = 80; i != -8; i -= 8)

  return (NSString *)v3;
}

- (id)processName
{
  NSString *processName;
  NSString *v4;
  NSString *v5;

  processName = self->_processName;
  if (!processName)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.64s"), self->_descriptor.pname);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_processName;
    self->_processName = v4;

    processName = self->_processName;
  }
  return processName;
}

- (id)uuid
{
  NSString *uuid;
  void *v4;
  NSString *v5;
  NSString *v6;

  uuid = self->_uuid;
  if (!uuid)
  {
    -[NWSProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor.uuid);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uuid;
    self->_uuid = v5;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)euuid
{
  NSString *euuid;
  void *v4;
  NSString *v5;
  NSString *v6;

  euuid = self->_euuid;
  if (!euuid)
  {
    -[NWSProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor.euuid);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_euuid;
    self->_euuid = v5;

    euuid = self->_euuid;
  }
  return euuid;
}

- (id)fuuid
{
  NSString *fuuid;
  void *v4;
  NSString *v5;
  NSString *v6;

  fuuid = self->_fuuid;
  if (!fuuid)
  {
    -[NWSProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor.fuuid);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_fuuid;
    self->_fuuid = v5;

    fuuid = self->_fuuid;
  }
  return fuuid;
}

- (id)vuuid
{
  NSString *vuuid;
  void *v4;
  NSString *v5;
  NSString *v6;

  vuuid = self->_vuuid;
  if (!vuuid)
  {
    -[NWSProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor.vuuid);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_vuuid;
    self->_vuuid = v5;

    vuuid = self->_vuuid;
  }
  return vuuid;
}

- (id)localAddress
{
  NSData *v3;
  NSData *localAddress;

  if (!self->_localAddress)
  {
    if (self->_descriptor.local.v4.sin_len)
      v3 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &self->_descriptor.local, self->_descriptor.local.v4.sin_len);
    else
      v3 = 0;
    localAddress = self->_localAddress;
    self->_localAddress = v3;

  }
  return self->_localAddress;
}

- (id)remoteAddress
{
  NSData *v3;
  NSData *remoteAddress;

  if (!self->_remoteAddress)
  {
    if (self->_descriptor.remote.v4.sin_len)
      v3 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &self->_descriptor.remote, self->_descriptor.remote.v4.sin_len);
    else
      v3 = 0;
    remoteAddress = self->_remoteAddress;
    self->_remoteAddress = v3;

  }
  return self->_remoteAddress;
}

- (NSString)congestionAlgorithm
{
  NSString *congestionAlgorithm;
  NSString *v4;
  NSString *v5;

  congestionAlgorithm = self->_congestionAlgorithm;
  if (!congestionAlgorithm)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.16s"), self->_descriptor.cc_algo);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_congestionAlgorithm;
    self->_congestionAlgorithm = v4;

    congestionAlgorithm = self->_congestionAlgorithm;
  }
  return congestionAlgorithm;
}

- (BOOL)probeActivated
{
  return self->_descriptor.var0.__pad_connstatus[0] & 1;
}

- (BOOL)connProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 3) & 1;
}

- (BOOL)readProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 2) & 1;
}

- (BOOL)writeProbeFailed
{
  return (self->_descriptor.var0.__pad_connstatus[0] >> 1) & 1;
}

- (BOOL)countsIncludeHeaderOverhead
{
  return self->_provider == 3;
}

- (unint64_t)networkActivityMapStartTime
{
  return self->_descriptor.activity_bitmap.start;
}

- (unint64_t)networkActivityMapPart1
{
  return self->_descriptor.activity_bitmap.bitmap[0];
}

- (unint64_t)networkActivityMapPart2
{
  return self->_descriptor.activity_bitmap.bitmap[1];
}

- (unint64_t)eventFlags
{
  return self->_eventFlags;
}

- (id)traditionalDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  nstat_tcp_descriptor *p_descriptor;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned int ifnet_properties;
  __CFString **v55;
  __CFString **v56;
  unsigned int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  unsigned int v67;
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)NWSTCPSnapshot;
  -[NWSSnapshot _createCountsForProvider:](&v68, sel__createCountsForProvider_, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_38;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", kNStatProviderTCP, kNStatSrcKeyProvider);
  -[NWSTCPSnapshot localAddress](self, "localAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCE50];
    -[NWSTCPSnapshot localAddress](self, "localAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, kNStatSrcKeyLocal);

  }
  -[NWSTCPSnapshot remoteAddress](self, "remoteAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDBCE50];
    -[NWSTCPSnapshot remoteAddress](self, "remoteAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataWithData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, kNStatSrcKeyRemote);

  }
  p_descriptor = &self->_descriptor;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.ifindex);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, kNStatSrcKeyInterface);

  -[NWSTCPSnapshot TCPState](self, "TCPState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NWSTCPSnapshot TCPState](self, "TCPState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, kNStatSrcKeyTCPState);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.sndbufsize);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, kNStatSrcKeySndBufSize);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.sndbufused);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, kNStatSrcKeySndBufUsed);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.rcvbufsize);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, kNStatSrcKeyRcvBufSize);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.rcvbufused);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, kNStatSrcKeyRcvBufUsed);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.txunacked);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, kNStatSrcKeyTCPTxUnacked);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.txwindow);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, kNStatSrcKeyTCPTxWindow);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.txcwindow);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, kNStatSrcKeyTCPTxCongWindow);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.traffic_class);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, kNStatSrcKeyTrafficClass);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.traffic_mgt_flags);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, kNStatSrcKeyTrafficMgtFlags);

  -[NWSTCPSnapshot congestionAlgorithm](self, "congestionAlgorithm");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = (void *)MEMORY[0x24BDD17C8];
    -[NWSTCPSnapshot congestionAlgorithm](self, "congestionAlgorithm");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithString:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, kNStatSrcKeyTCPCCAlgorithm);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", p_descriptor->upid);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, kNStatSrcKeyUPID);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.pid);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, kNStatSrcKeyPID);

  -[NWSTCPSnapshot processName](self, "processName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = (void *)MEMORY[0x24BDD17C8];
    -[NWSTCPSnapshot processName](self, "processName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithString:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, kNStatSrcKeyProcessName);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_descriptor.eupid);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, kNStatSrcKeyEUPID);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.epid);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, kNStatSrcKeyEPID);

  -[NWSTCPSnapshot uuid](self, "uuid");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = (void *)MEMORY[0x24BDD17C8];
    -[NWSTCPSnapshot uuid](self, "uuid");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithString:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, kNStatSrcKeyUUID);

  }
  -[NWSTCPSnapshot euuid](self, "euuid");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v43 = (void *)MEMORY[0x24BDD17C8];
    -[NWSTCPSnapshot euuid](self, "euuid");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithString:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, kNStatSrcKeyEUUID);

  }
  -[NWSTCPSnapshot fuuid](self, "fuuid");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v47 = (void *)MEMORY[0x24BDD17C8];
    -[NWSTCPSnapshot fuuid](self, "fuuid");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithString:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, kNStatSrcKeyFUUID);

  }
  -[NWSTCPSnapshot vuuid](self, "vuuid");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    v51 = (void *)MEMORY[0x24BDD17C8];
    -[NWSTCPSnapshot vuuid](self, "vuuid");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stringWithString:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v53, kNStatSrcKeyVUUID);

  }
  ifnet_properties = self->_descriptor.ifnet_properties;
  if ((ifnet_properties & 8) != 0)
  {
    v56 = &kNStatSrcKeyInterfaceTypeWiFi;
LABEL_28:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *v56);
    goto LABEL_29;
  }
  if ((ifnet_properties & 4) == 0)
  {
    v55 = &kNStatSrcKeyInterfaceTypeLoopback;
    if ((ifnet_properties & 2) == 0)
      v55 = &kNStatSrcKeyInterfaceTypeUnknown;
    if ((ifnet_properties & 0x10) != 0)
      v56 = &kNStatSrcKeyInterfaceTypeWired;
    else
      v56 = v55;
    goto LABEL_28;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kNStatSrcKeyInterfaceTypeCellular);
  if ((self->_descriptor.ifnet_properties & 0x100) != 0)
  {
    v67 = self->_descriptor.fallback_mode - 2;
    if (v67 < 3)
    {
      v56 = off_24CBD2EB8[(char)v67];
      goto LABEL_28;
    }
    if (self->_provider == 2)
    {
      v56 = &kNStatSrcKeyInterfaceIsCellFallback;
      goto LABEL_28;
    }
  }
LABEL_29:
  v57 = self->_descriptor.ifnet_properties;
  if ((v57 & 0x200) == 0)
  {
    if ((v57 & 0x40) == 0)
      goto LABEL_31;
LABEL_40:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kNStatSrcKeyInterfaceIsExpensive);
    if ((self->_descriptor.ifnet_properties & 0x20) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kNStatSrcKeyInterfaceTypeCompanionLink);
  v57 = self->_descriptor.ifnet_properties;
  if ((v57 & 0x40) != 0)
    goto LABEL_40;
LABEL_31:
  if ((v57 & 0x20) != 0)
LABEL_32:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kNStatSrcKeyInterfaceIsAWDL);
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.var0.__pad_connstatus[0] & 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, kNStatSrcKeyProbeActivated);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_descriptor.var0.__pad_connstatus[0] >> 3) & 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v59, kNStatSrcKeyConnProbeFailed);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_descriptor.var0.__pad_connstatus[0] >> 2) & 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v60, kNStatSrcKeyReadProbeFailed);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (self->_descriptor.var0.__pad_connstatus[0] >> 1) & 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v61, kNStatSrcKeyWriteProbeFailed);

  if (-[NWSTCPSnapshot countsIncludeHeaderOverhead](self, "countsIncludeHeaderOverhead"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kNStatSrcKeyChannelArchitecture);
  if (self->_eventFlags)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v62, kNStatSrcKeyEventFlags);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", p_descriptor->start_timestamp);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v63, kNStatSrcKeyStartAbsoluteTime);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", p_descriptor->timestamp - p_descriptor->start_timestamp);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v64, kNStatSrcKeyDurationAbsoluteTime);

  v65 = v4;
LABEL_38:

  return v4;
}

- (id)description
{
  void *v3;
  _printf_domain *v4;
  void *v5;
  objc_super v7;
  char *__ret;

  __ret = 0;
  v7.receiver = self;
  v7.super_class = (Class)NWSTCPSnapshot;
  -[NWSSnapshot description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v4, 0, "NWTCPSnapshot %N<->%N@%I %@", &self->_descriptor.local, &self->_descriptor.remote, self->_descriptor.ifindex, v3);
  if (__ret)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", __ret, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    free(__ret);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NWSTCPSnapshot)initWithCounts:(const nstat_counts *)a3 TCPDescriptor:(nstat_tcp_descriptor *)a4 sourceIdent:(unint64_t)a5 events:(unint64_t)a6 seqno:(unint64_t)a7 provider:(unsigned int)a8
{
  NWSTCPSnapshot *v11;
  NWSTCPSnapshot *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NWSTCPSnapshot;
  v11 = -[NWSSnapshot _initWithCounts:sourceIdent:seqno:](&v14, sel__initWithCounts_sourceIdent_seqno_, a3, a5, a7);
  v12 = v11;
  if (v11)
  {
    memcpy(&v11->_descriptor, a4, sizeof(v11->_descriptor));
    v12->_provider = a8;
    v12->_eventFlags = a6;
  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
  objc_storeStrong((id *)&self->_vuuid, 0);
  objc_storeStrong((id *)&self->_fuuid, 0);
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_congestionAlgorithm, 0);
}

@end
