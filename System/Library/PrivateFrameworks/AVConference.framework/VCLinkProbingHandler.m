@implementation VCLinkProbingHandler

- (VCLinkProbingHandler)initWithDelegate:(id)a3
{
  VCLinkProbingHandler *v4;
  VCLinkProbingHandler *v5;
  NSObject *CustomRootQueue;
  uint64_t v7;
  VCDispatchTimer *v8;
  uint64_t linkProbingQueryResultsInterval;
  uint64_t v10;
  VCDispatchTimer *v11;
  uint64_t linkProbingLockdownPeriod;
  VCDispatchTimer *v13;
  uint64_t linkProbingQRStatFrequency;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VCLinkProbingHandler;
  v4 = -[VCLinkProbingHandler init](&v19, sel_init);
  v5 = v4;
  if (v4)
  {
    -[VCLinkProbingHandler loadStorebagValues](v4, "loadStorebagValues");
    -[VCLinkProbingHandler setLinkProbingHandlerDelegate:](v5, "setLinkProbingHandlerDelegate:", a3);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v5->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.vcLinkProbing.delegateQueue", 0, CustomRootQueue);
    v5->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.vcLinkProbing.serialQueue", 0, CustomRootQueue);
    v7 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v5);
    v8 = [VCDispatchTimer alloc];
    linkProbingQueryResultsInterval = v5->_linkProbingQueryResultsInterval;
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __41__VCLinkProbingHandler_initWithDelegate___block_invoke;
    v18[3] = &unk_1E9E521C0;
    v18[4] = v7;
    v5->_queryProbingResultsTimer = -[VCDispatchTimer initWithIntervalSeconds:callbackBlock:clientQueue:](v8, "initWithIntervalSeconds:callbackBlock:clientQueue:", linkProbingQueryResultsInterval, v18, v5->_serialQueue);
    v11 = [VCDispatchTimer alloc];
    linkProbingLockdownPeriod = v5->_linkProbingLockdownPeriod;
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __41__VCLinkProbingHandler_initWithDelegate___block_invoke_2;
    v17[3] = &unk_1E9E521C0;
    v17[4] = v7;
    v5->_probingLockdownTimer = -[VCDispatchTimer initWithIntervalSeconds:callbackBlock:clientQueue:](v11, "initWithIntervalSeconds:callbackBlock:clientQueue:", linkProbingLockdownPeriod, v17, v5->_serialQueue);
    v5->_aggregatedProbingResults = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_linkPreferenceOrder = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v5->_activelyProbingLinkIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = [VCDispatchTimer alloc];
    linkProbingQRStatFrequency = v5->_linkProbingQRStatFrequency;
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __41__VCLinkProbingHandler_initWithDelegate___block_invoke_3;
    v16[3] = &unk_1E9E521C0;
    v16[4] = v7;
    v5->_requestStatsTimer = -[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:](v13, "initWithIntervalMilliseconds:callbackBlock:clientQueue:", linkProbingQRStatFrequency, v16, v5->_serialQueue);
    v5->_activeQRStatRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v5;
}

uint64_t __41__VCLinkProbingHandler_initWithDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "queryProbingResults");
}

uint64_t __41__VCLinkProbingHandler_initWithDelegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "probingLockdownEnded");
}

uint64_t __41__VCLinkProbingHandler_initWithDelegate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "requestStats");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCDispatchTimer stop](self->_queryProbingResultsTimer, "stop");
  -[VCDispatchTimer stop](self->_probingLockdownTimer, "stop");

  objc_storeWeak((id *)&self->_linkProbingHandlerDelegate, 0);
  dispatch_release((dispatch_object_t)self->_delegateQueue);
  self->_delegateQueue = 0;
  dispatch_release((dispatch_object_t)self->_serialQueue);
  self->_serialQueue = 0;

  -[VCDispatchTimer stop](self->_requestStatsTimer, "stop");
  v3.receiver = self;
  v3.super_class = (Class)VCLinkProbingHandler;
  -[VCLinkProbingHandler dealloc](&v3, sel_dealloc);
}

- (VCLinkProbingHandlerDelegate)linkProbingHandlerDelegate
{
  return (VCLinkProbingHandlerDelegate *)objc_loadWeak((id *)&self->_linkProbingHandlerDelegate);
}

- (void)setLinkProbingHandlerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_linkProbingHandlerDelegate, a3);
}

- (BOOL)isLinkProbingActive
{
  return self->_linkProbingState == 1;
}

- (void)startActiveProbingOnLinks:(id)a3
{
  NSObject *delegateQueue;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_linkProbingCapabilityVersion)
  {
    if (a3 && objc_msgSend(a3, "count"))
    {
      delegateQueue = self->_delegateQueue;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__VCLinkProbingHandler_startActiveProbingOnLinks___block_invoke;
      v9[3] = &unk_1E9E52238;
      v9[4] = self;
      v9[5] = a3;
      dispatch_async(delegateQueue, v9);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCLinkProbingHandler startActiveProbingOnLinks:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v8 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v11 = v6;
        v12 = 2080;
        v13 = "-[VCLinkProbingHandler startActiveProbingOnLinks:]";
        v14 = 1024;
        v15 = 158;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: startActiveProbing failed: Link probing not enabled", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[VCLinkProbingHandler startActiveProbingOnLinks:].cold.1();
    }
  }
}

void __50__VCLinkProbingHandler_startActiveProbingOnLinks___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count"))
    *(double *)(*(_QWORD *)(a1 + 32) + 200) = micro();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "allObjects");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0D33F70]);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 76));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D33F68]);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D33F80]);
  if (objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"))
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "startActiveProbingWithOptions:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setLinkProbingResultConfig");
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 92))
  {
    objc_msgSend(*(id *)(v5 + 16), "start");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 92) = 1;
  }

}

- (void)stopActiveProbingOnLinks:(id)a3 resetStats:(BOOL)a4
{
  NSObject *delegateQueue;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[6];
  BOOL v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_linkProbingCapabilityVersion)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke;
    block[3] = &unk_1E9E52210;
    block[4] = self;
    block[5] = a3;
    v8 = a4;
    dispatch_async(delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCLinkProbingHandler stopActiveProbingOnLinks:resetStats:]";
      v13 = 1024;
      v14 = 191;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: stopActiveProbing failed: Link probing not enabled", buf, 0x1Cu);
    }
  }
}

void __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 92) == 1)
  {
    v2 = *(void **)(a1 + 40);
    if (v2
      && objc_msgSend(v2, "count")
      && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40)), "isSubsetOfSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184)) & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40)));
      v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count");
      v5 = *MEMORY[0x1E0D33F70];
      if (v4)
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), v5);
        objc_msgSend(*(id *)(a1 + 32), "removeProbingResultsForLinks:", *(_QWORD *)(a1 + 40));
      }
      else
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D33F60], v5);
        if (*(_BYTE *)(a1 + 48))
          objc_msgSend(*(id *)(a1 + 32), "resetAggregatedProbingResults");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stop");
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 92) = 0;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"))
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "stopActiveProbingWithOptions:", v3);

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 232) = 0;
      objc_msgSend(*(id *)(a1 + 32), "flushProbingResults:", *(_QWORD *)(a1 + 40));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke_cold_1();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke_cold_2();
  }
}

- (void)updateProbingResults:(id)a3
{
  NSObject *delegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCLinkProbingHandler_updateProbingResults___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(delegateQueue, block);
}

uint64_t __45__VCLinkProbingHandler_updateProbingResults___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateProbingResults:", *(_QWORD *)(a1 + 40));
}

- (void)dispatchedUpdateProbingResults:(id)a3
{
  void *v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  uint64_t v9;
  VCLinkProbingResult *v10;
  uint64_t v11;
  __int128 v12;
  int v13;
  const char *v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char *__lasts;
  char *__str;
  _BYTE buf[40];
  char *v26;
  void *v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_linkProbingState == 1)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = (void *)objc_msgSend(a3, "allKeys");
    v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    if (v22)
    {
      v21 = *(_QWORD *)v30;
      v20 = v5;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v5);
          v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v8 = -[VCLinkProbingHandler isValidProbingResult:](self, "isValidProbingResult:", objc_msgSend(a3, "objectForKeyedSubscript:", v7));
          v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_aggregatedProbingResults, "objectForKeyedSubscript:", v7);
          if (v8)
          {
            if (v9)
            {
              objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregatedProbingResults, "objectForKeyedSubscript:", v7), "mergeProbingResults:", objc_msgSend(a3, "objectForKeyedSubscript:", v7));
            }
            else
            {
              v10 = [VCLinkProbingResult alloc];
              v11 = objc_msgSend(a3, "objectForKeyedSubscript:", v7);
              v12 = *(_OWORD *)&self->_linkProbingResultConfig.envelopeAttackFactor;
              *(_OWORD *)buf = *(_OWORD *)&self->_linkProbingResultConfig.linkProbingCapabilityVersion;
              *(_OWORD *)&buf[16] = v12;
              *(_QWORD *)&buf[32] = self->_linkProbingResultConfig.plrBuckets;
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_aggregatedProbingResults, "setObject:forKeyedSubscript:", -[VCLinkProbingResult initWithProbingResults:linkProbingResultConfig:](v10, "initWithProbingResults:linkProbingResultConfig:", v11, buf), v7);
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              __str = 0;
              v13 = objc_msgSend(v7, "intValue");
              if (-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregatedProbingResults, "objectForKeyedSubscript:", v7))
              {
                v14 = (const char *)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregatedProbingResults, "objectForKeyedSubscript:", v7), "description"), "UTF8String");
              }
              else
              {
                v14 = "<nil>";
              }
              asprintf(&__str, "LinkProbing: Updated probing results for linkID: %d -> %s", v13, v14);
              if (__str)
              {
                __lasts = 0;
                v15 = strtok_r(__str, "\n", &__lasts);
                do
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v16 = VRTraceErrorLogLevelToCSTR();
                    v17 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136316162;
                      *(_QWORD *)&buf[4] = v16;
                      *(_WORD *)&buf[12] = 2080;
                      *(_QWORD *)&buf[14] = "-[VCLinkProbingHandler dispatchedUpdateProbingResults:]";
                      *(_WORD *)&buf[22] = 1024;
                      *(_DWORD *)&buf[24] = 255;
                      *(_WORD *)&buf[28] = 2080;
                      *(_QWORD *)&buf[30] = "-[VCLinkProbingHandler dispatchedUpdateProbingResults:]";
                      *(_WORD *)&buf[38] = 2080;
                      v26 = v15;
                      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                    }
                  }
                  v15 = strtok_r(0, "\n", &__lasts);
                }
                while (v15);
                free(__str);
              }
              v5 = v20;
            }
          }
          else if (v9)
          {
            v27 = v7;
            -[VCLinkProbingHandler removeProbingResultsForLinks:](self, "removeProbingResultsForLinks:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1));
          }
        }
        v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
      }
      while (v22);
    }
    -[VCLinkProbingHandler updateLinkPreferenceOrder](self, "updateLinkPreferenceOrder");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCLinkProbingHandler dispatchedUpdateProbingResults:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 238;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: updateProbingResults failed: Link probing not in progress", buf, 0x1Cu);
    }
  }
}

- (void)flushProbingResults:(id)a3
{
  id v5;
  id v6;

  if (-[VCLinkProbingHandler linkProbingHandlerDelegate](self, "linkProbingHandlerDelegate"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (-[NSMutableSet count](self->_activelyProbingLinkIDs, "count"))
      v5 = a3;
    else
      v5 = (id)*MEMORY[0x1E0D33F60];
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D33F70]);
    -[VCLinkProbingHandlerDelegate flushLinkProbingStatusWithOptions:](-[VCLinkProbingHandler linkProbingHandlerDelegate](self, "linkProbingHandlerDelegate"), "flushLinkProbingStatusWithOptions:", v6);

  }
}

- (BOOL)isValidProbingResult:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = *MEMORY[0x1E0D33EF0];
  v6 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33EF0]);
  if (v6)
    LOBYTE(v6) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v5), "unsignedIntValue") >= self->_minSentRequestCountThreshold;
  return v6;
}

- (void)removeProbingResultsForLinks:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregatedProbingResults, "objectForKeyedSubscript:", v9))
        {
          -[NSMutableDictionary removeObjectForKey:](self->_aggregatedProbingResults, "removeObjectForKey:", v9);
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

- (id)getProbingResultsForLinkID:(id)a3
{
  NSMutableDictionary *aggregatedProbingResults;

  aggregatedProbingResults = self->_aggregatedProbingResults;
  if (aggregatedProbingResults
    && -[NSMutableDictionary objectForKeyedSubscript:](aggregatedProbingResults, "objectForKeyedSubscript:"))
  {
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregatedProbingResults, "objectForKeyedSubscript:", a3);
  }
  else
  {
    return 0;
  }
}

- (void)setQRLinkID:(id)a3
{
  NSObject *delegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__VCLinkProbingHandler_setQRLinkID___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(delegateQueue, block);
}

void __36__VCLinkProbingHandler_setQRLinkID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 264) = objc_msgSend(*(id *)(a1 + 32), "copy");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 264);
        v5 = 136315906;
        v6 = v2;
        v7 = 2080;
        v8 = "-[VCLinkProbingHandler setQRLinkID:]_block_invoke";
        v9 = 1024;
        v10 = 300;
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: QR link ID=%@", (uint8_t *)&v5, 0x26u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __36__VCLinkProbingHandler_setQRLinkID___block_invoke_cold_1();
  }
}

- (void)startActiveProbingQRLink
{
  NSObject *delegateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__VCLinkProbingHandler_startActiveProbingQRLink__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

void __48__VCLinkProbingHandler_startActiveProbingQRLink__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 256) == 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v2;
        v13 = 2080;
        v14 = "-[VCLinkProbingHandler startActiveProbingQRLink]_block_invoke";
        v15 = 1024;
        v16 = 307;
        v4 = " [%s] %s:%d LinkProbing: startActiveProbingQRLink failed: QR link probing already in progress";
        v5 = v3;
        v6 = 28;
LABEL_9:
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v11, v6);
      }
    }
  }
  else if (*(_QWORD *)(v1 + 264))
  {
    *(_BYTE *)(v1 + 256) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "start");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264);
        v11 = 136315906;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCLinkProbingHandler startActiveProbingQRLink]_block_invoke";
        v15 = 1024;
        v16 = 317;
        v17 = 2112;
        v18 = v10;
        v4 = " [%s] %s:%d LinkProbing: startActiveProbingQRLink success: QR link probing started on linkID=%@";
        v5 = v9;
        v6 = 38;
        goto LABEL_9;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __48__VCLinkProbingHandler_startActiveProbingQRLink__block_invoke_cold_1();
  }
}

- (void)stopActiveProbingQRLink
{
  NSObject *delegateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__VCLinkProbingHandler_stopActiveProbingQRLink__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

void __47__VCLinkProbingHandler_stopActiveProbingQRLink__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 256) == 1)
  {
    *(_BYTE *)(v1 + 256) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stop");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136315650;
        v5 = v2;
        v6 = 2080;
        v7 = "-[VCLinkProbingHandler stopActiveProbingQRLink]_block_invoke";
        v8 = 1024;
        v9 = 329;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: stopActiveProbingQRLink success: QR link probing stopped", (uint8_t *)&v4, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __47__VCLinkProbingHandler_stopActiveProbingQRLink__block_invoke_cold_1();
  }
}

- (void)updateQRProbingResult:(id)a3
{
  NSObject *delegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCLinkProbingHandler_updateQRProbingResult___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(delegateQueue, block);
}

uint64_t __46__VCLinkProbingHandler_updateQRProbingResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateQRProbingResult:", *(_QWORD *)(a1 + 40));
}

- (void)loadStorebagValues
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSArray *v7;
  unsigned int v8;
  double v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int linkProbingInterval;
  unsigned int linkProbingTimeout;
  unsigned int linkProbingQueryResultsInterval;
  double expMovMeanFactor;
  double plrEnvelopeAttackFactor;
  double plrEnvelopeDecayFactor;
  NSString *v19;
  unsigned int minSentRequestCountThreshold;
  unsigned int linkProbingDuplicationWaitTimeout;
  unsigned int consecutiveIdenticalQueryResultMax;
  double linkProbingLockdownPeriod;
  unsigned int linkProbingQRStatFrequency;
  unsigned int linkProbingQRStatRequestMaxCount;
  double inkProbingQRStatRequestMaxRTT;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  NSString *v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  unsigned int v52;
  __int16 v53;
  double v54;
  __int16 v55;
  unsigned int v56;
  __int16 v57;
  unsigned int v58;
  __int16 v59;
  double v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  self->_linkProbingInterval = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-interval"), CFSTR("linkProbingInterval"), &unk_1E9EF6C80, 0), "unsignedIntValue");
  self->_linkProbingTimeout = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-timeout"), CFSTR("linkProbingTimeout"), &unk_1E9EF6C98, 0), "unsignedIntValue");
  self->_linkProbingQueryResultsInterval = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-query-results-interval"), CFSTR("linkProbingQueryResultsInterval"), &unk_1E9EF6CB0, 0), "unsignedIntValue");
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-connection-lockdown-period"), CFSTR("linkProbingConnectionLockdownPeriod"), &unk_1E9EF6CC8, 1), "doubleValue");
  self->_linkProbingConnectionLockdownPeriod = v3;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-exponential-moving-mean-factor"), CFSTR("linkProbingExponentialMovingMeanFactor"), &unk_1E9EFB238, 1), "doubleValue");
  self->_expMovMeanFactor = v4;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-envelope-attack-factor"), CFSTR("linkProbingEnvelopeAttackFactor"), &unk_1E9EFB238, 1), "doubleValue");
  self->_plrEnvelopeAttackFactor = v5;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-envelope-decay-factor"), CFSTR("linkProbingEnvelopeDecayFactor"), &unk_1E9EFB248, 1), "doubleValue");
  self->_plrEnvelopeDecayFactor = v6;
  v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", objc_msgSend(+[GKSConnectivitySettings getStorebagValueStorebagKey:defaultValue:](GKSConnectivitySettings, "getStorebagValueStorebagKey:defaultValue:", CFSTR("vc-link-probing-plr-buckets"), CFSTR("0.25,2.5,10,20,30,100")), "componentsSeparatedByString:", CFSTR(",")));
  v8 = llround((double)(1000 * self->_linkProbingQueryResultsInterval / self->_linkProbingInterval) * 0.25);
  self->_plrBuckets = v7;
  self->_minSentRequestCountThreshold = v8;
  self->_linkProbingDuplicationWaitTimeout = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-duplication-wait-timeout"), CFSTR("linkProbingDuplicationWaitTimeout"), &unk_1E9EF6CE0, 0), "unsignedIntValue");
  self->_consecutiveIdenticalQueryResultMax = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-identical-query-result-max"), CFSTR("linkProbingIdenticalQueryResultMax"), &unk_1E9EF6CC8, 0), "unsignedIntValue");
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-lockdown-period"), CFSTR("linkProbingLockdownPeriod"), &unk_1E9EF6CF8, 1), "doubleValue");
  self->_linkProbingLockdownPeriod = v9;
  self->_linkProbingQRStatFrequency = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-qr-stat-request-frequency"), CFSTR("linkProbingQRStatRequestFrequency"), &unk_1E9EF6D10, 0), "unsignedIntValue");
  self->_linkProbingQRStatRequestMaxCount = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-qr-stat-request-max-count"), CFSTR("linkProbingQRStatRequestMaxCount"), &unk_1E9EF6D28, 0), "unsignedIntValue");
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-qr-stat-request-max-rtt"), CFSTR("linkProbingQRStatRequestMaxRTT"), &unk_1E9EF6D40, 1), "doubleValue");
  self->_inkProbingQRStatRequestMaxRTT = v10;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      linkProbingInterval = self->_linkProbingInterval;
      linkProbingTimeout = self->_linkProbingTimeout;
      linkProbingQueryResultsInterval = self->_linkProbingQueryResultsInterval;
      expMovMeanFactor = self->_expMovMeanFactor;
      plrEnvelopeAttackFactor = self->_plrEnvelopeAttackFactor;
      plrEnvelopeDecayFactor = self->_plrEnvelopeDecayFactor;
      v19 = -[NSArray componentsJoinedByString:](self->_plrBuckets, "componentsJoinedByString:", CFSTR(","));
      minSentRequestCountThreshold = self->_minSentRequestCountThreshold;
      linkProbingDuplicationWaitTimeout = self->_linkProbingDuplicationWaitTimeout;
      consecutiveIdenticalQueryResultMax = self->_consecutiveIdenticalQueryResultMax;
      linkProbingLockdownPeriod = self->_linkProbingLockdownPeriod;
      linkProbingQRStatFrequency = self->_linkProbingQRStatFrequency;
      linkProbingQRStatRequestMaxCount = self->_linkProbingQRStatRequestMaxCount;
      inkProbingQRStatRequestMaxRTT = self->_inkProbingQRStatRequestMaxRTT;
      v27 = 136319234;
      v28 = v11;
      v29 = 2080;
      v30 = "-[VCLinkProbingHandler loadStorebagValues]";
      v31 = 1024;
      v32 = 372;
      v33 = 1024;
      v34 = linkProbingInterval;
      v35 = 1024;
      v36 = linkProbingTimeout;
      v37 = 1024;
      v38 = linkProbingQueryResultsInterval;
      v39 = 2048;
      v40 = expMovMeanFactor;
      v41 = 2048;
      v42 = plrEnvelopeAttackFactor;
      v43 = 2048;
      v44 = plrEnvelopeDecayFactor;
      v45 = 2112;
      v46 = v19;
      v47 = 1024;
      v48 = minSentRequestCountThreshold;
      v49 = 1024;
      v50 = linkProbingDuplicationWaitTimeout;
      v51 = 1024;
      v52 = consecutiveIdenticalQueryResultMax;
      v53 = 2048;
      v54 = linkProbingLockdownPeriod;
      v55 = 1024;
      v56 = linkProbingQRStatFrequency;
      v57 = 1024;
      v58 = linkProbingQRStatRequestMaxCount;
      v59 = 2048;
      v60 = inkProbingQRStatRequestMaxRTT;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Loaded storebag values linkProbingInterval=%d linkProbingTimeout=%d linkProbingQueryResultsInterval=%d exponentialMovingMeanFactor=%f plrEnvelopeAttackFactor=%f plrEnvelopeDecayFactor=%f plrBuckets=%@ minSentRequestCountThreshold=%d _linkProbingDuplicationWaitTimeout=%d _consecutiveIdenticalQueryResultMax=%d _linkProbingLockdownPeriod=%f _linkProbingQRStatFrequency=%d _linkProbingQRStatRequestMaxCount=%d _inkProbingQRStatRequestMaxRTT=%f", (uint8_t *)&v27, 0x88u);
    }
  }
}

- (void)setLinkProbingResultConfig
{
  self->_linkProbingResultConfig.linkProbingCapabilityVersion = self->_linkProbingCapabilityVersion;
  self->_linkProbingResultConfig.linkProbingQueryResultsInterval = self->_linkProbingInterval;
  *(_OWORD *)&self->_linkProbingResultConfig.expMovMeanFactor = *(_OWORD *)&self->_expMovMeanFactor;
  self->_linkProbingResultConfig.envelopeDecayFactor = self->_plrEnvelopeDecayFactor;
  self->_linkProbingResultConfig.plrBuckets = self->_plrBuckets;
}

- (void)queryProbingResults
{
  double v3;
  unint64_t v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  double v8;
  NSObject *delegateQueue;
  _QWORD block[5];
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
  v3 = micro();
  if (self->_linkProbingState == 1)
  {
    v5 = v3;
    LODWORD(v4) = self->_linkProbingDuplicationWaitTimeout;
    if (v3 - self->_probingStartTime > (double)v4 && !self->_isDuplicationEnabled)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = v5 - self->_probingStartTime;
          *(_DWORD *)buf = 136315906;
          v12 = v6;
          v13 = 2080;
          v14 = "-[VCLinkProbingHandler queryProbingResults]";
          v15 = 1024;
          v16 = 388;
          v17 = 2048;
          v18 = v8;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Stop active probing because duplication did not start in %f seconds after starting probing.", buf, 0x26u);
        }
      }
      -[VCLinkProbingHandler stopActiveProbingOnLinks:resetStats:](self, "stopActiveProbingOnLinks:resetStats:", -[NSMutableSet allObjects](self->_activelyProbingLinkIDs, "allObjects"), 0);
    }
  }
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCLinkProbingHandler_queryProbingResults__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __43__VCLinkProbingHandler_queryProbingResults__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 92) == 1)
  {
    v3 = *(void **)(v1 + 184);
    if (v3 && objc_msgSend(v3, "count"))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "allObjects");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D33F70]);
      if (objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"))
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "queryProbingResultsWithOptions:", v5);

    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __43__VCLinkProbingHandler_queryProbingResults__block_invoke_cold_1();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __43__VCLinkProbingHandler_queryProbingResults__block_invoke_cold_2();
  }
}

- (void)updateLinkPreferenceOrder
{
  double v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = micro();
  v4 = (void *)-[NSMutableDictionary keysSortedByValueUsingComparator:](self->_aggregatedProbingResults, "keysSortedByValueUsingComparator:", &__block_literal_global_93);
  if (objc_msgSend(v4, "count")
    && -[NSArray count](self->_linkPreferenceOrder, "count")
    && objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0), "isEqualToNumber:", -[NSArray objectAtIndexedSubscript:](self->_linkPreferenceOrder, "objectAtIndexedSubscript:", 0)))
  {
    v5 = self->_consecutiveIdenticalQueryResultCount + 1;
    self->_consecutiveIdenticalQueryResultCount = v5;
  }
  else
  {
    v5 = 0;
    self->_consecutiveIdenticalQueryResultCount = 0;
  }
  if (v5 == self->_consecutiveIdenticalQueryResultMax - 1 && self->_linkProbingState == 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_consecutiveIdenticalQueryResultCount + 1;
        v9 = 136315906;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCLinkProbingHandler updateLinkPreferenceOrder]";
        v13 = 1024;
        v14 = 435;
        v15 = 1024;
        v16 = v8;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Stop active probing because the same connection chosen for duplication after %d consecutive queries", (uint8_t *)&v9, 0x22u);
      }
    }
    -[VCLinkProbingHandler stopActiveProbingOnLinks:resetStats:](self, "stopActiveProbingOnLinks:resetStats:", -[NSMutableSet allObjects](self->_activelyProbingLinkIDs, "allObjects"), 0);
    -[VCDispatchTimer start](self->_probingLockdownTimer, "start");
  }
  if (v3 - self->_lastLinkPreferenceUpdateNotificationTime >= self->_linkProbingConnectionLockdownPeriod)
  {
    self->_lastLinkPreferenceUpdateNotificationTime = v3;
    if ((objc_msgSend(v4, "isEqualToArray:", self->_linkPreferenceOrder) & 1) == 0)
    {
      if (-[VCLinkProbingHandler linkProbingHandlerDelegate](self, "linkProbingHandlerDelegate"))
      {

        self->_linkPreferenceOrder = (NSArray *)objc_msgSend(v4, "copy");
        -[VCLinkProbingHandlerDelegate didUpdateLinkPreferenceOrder:](-[VCLinkProbingHandler linkProbingHandlerDelegate](self, "linkProbingHandlerDelegate"), "didUpdateLinkPreferenceOrder:", self->_linkPreferenceOrder);
      }
    }
  }
}

uint64_t __49__VCLinkProbingHandler_updateLinkPreferenceOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5;
  unsigned int v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = objc_msgSend((id)objc_msgSend(a2, "plrTier"), "unsignedIntValue");
  if (v5 > objc_msgSend((id)objc_msgSend(a3, "plrTier"), "unsignedIntValue"))
    return 1;
  v6 = objc_msgSend((id)objc_msgSend(a2, "plrTier"), "unsignedIntValue");
  if (v6 < objc_msgSend((id)objc_msgSend(a3, "plrTier"), "unsignedIntValue"))
    return -1;
  objc_msgSend((id)objc_msgSend(a2, "expMovMeanRTT"), "doubleValue");
  v9 = v8;
  objc_msgSend((id)objc_msgSend(a3, "expMovMeanRTT"), "doubleValue");
  if (v9 > v10)
    return 1;
  objc_msgSend((id)objc_msgSend(a2, "expMovMeanRTT"), "doubleValue");
  v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "expMovMeanRTT"), "doubleValue");
  if (v12 >= v13)
    return 0;
  else
    return -1;
}

- (void)probingLockdownEnded
{
  uint64_t v3;
  NSObject *v4;
  double linkProbingLockdownPeriod;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[VCDispatchTimer stop](self->_probingLockdownTimer, "stop");
  if (self->_isDuplicationEnabled && !self->_linkProbingState)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        linkProbingLockdownPeriod = self->_linkProbingLockdownPeriod;
        v6 = 136315906;
        v7 = v3;
        v8 = 2080;
        v9 = "-[VCLinkProbingHandler probingLockdownEnded]";
        v10 = 1024;
        v11 = 453;
        v12 = 2048;
        v13 = linkProbingLockdownPeriod;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Start active probing because connection for duplication was last updated using probing results %f seconds ago, and duplication is still active.", (uint8_t *)&v6, 0x26u);
      }
    }
    -[VCLinkProbingHandlerDelegate didLinkProbingLockdownEnd](-[VCLinkProbingHandler linkProbingHandlerDelegate](self, "linkProbingHandlerDelegate"), "didLinkProbingLockdownEnd");
  }
}

- (void)resetAggregatedProbingResults
{
  NSObject *delegateQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_linkPreferenceOrder, "count"))
  {

    self->_linkPreferenceOrder = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    if (-[VCLinkProbingHandler linkProbingHandlerDelegate](self, "linkProbingHandlerDelegate"))
    {
      delegateQueue = self->_delegateQueue;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __53__VCLinkProbingHandler_resetAggregatedProbingResults__block_invoke;
      v4[3] = &unk_1E9E521C0;
      v4[4] = self;
      dispatch_async(delegateQueue, v4);
    }
  }
  -[NSMutableDictionary removeAllObjects](self->_aggregatedProbingResults, "removeAllObjects");
}

uint64_t __53__VCLinkProbingHandler_resetAggregatedProbingResults__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "didUpdateLinkPreferenceOrder:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)requestStats
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d LinkProbing: requestStats failed: Invalid linkID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __36__VCLinkProbingHandler_requestStats__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264), *MEMORY[0x1E0D33ED0]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  v4 = objc_msgSend(v3, "numberWithUnsignedLongLong:");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D33FD0]);
  if (objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"))
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "count");
    v6 = *(_DWORD **)(a1 + 32);
    if (v5 == v6[60])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 240);
          v17 = 136315906;
          v18 = v7;
          v19 = 2080;
          v20 = "-[VCLinkProbingHandler requestStats]_block_invoke";
          v21 = 1024;
          v22 = 482;
          v23 = 1024;
          LODWORD(v24) = v9;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Request count reached max=%d", (uint8_t *)&v17, 0x22u);
        }
      }
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "didReceiveStatsResponse:", 0);
      v6 = *(_DWORD **)(a1 + 32);
    }
    objc_msgSend((id)objc_msgSend(v6, "linkProbingHandlerDelegate"), "requestStatsWithOptions:", v2);
    v10 = micro();
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272)));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(v14 + 272);
        v16 = objc_msgSend(*(id *)(v14 + 280), "count");
        v17 = 136316418;
        v18 = v12;
        v19 = 2080;
        v20 = "-[VCLinkProbingHandler requestStats]_block_invoke";
        v21 = 1024;
        v22 = 488;
        v23 = 2048;
        v24 = v15;
        v25 = 2048;
        v26 = v10;
        v27 = 2048;
        v28 = v16;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Requesting stats with statsId=%llu at time=%f requestCount=%lu", (uint8_t *)&v17, 0x3Au);
      }
    }
  }

}

- (void)dispatchedUpdateQRProbingResult:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int ErrorLogLevelForModule;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *delegateQueue;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_qrLinkProbingState != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v13 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v22 = v13;
    v23 = 2080;
    v24 = "-[VCLinkProbingHandler dispatchedUpdateQRProbingResult:]";
    v25 = 1024;
    v26 = 496;
    v12 = " [%s] %s:%d LinkProbing: dispatchedUpdateQRProbingResult failed: QR link probing not in progress";
LABEL_17:
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x1Cu);
    return;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v14 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v22 = v14;
    v23 = 2080;
    v24 = "-[VCLinkProbingHandler dispatchedUpdateQRProbingResult:]";
    v25 = 1024;
    v26 = 500;
    v12 = " [%s] %s:%d LinkProbing: dispatchedUpdateQRProbingResult failed: QR probing result is empty";
    goto LABEL_17;
  }
  v5 = *MEMORY[0x1E0D33FD0];
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33FD0]);
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33FD8]);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (ErrorLogLevelForModule < 7)
      return;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v22 = v10;
    v23 = 2080;
    v24 = "-[VCLinkProbingHandler dispatchedUpdateQRProbingResult:]";
    v25 = 1024;
    v26 = 506;
    v12 = " [%s] %s:%d LinkProbing: dispatchedUpdateQRProbingResult failed: QR probing result is invalid";
    goto LABEL_17;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(a3, "objectForKeyedSubscript:", v5);
      v18 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33FE0]);
      *(_DWORD *)buf = 136316162;
      v22 = v15;
      v23 = 2080;
      v24 = "-[VCLinkProbingHandler dispatchedUpdateQRProbingResult:]";
      v25 = 1024;
      v26 = 509;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Received stat response with statsID=%@ at timestamp=%@", buf, 0x30u);
    }
  }
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VCLinkProbingHandler_dispatchedUpdateQRProbingResult___block_invoke;
  block[3] = &unk_1E9E527D0;
  block[4] = self;
  block[5] = v6;
  block[6] = v7;
  dispatch_async(delegateQueue, block);
}

double *__56__VCLinkProbingHandler_dispatchedUpdateQRProbingResult___block_invoke(uint64_t a1)
{
  double *result;
  double v3;

  result = (double *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (result)
  {
    v3 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 48), "unsignedLongValue");
    result = *(double **)(a1 + 32);
    if (result[31] >= v3)
    {
      if (objc_msgSend(result, "linkProbingHandlerDelegate"))
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "didReceiveStatsResponse:", 1);
      return (double *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    }
  }
  return result;
}

- (unsigned)linkProbingCapabilityVersion
{
  return self->_linkProbingCapabilityVersion;
}

- (void)setLinkProbingCapabilityVersion:(unsigned __int8)a3
{
  self->_linkProbingCapabilityVersion = a3;
}

- (NSSet)activelyProbingLinkIDs
{
  return &self->_activelyProbingLinkIDs->super;
}

- (BOOL)isDuplicationEnabled
{
  return self->_isDuplicationEnabled;
}

- (void)setIsDuplicationEnabled:(BOOL)a3
{
  self->_isDuplicationEnabled = a3;
}

- (void)startActiveProbingOnLinks:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 158;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d LinkProbing: startActiveProbing failed: Link probing not enabled", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)startActiveProbingOnLinks:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d LinkProbing: startActiveProbing failed: Invalid linkID list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d LinkProbing: stopActiveProbing failed: Invalid linkID list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d LinkProbing: stopActiveProbing failed: Link probing not in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __36__VCLinkProbingHandler_setQRLinkID___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d LinkProbing: setQRLinkID failed: Invalid linkID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCLinkProbingHandler_startActiveProbingQRLink__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d LinkProbing: startActiveProbingQRLink failed: linkID is not set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__VCLinkProbingHandler_stopActiveProbingQRLink__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d LinkProbing: stopActiveProbingQRLink failed: QR link probing not in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__VCLinkProbingHandler_queryProbingResults__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d LinkProbing: queryProbingResults failed: No links are currently being probed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__VCLinkProbingHandler_queryProbingResults__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d LinkProbing: queryProbingResults failed: Link probing not in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
