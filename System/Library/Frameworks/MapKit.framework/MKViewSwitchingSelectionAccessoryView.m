@implementation MKViewSwitchingSelectionAccessoryView

- (MKViewSwitchingSelectionAccessoryView)initWithFrame:(CGRect)a3
{
  MKViewSwitchingSelectionAccessoryView *v3;
  MKViewSwitchingSelectionAccessoryView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKViewSwitchingSelectionAccessoryView;
  v3 = -[MKSelectionAccessoryView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MKViewSwitchingSelectionAccessoryView _updateDisplay](v3, "_updateDisplay");
  return v4;
}

- (void)displayLoading
{
  MKMapItem *mapItem;

  if (self->_error || self->_mapItem)
  {
    self->_error = 0;
    mapItem = self->_mapItem;
    self->_mapItem = 0;

    -[MKViewSwitchingSelectionAccessoryView _updateDisplay](self, "_updateDisplay");
  }
}

- (void)displayMapItem:(id)a3
{
  MKMapItem *v5;
  MKMapItem *v6;

  v5 = (MKMapItem *)a3;
  if (self->_error || self->_mapItem != v5)
  {
    self->_error = 0;
    v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    -[MKViewSwitchingSelectionAccessoryView _updateDisplay](self, "_updateDisplay");
    v5 = v6;
  }

}

- (void)displayError
{
  MKMapItem *mapItem;

  if (!self->_error || self->_mapItem)
  {
    self->_error = 1;
    mapItem = self->_mapItem;
    self->_mapItem = 0;

    -[MKViewSwitchingSelectionAccessoryView _updateDisplay](self, "_updateDisplay");
  }
}

- (void)_updateDisplay
{
  UIViewController *viewController;
  UIView *view;
  UIView *v5;
  UIViewController *v6;
  UIViewController *v7;
  MKMapItem *mapItem;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  viewController = self->_viewController;
  if (viewController)
    -[UIViewController willMoveToParentViewController:](viewController, "willMoveToParentViewController:", 0);
  view = self->_view;
  if (view)
  {
    -[UIView removeFromSuperview](view, "removeFromSuperview");
    v5 = self->_view;
    self->_view = 0;

  }
  v6 = self->_viewController;
  if (v6)
  {
    -[UIViewController removeFromParentViewController](v6, "removeFromParentViewController");
    v7 = self->_viewController;
    self->_viewController = 0;

  }
  mapItem = self->_mapItem;
  if (!mapItem)
  {
    if (!self->_error)
    {
      -[MKViewSwitchingSelectionAccessoryView _createLoadingView](self, "_createLoadingView");
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v18 = (void *)v19;
      -[MKViewSwitchingSelectionAccessoryView _displayView:](self, "_displayView:", v19);
      goto LABEL_19;
    }
LABEL_17:
    -[MKViewSwitchingSelectionAccessoryView _createErrorView](self, "_createErrorView");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  -[MKMapItem placemark](mapItem, "placemark");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_17;
  }
  v11 = (void *)v10;
  -[MKMapItem placemark](self->_mapItem, "placemark");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "coordinate");
  v15 = v14;
  v17 = v16;

  if (v17 < -180.0 || v17 > 180.0 || v15 < -90.0 || v15 > 90.0)
    goto LABEL_17;
  -[MKViewSwitchingSelectionAccessoryView _createMapItemViewController:](self, "_createMapItemViewController:", self->_mapItem);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewSwitchingSelectionAccessoryView _displayViewController:](self, "_displayViewController:", v18);
LABEL_19:

  -[MKSelectionAccessoryView _bringDismissButtonToFront](self, "_bringDismissButtonToFront");
}

- (void)_displayViewController:(id)a3
{
  _MKSelectionAccessoryParentViewController *WeakRetained;
  id v5;
  _MKSelectionAccessoryParentViewController *v6;
  void *v7;
  _MKSelectionAccessoryParentViewController *v8;

  v8 = (_MKSelectionAccessoryParentViewController *)a3;
  WeakRetained = (_MKSelectionAccessoryParentViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
  if (!WeakRetained)
    WeakRetained = -[_MKSelectionAccessoryParentViewController initWithChildViewController:]([_MKSelectionAccessoryParentViewController alloc], "initWithChildViewController:", v8);
  -[_MKSelectionAccessoryParentViewController addChildViewController:](WeakRetained, "addChildViewController:", v8);
  -[_MKSelectionAccessoryParentViewController setPlaceCardContentSizeDelegate:](v8, "setPlaceCardContentSizeDelegate:", self);
  v5 = objc_loadWeakRetained((id *)&self->_parentViewController);
  if (v5)
    v6 = v8;
  else
    v6 = WeakRetained;
  objc_storeStrong((id *)&self->_viewController, v6);

  -[UIViewController view](self->_viewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewSwitchingSelectionAccessoryView _displayView:](self, "_displayView:", v7);

  -[_MKSelectionAccessoryParentViewController didMoveToParentViewController:](v8, "didMoveToParentViewController:", WeakRetained);
}

- (void)_displayView:(id)a3
{
  UIView **p_view;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  p_view = &self->_view;
  objc_storeStrong((id *)&self->_view, a3);
  v17 = a3;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_view, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKViewSwitchingSelectionAccessoryView addSubview:](self, "addSubview:", *p_view);
  v16 = (void *)MEMORY[0x1E0CB3718];
  -[UIView topAnchor](*p_view, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewSwitchingSelectionAccessoryView topAnchor](self, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  -[UIView leadingAnchor](*p_view, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewSwitchingSelectionAccessoryView leadingAnchor](self, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  -[MKViewSwitchingSelectionAccessoryView trailingAnchor](self, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](*p_view, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v11;
  -[MKViewSwitchingSelectionAccessoryView bottomAnchor](self, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](*p_view, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v15);

}

- (void)placeCardPreferredContentSizeDidChange:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  height = a3.height;
  width = a3.width;
  v15 = *MEMORY[0x1E0C80C00];
  if (qword_1EDFB7AB0 != -1)
    dispatch_once(&qword_1EDFB7AB0, &__block_literal_global_143);
  v6 = (void *)_MergedGlobals_1_2;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1_2, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = v6;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&width, *(_QWORD *)&height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v9;
    _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_DEBUG, "SelectionAccessoryView placeCardPreferredContentSizeDidChange: %{public}@", buf, 0xCu);

  }
  -[MKSelectionAccessoryView placeCardContentSizeDelegate](self, "placeCardContentSizeDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[MKSelectionAccessoryView placeCardContentSizeDelegate](self, "placeCardContentSizeDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "placeCardPreferredContentSizeDidChange:", width, height);

  }
}

- (id)_createLoadingView
{
  -[MKViewSwitchingSelectionAccessoryView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)_createMapItemViewController:(id)a3
{
  -[MKViewSwitchingSelectionAccessoryView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)_createErrorView
{
  -[MKViewSwitchingSelectionAccessoryView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
