@implementation MNNavigationStateRoutePreviewGuidance

- (MNNavigationStateRoutePreviewGuidance)initWithStateManager:(id)a3 navigationSessionManager:(id)a4 startDetails:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNNavigationStateRoutePreviewGuidance;
  return -[MNNavigationStateGuidance initWithStateManager:navigationSessionManager:startDetails:](&v6, sel_initWithStateManager_navigationSessionManager_startDetails_, a3, a4, a5);
}

- (unint64_t)type
{
  return 3;
}

- (void)setGuidanceType:(unint64_t)a3
{
  __objc2_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    if (a3 != 1)
      return;
    v4 = MNNavigationStateLowGuidance;
  }
  else
  {
    v4 = MNNavigationStateGuidanceTurnByTurn;
  }
  v5 = [v4 alloc];
  -[MNNavigationState stateManager](self, "stateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "initWithStateManager:navigationSessionManager:startDetails:", v6, self->super._navigationSessionManager, 0);

  if (v8)
  {
    -[MNNavigationState stateManager](self, "stateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionToState:", v8);

  }
}

- (void)enterState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MNNavigationStateRoutePreviewGuidance;
  -[MNNavigationStateGuidance enterState](&v3, sel_enterState);
  -[MNNavigationSessionManager setIsNavigatingInLowGuidance:](self->super._navigationSessionManager, "setIsNavigatingInLowGuidance:", 0);
}

- (void)stopNavigationWithReason:(unint64_t)a3
{
  MNNavigationStateRoutePreview *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MNNavigationStateRoutePreview *v11;

  v5 = [MNNavigationStateRoutePreview alloc];
  -[MNNavigationState stateManager](self, "stateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationSessionManager routeManager](self->super._navigationSessionManager, "routeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewRoutes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationSessionManager routeManager](self->super._navigationSessionManager, "routeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MNNavigationStateRoutePreview initWithStateManager:previewRoutes:selectedRouteIndex:](v5, "initWithStateManager:previewRoutes:selectedRouteIndex:", v6, v8, objc_msgSend(v9, "selectedRouteIndex"));

  -[MNNavigationSessionManager stopNavigationWithReason:](self->super._navigationSessionManager, "stopNavigationWithReason:", a3);
  -[MNNavigationState stateManager](self, "stateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitionToState:", v11);

}

@end
