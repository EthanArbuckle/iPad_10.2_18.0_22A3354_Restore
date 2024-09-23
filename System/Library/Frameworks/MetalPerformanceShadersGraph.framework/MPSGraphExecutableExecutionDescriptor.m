@implementation MPSGraphExecutableExecutionDescriptor

- (void)requestProfilingStatsWithDictionary:(id)a3 profilingCallback:(id)a4
{
  void *v6;
  id profilingCallback;
  NSMutableDictionary *v8;
  NSMutableDictionary *profilingDictionary;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void *)MEMORY[0x186DA1DA0](a4);
  profilingCallback = self->_profilingCallback;
  self->_profilingCallback = v6;

  v8 = (NSMutableDictionary *)objc_msgSend(v13, "mutableCopy");
  profilingDictionary = self->_profilingDictionary;
  self->_profilingDictionary = v8;

  -[NSMutableDictionary objectForKey:](self->_profilingDictionary, "objectForKey:", CFSTR("MPSGRAPH_PROFILING_BEFORE_FIRST_COMMIT_TIMESTAMP"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    self->_profilingBitmap |= 1uLL;
  -[NSMutableDictionary objectForKey:](self->_profilingDictionary, "objectForKey:", CFSTR("MPSGRAPH_PROFILING_AFTER_FIRST_COMMIT_TIMESTAMP"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    self->_profilingBitmap |= 2uLL;
  -[NSMutableDictionary objectForKey:](self->_profilingDictionary, "objectForKey:", CFSTR("MPSGRAPH_PROFILING_FIRST_MTLCOMMANDBUFFER_SCHEDULED_TIMESTAMP"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    self->_profilingBitmap |= 4uLL;

}

- (MPSGraphExecutableExecutionDescriptor)init
{
  MPSGraphExecutableExecutionDescriptor *v2;
  id completionHandler;
  id scheduledHandler;
  id scheduledGraphHandler;
  id completionGraphHandler;
  NSMutableArray *waitEvents;
  NSMutableArray *anePowerWaitEvents;
  NSMutableArray *signalEvents;
  id profilingCallback;
  NSMutableDictionary *profilingDictionary;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MPSGraphExecutableExecutionDescriptor;
  v2 = -[MPSGraphExecutableExecutionDescriptor init](&v13, sel_init);
  v2->_waitUntilCompleted = 0;
  completionHandler = v2->_completionHandler;
  v2->_completionHandler = 0;

  scheduledHandler = v2->_scheduledHandler;
  v2->_scheduledHandler = 0;

  scheduledGraphHandler = v2->_scheduledGraphHandler;
  v2->_scheduledGraphHandler = 0;

  completionGraphHandler = v2->_completionGraphHandler;
  v2->_completionGraphHandler = 0;

  v2->_enableCommitAndContinue = 1;
  v2->_enableProfilingOpNames = 0;
  v2->_briefProfilingOpNames = 0;
  v2->_simulateANECompileFailure = 0;
  v2->_simulateANELoadModelFailure = 0;
  v2->_breakUpMetalEncoders = 0;
  v2->_generateRuntimeExecutionReport = 0;
  waitEvents = v2->_waitEvents;
  v2->_waitEvents = 0;

  anePowerWaitEvents = v2->_anePowerWaitEvents;
  v2->_anePowerWaitEvents = 0;

  signalEvents = v2->_signalEvents;
  v2->_signalEvents = 0;

  v2->_maximumNumberOfEncodingThreads = 0;
  v2->_disableSynchronizeResults = 0;
  profilingCallback = v2->_profilingCallback;
  v2->_profilingCallback = 0;

  profilingDictionary = v2->_profilingDictionary;
  v2->_profilingDictionary = 0;

  v2->_profilingBitmap = 0;
  v2->_numberOfCommitsByMPSGraph = 0;
  v2->_disableANECaching = 0;
  v2->_disableANEFallback = 0;
  return v2;
}

- (MPSGraphExecutableExecutionDescriptor)initWithGraphExecutionDescriptor:(id)a3
{
  id *v4;
  MPSGraphExecutableExecutionDescriptor *v5;
  id completionHandler;
  id scheduledHandler;
  uint64_t v8;
  id scheduledGraphHandler;
  uint64_t v10;
  id completionGraphHandler;

  v4 = (id *)a3;
  v5 = -[MPSGraphExecutableExecutionDescriptor init](self, "init");
  v5->_waitUntilCompleted = objc_msgSend(v4, "waitUntilCompleted");
  completionHandler = v5->_completionHandler;
  v5->_completionHandler = 0;

  scheduledHandler = v5->_scheduledHandler;
  v5->_scheduledHandler = 0;

  objc_msgSend(v4, "scheduledHandler");
  v8 = objc_claimAutoreleasedReturnValue();
  scheduledGraphHandler = v5->_scheduledGraphHandler;
  v5->_scheduledGraphHandler = (id)v8;

  objc_msgSend(v4, "completionHandler");
  v10 = objc_claimAutoreleasedReturnValue();
  completionGraphHandler = v5->_completionGraphHandler;
  v5->_completionGraphHandler = (id)v10;

  v5->_enableCommitAndContinue = objc_msgSend(v4, "enableCommitAndContinue");
  v5->_enableProfilingOpNames = objc_msgSend(v4, "enableProfilingOpNames");
  v5->_briefProfilingOpNames = objc_msgSend(v4, "briefProfilingOpNames");
  v5->_simulateANECompileFailure = objc_msgSend(v4, "simulateANECompileFailure");
  v5->_simulateANELoadModelFailure = objc_msgSend(v4, "simulateANELoadModelFailure");
  v5->_breakUpMetalEncoders = objc_msgSend(v4, "breakUpMetalEncoders");
  v5->_generateRuntimeExecutionReport = objc_msgSend(v4, "generateRuntimeExecutionReport");
  objc_storeStrong((id *)&v5->_waitEvents, v4[1]);
  objc_storeStrong((id *)&v5->_anePowerWaitEvents, v4[3]);
  objc_storeStrong((id *)&v5->_signalEvents, v4[2]);
  v5->_maximumNumberOfEncodingThreads = objc_msgSend(v4, "maximumNumberOfEncodingThreads");
  v5->_disableSynchronizeResults = objc_msgSend(v4, "disableSynchronizeResults");
  v5->_disableANECaching = objc_msgSend(v4, "disableANECaching");
  v5->_disableANEFallback = objc_msgSend(v4, "disableANEFallback");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphExecutableExecutionDescriptor *v4;
  uint64_t v5;
  NSMutableArray *waitEvents;
  uint64_t v7;
  NSMutableArray *signalEvents;
  uint64_t v9;
  id profilingCallback;
  uint64_t v11;
  NSMutableDictionary *profilingDictionary;

  v4 = [MPSGraphExecutableExecutionDescriptor alloc];
  -[MPSGraphExecutableExecutionDescriptor setCompletionHandler:](v4, "setCompletionHandler:", self->_completionHandler);
  -[MPSGraphExecutableExecutionDescriptor setScheduledHandler:](v4, "setScheduledHandler:", self->_scheduledHandler);
  -[MPSGraphExecutableExecutionDescriptor setScheduledGraphHandler:](v4, "setScheduledGraphHandler:", self->_scheduledGraphHandler);
  -[MPSGraphExecutableExecutionDescriptor setCompletionGraphHandler:](v4, "setCompletionGraphHandler:", self->_completionGraphHandler);
  -[MPSGraphExecutableExecutionDescriptor setEnableCommitAndContinue:](v4, "setEnableCommitAndContinue:", self->_enableCommitAndContinue);
  -[MPSGraphExecutableExecutionDescriptor setEnableProfilingOpNames:](v4, "setEnableProfilingOpNames:", self->_enableProfilingOpNames);
  -[MPSGraphExecutableExecutionDescriptor setBriefProfilingOpNames:](v4, "setBriefProfilingOpNames:", self->_briefProfilingOpNames);
  -[MPSGraphExecutableExecutionDescriptor setSimulateANECompileFailure:](v4, "setSimulateANECompileFailure:", self->_simulateANECompileFailure);
  -[MPSGraphExecutableExecutionDescriptor setSimulateANELoadModelFailure:](v4, "setSimulateANELoadModelFailure:", self->_simulateANELoadModelFailure);
  -[MPSGraphExecutableExecutionDescriptor setBreakUpMetalEncoders:](v4, "setBreakUpMetalEncoders:", self->_breakUpMetalEncoders);
  -[MPSGraphExecutableExecutionDescriptor setGenerateRuntimeExecutionReport:](v4, "setGenerateRuntimeExecutionReport:", self->_generateRuntimeExecutionReport);
  v5 = -[NSMutableArray copy](self->_waitEvents, "copy");
  waitEvents = v4->_waitEvents;
  v4->_waitEvents = (NSMutableArray *)v5;

  v7 = -[NSMutableArray copy](self->_signalEvents, "copy");
  signalEvents = v4->_signalEvents;
  v4->_signalEvents = (NSMutableArray *)v7;

  -[MPSGraphExecutableExecutionDescriptor setMaximumNumberOfEncodingThreads:](v4, "setMaximumNumberOfEncodingThreads:", self->_maximumNumberOfEncodingThreads);
  -[MPSGraphExecutableExecutionDescriptor setDisableSynchronizeResults:](v4, "setDisableSynchronizeResults:", self->_disableSynchronizeResults);
  v9 = MEMORY[0x186DA1DA0](self->_profilingCallback);
  profilingCallback = v4->_profilingCallback;
  v4->_profilingCallback = (id)v9;

  v11 = -[NSMutableDictionary mutableCopy](self->_profilingDictionary, "mutableCopy");
  profilingDictionary = v4->_profilingDictionary;
  v4->_profilingDictionary = (NSMutableDictionary *)v11;

  v4->_profilingBitmap = self->_profilingBitmap;
  v4->_numberOfCommitsByMPSGraph = self->_numberOfCommitsByMPSGraph;
  v4->_disableANECaching = self->_disableANECaching;
  v4->_disableANEFallback = self->_disableANEFallback;
  return v4;
}

- (void)waitForEvent:(id)event value:(uint64_t)value
{
  MPSGraphWaitEvent *v6;
  NSMutableArray *waitEvents;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;

  v10 = event;
  v6 = -[MPSGraphWaitEvent initWithEvent:value:]([MPSGraphWaitEvent alloc], "initWithEvent:value:", v10, value);
  waitEvents = self->_waitEvents;
  if (!waitEvents)
  {
    v8 = (NSMutableArray *)objc_opt_new();
    v9 = self->_waitEvents;
    self->_waitEvents = v8;

    waitEvents = self->_waitEvents;
  }
  -[NSMutableArray addObject:](waitEvents, "addObject:", v6);

}

- (void)signalEvent:(id)event atExecutionEvent:(MPSGraphExecutionStage)executionStage value:(uint64_t)value
{
  MPSGraphSignalEvent *v8;
  NSMutableArray *signalEvents;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;

  v12 = event;
  v8 = -[MPSGraphSignalEvent initWithEvent:executionStage:value:]([MPSGraphSignalEvent alloc], "initWithEvent:executionStage:value:", v12, executionStage, value);
  signalEvents = self->_signalEvents;
  if (!signalEvents)
  {
    v10 = (NSMutableArray *)objc_opt_new();
    v11 = self->_signalEvents;
    self->_signalEvents = v10;

    signalEvents = self->_signalEvents;
  }
  -[NSMutableArray addObject:](signalEvents, "addObject:", v8);

}

- (void)waitForANEPrePowerUpEvent:(id)a3 value:(unint64_t)a4
{
  NSMutableArray *anePowerWaitEvents;
  NSMutableArray *v7;
  NSMutableArray *v8;
  MPSGraphWaitEvent *v9;
  id v10;

  v10 = a3;
  anePowerWaitEvents = self->_anePowerWaitEvents;
  if (!anePowerWaitEvents)
  {
    v7 = (NSMutableArray *)objc_opt_new();
    v8 = self->_anePowerWaitEvents;
    self->_anePowerWaitEvents = v7;

    anePowerWaitEvents = self->_anePowerWaitEvents;
  }
  -[NSMutableArray count](anePowerWaitEvents, "count");
  if (-[NSMutableArray count](self->_anePowerWaitEvents, "count") && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v9 = -[MPSGraphWaitEvent initWithEvent:value:]([MPSGraphWaitEvent alloc], "initWithEvent:value:", v10, a4);
  -[NSMutableArray addObject:](self->_anePowerWaitEvents, "addObject:", v9);

}

- (unint64_t)numberOfCommitsByMPSGraph
{
  return self->_numberOfCommitsByMPSGraph;
}

- (MPSGraphExecutableScheduledHandler)scheduledHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setScheduledHandler:(MPSGraphExecutableScheduledHandler)scheduledHandler
{
  objc_setProperty_atomic_copy(self, a2, scheduledHandler, 80);
}

- (MPSGraphExecutableCompletionHandler)completionHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setCompletionHandler:(MPSGraphExecutableCompletionHandler)completionHandler
{
  objc_setProperty_atomic_copy(self, a2, completionHandler, 88);
}

- (BOOL)waitUntilCompleted
{
  return self->_waitUntilCompleted;
}

- (void)setWaitUntilCompleted:(BOOL)waitUntilCompleted
{
  self->_waitUntilCompleted = waitUntilCompleted;
}

- (BOOL)enableCommitAndContinue
{
  return self->_enableCommitAndContinue;
}

- (void)setEnableCommitAndContinue:(BOOL)a3
{
  self->_enableCommitAndContinue = a3;
}

- (id)scheduledGraphHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setScheduledGraphHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (id)completionGraphHandler
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setCompletionGraphHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (BOOL)simulateANECompileFailure
{
  return self->_simulateANECompileFailure;
}

- (void)setSimulateANECompileFailure:(BOOL)a3
{
  self->_simulateANECompileFailure = a3;
}

- (BOOL)simulateANELoadModelFailure
{
  return self->_simulateANELoadModelFailure;
}

- (void)setSimulateANELoadModelFailure:(BOOL)a3
{
  self->_simulateANELoadModelFailure = a3;
}

- (BOOL)disableSynchronizeResults
{
  return self->_disableSynchronizeResults;
}

- (void)setDisableSynchronizeResults:(BOOL)a3
{
  self->_disableSynchronizeResults = a3;
}

- (BOOL)disableANECaching
{
  return self->_disableANECaching;
}

- (void)setDisableANECaching:(BOOL)a3
{
  self->_disableANECaching = a3;
}

- (BOOL)disableANEFallback
{
  return self->_disableANEFallback;
}

- (void)setDisableANEFallback:(BOOL)a3
{
  self->_disableANEFallback = a3;
}

- (BOOL)enableProfilingOpNames
{
  return self->_enableProfilingOpNames;
}

- (void)setEnableProfilingOpNames:(BOOL)a3
{
  self->_enableProfilingOpNames = a3;
}

- (BOOL)briefProfilingOpNames
{
  return self->_briefProfilingOpNames;
}

- (void)setBriefProfilingOpNames:(BOOL)a3
{
  self->_briefProfilingOpNames = a3;
}

- (BOOL)breakUpMetalEncoders
{
  return self->_breakUpMetalEncoders;
}

- (void)setBreakUpMetalEncoders:(BOOL)a3
{
  self->_breakUpMetalEncoders = a3;
}

- (BOOL)generateRuntimeExecutionReport
{
  return self->_generateRuntimeExecutionReport;
}

- (void)setGenerateRuntimeExecutionReport:(BOOL)a3
{
  self->_generateRuntimeExecutionReport = a3;
}

- (unint64_t)maximumNumberOfEncodingThreads
{
  return self->_maximumNumberOfEncodingThreads;
}

- (void)setMaximumNumberOfEncodingThreads:(unint64_t)a3
{
  self->_maximumNumberOfEncodingThreads = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionGraphHandler, 0);
  objc_storeStrong(&self->_scheduledGraphHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_scheduledHandler, 0);
  objc_storeStrong((id *)&self->_profilingDictionary, 0);
  objc_storeStrong(&self->_profilingCallback, 0);
  objc_storeStrong((id *)&self->_anePowerWaitEvents, 0);
  objc_storeStrong((id *)&self->_signalEvents, 0);
  objc_storeStrong((id *)&self->_waitEvents, 0);
}

@end
