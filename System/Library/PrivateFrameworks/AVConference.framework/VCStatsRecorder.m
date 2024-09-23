@implementation VCStatsRecorder

- (VCStatsRecorder)init
{
  VCStatsRecorder *v2;
  VCStatsRecorder *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCStatsRecorder;
  v2 = -[VCStatsRecorder init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_rwlock_init(&v2->_stateRWLock, 0);
    bzero(v3->_localStats, 0xC00uLL);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  pthread_rwlock_destroy(&self->_stateRWLock);
  v3.receiver = self;
  v3.super_class = (Class)VCStatsRecorder;
  -[VCStatsRecorder dealloc](&v3, sel_dealloc);
}

- (void)updateSessionStats:(unsigned __int16)a3 connection:(id)a4 totalPacketSent:(unsigned int)a5 totalPacketReceived:(unsigned int)a6
{
  uint64_t v7;
  unsigned int v9;
  _opaque_pthread_rwlock_t *p_stateRWLock;
  double v12;
  unsigned int v13;
  unsigned int v14;
  double *v15;

  if (a4)
  {
    v7 = *(_QWORD *)&a5;
    v9 = a3;
    p_stateRWLock = &self->_stateRWLock;
    pthread_rwlock_wrlock(&self->_stateRWLock);
    v12 = micro();
    v13 = VCConnectionIDS_LinkID((uint64_t)a4);
    v14 = self->_uplinkServerStatsByteUsed
        + -[VCStatsRecorder serverStatsSizeInByteForUplink:connection:](self, "serverStatsSizeInByteForUplink:connection:", 1, a4);
    self->_uplinkServerStatsByteUsed = v14;
    v15 = (double *)((char *)self + 24 * (v9 & 0x7F));
    v15[26] = v12;
    *((_QWORD *)v15 + 27) = ((unint64_t)v9 << 16) | (v7 << 32) | v13;
    *((_DWORD *)v15 + 56) = a6;
    *((_DWORD *)v15 + 57) = v14;
    self->_currentLocalStatsIndex = v9 & 0x7F;
    pthread_rwlock_unlock(p_stateRWLock);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStatsRecorder updateSessionStats:connection:totalPacketSent:totalPacketReceived:].cold.1();
  }
}

- (void)getLocalStats:(unsigned __int16)a3 localSessionStats:(id *)a4
{
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_stateRWLock;
  char *v8;

  if (a4)
  {
    v5 = a3;
    p_stateRWLock = &self->_stateRWLock;
    pthread_rwlock_rdlock(&self->_stateRWLock);
    v8 = (char *)self + 24 * v5;
    a4->var1 = v8[216];
    a4->var0 = *((double *)v8 + 26);
    a4->var3 = *((_DWORD *)v8 + 55);
    a4->var5 = *((_DWORD *)v8 + 57);
    pthread_rwlock_unlock(p_stateRWLock);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStatsRecorder getLocalStats:localSessionStats:].cold.1();
  }
}

- ($2A5123FA66906022607F2B5D76B2AC99)getMostRecentLocalStats
{
  _opaque_pthread_rwlock_t *p_stateRWLock;
  char *v6;

  retstr->var0 = 0.0;
  *(_QWORD *)&retstr->var1 = 0;
  *(_QWORD *)&retstr->var4 = 0;
  p_stateRWLock = &self->_stateRWLock;
  pthread_rwlock_rdlock(&self->_stateRWLock);
  v6 = (char *)self + 24 * self->_currentLocalStatsIndex;
  retstr->var1 = v6[216];
  retstr->var0 = *((double *)v6 + 26);
  retstr->var3 = *((_DWORD *)v6 + 55);
  retstr->var5 = *((_DWORD *)v6 + 57);
  return ($2A5123FA66906022607F2B5D76B2AC99 *)pthread_rwlock_unlock(p_stateRWLock);
}

- (int)serverStatsSizeInByteForUplink:(BOOL)a3 connection:(id)a4
{
  _BOOL4 v4;
  int v5;
  int v6;
  int result;

  if (a4)
  {
    v4 = a3;
    v5 = VCConnectionIDS_NetworkOverheadInBytes((uint64_t)a4, 0, 0);
    if (v4)
      v6 = -18;
    else
      v6 = -8;
    return v6 + v5;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      -[VCStatsRecorder serverStatsSizeInByteForUplink:connection:].cold.1();
    }
    return 0;
  }
}

- (void)updateSessionStats:connection:totalPacketSent:totalPacketReceived:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Connection is NIL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getLocalStats:localSessionStats:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d localSessionStats is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serverStatsSizeInByteForUplink:connection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Connection is NIL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
