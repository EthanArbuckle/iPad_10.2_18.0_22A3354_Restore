@implementation CSPosterSwitcherTransitionSource

- (void)prepareForPresentation
{
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CSComponent *v9;
  CSComponent *wallpaper;
  void *v11;
  void *v12;
  void *v13;
  CSComponent *v14;
  CSComponent *wallpaperFloatingLayer;
  void *v16;
  void *v17;
  void *v18;
  CSHomeAffordanceComponent *v19;
  CSHomeAffordanceComponent *homeAffordance;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[3];

  self->_transitionType = 2;
  v21 = 0u;
  v23 = 1;
  v22 = 0x3FF0000000000000;
  BYTE8(v21) = 1;
  CSCoverSheetTransitionContextMake((uint64_t)&v21, 3, (uint64_t)v24);
  v3 = v24[1];
  *(_OWORD *)&self->_transitionContext.value = v24[0];
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v3;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v24[2];
  -[CSPosterSwitcherTransitionSource transitioningDelegate](self, "transitioningDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSComponent wallpaper](CSComponent, "wallpaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPosterSwitcherTransitionSource appearanceIdentifier](self, "appearanceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "priority:", 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hidden:", 0);
  v9 = (CSComponent *)objc_claimAutoreleasedReturnValue();
  wallpaper = self->_wallpaper;
  self->_wallpaper = v9;

  -[CSComponent setLevel:](self->_wallpaper, "setLevel:", 1);
  +[CSComponent wallpaperFloatingLayer](CSComponent, "wallpaperFloatingLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPosterSwitcherTransitionSource appearanceIdentifier](self, "appearanceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "priority:", 40);
  v14 = (CSComponent *)objc_claimAutoreleasedReturnValue();
  wallpaperFloatingLayer = self->_wallpaperFloatingLayer;
  self->_wallpaperFloatingLayer = v14;

  -[CSComponent setLevel:](self->_wallpaperFloatingLayer, "setLevel:", 1);
  v16 = (void *)objc_opt_new();
  -[CSPosterSwitcherTransitionSource appearanceIdentifier](self, "appearanceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "suppressTeachableMomentsAnimation:", 1);
  v19 = (CSHomeAffordanceComponent *)objc_claimAutoreleasedReturnValue();
  homeAffordance = self->_homeAffordance;
  self->_homeAffordance = v19;

  objc_msgSend(v4, "transitionSource:willBeginWithType:", self, self->_transitionType);
  -[CSPosterSwitcherTransitionSource updatePresentationWithProgress:](self, "updatePresentationWithProgress:", 0.0);

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
  -[CSPosterSwitcherTransitionSource transitioningDelegate](self, "transitioningDelegate");
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
  CSComponent *wallpaper;
  CSComponent *wallpaperFloatingLayer;
  void *v6;
  __int128 v7;
  _OWORD v8[3];

  homeAffordance = self->_homeAffordance;
  self->_homeAffordance = 0;

  wallpaper = self->_wallpaper;
  self->_wallpaper = 0;

  wallpaperFloatingLayer = self->_wallpaperFloatingLayer;
  self->_wallpaperFloatingLayer = 0;

  self->_transitionType = 0;
  -[CSPosterSwitcherTransitionSource transitioningDelegate](self, "transitioningDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  v8[0] = *(_OWORD *)&self->_transitionContext.value;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  objc_msgSend(v6, "transitionSource:didEndWithContext:", self, v8);

}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (-[CSPosterSwitcherTransitionSource isTransitioning](self, "isTransitioning"))
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
  if (self->_wallpaper)
    objc_msgSend(v4, "addObject:");
  if (self->_wallpaperFloatingLayer)
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
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
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
  -[CSPosterSwitcherTransitionSource updatePresentationWithProgress:](self, "updatePresentationWithProgress:", 0.0);
  -[CSPosterSwitcherTransitionSource cleanupPresentation](self, "cleanupPresentation");
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

- (CSPosterSwitcherTransitionDelegate)transitioningDelegate
{
  return (CSPosterSwitcherTransitionDelegate *)objc_loadWeakRetained((id *)&self->_transitioningDelegate);
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

- (CSComponent)wallpaper
{
  return self->_wallpaper;
}

- (void)setWallpaper:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaper, a3);
}

- (CSComponent)wallpaperFloatingLayer
{
  return self->_wallpaperFloatingLayer;
}

- (void)setWallpaperFloatingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperFloatingLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperFloatingLayer, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_homeAffordance, 0);
  objc_destroyWeak((id *)&self->_transitioningDelegate);
}

@end
