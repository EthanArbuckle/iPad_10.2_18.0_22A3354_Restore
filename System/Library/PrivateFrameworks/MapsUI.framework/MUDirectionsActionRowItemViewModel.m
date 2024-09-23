@implementation MUDirectionsActionRowItemViewModel

- (MUDirectionsActionRowItemViewModel)initWithETAProvider:(id)a3
{
  id v5;
  MUDirectionsActionRowItemViewModel *v6;
  MUDirectionsActionRowItemViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUDirectionsActionRowItemViewModel;
  v6 = -[MUActionRowItemViewModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_etaProvider, a3);
    -[MKETAProvider addObserver:](v7->_etaProvider, "addObserver:", v7);
  }

  return v7;
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)symbolName
{
  return +[MUETAHelper etaSymbolForTransportType:](MUETAHelper, "etaSymbolForTransportType:", -[MKETAProvider etaTransportType](self->_etaProvider, "etaTransportType"));
}

- (id)titleText
{
  double v3;
  double v4;
  void *v5;
  id v6;
  void *v7;

  -[MKETAProvider etaTravelTime](self->_etaProvider, "etaTravelTime");
  if (v3 <= 0.0)
  {
    _MULocalizedStringFromThisBundle(CFSTR("Directions [Placecard]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKETAProvider etaTravelTime](self->_etaProvider, "etaTravelTime");
    +[MUPlaceHeaderETAFormatter etaStringFromSeconds:isRenderingInFullWidth:](MUPlaceHeaderETAFormatter, "etaStringFromSeconds:isRenderingInFullWidth:", (unint64_t)v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = v5;
    }
    else
    {
      _MULocalizedStringFromThisBundle(CFSTR("Directions [Placecard]"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  return v7;
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
  return (id)objc_msgSend(CFSTR("ActionRowItemType"), "stringByAppendingString:", CFSTR("Directions"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaProvider, 0);
}

@end
