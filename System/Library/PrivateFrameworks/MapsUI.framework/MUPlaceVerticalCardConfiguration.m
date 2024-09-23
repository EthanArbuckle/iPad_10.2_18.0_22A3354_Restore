@implementation MUPlaceVerticalCardConfiguration

+ (id)plainConfiguration
{
  MUPlaceVerticalCardConfiguration *v2;

  v2 = objc_alloc_init(MUPlaceVerticalCardConfiguration);
  -[MUPlaceVerticalCardConfiguration setShowSeparators:](v2, "setShowSeparators:", 0);
  return v2;
}

+ (id)separatorConfiguration
{
  MUPlaceVerticalCardConfiguration *v2;
  double v3;

  v2 = objc_alloc_init(MUPlaceVerticalCardConfiguration);
  -[MUPlaceVerticalCardConfiguration setShowSeparators:](v2, "setShowSeparators:", 1);
  if (MapKitIdiomIsMacCatalyst())
    v3 = 16.0;
  else
    v3 = 0.0;
  -[MUPlaceVerticalCardConfiguration setBottomSeparatorInset:](v2, "setBottomSeparatorInset:", 0.0, 16.0, 0.0, v3);
  return v2;
}

+ (id)developerPlaceCardConfiguration
{
  void *v2;

  objc_msgSend(a1, "plainConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDeveloperPlaceCard:", 1);
  return v2;
}

- (BOOL)showSeparators
{
  return self->_showSeparators;
}

- (void)setShowSeparators:(BOOL)a3
{
  self->_showSeparators = a3;
}

- (NSDirectionalEdgeInsets)bottomSeparatorInset
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_bottomSeparatorInset.top;
  leading = self->_bottomSeparatorInset.leading;
  bottom = self->_bottomSeparatorInset.bottom;
  trailing = self->_bottomSeparatorInset.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setBottomSeparatorInset:(NSDirectionalEdgeInsets)a3
{
  self->_bottomSeparatorInset = a3;
}

- (BOOL)isDeveloperPlaceCard
{
  return self->_developerPlaceCard;
}

- (void)setDeveloperPlaceCard:(BOOL)a3
{
  self->_developerPlaceCard = a3;
}

@end
