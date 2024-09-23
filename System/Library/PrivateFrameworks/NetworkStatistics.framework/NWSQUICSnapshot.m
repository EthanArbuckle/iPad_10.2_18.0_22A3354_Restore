@implementation NWSQUICSnapshot

- (id)provider
{
  return CFSTR("QUIC");
}

- (unsigned)interfaceIndex
{
  return self->_descriptor.ifindex;
}

- (unsigned)receiveBufferSize
{
  return self->_descriptor.rcvbufsize;
}

- (unsigned)receiveBufferUsed
{
  return self->_descriptor.rcvbufused;
}

- (unsigned)trafficClass
{
  return self->_descriptor.traffic_class;
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
  return (~self->_descriptor.ifnet_properties & 0x104) == 0 && (self->_descriptor.fallback_mode & 0xFE) == 2;
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

- (BOOL)countsIncludeHeaderOverhead
{
  return self->_provider == 8;
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
  unsigned int ifnet_properties;
  __CFString **v43;
  __CFString **v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  unsigned int v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)NWSQUICSnapshot;
  -[NWSSnapshot _createCountsForProvider:](&v52, sel__createCountsForProvider_, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_34;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", kNStatProviderUDP, kNStatSrcKeyProvider);
  -[NWSQUICSnapshot localAddress](self, "localAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCE50];
    -[NWSQUICSnapshot localAddress](self, "localAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, kNStatSrcKeyLocal);

  }
  -[NWSQUICSnapshot remoteAddress](self, "remoteAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDBCE50];
    -[NWSQUICSnapshot remoteAddress](self, "remoteAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataWithData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, kNStatSrcKeyRemote);

  }
  p_descriptor = &self->_descriptor;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.ifindex);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, kNStatSrcKeyInterface);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.pid);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, kNStatSrcKeyPID);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_descriptor.upid);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, kNStatSrcKeyUPID);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.epid);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, kNStatSrcKeyEPID);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_descriptor.eupid);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, kNStatSrcKeyEUPID);

  -[NWSQUICSnapshot uuid](self, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    -[NWSQUICSnapshot uuid](self, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, kNStatSrcKeyUUID);

  }
  -[NWSQUICSnapshot euuid](self, "euuid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    -[NWSQUICSnapshot euuid](self, "euuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithString:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, kNStatSrcKeyEUUID);

  }
  -[NWSQUICSnapshot fuuid](self, "fuuid");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = (void *)MEMORY[0x24BDD17C8];
    -[NWSQUICSnapshot fuuid](self, "fuuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithString:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, kNStatSrcKeyFUUID);

  }
  -[NWSQUICSnapshot vuuid](self, "vuuid");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = (void *)MEMORY[0x24BDD17C8];
    -[NWSQUICSnapshot vuuid](self, "vuuid");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithString:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, kNStatSrcKeyVUUID);

  }
  -[NWSQUICSnapshot processName](self, "processName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = (void *)MEMORY[0x24BDD17C8];
    -[NWSQUICSnapshot processName](self, "processName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithString:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, kNStatSrcKeyProcessName);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.rcvbufsize);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, kNStatSrcKeyRcvBufSize);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.rcvbufused);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, kNStatSrcKeyRcvBufUsed);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_descriptor.traffic_class);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, kNStatSrcKeyTrafficClass);

  ifnet_properties = self->_descriptor.ifnet_properties;
  if ((ifnet_properties & 8) != 0)
  {
    v44 = &kNStatSrcKeyInterfaceTypeWiFi;
LABEL_24:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *v44);
    goto LABEL_25;
  }
  if ((ifnet_properties & 4) == 0)
  {
    v43 = &kNStatSrcKeyInterfaceTypeLoopback;
    if ((ifnet_properties & 2) == 0)
      v43 = &kNStatSrcKeyInterfaceTypeUnknown;
    if ((ifnet_properties & 0x10) != 0)
      v44 = &kNStatSrcKeyInterfaceTypeWired;
    else
      v44 = v43;
    goto LABEL_24;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kNStatSrcKeyInterfaceTypeCellular);
  if ((self->_descriptor.ifnet_properties & 0x100) != 0)
  {
    v51 = self->_descriptor.fallback_mode - 2;
    if (v51 < 3)
    {
      v44 = off_24CBD2EE8[(char)v51];
      goto LABEL_24;
    }
  }
LABEL_25:
  v45 = self->_descriptor.ifnet_properties;
  if ((v45 & 0x200) == 0)
  {
    if ((v45 & 0x40) == 0)
      goto LABEL_27;
LABEL_36:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kNStatSrcKeyInterfaceIsExpensive);
    if ((self->_descriptor.ifnet_properties & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kNStatSrcKeyInterfaceTypeCompanionLink);
  v45 = self->_descriptor.ifnet_properties;
  if ((v45 & 0x40) != 0)
    goto LABEL_36;
LABEL_27:
  if ((v45 & 0x20) != 0)
LABEL_28:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kNStatSrcKeyInterfaceIsAWDL);
LABEL_29:
  if (-[NWSQUICSnapshot countsIncludeHeaderOverhead](self, "countsIncludeHeaderOverhead"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], kNStatSrcKeyChannelArchitecture);
  if (self->_eventFlags)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v46, kNStatSrcKeyEventFlags);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", p_descriptor->start_timestamp);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, kNStatSrcKeyStartAbsoluteTime);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", p_descriptor->timestamp - p_descriptor->start_timestamp);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, kNStatSrcKeyDurationAbsoluteTime);

  v49 = v4;
LABEL_34:

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
  v7.super_class = (Class)NWSQUICSnapshot;
  -[NWSSnapshot description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v4, 0, "NWQUICSnapshot %N<->%N@%I %@", &self->_descriptor.local, &self->_descriptor.remote, self->_descriptor.ifindex, v3);
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

- (NWSQUICSnapshot)initWithCounts:(const nstat_counts *)a3 QUICDescriptor:(nstat_tcp_descriptor *)a4 sourceIdent:(unint64_t)a5 events:(unint64_t)a6 seqno:(unint64_t)a7 provider:(unsigned int)a8
{
  NWSQUICSnapshot *v11;
  NWSQUICSnapshot *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NWSQUICSnapshot;
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

- (double)rttMinimum
{
  return self->_rttMinimum;
}

- (double)rttAverage
{
  return self->_rttAverage;
}

- (double)rttVariation
{
  return self->_rttVariation;
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
}

@end
