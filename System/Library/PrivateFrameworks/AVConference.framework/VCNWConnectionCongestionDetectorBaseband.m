@implementation VCNWConnectionCongestionDetectorBaseband

- (BOOL)processNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *logNWDump;
  uint64_t v14;
  NSObject *v15;
  uint8_t frequency_band;
  unsigned __int16 reference_signal_level;
  __int16 v18;
  uint8_t quality_score_loss;
  __int16 v20;
  ifnet_interface_advisory_interface_type interface_type;
  uint64_t timestamp;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v30[26];

  v30[25] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3->version < 3u)
    {
      frequency_band = a3->var1.advisory.frequency_band;
      reference_signal_level = a3->var1.advisory.cell_context.reference_signal_level;
      v18 = *((_WORD *)&a3->var1.thermalUpdate + 29);
      quality_score_loss = a3->var1.advisory.quality_score_loss;
      v20 = *(_WORD *)&a3->var1.advisory.version;
      interface_type = a3->var1.advisory.header.interface_type;
      timestamp = a3->var1.advisory.timestamp;
      memset(&v30[22], 170, 24);
      memset(&v30[2], 170, 64);
      v30[0] = 12;
      v30[1] = micro();
      LODWORD(v30[2]) = 0x10000;
      LOWORD(v30[3]) = v20;
      BYTE2(v30[3]) = interface_type;
      *(_DWORD *)((char *)&v30[3] + 3) = 0;
      HIBYTE(v30[3]) = 0;
      v30[4] = timestamp;
      memset(&v30[5], 0, 48);
      LOBYTE(v30[11]) = frequency_band;
      BYTE1(v30[11]) = -86;
      *(_DWORD *)((char *)&v30[11] + 2) = reference_signal_level;
      BYTE6(v30[11]) = 0;
      *(_WORD *)((char *)&v30[11] + 7) = v18;
      BYTE1(v30[12]) = quality_score_loss;
      *(_QWORD *)((char *)&v30[12] + 2) = 0xAA0000000000AA00;
      v30[21] = 0;
      *(_OWORD *)((char *)&v30[19] + 2) = 0u;
      *(_OWORD *)((char *)&v30[17] + 2) = 0u;
      *(_OWORD *)((char *)&v30[15] + 2) = 0u;
      *(_OWORD *)((char *)&v30[13] + 2) = 0u;
      AVCStatisticsCollector_SetVCStatistics((uint64_t)self->super._statisticsCollector, (uint64_t)v30);
      v23 = *(_OWORD *)&v30[22];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 136) = *(_OWORD *)&v30[20];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 152) = v23;
      *((_QWORD *)&self->super._previousStatistics.var0.localRCEvent + 21) = v30[24];
      v24 = *(_OWORD *)&v30[14];
      *(_OWORD *)(&self->super._previousStatistics.var0.localRCEvent + 3) = *(_OWORD *)&v30[12];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 88) = v24;
      v25 = *(_OWORD *)&v30[18];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 104) = *(_OWORD *)&v30[16];
      *(_OWORD *)(&self->super._previousStatistics.var0.localRCEvent + 5) = v25;
      v26 = *(_OWORD *)&v30[6];
      *(_OWORD *)&self->super._previousStatistics.var0.rtcpRR.lastSequenceNumber = *(_OWORD *)&v30[4];
      *(_OWORD *)(&self->super._previousStatistics.var0.localRCEvent + 1) = v26;
      v27 = *(_OWORD *)&v30[10];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 40) = *(_OWORD *)&v30[8];
      *(_OWORD *)((char *)&self->super._previousStatistics.var0.localRCEvent + 56) = v27;
      v28 = *(_OWORD *)&v30[2];
      LOBYTE(logNWDump) = 1;
      *(_OWORD *)&self->super._previousStatistics.type = *(_OWORD *)v30;
      *(_OWORD *)&self->super._previousStatistics.isVCRCInternal = v28;
      return (char)logNWDump;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCNWConnectionCongestionDetectorBaseband processNWConnectionNotification:].cold.2(v11, (uint64_t)a3, v12);
    }
    logNWDump = self->super._logNWDump;
    if (logNWDump)
    {
      VRLogfilePrint((uint64_t)logNWDump, "NWConnection notification has a bad version=%d\n", v5, v6, v7, v8, v9, v10, a3->var1.advisory.version);
LABEL_11:
      LOBYTE(logNWDump) = 0;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_11;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    LODWORD(logNWDump) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if ((_DWORD)logNWDump)
    {
      -[VCNWConnectionCongestionDetectorBaseband processNWConnectionNotification:].cold.1(v14, v15);
      goto LABEL_11;
    }
  }
  return (char)logNWDump;
}

- (void)processNWConnectionNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCNWConnectionCongestionDetectorBaseband processNWConnectionNotification:]";
  v6 = 1024;
  v7 = 23;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, "VCRC [%s] %s:%d NWConnection notification is nil", (uint8_t *)&v2, 0x1Cu);
}

- (void)processNWConnectionNotification:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int8 *)(a2 + 8);
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCNWConnectionCongestionDetectorBaseband processNWConnectionNotification:]";
  v8 = 1024;
  v9 = 28;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, "VCRC [%s] %s:%d NWConnection notification has a bad version=%d", (uint8_t *)&v4, 0x22u);
}

@end
