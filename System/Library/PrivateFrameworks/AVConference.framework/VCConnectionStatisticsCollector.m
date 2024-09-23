@implementation VCConnectionStatisticsCollector

- (void)updateHistory:(BOOL)a3
{
  void (**copyPacketCountCallback)(id, char *);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  copyPacketCountCallback = (void (**)(id, char *))self->_copyPacketCountCallback;
  if (copyPacketCountCallback)
  {
    v5 = 1048;
    if (a3)
      v5 = 24;
    v6 = (char *)self + v5;
    v7 = 2076;
    if (a3)
      v7 = 2072;
    v17 = v7;
    v8 = 16;
    if (a3)
      v8 = 8;
    v9 = *(Class *)((char *)&self->super.isa + v8);
    copyPacketCountCallback[2](copyPacketCountCallback, v6);
    pthread_rwlock_wrlock(&self->_historyStateRWlock);
    for (i = 0; i != 256; ++i)
    {
      v11 = *(unsigned int *)&v6[4 * i];
      if ((_DWORD)v11)
      {
        v12 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)i));
        if (v12)
        {
          v13 = v12;
          if (objc_msgSend(v12, "count") == 8)
            objc_msgSend(v13, "removeFirstObject");
          objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11));
        }
        else
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11));
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)i));

        }
      }
    }
    ++*(_DWORD *)((char *)&self->super.isa + v17);
    pthread_rwlock_unlock(&self->_historyStateRWlock);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v19 = v15;
      v20 = 2080;
      v21 = "-[VCConnectionStatisticsCollector updateHistory:]";
      v22 = 1024;
      v23 = 58;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Callback not set", buf, 0x1Cu);
    }
  }
}

- (void)startUpdateHistoryTimerForOutgoing:(BOOL)a3
{
  uint64_t v5;
  NSObject *global_queue;
  objc_class *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];
  BOOL v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
    v5 = 2080;
  else
    v5 = 2088;
  global_queue = dispatch_get_global_queue(0, 0);
  v7 = (objc_class *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
  *(Class *)((char *)&self->super.isa + v5) = v7;
  if (v7)
  {
    v8 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(*(dispatch_source_t *)((char *)&self->super.isa + v5), v8, 0x12A05F200uLL, 0);
    v9 = *(NSObject **)((char *)&self->super.isa + v5);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __70__VCConnectionStatisticsCollector_startUpdateHistoryTimerForOutgoing___block_invoke;
    handler[3] = &unk_1E9E521E8;
    handler[4] = self;
    v11 = a3;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume(*(dispatch_object_t *)((char *)&self->super.isa + v5));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCConnectionStatisticsCollector startUpdateHistoryTimerForOutgoing:].cold.1();
  }
}

uint64_t __70__VCConnectionStatisticsCollector_startUpdateHistoryTimerForOutgoing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHistory:", *(unsigned __int8 *)(a1 + 40));
}

- (VCConnectionStatisticsCollector)init
{
  VCConnectionStatisticsCollector *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCConnectionStatisticsCollector;
  v2 = -[VCConnectionStatisticsCollector init](&v4, sel_init);
  if (v2)
  {
    v2->_packetCountsHistorySent = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_packetCountsHistoryRecv = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pthread_rwlock_init(&v2->_historyStateRWlock, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  pthread_rwlock_destroy(&self->_historyStateRWlock);
  v3.receiver = self;
  v3.super_class = (Class)VCConnectionStatisticsCollector;
  -[VCConnectionStatisticsCollector dealloc](&v3, sel_dealloc);
}

- (void)startPeriodicUpdateHistory:(BOOL)a3
{
  if (a3)
  {
    if (self->_periodicHistoryUpdateSentTimer)
      return;
LABEL_5:
    -[VCConnectionStatisticsCollector startUpdateHistoryTimerForOutgoing:](self, "startUpdateHistoryTimerForOutgoing:");
    return;
  }
  if (!self->_periodicHistoryUpdateRecvTimer)
    goto LABEL_5;
}

- (void)stopPeriodicHistoryUpdate
{
  NSObject *periodicHistoryUpdateSentTimer;
  NSObject *v4;
  NSObject *periodicHistoryUpdateRecvTimer;
  NSObject *v6;

  periodicHistoryUpdateSentTimer = self->_periodicHistoryUpdateSentTimer;
  if (periodicHistoryUpdateSentTimer)
  {
    dispatch_source_cancel(periodicHistoryUpdateSentTimer);
    v4 = self->_periodicHistoryUpdateSentTimer;
    if (v4)
    {
      dispatch_release(v4);
      self->_periodicHistoryUpdateSentTimer = 0;
    }
  }
  periodicHistoryUpdateRecvTimer = self->_periodicHistoryUpdateRecvTimer;
  if (periodicHistoryUpdateRecvTimer)
  {
    dispatch_source_cancel(periodicHistoryUpdateRecvTimer);
    v6 = self->_periodicHistoryUpdateRecvTimer;
    if (v6)
    {
      dispatch_release(v6);
      self->_periodicHistoryUpdateRecvTimer = 0;
    }
  }
}

- (void)registerCopyPacketCountCallback:(id)a3
{
  if (a3)
  {
    _Block_release(self->_copyPacketCountCallback);
    self->_copyPacketCountCallback = _Block_copy(a3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCConnectionStatisticsCollector registerCopyPacketCountCallback:].cold.1();
  }
}

- (void)deregisterCopyPacketCountCallBack
{
  id copyPacketCountCallback;

  copyPacketCountCallback = self->_copyPacketCountCallback;
  if (copyPacketCountCallback)
  {
    _Block_release(copyPacketCountCallback);
    self->_copyPacketCountCallback = 0;
  }
}

- (void)addConnectionBasedTopPacketCountsTelemetry:(id)a3 reportingKey:(id)a4 mapLinkIDToLinkUUID:(id)a5 isOutgoing:(BOOL)a6
{
  _BOOL8 v6;
  _opaque_pthread_rwlock_t *p_historyStateRWlock;
  id v12;
  unsigned int v13;
  uint64_t v14;

  v6 = a6;
  v14 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  p_historyStateRWlock = &self->_historyStateRWlock;
  pthread_rwlock_wrlock(&self->_historyStateRWlock);
  v12 = -[VCConnectionStatisticsCollector connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:](self, "connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:", &v13, v6);
  -[VCConnectionStatisticsCollector addConnectionBasedTopPacketCountsTelemetry:reportingKey:reportingTickCounts:mapLinkIDToLinkUUID:packetCountsPerConnection:](self, "addConnectionBasedTopPacketCountsTelemetry:reportingKey:reportingTickCounts:mapLinkIDToLinkUUID:packetCountsPerConnection:", a3, a4, v13, a5, v12);
  pthread_rwlock_unlock(p_historyStateRWlock);
}

- (id)connectionBasedTopPacketCountsWithUpdateTickCounts:(unsigned int *)a3 isOutgoing:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __CFBinaryHeap *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  unsigned int v16;
  id v17;
  int v18;
  void *Minimum;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v26;
  NSObject *v27;
  CFBinaryHeapCallBacks v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v7 = 16;
  if (a4)
    v7 = 8;
  v8 = *(Class *)((char *)&self->super.isa + v7);
  if (objc_msgSend(v8, "count"))
  {
    v9 = 2076;
    if (v4)
      v9 = 2072;
    *a3 = *(_DWORD *)((char *)&self->super.isa + v9);
    memset(&v28, 0, 32);
    v28.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))_VCConnectionStatisticsCollector_ComparePacketCounts;
    v10 = CFBinaryHeapCreate(0, 256, &v28, 0);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v8);
          v15 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v15), "lastObject"), "unsignedIntValue");
          v37[1] = CFSTR("PktCnt");
          v38[0] = v15;
          v37[0] = CFSTR("linkID");
          v38[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
          CFBinaryHeapAddValue(v10, (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2));
        }
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
      }
      while (v12);
    }
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0;
    while (1)
    {
      Minimum = (void *)CFBinaryHeapGetMinimum(v10);
      if (!Minimum)
        break;
      v20 = Minimum;
      CFBinaryHeapRemoveMinimumValue(v10);
      v21 = objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("linkID"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", v21), v21);
      if (++v18 == 3)
        goto LABEL_23;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_23;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    v24 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v30 = v22;
        v31 = 2080;
        v32 = "-[VCConnectionStatisticsCollector connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:]";
        v33 = 1024;
        v34 = 199;
        v35 = 1024;
        v36 = v18;
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Did not get max value for ranked=%d", buf, 0x22u);
        if (!v10)
          return v17;
        goto LABEL_24;
      }
LABEL_23:
      if (!v10)
        return v17;
      goto LABEL_24;
    }
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      goto LABEL_23;
    -[VCConnectionStatisticsCollector connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:].cold.1();
    if (v10)
LABEL_24:
      CFRelease(v10);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v30 = v26;
        v31 = 2080;
        v32 = "-[VCConnectionStatisticsCollector connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:]";
        v33 = 1024;
        v34 = 178;
        _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d History is empty", buf, 0x1Cu);
      }
    }
    v17 = 0;
  }
  return v17;
}

- (void)addConnectionBasedTopPacketCountsTelemetry:(id)a3 reportingKey:(id)a4 reportingTickCounts:(unsigned int)a5 mapLinkIDToLinkUUID:(id)a6 packetCountsPerConnection:(id)a7
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a7)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(a7);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "integerValue");
          v16 = (void *)objc_msgSend(a6, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15));
          v17 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", v14);
          objc_msgSend(v9, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@:"), objc_msgSend(v16, "UUIDString"), objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","))));
        }
        v11 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      }
      while (v11);
    }
    if (objc_msgSend(v9, "length"))
      objc_msgSend(v9, "deleteCharactersInRange:", objc_msgSend(v9, "length") - 1, 1);
    objc_msgSend(a3, "setObject:forKeyedSubscript:", v9, a4);

    v18 = objc_msgSend(a4, "isEqual:", CFSTR("ULPH"));
    v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5);
    if (v18)
      v20 = CFSTR("ULPI");
    else
      v20 = CFSTR("DLPI");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", v19, v20);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v32 = v21;
      v33 = 2080;
      v34 = "-[VCConnectionStatisticsCollector addConnectionBasedTopPacketCountsTelemetry:reportingKey:reportingTickCount"
            "s:mapLinkIDToLinkUUID:packetCountsPerConnection:]";
      v35 = 1024;
      v36 = 217;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No ranks received", buf, 0x1Cu);
    }
  }
}

- (void)startUpdateHistoryTimerForOutgoing:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not create dispatch source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerCopyPacketCountCallback:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d callback passed is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCConnectionStatisticsCollector connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:]";
  v6 = 1024;
  v7 = 199;
  v8 = 1024;
  v9 = v1;
  _os_log_debug_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Did not get max value for ranked=%d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

@end
