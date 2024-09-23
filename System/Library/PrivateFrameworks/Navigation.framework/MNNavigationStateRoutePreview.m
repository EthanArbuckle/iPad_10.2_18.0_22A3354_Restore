@implementation MNNavigationStateRoutePreview

- (unint64_t)type
{
  return 2;
}

- (BOOL)requiresHighMemoryThreshold
{
  return 1;
}

- (unint64_t)desiredLocationProviderType
{
  return 0;
}

- (BOOL)shouldClearStoredRoutes
{
  return 0;
}

- (id)traceManager
{
  return -[MNNavigationSessionManager traceManager](self->_navigationSessionManager, "traceManager");
}

- (id)simulationLocationProvider
{
  return -[MNNavigationSessionManager simulationLocationProvider](self->_navigationSessionManager, "simulationLocationProvider");
}

- (MNNavigationStateRoutePreview)initWithStateManager:(id)a3 previewRoutes:(id)a4 selectedRouteIndex:(unint64_t)a5
{
  id v9;
  MNNavigationStateRoutePreview *v10;
  MNNavigationStateRoutePreview *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MNNavigationStateRoutePreview;
  v10 = -[MNNavigationState initWithStateManager:](&v13, sel_initWithStateManager_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_previewRoutes, a4);
    v11->_selectedRouteIndex = a5;
  }

  return v11;
}

- (void)enterState
{
  MNNavigationSessionManager *v3;
  void *v4;
  void *v5;
  MNNavigationSessionManager *v6;
  MNNavigationSessionManager *navigationSessionManager;
  void *v8;
  void *v9;
  NSArray *previewRoutes;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MNNavigationStateRoutePreview;
  -[MNNavigationState enterState](&v11, sel_enterState);
  v3 = [MNNavigationSessionManager alloc];
  -[MNNavigationState stateManager](self, "stateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MNNavigationSessionManager initWithAuditToken:](v3, "initWithAuditToken:", v5);
  navigationSessionManager = self->_navigationSessionManager;
  self->_navigationSessionManager = v6;

  -[MNNavigationState stateManager](self, "stateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationSessionManager setDelegate:](self->_navigationSessionManager, "setDelegate:", v9);

  previewRoutes = self->_previewRoutes;
  if (previewRoutes)
    -[MNNavigationSessionManager setRoutesForPreview:selectedRouteIndex:](self->_navigationSessionManager, "setRoutesForPreview:selectedRouteIndex:", previewRoutes, self->_selectedRouteIndex);
}

- (void)leaveState
{
  MNNavigationSessionManager *navigationSessionManager;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MNNavigationStateRoutePreview;
  -[MNNavigationState leaveState](&v4, sel_leaveState);
  -[MNNavigationSessionManager setDelegate:](self->_navigationSessionManager, "setDelegate:", 0);
  navigationSessionManager = self->_navigationSessionManager;
  self->_navigationSessionManager = 0;

}

- (void)setRoutesForPreview:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  -[MNNavigationSessionManager setRoutesForPreview:selectedRouteIndex:](self->_navigationSessionManager, "setRoutesForPreview:selectedRouteIndex:", a3, a4);
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
  +[MNNavigationStateGuidance guidanceStateForStartDetails:stateManager:navigationSessionManager:](MNNavigationStateGuidance, "guidanceStateForStartDetails:stateManager:navigationSessionManager:", v5, v6, self->_navigationSessionManager);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MNNavigationState stateManager](self, "stateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionToState:", v8);

  }
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  MNNavigationStateNoDestination *v4;
  void *v5;
  void *v6;
  MNNavigationStateNoDestination *v7;

  -[MNNavigationSessionManager stopNavigationWithReason:](self->_navigationSessionManager, "stopNavigationWithReason:", a3);
  v4 = [MNNavigationStateNoDestination alloc];
  -[MNNavigationState stateManager](self, "stateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MNNavigationState initWithStateManager:](v4, "initWithStateManager:", v5);

  -[MNNavigationState stateManager](self, "stateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionToState:", v7);

}

- (void)pauseRealtimeUpdatesForSubscriber:(id)a3
{
  -[MNNavigationSessionManager pauseRealtimeUpdatesForSubscriber:](self->_navigationSessionManager, "pauseRealtimeUpdatesForSubscriber:", a3);
}

- (void)resumeRealtimeUpdatesForSubscriber:(id)a3
{
  -[MNNavigationSessionManager resumeRealtimeUpdatesForSubscriber:](self->_navigationSessionManager, "resumeRealtimeUpdatesForSubscriber:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionManager, 0);
  objc_storeStrong((id *)&self->_previewRoutes, 0);
}

@end
