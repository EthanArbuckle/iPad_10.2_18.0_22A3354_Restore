@implementation AXRDeviceActionsViewController

- (AXRDeviceActionsViewController)initWithRemoteDevice:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  AXRDeviceActionsViewController *v8;
  AXRDeviceActionsViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXRDeviceActionsViewController;
  v8 = -[AXRDeviceActionsViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AXRDeviceActionsViewController setActiveDevice:](v8, "setActiveDevice:", v6);
    -[AXRDeviceActionsViewController setDelegate:](v9, "setDelegate:", v7);
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXRDeviceActionsViewController;
  -[AXRDeviceActionsViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[AXRDeviceActionsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CellIdentifier"));

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXRDeviceActionsViewController;
  -[AXRDeviceActionsViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXRDeviceActionsViewController;
  -[AXRDeviceActionsViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (BOOL)accessibilityPerformEscape
{
  -[AXRDeviceActionsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_deviceSupportsHandGestures
{
  return 0;
}

- (id)_supportedHandGestures
{
  return &unk_24F4F9618;
}

- (int64_t)_numberOfSections
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceRemoteActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5 + -[AXRDeviceActionsViewController _deviceSupportsHandGestures](self, "_deviceSupportsHandGestures");
}

- (BOOL)_indexPathSectionIsForHandGestures:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[AXRDeviceActionsViewController _deviceSupportsHandGestures](self, "_deviceSupportsHandGestures");
  if (v5)
    LOBYTE(v5) = -[AXRDeviceActionsViewController _numberOfSections](self, "_numberOfSections") - 1 == a3;
  return v5;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceRemoteActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3)
  {
    if (!-[AXRDeviceActionsViewController _deviceSupportsHandGestures](self, "_deviceSupportsHandGestures"))
      return 0;
    -[AXRDeviceActionsViewController _supportedHandGestures](self, "_supportedHandGestures");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "count");
  }
  else
  {
    -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceRemoteActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "remoteActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

  }
  return v12;
}

- (id)_titleForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceRemoteActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3)
  {
    if (-[AXRDeviceActionsViewController _deviceSupportsHandGestures](self, "_deviceSupportsHandGestures"))
    {
      AXRLocalizedStringForKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceRemoteActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "localizedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_footerForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceRemoteActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3 && -[AXRDeviceActionsViewController _deviceSupportsHandGestures](self, "_deviceSupportsHandGestures"))
  {
    AXRLocalizedStringForKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_actionForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceRemoteActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v5 >= v8)
  {
    v13 = 0;
  }
  else
  {
    -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceRemoteActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "remoteActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (int64_t)_handGestureEventUsageForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (-[AXRDeviceActionsViewController _indexPathSectionIsForHandGestures:](self, "_indexPathSectionIsForHandGestures:", objc_msgSend(v4, "section")))
  {
    -[AXRDeviceActionsViewController _supportedHandGestures](self, "_supportedHandGestures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (int)objc_msgSend(v6, "intValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_handleIndexPathSelection:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceRemoteActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v5 >= v8)
  {
    v10 = objc_msgSend(v4, "section");

    -[AXRDeviceActionsViewController _indexPathSectionIsForHandGestures:](self, "_indexPathSectionIsForHandGestures:", v10);
  }
  else
  {
    -[AXRDeviceActionsViewController _actionForIndexPath:](self, "_actionForIndexPath:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[AXRDeviceActionsViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionsViewController:selectedAction:", self, v11);

  }
}

- (id)_titleForListItemAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceRemoteActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v5 >= v8)
  {
    if (-[AXRDeviceActionsViewController _indexPathSectionIsForHandGestures:](self, "_indexPathSectionIsForHandGestures:", objc_msgSend(v4, "section")))
    {
      -[AXRDeviceActionsViewController _handGestureEventUsageForIndexPath:](self, "_handGestureEventUsageForIndexPath:", v4);
      AXLocalizedStringForHandGestureEventUsage();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    -[AXRDeviceActionsViewController _actionForIndexPath:](self, "_actionForIndexPath:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceType");
    AXRLocalizedStringForRemoteActionWithDeviceType();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_subtitleForListItemAtIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[AXRDeviceActionsViewController _indexPathSectionIsForHandGestures:](self, "_indexPathSectionIsForHandGestures:", objc_msgSend(v4, "section")))
  {
    v5 = -[AXRDeviceActionsViewController _handGestureEventUsageForIndexPath:](self, "_handGestureEventUsageForIndexPath:", v4);
    -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customizedRemoteActionForHandGestureEventUsage:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceType");
    AXRLocalizedStringForRemoteActionWithDeviceType();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_imageForListItemAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceRemoteActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v5 >= v8)
  {
    v11 = 0;
  }
  else
  {
    -[AXRDeviceActionsViewController _actionForIndexPath:](self, "_actionForIndexPath:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRDeviceActionsViewController activeDevice](self, "activeDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXRUIImageForRemoteActionWithDeviceType(v9, objc_msgSend(v10, "deviceType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_leadingImageViewForListItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[AXRDeviceActionsViewController _imageForListItemAtIndexPath:](self, "_imageForListItemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v3);
  else
    v4 = 0;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[AXRDeviceActionsViewController _numberOfRowsInSection:](self, "_numberOfRowsInSection:", a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[AXRDeviceActionsViewController _titleForSection:](self, "_titleForSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultContentConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRDeviceActionsViewController _imageForListItemAtIndexPath:](self, "_imageForListItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v9);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v10);

  -[AXRDeviceActionsViewController _titleForListItemAtIndexPath:](self, "_titleForListItemAtIndexPath:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v12);

  -[AXRDeviceActionsViewController _subtitleForListItemAtIndexPath:](self, "_subtitleForListItemAtIndexPath:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSecondaryText:", v13);
  objc_msgSend(v7, "setContentConfiguration:", v8);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[AXRDeviceActionsViewController _handleIndexPathSelection:](self, "_handleIndexPathSelection:", v6);

}

- (AXRemoteDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
  objc_storeStrong((id *)&self->_activeDevice, a3);
}

- (AXRDeviceActionsViewControllerDelegate)delegate
{
  return (AXRDeviceActionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeDevice, 0);
}

@end
