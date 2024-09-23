@implementation VCConnectionHealthMonitor

- (VCConnectionHealthMonitor)init
{
  VCConnectionHealthMonitor *v2;
  VCConnectionHealthMonitor *v3;
  NSObject *CustomRootQueue;
  double v5;
  uint64_t v6;
  NSObject *v7;
  double primaryConnHealthAllowedDelay;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCConnectionHealthMonitor;
  v2 = -[VCConnectionHealthMonitor init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_rwlock_init(&v2->_stateRWLock, 0);
    pthread_rwlock_init(&v3->_peerStateRWLock, 0);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v3->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCConnectionHealthMonitor.delegateQueue", 0, CustomRootQueue);
    objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-primary-conn-health-allowed-delay"), CFSTR("primaryConnHealthAllowedDelay"), &unk_1E9EFB1C8, 1), "doubleValue");
    v3->_primaryConnHealthAllowedDelay = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        primaryConnHealthAllowedDelay = v3->_primaryConnHealthAllowedDelay;
        *(_DWORD *)buf = 136315906;
        v12 = v6;
        v13 = 2080;
        v14 = "-[VCConnectionHealthMonitor init]";
        v15 = 1024;
        v16 = 68;
        v17 = 2048;
        v18 = primaryConnHealthAllowedDelay;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Primary connection health allowed delay = %.2f", buf, 0x26u);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCConnectionHealthMonitor setDelegate:](self, "setDelegate:", 0);
  pthread_rwlock_destroy(&self->_stateRWLock);
  pthread_rwlock_destroy(&self->_peerStateRWLock);
  dispatch_release((dispatch_object_t)self->_delegateQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCConnectionHealthMonitor;
  -[VCConnectionHealthMonitor dealloc](&v3, sel_dealloc);
}

- (VCConnectionHealthMonitorDelegate)delegate
{
  return (VCConnectionHealthMonitorDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (unsigned)generateStatsBlob
{
  _opaque_pthread_rwlock_t *p_stateRWLock;
  int latestConnectionStatsIndex;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned __int8 *v9;

  p_stateRWLock = &self->_stateRWLock;
  pthread_rwlock_rdlock(&self->_stateRWLock);
  latestConnectionStatsIndex = self->_statsHistory.latestConnectionStatsIndex;
  if (self->_lastReportedIndex == latestConnectionStatsIndex)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v9 = (unsigned __int8 *)self
       + (self->_statsHistory.latestConnectionStatsIndex
                      - 5 * ((858993460 * (unint64_t)self->_statsHistory.latestConnectionStatsIndex) >> 32));
    LODWORD(v9) = bswap32((v9[15] << 8) | (latestConnectionStatsIndex << 24) | (v9[20] << 16) | v9[10]);
    self->_lastReportedIndex = latestConnectionStatsIndex;
    v5 = v9 & 0xFF000000;
    v6 = v9 & 0xFF0000;
    v7 = (unsigned __int16)v9 & 0xFF00;
    v8 = v9;
  }
  pthread_rwlock_unlock(p_stateRWLock);
  return v6 | v5 | v7 | v8;
}

- (void)processPeerStatsBlob:(unsigned int)a3
{
  unsigned int v4;
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_peerStateRWLock;
  int latestConnectionStatsIndex;
  uint64_t v8;
  char v10;
  unsigned __int8 v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = bswap32(a3);
  v5 = HIBYTE(v4);
  p_peerStateRWLock = &self->_peerStateRWLock;
  pthread_rwlock_wrlock(&self->_peerStateRWLock);
  if (HIBYTE(v4) != self->_peerStatsHistory.latestConnectionStatsIndex)
  {
    latestConnectionStatsIndex = self->_peerStatsHistory.latestConnectionStatsIndex;
    v8 = (HIBYTE(v4) - 5 * ((205 * HIBYTE(v4)) >> 10));
    if (v5 >= latestConnectionStatsIndex + 5 || (int)v5 <= latestConnectionStatsIndex - 5)
    {
      self->_peerStatsHistory.totalPacketsReceived[4] = 0;
      *(_DWORD *)self->_peerStatsHistory.totalPacketsReceived = 0;
      *(_DWORD *)&self->_peerStatsHistory.connectionStats[0][0] = 0;
      self->_peerStatsHistory.connectionStats[0][4] = 0;
      *(_DWORD *)&self->_peerStatsHistory.connectionStats[1][0] = 0;
      self->_peerStatsHistory.connectionStats[1][4] = 0;
    }
    else
    {
      v10 = self->_peerStatsHistory.latestConnectionStatsIndex % 5u;
      if ((v10 + 1) == 5)
        v11 = 0;
      else
        v11 = v10 + 1;
      if ((_DWORD)v8 != v11)
      {
        v12 = v11;
        do
        {
          self->_peerStatsHistory.totalPacketsReceived[v12] = 0;
          self->_peerStatsHistory.connectionStats[0][v12] = 0;
          self->_peerStatsHistory.connectionStats[1][v12] = 0;
          v12 = (v12 + 1) % 5;
        }
        while (v12 != (_DWORD)v8);
      }
    }
    self->_peerStatsHistory.latestConnectionStatsIndex = HIBYTE(v4);
    self->_peerStatsHistory.totalPacketsReceived[(HIBYTE(v4)
                                                                 - 5 * ((205 * HIBYTE(v4)) >> 10))] = v4;
    self->_peerStatsHistory.connectionStats[0][(HIBYTE(v4)
                                                               - 5 * ((205 * HIBYTE(v4)) >> 10))] = BYTE1(v4);
    self->_peerStatsHistory.connectionStats[1][(HIBYTE(v4)
                                                               - 5 * ((205 * HIBYTE(v4)) >> 10))] = BYTE2(v4);
    _VCConnectionHealthMonitor_UpdateRatiosForHistory((uint64_t)&self->_peerStatsHistory, (HIBYTE(v4) - 5 * ((205 * HIBYTE(v4)) >> 10)));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_peerStatsHistory.latestConnectionStatsIndex;
        v16 = self->_peerStatsHistory.connectionStats[0][v8];
        v17 = self->_peerStatsHistory.connectionStats[1][v8];
        v18 = self->_peerStatsHistory.totalPacketsReceived[v8];
        v19 = self->_peerStatsHistory.connectionStatsRatio[0][v8];
        v20 = self->_peerStatsHistory.connectionStatsRatio[1][v8];
        v21 = 136317442;
        v22 = v13;
        v23 = 2080;
        v24 = "-[VCConnectionHealthMonitor processPeerStatsBlob:]";
        v25 = 1024;
        v26 = 200;
        v27 = 1024;
        v28 = v8;
        v29 = 1024;
        v30 = v15;
        v31 = 1024;
        v32 = v16;
        v33 = 1024;
        v34 = v17;
        v35 = 1024;
        v36 = v18;
        v37 = 1024;
        v38 = v19;
        v39 = 1024;
        v40 = v20;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: receive - last packet with feedback index %d, %u, bucket [%u %u %u] ratios [%u %u]", (uint8_t *)&v21, 0x46u);
      }
    }
    VCConnectionHealthMonitor_ReportConnectionHealthWithStatsHistory((uint64_t)self, (uint64_t)&self->_peerStatsHistory, v8, 1);
  }
  pthread_rwlock_unlock(p_peerStateRWLock);
}

- (void)resetConnectionStats:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  pthread_rwlock_t *v6;

  v4 = 40;
  if (a3)
  {
    v4 = 304;
    v5 = 9;
  }
  else
  {
    v5 = 240;
  }
  v6 = (pthread_rwlock_t *)((char *)self + v4);
  pthread_rwlock_wrlock((pthread_rwlock_t *)((char *)self + v4));
  -[VCConnectionHealthMonitor resetHistory:](self, "resetHistory:", (char *)self + v5);
  pthread_rwlock_unlock(v6);
}

- (void)resetHistory:(ConnectionStatsHistory *)a3
{
  a3->totalPacketsReceived[4] = 0;
  *(_DWORD *)a3->totalPacketsReceived = 0;
  *(_QWORD *)&a3->connectionStats[0][0] = 0;
  *(_WORD *)&a3->connectionStats[1][3] = 0;
  *(_QWORD *)&a3->connectionStatsRatio[0][0] = 0;
  *(_WORD *)&a3->connectionStatsRatio[1][3] = 0;
}

uint64_t __VCConnectionHealthMonitor_ReportConnectionHealthWithStatsHistory_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "connectionHealthDidUpdate:isLocalConnection:", *(unsigned int *)(a1 + 40), *(_BYTE *)(a1 + 44) == 0);
}

- (double)primaryConnHealthAllowedDelay
{
  return self->_primaryConnHealthAllowedDelay;
}

- (void)setPrimaryConnHealthAllowedDelay:(double)a3
{
  self->_primaryConnHealthAllowedDelay = a3;
}

- (BOOL)usingServerBasedLinks
{
  return self->_usingServerBasedLinks;
}

- (void)setUsingServerBasedLinks:(BOOL)a3
{
  self->_usingServerBasedLinks = a3;
}

uint64_t ___VCConnectionHealthMonitor_checkAndReportSymptomOnRecoveryAfterLongMediaStall_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "reportSymptomOnLongMediaStallRecovered");
}

@end
