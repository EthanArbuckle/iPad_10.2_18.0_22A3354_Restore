@implementation MNNavigationStateLowGuidance

- (unint64_t)type
{
  return 5;
}

- (void)postEnterState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MNNavigationStateLowGuidance;
  -[MNNavigationStateGuidance postEnterState](&v3, sel_postEnterState);
  -[MNNavigationSessionManager setIsNavigatingInLowGuidance:](self->super._navigationSessionManager, "setIsNavigatingInLowGuidance:", 1);
}

- (void)setGuidanceType:(unint64_t)a3
{
  __objc2_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3 == 2)
  {
    v4 = MNNavigationStateRoutePreviewGuidance;
  }
  else
  {
    if (a3)
      return;
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

@end
