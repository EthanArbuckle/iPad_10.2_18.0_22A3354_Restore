@implementation NWStatsQUICSnapshot

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

- (unint64_t)networkActivityMapStartTime
{
  return self->_descriptor->activity_bitmap.start;
}

- (BOOL)interfaceCellular
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 2) & 1;
}

- (BOOL)interfaceWiFi
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 3) & 1;
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
    -[NWStatsQUICSnapshot flowStartTimeIntervalSinceReferenceDate](self, "flowStartTimeIntervalSinceReferenceDate");
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

- (BOOL)hasLocalDestination
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 3) & 1;
}

- (int)processID
{
  return self->_descriptor->pid;
}

- (double)flowDuration
{
  double result;

  +[NWStatsProtocolSnapshot _intervalWithContinuousTime:](NWStatsProtocolSnapshot, "_intervalWithContinuousTime:", self->_descriptor->timestamp - self->_descriptor->start_timestamp);
  return result;
}

- (BOOL)connProbeFailed
{
  return (self->_descriptor->var0.__pad_connstatus[0] >> 3) & 1;
}

- (unsigned)rxDuplicateBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsQUICSnapshot;
  return -[NWStatsProtocolSnapshot _rxDuplicateBytes](&v3, sel__rxDuplicateBytes);
}

- (unsigned)txRetransmittedBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsQUICSnapshot;
  return -[NWStatsProtocolSnapshot _txRetransmittedBytes](&v3, sel__txRetransmittedBytes);
}

- (unsigned)rxOutOfOrderBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsQUICSnapshot;
  return -[NWStatsProtocolSnapshot _rxOutOfOrderBytes](&v3, sel__rxOutOfOrderBytes);
}

- (unsigned)deltaTxRetransmittedBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsQUICSnapshot;
  return -[NWStatsProtocolSnapshot _deltaTxRetransmittedBytes](&v3, sel__deltaTxRetransmittedBytes);
}

- (unsigned)deltaRxOutOfOrderBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsQUICSnapshot;
  return -[NWStatsProtocolSnapshot _deltaRxOutOfOrderBytes](&v3, sel__deltaRxOutOfOrderBytes);
}

- (unsigned)deltaRxDuplicateBytes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsQUICSnapshot;
  return -[NWStatsProtocolSnapshot _deltaRxDuplicateBytes](&v3, sel__deltaRxDuplicateBytes);
}

- (unsigned)txUnacked
{
  return self->_descriptor->txunacked;
}

- (unint64_t)networkActivityMapPart2
{
  return self->_descriptor->activity_bitmap.bitmap[1];
}

- (unint64_t)networkActivityMapPart1
{
  return self->_descriptor->activity_bitmap.bitmap[0];
}

- (BOOL)writeProbeFailed
{
  return (self->_descriptor->var0.__pad_connstatus[0] >> 1) & 1;
}

- (BOOL)readProbeFailed
{
  return (self->_descriptor->var0.__pad_connstatus[0] >> 2) & 1;
}

- (BOOL)probeActivated
{
  return self->_descriptor->var0.__pad_connstatus[0] & 1;
}

- (BOOL)interfaceExpensive
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 6) & 1;
}

- (BOOL)interfaceAWDL
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 5) & 1;
}

- (BOOL)hasNonLocalDestination
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 4) & 1;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  nstat_tcp_descriptor *descriptor;

  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && descriptor->fallback_mode == 4;
}

- (BOOL)interfaceCellularViaFallback
{
  nstat_tcp_descriptor *descriptor;

  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && (descriptor->fallback_mode & 0xFE) == 2;
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

- (id)descriptorDescription
{
  const nstat_msg_src_update_convenient *v3;
  id v4;
  uint64_t ifindex;
  uint64_t ifnet_properties;
  uint64_t pid;
  uint64_t epid;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[NWStatsProtocolSnapshot _update_ptr](self, "_update_ptr");
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  ifindex = v3->var0.tcp.ifindex;
  ifnet_properties = v3->var0.tcp.ifnet_properties;
  pid = v3->var0.tcp.pid;
  epid = v3->var0.tcp.epid;
  -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", (char *)&v3->var0.conn + 260);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsProtocolSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", (char *)&v3->var0.conn + 276);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("desc  ifidx %d flags 0x%x pid %d epid %d uuid %@ euuid %@ pname %s"), ifindex, ifnet_properties, pid, epid, v9, v10, v3->var0.conn.reserved);

  return v11;
}

- (id)provider
{
  return CFSTR("QUIC");
}

- (BOOL)flowUsesChannels
{
  return 1;
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
  nstat_tcp_descriptor *descriptor;
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
  nstat_tcp_descriptor *descriptor;
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

- (BOOL)interfaceUnknown
{
  return (self->_descriptor->ifnet_properties & 0x4021E) == 0;
}

- (BOOL)interfaceLoopback
{
  return (LOBYTE(self->_descriptor->ifnet_properties) >> 1) & 1;
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

- (BOOL)failedRouteValuesLookup
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 5) & 1;
}

- (BOOL)failedFlowswitchValuesLookup
{
  return (BYTE1(self->_descriptor->ifnet_properties) >> 6) & 1;
}

- (BOOL)interfaceCellularViaAnyFallback
{
  return (~self->_descriptor->ifnet_properties & 0x104) == 0;
}

- (BOOL)interfaceCellularViaFastFallback
{
  nstat_tcp_descriptor *descriptor;

  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && descriptor->fallback_mode == 3;
}

- (BOOL)interfaceCellularViaSlowFallback
{
  nstat_tcp_descriptor *descriptor;

  descriptor = self->_descriptor;
  return (~descriptor->ifnet_properties & 0x104) == 0 && descriptor->fallback_mode == 2;
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
    -[NWStatsQUICSnapshot flowSnapshotTimeIntervalSinceReferenceDate](self, "flowSnapshotTimeIntervalSinceReferenceDate");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_snapshotTimestamp;
    self->_snapshotTimestamp = v5;

    snapshotTimestamp = self->_snapshotTimestamp;
  }
  return snapshotTimestamp;
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

- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3
{
  self->_snapshotTimeInterval = a3;
}

- (double)flowStartTimeIntervalSince1970
{
  double v2;

  -[NWStatsQUICSnapshot flowStartTimeIntervalSinceReferenceDate](self, "flowStartTimeIntervalSinceReferenceDate");
  return v2 + 978307200.0;
}

- (double)flowSnapshotTimeIntervalSince1970
{
  double v2;

  -[NWStatsQUICSnapshot flowSnapshotTimeIntervalSinceReferenceDate](self, "flowSnapshotTimeIntervalSinceReferenceDate");
  return v2 + 978307200.0;
}

- (double)rttMinimum
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsQUICSnapshot;
  -[NWStatsProtocolSnapshot _rttMinimum](&v3, sel__rttMinimum);
  return result;
}

- (double)rttAverage
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsQUICSnapshot;
  -[NWStatsProtocolSnapshot _rttAverage](&v3, sel__rttAverage);
  return result;
}

- (double)rttVariation
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NWStatsQUICSnapshot;
  -[NWStatsProtocolSnapshot _rttVariation](&v3, sel__rttVariation);
  return result;
}

- (unsigned)sendBufferSize
{
  return self->_descriptor->sndbufsize;
}

- (unsigned)sendBufferUsed
{
  return self->_descriptor->sndbufused;
}

- (unsigned)txWindow
{
  return self->_descriptor->txwindow;
}

- (unsigned)txCongestionWindow
{
  return self->_descriptor->txcwindow;
}

- (unsigned)trafficManagementFlags
{
  return self->_descriptor->traffic_mgt_flags;
}

- (NSString)QUICState
{
  uint64_t state;
  id v3;
  uint64_t i;
  _OWORD v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  state = self->_descriptor->state;
  v6[2] = xmmword_24CBD2DA8;
  v6[3] = *(_OWORD *)&off_24CBD2DB8;
  v6[4] = xmmword_24CBD2DC8;
  v6[5] = *(_OWORD *)&off_24CBD2DD8;
  v6[0] = xmmword_24CBD2D88;
  v6[1] = *(_OWORD *)&off_24CBD2D98;
  if (state > 0xB)
    v3 = 0;
  else
    v3 = *((id *)v6 + state);
  for (i = 88; i != -8; i -= 8)

  return (NSString *)v3;
}

- (unsigned)QUICStateNumber
{
  return self->_descriptor->state;
}

- (NWStatsQUICSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8
{
  NWStatsQUICSnapshot *v9;
  NWStatsQUICSnapshot *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NWStatsQUICSnapshot;
  v9 = -[NWStatsUDPSnapshot initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:](&v12, sel_initWithUpdate_startTime_flowFlags_previously_bluetoothCounts_peerEgressCellularCounts_, a3, *(_QWORD *)&a5, a6, a7, a8);
  v10 = v9;
  if (v9)
  {
    v9->_descriptor = (nstat_tcp_descriptor *)(-[NWStatsProtocolSnapshot _update_ptr](v9, "_update_ptr") + 152);
    v10->_startTimeInterval = a4;
  }
  return v10;
}

@end
