@implementation MPSGraphExecutionDescriptor

- (MPSGraphExecutionDescriptor)init
{
  MPSGraphExecutionDescriptor *v2;
  MPSGraphCompilationDescriptor *compilationDescriptor;
  uint64_t v4;
  NSMutableArray *waitEvents;
  uint64_t v6;
  NSMutableArray *anePowerWaitEvents;
  uint64_t v8;
  NSMutableArray *signalEvents;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPSGraphExecutionDescriptor;
  v2 = -[MPSGraphExecutionDescriptor init](&v11, sel_init);
  compilationDescriptor = v2->_compilationDescriptor;
  v2->_compilationDescriptor = 0;

  v2->_enableCommitAndContinue = 1;
  v2->_enableProfilingOpNames = 0;
  v2->_briefProfilingOpNames = 0;
  v2->_simulateANECompileFailure = 0;
  v2->_simulateANELoadModelFailure = 0;
  v2->_breakUpMetalEncoders = 0;
  v2->_generateRuntimeExecutionReport = 0;
  v4 = objc_opt_new();
  waitEvents = v2->_waitEvents;
  v2->_waitEvents = (NSMutableArray *)v4;

  v6 = objc_opt_new();
  anePowerWaitEvents = v2->_anePowerWaitEvents;
  v2->_anePowerWaitEvents = (NSMutableArray *)v6;

  v8 = objc_opt_new();
  signalEvents = v2->_signalEvents;
  v2->_signalEvents = (NSMutableArray *)v8;

  v2->_maximumNumberOfEncodingThreads = 0;
  return v2;
}

- (void)waitForEvent:(id)event value:(uint64_t)value
{
  MPSGraphWaitEvent *v6;
  id v7;

  v7 = event;
  v6 = -[MPSGraphWaitEvent initWithEvent:value:]([MPSGraphWaitEvent alloc], "initWithEvent:value:", v7, value);
  -[NSMutableArray addObject:](self->_waitEvents, "addObject:", v6);

}

- (void)waitForANEPrePowerUpEvent:(id)a3 value:(unint64_t)a4
{
  MPSGraphWaitEvent *v6;
  id v7;

  v7 = a3;
  -[NSMutableArray count](self->_anePowerWaitEvents, "count");
  if (-[NSMutableArray count](self->_anePowerWaitEvents, "count") && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v6 = -[MPSGraphWaitEvent initWithEvent:value:]([MPSGraphWaitEvent alloc], "initWithEvent:value:", v7, a4);
  -[NSMutableArray addObject:](self->_anePowerWaitEvents, "addObject:", v6);

}

- (void)signalEvent:(id)event atExecutionEvent:(MPSGraphExecutionStage)executionStage value:(uint64_t)value
{
  MPSGraphSignalEvent *v8;
  id v9;

  v9 = event;
  v8 = -[MPSGraphSignalEvent initWithEvent:executionStage:value:]([MPSGraphSignalEvent alloc], "initWithEvent:executionStage:value:", v9, executionStage, value);
  -[NSMutableArray addObject:](self->_signalEvents, "addObject:", v8);

}

- (MPSGraphCompilationDescriptor)compilationDescriptor
{
  return (MPSGraphCompilationDescriptor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor
{
  objc_setProperty_atomic_copy(self, a2, compilationDescriptor, 48);
}

- (MPSGraphScheduledHandler)scheduledHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setScheduledHandler:(MPSGraphScheduledHandler)scheduledHandler
{
  objc_setProperty_atomic_copy(self, a2, scheduledHandler, 56);
}

- (MPSGraphCompletionHandler)completionHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setCompletionHandler:(MPSGraphCompletionHandler)completionHandler
{
  objc_setProperty_atomic_copy(self, a2, completionHandler, 64);
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
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_scheduledHandler, 0);
  objc_storeStrong((id *)&self->_compilationDescriptor, 0);
  objc_storeStrong((id *)&self->_anePowerWaitEvents, 0);
  objc_storeStrong((id *)&self->_signalEvents, 0);
  objc_storeStrong((id *)&self->_waitEvents, 0);
}

@end
