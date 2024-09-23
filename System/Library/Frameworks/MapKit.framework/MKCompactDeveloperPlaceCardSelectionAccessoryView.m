@implementation MKCompactDeveloperPlaceCardSelectionAccessoryView

- (id)_createLoadingView
{
  return objc_alloc_init(MKCompactDeveloperPlaceCardLoadingView);
}

- (id)_createMapItemViewController:(id)a3
{
  id v3;
  MKCompactDeveloperPlaceCardRemoteUIHostViewController *v4;

  v3 = a3;
  v4 = -[MKCompactDeveloperPlaceCardRemoteUIHostViewController initWithMapItem:]([MKCompactDeveloperPlaceCardRemoteUIHostViewController alloc], "initWithMapItem:", v3);

  return v4;
}

- (id)_createErrorView
{
  return objc_alloc_init(MKCompactDeveloperPlaceCardErrorView);
}

@end
