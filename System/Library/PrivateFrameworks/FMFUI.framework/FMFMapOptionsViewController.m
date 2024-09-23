@implementation FMFMapOptionsViewController

- (FMFMapOptionsViewController)init
{
  void *v3;
  FMFMapOptionsViewController *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)FMFMapOptionsViewController;
  v4 = -[FMFMapOptionsViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, CFSTR("FMFMapOptions"), v3);

  return v4;
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FMFMapOptionsViewController;
  -[FMFMapOptionsViewController awakeFromNib](&v2, sel_awakeFromNib);
}

- (void)_dismiss:(id)a3
{
  id v4;

  -[FMFMapOptionsViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_dismiss:", self);

}

- (CGSize)paneSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[FMFMapOptionsViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", *MEMORY[0x24BDF7B88], *(double *)(MEMORY[0x24BDF7B88] + 8));
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  uint8_t buf[16];

  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DD58000, v3, OS_LOG_TYPE_DEFAULT, "FMFMapOptionsViewController: viewDidLoad", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)FMFMapOptionsViewController;
  -[FMFMapOptionsViewController viewDidLoad](&v15, sel_viewDidLoad);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__dismiss_);
  -[FMFMapOptionsViewController topTapView](self, "topTapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", v4);

  -[FMFMapOptionsViewController mapAttributionButton](self, "mapAttributionButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFMapOptionsViewController mapAttribution](self, "mapAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedTitle:forState:", v8, 0);

  -[FMFMapOptionsViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mapType");

  if (v11 == 4)
    v12 = 1;
  else
    v12 = v11;
  if (v11 == 3)
    v13 = 2;
  else
    v13 = v12;
  -[FMFMapOptionsViewController segmentedControl](self, "segmentedControl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSelectedSegmentIndex:", v13);

}

- (void)openInMaps:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMFMapOptionsViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openInMapsButtonTapped:", self);
  -[FMFMapOptionsViewController _dismiss:](self, "_dismiss:", v4);

}

- (MKMapAttribution)mapAttribution
{
  MKMapAttribution *mapAttribution;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  mapAttribution = self->_mapAttribution;
  if (!mapAttribution)
  {
    if (!mapAttribution_stringAttributes)
    {
      v12[0] = *MEMORY[0x24BDF6600];
      objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v4;
      v12[1] = *MEMORY[0x24BDF65F8];
      objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 12.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)mapAttribution_stringAttributes;
      mapAttribution_stringAttributes = v6;

    }
    -[FMFMapOptionsViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mapAttributionWithStringAttributes:underlineText:", mapAttribution_stringAttributes, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFMapOptionsViewController setMapAttribution:](self, "setMapAttribution:", v10);

    mapAttribution = self->_mapAttribution;
  }
  return mapAttribution;
}

- (void)attributionButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[FMFMapOptionsViewController mapAttribution](self, "mapAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openURL:withOptions:", v7, 0);

  }
  -[FMFMapOptionsViewController _dismiss:](self, "_dismiss:", v8);

}

- (void)segmentedControlChanged:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "selectedSegmentIndex");
  LogCategory_Daemon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = v5;
    _os_log_impl(&dword_20DD58000, v6, OS_LOG_TYPE_DEFAULT, "FMFMapOptionsViewController: newMapType %lu", (uint8_t *)&v9, 0xCu);
  }

  if (objc_msgSend(v4, "selectedSegmentIndex") == 1)
  {
    v5 = 4;
  }
  else if (objc_msgSend(v4, "selectedSegmentIndex") == 2)
  {
    v5 = 3;
  }
  -[FMFMapOptionsViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMapType:", v5);

  objc_msgSend(v7, "mapTypeChanged:", v5);
  -[FMFMapOptionsViewController _dismiss:](self, "_dismiss:", v4);

}

- (FMFMapOptionsViewControllerDelegate)delegate
{
  return (FMFMapOptionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)mapAttributionButton
{
  return self->_mapAttributionButton;
}

- (void)setMapAttributionButton:(id)a3
{
  objc_storeStrong((id *)&self->_mapAttributionButton, a3);
}

- (UIView)topTapView
{
  return self->_topTapView;
}

- (void)setTopTapView:(id)a3
{
  objc_storeStrong((id *)&self->_topTapView, a3);
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (UIView)bottomWhitePane
{
  return self->_bottomWhitePane;
}

- (void)setBottomWhitePane:(id)a3
{
  objc_storeStrong((id *)&self->_bottomWhitePane, a3);
}

- (void)setMapAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_mapAttribution, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapAttribution, 0);
  objc_storeStrong((id *)&self->_bottomWhitePane, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_topTapView, 0);
  objc_storeStrong((id *)&self->_mapAttributionButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
