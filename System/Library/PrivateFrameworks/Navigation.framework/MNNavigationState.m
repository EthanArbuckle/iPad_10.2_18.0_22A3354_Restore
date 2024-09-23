@implementation MNNavigationState

- (unint64_t)type
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "-[MNNavigationState type]";
    v6 = 2080;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Navigation/NavigationState/MNNavigationState.m";
    v8 = 1024;
    v9 = 27;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v4, 0x1Cu);
  }

  return -1;
}

- (BOOL)requiresHighMemoryThreshold
{
  return 0;
}

- (BOOL)requiresLocationAccess
{
  unint64_t v3;

  v3 = -[MNNavigationState desiredLocationProviderType](self, "desiredLocationProviderType");
  if (v3 != 1)
    LOBYTE(v3) = -[MNNavigationState desiredLocationProviderType](self, "desiredLocationProviderType") == 2;
  return v3;
}

- (unint64_t)desiredLocationProviderType
{
  return 0;
}

- (MNLocationProviderCLParameters)clParameters
{
  return 0;
}

- (BOOL)shouldClearStoredRoutes
{
  return 1;
}

- (MNNavigationTraceManager)traceManager
{
  return 0;
}

- (MNSimulationLocationProvider)simulationLocationProvider
{
  return 0;
}

- (MNNavigationState)init
{
  return -[MNNavigationState initWithStateManager:](self, "initWithStateManager:", 0);
}

- (MNNavigationState)initWithStateManager:(id)a3
{
  id v4;
  char *v5;
  MNNavigationState *v6;
  void *v7;
  MNNavigationState *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationState;
  v5 = -[MNNavigationState init](&v10, sel_init);
  v6 = (MNNavigationState *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_1B0BF3780;
    objc_storeWeak((id *)v5 + 3, v4);
    if (-[MNNavigationState requiresHighMemoryThreshold](v6, "requiresHighMemoryThreshold"))
    {
      +[MNXPCTransactionManager sharedInstance](MNXPCTransactionManager, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addHighMemoryThresholdRequest:", v6);

    }
    v8 = v6;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[MNNavigationState requiresHighMemoryThreshold](self, "requiresHighMemoryThreshold"))
  {
    +[MNXPCTransactionManager sharedInstance](MNXPCTransactionManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeHighMemoryThresholdRequest:afterDelay:", self, 3.0);

  }
  v4.receiver = self;
  v4.super_class = (Class)MNNavigationState;
  -[MNNavigationState dealloc](&v4, sel_dealloc);
}

- (void)forwardInvocation:(id)a3
{
  const char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (const char *)objc_msgSend(a3, "selector");
  if (-[MNNavigationState _isSelectorValidForForwarding:](self, "_isSelectorValidForForwarding:", v4))
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = objc_opt_class();
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "%@ is not supported by state %@", (uint8_t *)&v7, 0x16u);

    }
  }
  else
  {
    -[MNNavigationState doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", v4);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (-[MNNavigationState _isSelectorValidForForwarding:](self, "_isSelectorValidForForwarding:"))
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "_navigation_methodSignatureForEmptyMethod");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MNNavigationState;
    -[MNNavigationState methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if (-[MNNavigationState _isSelectorValidForForwarding:](self, "_isSelectorValidForForwarding:"))
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MNNavigationState;
  return -[MNNavigationState respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (BOOL)_isSelectorValidForForwarding:(SEL)a3
{
  return MNProtocolDeclaresSelector(&unk_1EEEEB480, a3);
}

- (double)locationUpdateInterval
{
  return self->_locationUpdateInterval;
}

- (double)suggestionUpdateFrequency
{
  return self->_suggestionUpdateFrequency;
}

- (MNNavigationStateManager)stateManager
{
  return (MNNavigationStateManager *)objc_loadWeakRetained((id *)&self->_stateManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateManager);
}

@end
