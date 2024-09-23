@implementation NWStatsUDPSnapshot

- (unint64_t)networkActivityMapStartTime
{
  return self->_descriptor->activity_bitmap.start;
}

- (unsigned)interfaceIndex
{
  return self->_descriptor->ifindex;
}

- (id)euuid
{
  NSUUID *euuid;
  NSUUID *v4;
  NSUUID *v5;

  euuid = self->_euuid;
  if (!euuid)
  {
    -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->euuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_euuid;
    self->_euuid = v4;

    euuid = self->_euuid;
  }
  return euuid;
}

- (BOOL)interfaceCellular
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 2) & 1;
}

- (BOOL)hasLocalDestination
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 3) & 1;
}

- (BOOL)interfaceWiFi
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 3) & 1;
}

- (unint64_t)networkActivityMapPart2
{
  return self->_descriptor->activity_bitmap.bitmap[1];
}

- (unint64_t)networkActivityMapPart1
{
  return self->_descriptor->activity_bitmap.bitmap[0];
}

- (BOOL)interfaceExpensive
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 6) & 1;
}

- (BOOL)isSubFlow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsUDPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v3, sel__update_ptr) + 36) == 10;
}

- (id)remoteAddress
{
  NSData *v3;
  NSData *remoteAddress;

  if (!self->_remoteAddress)
  {
    if (self->_descriptor->remote.v4.sin_len)
      v3 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &self->_descriptor->remote, self->_descriptor->remote.v4.sin_len);
    else
      v3 = 0;
    remoteAddress = self->_remoteAddress;
    self->_remoteAddress = v3;

  }
  return self->_remoteAddress;
}

- (BOOL)failedSkywalkAction
{
  return (self->_descriptor->ifnet_properties & 0x6000) != 0;
}

- (BOOL)interfaceUnknown
{
  return self->_descriptor->ifnet_properties & 1 | ((self->_descriptor->ifnet_properties & 0x21E) == 0);
}

- (BOOL)interfaceLoopback
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 1) & 1;
}

- (int)processID
{
  return self->_descriptor->pid;
}

- (BOOL)interfaceAWDL
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 5) & 1;
}

- (double)flowDuration
{
  double result;

  +[NWStatsProtocolSnapshot _intervalWithContinuousTime:](NWStatsProtocolSnapshot, "_intervalWithContinuousTime:", self->_descriptor->timestamp - self->_descriptor->start_timestamp);
  return result;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  nstat_udp_descriptor *descriptor;

  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && descriptor->fallback_mode == 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
  objc_storeStrong((id *)&self->_flowuuid, 0);
  objc_storeStrong((id *)&self->_vuuid, 0);
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_snapshotTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

- (id)flowStartTimestamp
{
  NSDate *startTimestamp;
  void *v4;
  NSDate *v5;
  NSDate *v6;

  startTimestamp = self->_startTimestamp;
  if (!startTimestamp)
  {
    v4 = (void *)MEMORY[0x24BDBCE60];
    -[NWStatsUDPSnapshot flowStartTimeIntervalSinceReferenceDate](self, "flowStartTimeIntervalSinceReferenceDate");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_startTimestamp;
    self->_startTimestamp = v5;

    startTimestamp = self->_startTimestamp;
  }
  return startTimestamp;
}

- (double)flowStartTimeIntervalSinceReferenceDate
{
  double result;

  result = self->_startTimeInterval;
  if (result == 0.0)
  {
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:](NWStatsProtocolSnapshot, "_referenceIntervalWithContinuousTime:", self->_descriptor->start_timestamp);
    self->_startTimeInterval = result;
  }
  return result;
}

- (BOOL)interfaceCellularViaFallback
{
  nstat_udp_descriptor *descriptor;
  objc_super v4;

  descriptor = self->_descriptor;
  if ((~descriptor->ifnet_properties & 0x104) != 0)
    return 0;
  if ((descriptor->fallback_mode & 0xFE) == 2)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)NWStatsUDPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v4, sel__update_ptr) + 36) == 4;
}

- (id)descriptorDescription
{
  const nstat_msg_src_update_convenient *v3;
  id v4;
  uint64_t traffic_mgt_flags;
  uint64_t ifnet_properties;
  uint64_t s_addr;
  uint64_t epid;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[NWStatsProtocolSnapshot _update_ptr](self, "_update_ptr");
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  traffic_mgt_flags = v3->var0.tcp.traffic_mgt_flags;
  ifnet_properties = v3->var0.udp.ifnet_properties;
  s_addr = v3->var0.tcp.local.v4.sin_addr.s_addr;
  epid = v3->var0.udp.epid;
  -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", &v3->var0.conn + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", (char *)&v3->var0.conn + 216);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("desc  ifidx %d flags 0x%x pid %d epid %d uuid %@ euuid %@ pname %s"), traffic_mgt_flags, ifnet_properties, s_addr, epid, v9, v10, &v3->var0.conn.euuid[8]);

  return v11;
}

- (id)provider
{
  return CFSTR("UDP");
}

- (BOOL)flowUsesChannels
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsUDPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v3, sel__update_ptr) + 36) == 5;
}

- (unsigned)receiveBufferSize
{
  return self->_descriptor->rcvbufsize;
}

- (unsigned)receiveBufferUsed
{
  return self->_descriptor->rcvbufused;
}

- (unsigned)trafficClass
{
  return self->_descriptor->traffic_class;
}

- (unint64_t)uniqueProcessID
{
  return self->_descriptor->upid;
}

- (unsigned)personaID
{
  return self->_descriptor->persona_id;
}

- (unsigned)uid
{
  return self->_descriptor->uid;
}

- (unint64_t)eupid
{
  return self->_descriptor->eupid;
}

- (int)epid
{
  return self->_descriptor->epid;
}

- (id)processName
{
  NSString *processName;
  NSString *v4;
  NSString *v5;

  processName = self->_processName;
  if (!processName)
  {
    v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%.64s"), self->_descriptor->pname);
    v5 = self->_processName;
    self->_processName = v4;

    processName = self->_processName;
  }
  return processName;
}

- (id)uuid
{
  NSUUID *uuid;
  NSUUID *v4;
  NSUUID *v5;

  uuid = self->_uuid;
  if (!uuid)
  {
    -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->uuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)vuuid
{
  NSUUID *vuuid;
  NSUUID *v4;
  NSUUID *v5;

  vuuid = self->_vuuid;
  if (!vuuid)
  {
    -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->vuuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_vuuid;
    self->_vuuid = v4;

    vuuid = self->_vuuid;
  }
  return vuuid;
}

- (id)flowuuid
{
  NSUUID *flowuuid;
  NSUUID *v4;
  NSUUID *v5;

  flowuuid = self->_flowuuid;
  if (!flowuuid)
  {
    -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->fuuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_flowuuid;
    self->_flowuuid = v4;

    flowuuid = self->_flowuuid;
  }
  return flowuuid;
}

- (id)localAddress
{
  NSData *v3;
  NSData *localAddress;

  if (!self->_localAddress)
  {
    if (self->_descriptor->local.v4.sin_len)
      v3 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &self->_descriptor->local, self->_descriptor->local.v4.sin_len);
    else
      v3 = 0;
    localAddress = self->_localAddress;
    self->_localAddress = v3;

  }
  return self->_localAddress;
}

- (unsigned)localPort
{
  nstat_udp_descriptor *descriptor;
  int sin_family;
  int v5;

  descriptor = self->_descriptor;
  sin_family = descriptor->local.v4.sin_family;
  if (sin_family == 30 || sin_family == 2)
    return bswap32(descriptor->local.v4.sin_port) >> 16;
  else
    LOWORD(v5) = 0;
  return v5;
}

- (id)localAddressString
{
  return sockaddrForLogging((const sockaddr *)&self->_descriptor->local);
}

- (unsigned)remotePort
{
  nstat_udp_descriptor *descriptor;
  int sin_family;
  int v5;

  descriptor = self->_descriptor;
  sin_family = descriptor->remote.v4.sin_family;
  if (sin_family == 30 || sin_family == 2)
    return bswap32(descriptor->remote.v4.sin_port) >> 16;
  else
    LOWORD(v5) = 0;
  return v5;
}

- (id)remoteAddressString
{
  return sockaddrForLogging((const sockaddr *)&self->_descriptor->remote);
}

- (unsigned)ifnet_properties
{
  return self->_descriptor->ifnet_properties;
}

- (BOOL)interfaceWired
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 4) & 1;
}

- (BOOL)interfaceCompanionLinkBluetooth
{
  return (BYTE2(self->_descriptor->ifnet_properties) >> 2) & 1;
}

- (BOOL)isKnownVPNFromKernel
{
  return LOBYTE(self->_descriptor->ifnet_properties) >> 7;
}

- (BOOL)interfaceLLW
{
  return BYTE1(self->_descriptor->ifnet_properties) >> 7;
}

- (BOOL)interfaceConstrained
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 2) & 1;
}

- (BOOL)interfaceCompanionLink
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 1) & 1;
}

- (BOOL)interfaceCellularViaAnyFallback
{
  return (~self->_descriptor->ifnet_properties & 0x104) == 0;
}

- (BOOL)interfaceCellularViaFastFallback
{
  nstat_udp_descriptor *descriptor;

  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && descriptor->fallback_mode == 3;
}

- (BOOL)interfaceCellularViaSlowFallback
{
  nstat_udp_descriptor *descriptor;

  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && descriptor->fallback_mode == 2;
}

- (BOOL)interfaceCellularViaIndependentFallback
{
  objc_super v3;

  if ((~self->_descriptor->ifnet_properties & 0x104) != 0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)NWStatsUDPSnapshot;
  return *((_DWORD *)-[NWStatsProtocolSnapshot _update_ptr](&v3, sel__update_ptr) + 36) == 4;
}

- (BOOL)failedRouteValuesLookup
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 5) & 1;
}

- (BOOL)failedFlowswitchValuesLookup
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 6) & 1;
}

- (BOOL)hasNonLocalDestination
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 4) & 1;
}

- (BOOL)isKnownListener
{
  return (HIBYTE(self->_descriptor->ifnet_properties) >> 1) & 1;
}

- (BOOL)isKnownInbound
{
  return (HIBYTE(self->_descriptor->ifnet_properties) >> 2) & 1;
}

- (BOOL)isKnownOutbound
{
  return (HIBYTE(self->_descriptor->ifnet_properties) >> 3) & 1;
}

- (unint64_t)flowStartContinuousTime
{
  return self->_descriptor->start_timestamp;
}

- (id)flowSnapshotTimestamp
{
  NSDate *snapshotTimestamp;
  void *v4;
  NSDate *v5;
  NSDate *v6;

  snapshotTimestamp = self->_snapshotTimestamp;
  if (!snapshotTimestamp)
  {
    v4 = (void *)MEMORY[0x24BDBCE60];
    -[NWStatsUDPSnapshot flowSnapshotTimeIntervalSinceReferenceDate](self, "flowSnapshotTimeIntervalSinceReferenceDate");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_snapshotTimestamp;
    self->_snapshotTimestamp = v5;

    snapshotTimestamp = self->_snapshotTimestamp;
  }
  return snapshotTimestamp;
}

- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3
{
  self->_snapshotTimeInterval = a3;
}

- (double)flowSnapshotTimeIntervalSinceReferenceDate
{
  double result;

  result = self->_snapshotTimeInterval;
  if (result == 0.0)
  {
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:](NWStatsProtocolSnapshot, "_referenceIntervalWithContinuousTime:", self->_descriptor->timestamp);
    self->_snapshotTimeInterval = result;
  }
  return result;
}

- (double)flowStartTimeIntervalSince1970
{
  double v2;

  -[NWStatsUDPSnapshot flowStartTimeIntervalSinceReferenceDate](self, "flowStartTimeIntervalSinceReferenceDate");
  return v2 + 978307200.0;
}

- (double)flowSnapshotTimeIntervalSince1970
{
  double v2;

  -[NWStatsUDPSnapshot flowSnapshotTimeIntervalSinceReferenceDate](self, "flowSnapshotTimeIntervalSinceReferenceDate");
  return v2 + 978307200.0;
}

- (NWStatsUDPSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8
{
  NWStatsUDPSnapshot *v9;
  NWStatsUDPSnapshot *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NWStatsUDPSnapshot;
  v9 = -[NWStatsProtocolSnapshot initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:](&v12, sel_initWithUpdate_startTime_flowFlags_previously_bluetoothCounts_peerEgressCellularCounts_, a3, *(_QWORD *)&a5, a6, a7, a8);
  v10 = v9;
  if (v9)
  {
    v9->_descriptor = (nstat_udp_descriptor *)(-[NWStatsProtocolSnapshot _update_ptr](v9, "_update_ptr") + 152);
    v10->_startTimeInterval = a4;
  }
  return v10;
}

@end
