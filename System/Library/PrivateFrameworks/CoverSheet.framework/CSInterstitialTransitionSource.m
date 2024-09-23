@implementation CSInterstitialTransitionSource

- (void)prepareForPresentation
{
  __int128 v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CSHomeAffordanceComponent *v12;
  CSHomeAffordanceComponent *homeAffordance;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CSStatusBarComponent *v19;
  CSStatusBarComponent *statusBar;
  _OWORD v21[3];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  self->_transitionType = 2;
  v22 = 0u;
  v24 = 1;
  v23 = 0x3FF0000000000000;
  BYTE8(v22) = 1;
  CSCoverSheetTransitionContextMake((uint64_t)&v22, 3, (uint64_t)&v25);
  v3 = v26;
  *(_OWORD *)&self->_transitionContext.value = v25;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v3;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v27;
  -[CSInterstitialTransitionSource transitioningDelegate](self, "transitioningDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "coverSheetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  CSComponentTransitionInputsMake(0, (uint64_t)&v25, 0.0, 0.0, v6 / -6.0, 0.0, 0.0);

  v7 = (void *)objc_opt_new();
  -[CSInterstitialTransitionSource appearanceIdentifier](self, "appearanceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionModifiers:", 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v25;
  v21[1] = v26;
  v21[2] = v27;
  objc_msgSend(v10, "transitionInputs:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "suppressTeachableMomentsAnimation:", 1);
  v12 = (CSHomeAffordanceComponent *)objc_claimAutoreleasedReturnValue();
  homeAffordance = self->_homeAffordance;
  self->_homeAffordance = v12;

  v14 = SBFEffectiveArtworkSubtype();
  if (v14 <= 2795)
  {
    if (v14 != 2556 && v14 != 2622)
      goto LABEL_8;
LABEL_7:
    v15 = (void *)objc_opt_new();
    -[CSInterstitialTransitionSource appearanceIdentifier](self, "appearanceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "priority:", 60);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hidden:", 1);
    v19 = (CSStatusBarComponent *)objc_claimAutoreleasedReturnValue();
    statusBar = self->_statusBar;
    self->_statusBar = v19;

    goto LABEL_8;
  }
  if (v14 == 2868 || v14 == 2796)
    goto LABEL_7;
LABEL_8:
  objc_msgSend(v4, "transitionSource:willBeginWithType:", self, self->_transitionType);
  -[CSInterstitialTransitionSource updatePresentationWithProgress:](self, "updatePresentationWithProgress:", 0.0);

}

- (void)updatePresentationWithProgress:(double)a3
{
  __int128 v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v7 = 0u;
  v9 = 1;
  v8 = 0x3FF0000000000000;
  BYTE8(v7) = 1;
  CSCoverSheetTransitionContextMake((uint64_t)&v7, 3, (uint64_t)&v10);
  v4 = v11;
  *(_OWORD *)&self->_transitionContext.value = v10;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v4;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v12;
  -[CSInterstitialTransitionSource transitioningDelegate](self, "transitioningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  v10 = *(_OWORD *)&self->_transitionContext.value;
  v11 = v6;
  v12 = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  objc_msgSend(v5, "transitionSource:didUpdateTransitionWithContext:", self, &v10);

}

- (void)cleanupPresentation
{
  CSHomeAffordanceComponent *homeAffordance;
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  homeAffordance = self->_homeAffordance;
  self->_homeAffordance = 0;

  self->_transitionType = 0;
  -[CSInterstitialTransitionSource transitioningDelegate](self, "transitioningDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  v6[0] = *(_OWORD *)&self->_transitionContext.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  objc_msgSend(v4, "transitionSource:didEndWithContext:", self, v6);

}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (-[CSInterstitialTransitionSource isTransitioning](self, "isTransitioning"))
    return 2;
  else
    return 1;
}

- (NSSet)components
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_homeAffordance)
    objc_msgSend(v3, "addObject:");
  if (self->_statusBar)
    objc_msgSend(v4, "addObject:");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (_UILegibilitySettings)legibilitySettings
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 3;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  if (-[CSInterstitialTransitionSource isTransitioning](self, "isTransitioning"))
    return 4096;
  else
    return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (BOOL)isTransitioning
{
  return self->_transitionType != 0;
}

- (void)cancelTransition
{
  -[CSInterstitialTransitionSource updatePresentationWithProgress:](self, "updatePresentationWithProgress:", 0.0);
  -[CSInterstitialTransitionSource cleanupPresentation](self, "cleanupPresentation");
}

- ($C89AE587F4FC9517FD26718A5F681357)transitionContext
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var0.var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  *(_OWORD *)&retstr->var1.var1.var1 = *(_OWORD *)&self[1].var1.var1.var1;
  return self;
}

- (CSInterstitialTransitionDelegate)transitioningDelegate
{
  return (CSInterstitialTransitionDelegate *)objc_loadWeakRetained((id *)&self->_transitioningDelegate);
}

- (void)setTransitioningDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transitioningDelegate, a3);
}

- (int64_t)transitionType
{
  return self->_transitionType;
}

- (void)setTransitionType:(int64_t)a3
{
  self->_transitionType = a3;
}

- (CSHomeAffordanceComponent)homeAffordance
{
  return self->_homeAffordance;
}

- (void)setHomeAffordance:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordance, a3);
}

- (CSStatusBarComponent)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(id)a3
{
  objc_storeStrong((id *)&self->_statusBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_homeAffordance, 0);
  objc_destroyWeak((id *)&self->_transitioningDelegate);
}

@end
