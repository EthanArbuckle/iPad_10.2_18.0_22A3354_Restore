@implementation MUPlaceViewControllerSectionController

- (MUPlaceViewControllerSectionController)initWithMapItem:(id)a3 viewController:(id)a4
{
  id v7;
  MUPlaceViewControllerSectionController *v8;
  MUPlaceViewControllerSectionController *v9;
  MUPlaceViewControllerSectionController *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  v7 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)MUPlaceViewControllerSectionController;
    v8 = -[MUPlaceSectionController initWithMapItem:](&v13, sel_initWithMapItem_, a3);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_viewController, a4);
    self = v9;
    v10 = self;
  }
  else
  {
    MUGetPlaceCardLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v11, OS_LOG_TYPE_INFO, "MUPlaceViewControllerSectionController: Attempting to initializer with a nil view controller", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (UIViewController)sectionViewController
{
  return self->_viewController;
}

- (UIView)sectionView
{
  return -[UIViewController view](self->_viewController, "view");
}

- (BOOL)isImpressionable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
