@implementation MNNavigationStateNoDestination

- (unint64_t)type
{
  return 1;
}

- (unint64_t)desiredLocationProviderType
{
  void *v2;
  void *v3;

  -[MNNavigationState traceManager](self, "traceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tracePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 3;
  else
    return 0;
}

- (void)postEnterState
{
  +[MNNavigationTraceManager clearOldTraces](MNNavigationTraceManager, "clearOldTraces");
}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  id v6;
  MNNavigationStateRoutePreview *v7;
  void *v8;
  MNNavigationStateRoutePreview *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count") && objc_msgSend(v6, "count") > a4)
  {
    v7 = [MNNavigationStateRoutePreview alloc];
    -[MNNavigationState stateManager](self, "stateManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MNNavigationStateRoutePreview initWithStateManager:previewRoutes:selectedRouteIndex:](v7, "initWithStateManager:previewRoutes:selectedRouteIndex:", v8, v6, a4);

    -[MNNavigationState stateManager](self, "stateManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transitionToState:", v9);

  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2048;
      v15 = a4;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "setting nil routes (%@) or selectedRouteIndex out of bound (%ld) for route previews while in state MNNavigationStateNoDestination is a no-op, returning early", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (void)startNavigationWithDetails:(id)a3 activeBlock:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[MNNavigationState stateManager](self, "stateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MNNavigationStateGuidance guidanceStateForStartDetails:stateManager:navigationSessionManager:](MNNavigationStateGuidance, "guidanceStateForStartDetails:stateManager:navigationSessionManager:", v5, v6, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MNNavigationState stateManager](self, "stateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionToState:", v8);

  }
}

@end
