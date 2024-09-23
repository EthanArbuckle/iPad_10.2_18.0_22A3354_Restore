@implementation MUPlaceAddStopActionRowItemViewModel

- (MUPlaceAddStopActionRowItemViewModel)initWithSearchAlongRoute:(BOOL)a3 ETAProvider:(id)a4 detourInfo:(id)a5 canShowDetourTime:(BOOL)a6
{
  _BOOL4 v9;
  id v11;
  id v12;
  MUPlaceAddStopActionRowItemViewModel *v13;
  MUPlaceAddStopActionRowItemViewModel *v14;
  char v15;
  NSObject *v16;
  uint8_t v18[16];
  objc_super v19;

  v9 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MUPlaceAddStopActionRowItemViewModel;
  v13 = -[MUActionRowItemViewModel init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_isSearchAlongRoute = v9;
    objc_storeStrong((id *)&v13->_etaProvider, a4);
    objc_storeStrong((id *)&v14->_detourInfo, a5);
    v14->_canShowDetourTime = a6;
    if (v11)
    {
      if (!v12 && v9)
      {
        v15 = objc_msgSend(v11, "isLikelyToReturnETA");
        v14->_hiddenWhileWaitingForETA = v15 ^ 1;
        if ((v15 & 1) == 0)
        {
          MUGetPlaceCardLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v18 = 0;
            _os_log_impl(&dword_191DB8000, v16, OS_LOG_TYPE_INFO, "Hiding directions button while waiting for valid ETA", v18, 2u);
          }

        }
        -[MKETAProvider addObserver:](v14->_etaProvider, "addObserver:", v14);
      }
    }
  }

  return v14;
}

- (BOOL)isEnabled
{
  return !self->_isSearchAlongRoute || self->_detourInfo || self->_etaTravelTime > 0.0;
}

- (BOOL)isHidden
{
  if (self->_isSearchAlongRoute && self->_hiddenWhileWaitingForETA)
    return !-[MUPlaceAddStopActionRowItemViewModel isEnabled](self, "isEnabled");
  else
    return 0;
}

- (id)symbolName
{
  return CFSTR("plus.circle.fill");
}

- (id)titleText
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[GEOMapItemDetourInfo detourTime](self->_detourInfo, "detourTime");
  if (v3 > 0.0 && self->_canShowDetourTime)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[GEOMapItemDetourInfo detourTime](self->_detourInfo, "detourTime");
    objc_msgSend(v4, "_navigation_stringWithSeconds:andAbbreviationType:", (unint64_t)v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    _MULocalizedStringFromThisBundle(CFSTR("Add Stop With Detour Time [Placecard]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _MULocalizedStringFromThisBundle(CFSTR("Add Stop [Placecard]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)preferredTintColor
{
  return +[MUInfoCardStyle directionsButtonTintColor](MUInfoCardStyle, "directionsButtonTintColor");
}

- (id)preferredBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
}

- (id)accessibilityIdentifier
{
  return (id)objc_msgSend(CFSTR("ActionRowItemType"), "stringByAppendingString:", CFSTR("AddStop"));
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;

  v4 = a3;
  if (self->_etaTravelTime == 0.0)
  {
    v7 = v4;
    objc_msgSend(v4, "etaTravelTime");
    v4 = v7;
    if (v5 > 0.0)
    {
      objc_msgSend(v7, "etaTravelTime");
      self->_etaTravelTime = v6;
      -[MUActionRowItemViewModel _notifyObservers](self, "_notifyObservers");
      v4 = v7;
    }
  }

}

- (BOOL)isSearchAlongRoute
{
  return self->_isSearchAlongRoute;
}

- (MKETAProvider)etaProvider
{
  return self->_etaProvider;
}

- (GEOMapItemDetourInfo)detourInfo
{
  return self->_detourInfo;
}

- (BOOL)canShowDetourTime
{
  return self->_canShowDetourTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detourInfo, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
}

@end
