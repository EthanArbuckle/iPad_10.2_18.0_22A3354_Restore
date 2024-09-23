@implementation MKMapItemDetailViewController

- (MKMapItemDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[MKMapItemDetailViewController initWithMapItem:displaysMap:](self, "initWithMapItem:displaysMap:", 0, 1);
}

- (MKMapItemDetailViewController)initWithMapItem:(id)a3
{
  return -[MKMapItemDetailViewController initWithMapItem:displaysMap:](self, "initWithMapItem:displaysMap:", a3, 1);
}

- (MKMapItemDetailViewController)initWithMapItem:(id)a3 displaysMap:(BOOL)a4
{
  id v7;
  MKMapItemDetailViewController *v8;
  MKMapItemDetailViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKMapItemDetailViewController;
  v8 = -[MKMapItemDetailViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapItem, a3);
    v9->_displaysMap = a4;
  }

  return v9;
}

- (MKMapItemDetailViewController)initWithCoder:(id)a3
{
  id v4;
  MKMapItemDetailViewController *v5;
  MKMapItemDetailViewController *v6;
  MKMapItem *mapItem;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKMapItemDetailViewController;
  v5 = -[MKMapItemDetailViewController initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    mapItem = v5->_mapItem;
    v5->_mapItem = 0;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MKDisplaysMap")))
      v6->_displaysMap = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MKDisplaysMap"));
    else
      v6->_displaysMap = 1;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKMapItemDetailViewController;
  v4 = a3;
  -[MKMapItemDetailViewController encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_displaysMap, CFSTR("MKDisplaysMap"), v5.receiver, v5.super_class);

}

- (void)loadView
{
  _MKMapItemDetailView *v3;
  _MKMapItemDetailView *v4;
  void *v5;
  void *v6;
  void *v7;
  MKFullDeveloperPlaceCardSelectionAccessoryView *v8;
  MKFullDeveloperPlaceCardSelectionAccessoryView *accessoryView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v3 = [_MKMapItemDetailView alloc];
  v4 = -[_MKMapItemDetailView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKMapItemDetailViewController setView:](self, "setView:", v4);

  -[MKMapItemDetailViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemDetailViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = -[MKFullDeveloperPlaceCardSelectionAccessoryView initAsStandAloneHidingInlineMap:]([MKFullDeveloperPlaceCardSelectionAccessoryView alloc], "initAsStandAloneHidingInlineMap:", !self->_displaysMap);
  accessoryView = self->_accessoryView;
  self->_accessoryView = v8;

  -[MKFullDeveloperPlaceCardSelectionAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKViewSwitchingSelectionAccessoryView setParentViewController:](self->_accessoryView, "setParentViewController:", self);
  -[MKSelectionAccessoryView setDelegate:](self->_accessoryView, "setDelegate:", self);
  -[MKMapItemDetailViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_accessoryView);

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[MKFullDeveloperPlaceCardSelectionAccessoryView topAnchor](self->_accessoryView, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemDetailViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  -[MKFullDeveloperPlaceCardSelectionAccessoryView leadingAnchor](self->_accessoryView, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapItemDetailViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v20;
  -[MKMapItemDetailViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFullDeveloperPlaceCardSelectionAccessoryView trailingAnchor](self->_accessoryView, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  -[MKMapItemDetailViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKFullDeveloperPlaceCardSelectionAccessoryView bottomAnchor](self->_accessoryView, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v18);

  if (self->_mapItem)
    -[MKViewSwitchingSelectionAccessoryView displayMapItem:](self->_accessoryView, "displayMapItem:");
}

- (void)selectionAccessoryViewDidRequestDismissal:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  -[MKMapItemDetailViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKMapItemDetailViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapItemDetailViewControllerDidFinish:", self);

  }
  else
  {
    -[MKMapItemDetailViewController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MKMapItemDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    }
    else
    {
      MKGetMKRemoteUILog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_INFO, "MKMapItemDetailViewController close button not actionable", buf, 2u);
      }

    }
  }
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (MKMapItemDetailViewControllerDelegate)delegate
{
  return (MKMapItemDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
