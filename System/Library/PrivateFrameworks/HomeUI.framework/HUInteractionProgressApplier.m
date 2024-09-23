@implementation HUInteractionProgressApplier

+ (id)applyInteractionProgress:(id)a3 withApplier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "applierWithInteractionProgress:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUApplier registerStandaloneApplier:](HUApplier, "registerStandaloneApplier:", v11);
  objc_initWeak(&location, v11);
  objc_msgSend(v11, "addApplierBlock:", v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__HUInteractionProgressApplier_applyInteractionProgress_withApplier_completion___block_invoke;
  v14[3] = &unk_1E6F4CB00;
  v12 = v10;
  v15 = v12;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v11, "addCompletionBlock:", v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  return v11;
}

void __80__HUInteractionProgressApplier_applyInteractionProgress_withApplier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[HUApplier unregisterStandaloneApplier:](HUApplier, "unregisterStandaloneApplier:", WeakRetained);

}

+ (id)applierWithInteractionProgress:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInteractionProgress:", v4);

  return v5;
}

- (HUInteractionProgressApplier)initWithInteractionProgress:(id)a3
{
  id v6;
  HUInteractionProgressApplier *v7;
  HUInteractionProgressApplier *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUInteractionProgressApplier.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress"));

  }
  v12.receiver = self;
  v12.super_class = (Class)HUInteractionProgressApplier;
  v7 = -[HUApplier init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_interactionProgress, a3);
    -[HUInteractionProgressApplier setBoundProgressValues:](v8, "setBoundProgressValues:", 1);
    -[HUInteractionProgressApplier setCompletesAtTargetState:](v8, "setCompletesAtTargetState:", 1);
    +[HUAnimationSettings settingsWithDuration:curve:](HUAnimationSettings, "settingsWithDuration:curve:", 3, 0.075);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInteractionProgressApplier setTransitionAnimationSettings:](v8, "setTransitionAnimationSettings:", v9);

  }
  return v8;
}

- (HUInteractionProgressApplier)init
{
  -[HUInteractionProgressApplier doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (BOOL)isInteractive
{
  return 1;
}

- (BOOL)start
{
  _BOOL4 v3;
  void *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUInteractionProgressApplier;
  v3 = -[HUApplier start](&v7, sel_start);
  if (v3)
  {
    -[HUInteractionProgressApplier interactionProgress](self, "interactionProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addProgressObserver:", self);

    -[HUInteractionProgressApplier _currentInteractionProgress](self, "_currentInteractionProgress");
    if (v5 >= 1.0)
    {
      -[HUInteractionProgressApplier _updateCurrentProgress](self, "_updateCurrentProgress");
      -[HUInteractionProgressApplier _completeSuccessfullyIfAnimationsComplete](self, "_completeSuccessfullyIfAnimationsComplete");
    }
  }
  return v3;
}

- (double)_currentInteractionProgress
{
  void *v3;
  double v4;
  double v5;
  _BOOL4 v6;
  double result;

  -[HUInteractionProgressApplier interactionProgress](self, "interactionProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "percentComplete");
  v5 = v4;

  v6 = -[HUInteractionProgressApplier boundProgressValues](self, "boundProgressValues");
  result = fmax(fmin(v5, 1.0), 0.0);
  if (!v6)
    return v5;
  return result;
}

- (BOOL)_interactionProgressChangedSignificantly
{
  double v3;
  double v4;
  double v5;

  -[HUInteractionProgressApplier _currentInteractionProgress](self, "_currentInteractionProgress");
  v4 = v3;
  -[HUInteractionProgressApplier previousInteractionProgress](self, "previousInteractionProgress");
  return vabdd_f64(v4, v5) > 0.6;
}

- (void)_updateCurrentProgress
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  -[HUInteractionProgressApplier transitionAnimationSettings](self, "transitionAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInteractionProgressApplier significantProgressChangeAnimationSettings](self, "significantProgressChangeAnimationSettings");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[HUInteractionProgressApplier _interactionProgressChangedSignificantly](self, "_interactionProgressChangedSignificantly");

    if (v6)
    {
      -[HUInteractionProgressApplier significantProgressChangeAnimationSettings](self, "significantProgressChangeAnimationSettings");
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
  }
  if (v3)
  {
    -[HUInteractionProgressApplier animationFromProgress](self, "animationFromProgress");
    v9 = v8;
    -[HUInteractionProgressApplier animationToProgress](self, "animationToProgress");
    v11 = v10;
    -[HUInteractionProgressApplier animationFromProgress](self, "animationFromProgress");
    v13 = v11 - v12;
    -[HUInteractionProgressApplier inFlightAnimation](self, "inFlightAnimation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "progress");
    v16 = v9 + v13 * v15;

    -[HUInteractionProgressApplier inFlightAnimation](self, "inFlightAnimation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cancel");

    -[HUInteractionProgressApplier setAnimationFromProgress:](self, "setAnimationFromProgress:", v16);
    -[HUInteractionProgressApplier _currentInteractionProgress](self, "_currentInteractionProgress");
    -[HUInteractionProgressApplier setAnimationToProgress:](self, "setAnimationToProgress:");
    +[HUAnimationApplier dynamicApplierWithAnimationSettings:](HUAnimationApplier, "dynamicApplierWithAnimationSettings:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInteractionProgressApplier setInFlightAnimation:](self, "setInFlightAnimation:", v18);

    objc_initWeak(&location, self);
    -[HUInteractionProgressApplier inFlightAnimation](self, "inFlightAnimation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __54__HUInteractionProgressApplier__updateCurrentProgress__block_invoke;
    v26[3] = &unk_1E6F4CB28;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v19, "addApplierBlock:", v26);

    -[HUInteractionProgressApplier inFlightAnimation](self, "inFlightAnimation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __54__HUInteractionProgressApplier__updateCurrentProgress__block_invoke_2;
    v24[3] = &unk_1E6F4CB50;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v21, "addCompletionBlock:", v24);

    -[HUInteractionProgressApplier inFlightAnimation](self, "inFlightAnimation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "start");

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    -[HUInteractionProgressApplier inFlightAnimation](self, "inFlightAnimation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cancel");

    -[HUInteractionProgressApplier setInFlightAnimation:](self, "setInFlightAnimation:", 0);
    -[HUInteractionProgressApplier _currentInteractionProgress](self, "_currentInteractionProgress");
    -[HUApplier updateProgress:](self, "updateProgress:");
  }
  -[HUInteractionProgressApplier _currentInteractionProgress](self, "_currentInteractionProgress");
  -[HUInteractionProgressApplier setPreviousInteractionProgress:](self, "setPreviousInteractionProgress:");

}

void __54__HUInteractionProgressApplier__updateCurrentProgress__block_invoke(uint64_t a1, double a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "animationFromProgress");
  v4 = v3;
  objc_msgSend(WeakRetained, "animationToProgress");
  v6 = v5;
  objc_msgSend(WeakRetained, "animationFromProgress");
  objc_msgSend(WeakRetained, "updateProgress:", v4 + (v6 - v7) * a2);

}

void __54__HUInteractionProgressApplier__updateCurrentProgress__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "waitingOnAnimationToComplete"))
  {
    objc_msgSend(WeakRetained, "setWaitingOnAnimationToComplete:", 0);
    objc_msgSend(WeakRetained, "complete:", a2);
  }

}

- (void)interactionProgressDidUpdate:(id)a3
{
  if (!-[HUInteractionProgressApplier waitingOnAnimationToComplete](self, "waitingOnAnimationToComplete", a3))
    -[HUInteractionProgressApplier _updateCurrentProgress](self, "_updateCurrentProgress");
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (-[HUInteractionProgressApplier completesAtTargetState](self, "completesAtTargetState", a3))
  {
    if (v4)
      -[HUInteractionProgressApplier _completeSuccessfullyIfAnimationsComplete](self, "_completeSuccessfullyIfAnimationsComplete");
    else
      -[HUInteractionProgressApplier complete:](self, "complete:", 0);
  }
}

- (void)_completeSuccessfullyIfAnimationsComplete
{
  void *v3;

  -[HUInteractionProgressApplier inFlightAnimation](self, "inFlightAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[HUInteractionProgressApplier setWaitingOnAnimationToComplete:](self, "setWaitingOnAnimationToComplete:", 1);
  else
    -[HUInteractionProgressApplier complete:](self, "complete:", 1);
}

- (BOOL)complete:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUInteractionProgressApplier;
  v4 = -[HUApplier complete:](&v7, sel_complete_, a3);
  if (v4)
  {
    -[HUInteractionProgressApplier setWaitingOnAnimationToComplete:](self, "setWaitingOnAnimationToComplete:", 0);
    -[HUInteractionProgressApplier interactionProgress](self, "interactionProgress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeProgressObserver:", self);

  }
  return v4;
}

- (BOOL)cancel
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUInteractionProgressApplier;
  v3 = -[HUApplier cancel](&v6, sel_cancel);
  -[HUInteractionProgressApplier inFlightAnimation](self, "inFlightAnimation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[HUInteractionProgressApplier setInFlightAnimation:](self, "setInFlightAnimation:", 0);
  return v3;
}

- (UIInteractionProgress)interactionProgress
{
  return self->_interactionProgress;
}

- (HUAnimationSettings)significantProgressChangeAnimationSettings
{
  return self->_significantProgressChangeAnimationSettings;
}

- (void)setSignificantProgressChangeAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_significantProgressChangeAnimationSettings, a3);
}

- (HUAnimationSettings)transitionAnimationSettings
{
  return self->_transitionAnimationSettings;
}

- (void)setTransitionAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_transitionAnimationSettings, a3);
}

- (BOOL)boundProgressValues
{
  return self->_boundProgressValues;
}

- (void)setBoundProgressValues:(BOOL)a3
{
  self->_boundProgressValues = a3;
}

- (BOOL)completesAtTargetState
{
  return self->_completesAtTargetState;
}

- (void)setCompletesAtTargetState:(BOOL)a3
{
  self->_completesAtTargetState = a3;
}

- (double)animationFromProgress
{
  return self->_animationFromProgress;
}

- (void)setAnimationFromProgress:(double)a3
{
  self->_animationFromProgress = a3;
}

- (double)animationToProgress
{
  return self->_animationToProgress;
}

- (void)setAnimationToProgress:(double)a3
{
  self->_animationToProgress = a3;
}

- (HUAnimationApplier)inFlightAnimation
{
  return self->_inFlightAnimation;
}

- (void)setInFlightAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightAnimation, a3);
}

- (double)previousInteractionProgress
{
  return self->_previousInteractionProgress;
}

- (void)setPreviousInteractionProgress:(double)a3
{
  self->_previousInteractionProgress = a3;
}

- (BOOL)waitingOnAnimationToComplete
{
  return self->_waitingOnAnimationToComplete;
}

- (void)setWaitingOnAnimationToComplete:(BOOL)a3
{
  self->_waitingOnAnimationToComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightAnimation, 0);
  objc_storeStrong((id *)&self->_transitionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_significantProgressChangeAnimationSettings, 0);
  objc_storeStrong((id *)&self->_interactionProgress, 0);
}

@end
