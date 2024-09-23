@implementation VCNWConnectionCongestionDetector

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCNWConnectionCongestionDetector;
  -[VCNWConnectionCongestionDetector dealloc](&v3, sel_dealloc);
}

- (BOOL)processNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *logNWDump;
  uint64_t timestamp;
  unint64_t v12;
  void *v14;
  BOOL v15;
  unsigned int maxAveragePacketDelayMs;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCNWConnectionCongestionDetector processNWConnectionNotification:].cold.1();
    }
    return 0;
  }
  if (a3->version >= 3u)
  {
    logNWDump = self->_logNWDump;
    if (logNWDump)
      VRLogfilePrint((uint64_t)logNWDump, "NWConnection notification has a bad version: %d\n", (uint64_t)a3, v3, v4, v5, v6, v7, a3->version);
    return 0;
  }
  timestamp = a3->var1.advisory.timestamp;
  v12 = self->_previousStatistics.var0.nwConnection.timestamp;
  if (timestamp == v12 || (timestamp - v12) >> 32 != 0)
  {
    v14 = self->_logNWDump;
    if (v14)
      VRLogfilePrint((uint64_t)v14, "NWConnection notifications have identical timestamps or out of order [current timestamp:%llu, previous timestamp:%llu]\n", (uint64_t)a3, v3, v4, v5, v6, v7, a3->var1.advisory.timestamp);
    return 0;
  }
  v36 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  memset(v27, 0, sizeof(v27));
  *(_QWORD *)&v25 = 11;
  v26 = 0u;
  *((_QWORD *)&v25 + 1) = micro();
  v15 = 1;
  BYTE2(v26) = 1;
  WORD4(v26) = *(_WORD *)&a3->var1.advisory.version;
  *(_QWORD *)&v27[0] = timestamp;
  *(_OWORD *)((char *)v27 + 8) = *((_OWORD *)&a3->var1.thermalUpdate + 1);
  *((_QWORD *)&v27[1] + 1) = *((_QWORD *)&a3->var1.thermalUpdate + 5);
  LODWORD(v28) = a3->var1.advisory.average_delay;
  maxAveragePacketDelayMs = v28;
  *((_QWORD *)&v28 + 1) = a3->var1.advisory.average_throughput;
  LODWORD(v29) = a3->var1.advisory.rate_trend_suggestion;
  v18 = *(_OWORD *)((char *)&a3->var1.thermalUpdate + 65);
  *(_QWORD *)&v32 = *(_QWORD *)((char *)&a3->var1.thermalUpdate + 81);
  v31 = v18;
  self->_averageThroughputBps = DWORD2(v28);
  self->_averagePacketDelayMs = maxAveragePacketDelayMs;
  if (self->_maxAveragePacketDelayMs > maxAveragePacketDelayMs)
    maxAveragePacketDelayMs = self->_maxAveragePacketDelayMs;
  self->_maxAveragePacketDelayMs = maxAveragePacketDelayMs;
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)&v25);
  v19 = v35;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 136) = v34;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 152) = v19;
  *((_QWORD *)&self->_previousStatistics.var0.localRCEvent + 21) = v36;
  v20 = v31;
  *(_OWORD *)(&self->_previousStatistics.var0.localRCEvent + 3) = v30;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 88) = v20;
  v21 = v33;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 104) = v32;
  *(_OWORD *)(&self->_previousStatistics.var0.localRCEvent + 5) = v21;
  v22 = v27[1];
  *(_OWORD *)&self->_previousStatistics.var0.rtcpRR.lastSequenceNumber = v27[0];
  *(_OWORD *)(&self->_previousStatistics.var0.localRCEvent + 1) = v22;
  v23 = v29;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 40) = v28;
  *(_OWORD *)((char *)&self->_previousStatistics.var0.localRCEvent + 56) = v23;
  v24 = v26;
  *(_OWORD *)&self->_previousStatistics.type = v25;
  *(_OWORD *)&self->_previousStatistics.isVCRCInternal = v24;
  return v15;
}

- (BOOL)processNWConnectionPacketEvent:(packet_id *)a3 eventType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t lastTimestampWithPacketDrop;
  unsigned int v12;
  void *logNWDump;
  void *v14;

  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      LODWORD(logNWDump) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!(_DWORD)logNWDump)
        return (char)logNWDump;
      -[VCNWConnectionCongestionDetector processNWConnectionPacketEvent:eventType:].cold.1();
    }
LABEL_12:
    LOBYTE(logNWDump) = 0;
    return (char)logNWDump;
  }
  v8 = a4;
  if (a3->var0 != 1)
  {
    logNWDump = self->_logNWDump;
    if (!logNWDump)
      return (char)logNWDump;
    VRLogfilePrint((uint64_t)logNWDump, "NWConnection packet event has a bad version: %d, type: %d\n", (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7, a3->var0);
    goto LABEL_12;
  }
  lastTimestampWithPacketDrop = self->_lastTimestampWithPacketDrop;
  ++self->_packetDropCount;
  if ((_DWORD)lastTimestampWithPacketDrop == a3->var3)
  {
    v12 = self->_packetDropCountPerFrame + 1;
    self->_packetDropCountPerFrame = v12;
    if (!self->_didSendCongestionEvent && v12 >= 0xB)
    {
      self->_didSendCongestionEvent = 1;
      -[VCNWConnectionCongestionDetector sendCongestionEventWithTimestamp:](self, "sendCongestionEventWithTimestamp:");
    }
  }
  else
  {
    self->_packetDropCountPerFrame = 1;
    self->_lastTimestampWithPacketDrop = a3->var3;
    self->_didSendCongestionEvent = 0;
  }
  v14 = self->_logNWDump;
  if (v14)
    VRLogfilePrint((uint64_t)v14, "NWConnection packet NACK event [type:%d, timestamp:%u, identifier:%u, seq:%u, dropCountPerFrame:%d, dropCount:%d, congestionEvent:%d]\n", lastTimestampWithPacketDrop, *(uint64_t *)&a4, v4, v5, v6, v7, v8);
  LOBYTE(logNWDump) = 1;
  return (char)logNWDump;
}

- (void)sendCongestionEventWithTimestamp:(unsigned int)a3
{
  unsigned int packetDropCountPerFrame;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6[0] = 11;
  v7 = 0u;
  v6[1] = micro();
  BYTE2(v7) = 1;
  *(_QWORD *)&v8 = a3;
  packetDropCountPerFrame = self->_packetDropCountPerFrame;
  LODWORD(v11) = 0x80000000;
  DWORD1(v11) = packetDropCountPerFrame;
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v6);
}

- (void)enableNWLogDump:(void *)a3
{
  self->_logNWDump = a3;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (unsigned)averagePacketDelayMs
{
  return self->_averagePacketDelayMs;
}

- (unsigned)maxAveragePacketDelayMs
{
  return self->_maxAveragePacketDelayMs;
}

- (void)setMaxAveragePacketDelayMs:(unsigned int)a3
{
  self->_maxAveragePacketDelayMs = a3;
}

- (unsigned)averageThroughputBps
{
  return self->_averageThroughputBps;
}

- (unsigned)packetDropCount
{
  return self->_packetDropCount;
}

- (void)processNWConnectionNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d NWConnection notification is nil", v2, v3, v4, v5, 2u);
}

- (void)processNWConnectionPacketEvent:eventType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d NWConnection packet event is nil", v2, v3, v4, v5, 2u);
}

@end
