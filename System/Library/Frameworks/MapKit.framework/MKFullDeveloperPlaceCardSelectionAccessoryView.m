@implementation MKFullDeveloperPlaceCardSelectionAccessoryView

- (id)initAsAccessory
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKFullDeveloperPlaceCardSelectionAccessoryView;
  result = -[MKViewSwitchingSelectionAccessoryView initWithFrame:](&v3, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
  {
    *((_BYTE *)result + 480) = 0;
    *((_BYTE *)result + 481) = 1;
  }
  return result;
}

- (id)initAsStandAloneHidingInlineMap:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKFullDeveloperPlaceCardSelectionAccessoryView;
  result = -[MKViewSwitchingSelectionAccessoryView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
  {
    *((_BYTE *)result + 480) = 1;
    *((_BYTE *)result + 481) = a3;
  }
  return result;
}

- (id)_createLoadingView
{
  return objc_alloc_init(MKFullDeveloperPlaceCardLoadingView);
}

- (id)_createMapItemViewController:(id)a3
{
  _BOOL4 isStandAlonePlaceCard;
  id v5;
  MKFullDeveloperPlaceCardRemoteUIHostViewController *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;

  isStandAlonePlaceCard = self->_isStandAlonePlaceCard;
  v5 = a3;
  v6 = [MKFullDeveloperPlaceCardRemoteUIHostViewController alloc];
  -[MKSelectionAccessoryView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;
  if (isStandAlonePlaceCard)
    v9 = -[MKFullDeveloperPlaceCardRemoteUIHostViewController initAsStandAloneWithMapItem:dismissButtonDisplayed:hideInlineMap:](v6, "initAsStandAloneWithMapItem:dismissButtonDisplayed:hideInlineMap:", v5, v8, self->_hideInlineMap);
  else
    v9 = -[MKFullDeveloperPlaceCardRemoteUIHostViewController initAsAccessoryWithMapItem:dismissButtonDisplayed:](v6, "initAsAccessoryWithMapItem:dismissButtonDisplayed:", v5, v8);
  v10 = (void *)v9;

  return v10;
}

- (id)_createErrorView
{
  return objc_alloc_init(MKFullDeveloperPlaceCardErrorView);
}

@end
