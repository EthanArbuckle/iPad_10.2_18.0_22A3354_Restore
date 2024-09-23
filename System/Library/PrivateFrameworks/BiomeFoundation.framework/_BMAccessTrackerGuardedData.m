@implementation _BMAccessTrackerGuardedData

- (_BMAccessTrackerGuardedData)init
{
  _BMAccessTrackerGuardedData *v2;
  uint64_t v3;
  NSMutableDictionary *loggedReads;
  uint64_t v5;
  NSMutableDictionary *loggedWrites;
  uint64_t v7;
  NSMutableDictionary *cachedSandboxCheckResults;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_BMAccessTrackerGuardedData;
  v2 = -[_BMAccessTrackerGuardedData init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    loggedReads = v2->_loggedReads;
    v2->_loggedReads = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    loggedWrites = v2->_loggedWrites;
    v2->_loggedWrites = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    cachedSandboxCheckResults = v2->_cachedSandboxCheckResults;
    v2->_cachedSandboxCheckResults = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (uint64_t)loggedReads
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)loggedWrites
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)cachedSandboxCheckResults
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSandboxCheckResults, 0);
  objc_storeStrong((id *)&self->_loggedWrites, 0);
  objc_storeStrong((id *)&self->_loggedReads, 0);
}

@end
