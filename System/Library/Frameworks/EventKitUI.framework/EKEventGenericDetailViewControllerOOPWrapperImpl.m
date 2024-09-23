@implementation EKEventGenericDetailViewControllerOOPWrapperImpl

- (EKEventGenericDetailViewControllerOOPWrapperImpl)initWithTitle:(id)a3 viewID:(id)a4 leftBarButtonActions:(id)a5 rightBarButtonActions:(id)a6
{
  return -[EKEventGenericDetailViewControllerOOPWrapperImpl initWithTitle:viewID:event:leftBarButtonActions:rightBarButtonActions:](self, "initWithTitle:viewID:event:leftBarButtonActions:rightBarButtonActions:", a3, a4, 0, a5, a6);
}

- (EKEventGenericDetailViewControllerOOPWrapperImpl)initWithTitle:(id)a3 viewID:(id)a4 event:(id)a5 leftBarButtonActions:(id)a6 rightBarButtonActions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  EKEventGenericDetailViewControllerOOPWrapperImpl *v17;
  _TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)EKEventGenericDetailViewControllerOOPWrapperImpl;
  v17 = -[EKEventGenericDetailViewControllerOOPWrapperImpl init](&v20, sel_init);
  if (v17)
  {
    EKUILogInitIfNeeded();
    -[EKEventGenericDetailViewControllerOOPWrapperImpl setTitle:](v17, "setTitle:", v12);
    objc_storeStrong((id *)&v17->_viewID, a4);
    objc_storeStrong((id *)&v17->_event, a5);
    -[EKEventGenericDetailViewControllerOOPWrapperImpl setLeftBarButtonActions:](v17, "setLeftBarButtonActions:", v15);
    -[EKEventGenericDetailViewControllerOOPWrapperImpl setRightBarButtonActions:](v17, "setRightBarButtonActions:", v16);
    -[EKEventGenericDetailViewControllerOOPWrapperImpl setBottomStatusButtonActions:](v17, "setBottomStatusButtonActions:", MEMORY[0x1E0C9AA60]);
    v18 = -[EKEventGenericDetailViewControllerOOPImpl initWithHostViewID:]([_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl alloc], "initWithHostViewID:", v17->_viewID);
    -[EKEventGenericDetailViewControllerOOPWrapperImpl setVc:](v17, "setVc:", v18);

  }
  return v17;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)EKEventGenericDetailViewControllerOOPWrapperImpl;
  -[EKEventGenericDetailViewControllerOOPWrapperImpl viewDidLoad](&v36, sel_viewDidLoad);
  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGenericDetailViewControllerOOPWrapperImpl addChildViewController:](self, "addChildViewController:", v3);

  -[EKEventGenericDetailViewControllerOOPWrapperImpl view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v6);

  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didMoveToParentViewController:", self);

  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v24 = (void *)MEMORY[0x1E0CB3718];
  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGenericDetailViewControllerOOPWrapperImpl view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v30;
  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGenericDetailViewControllerOOPWrapperImpl view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v23;
  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGenericDetailViewControllerOOPWrapperImpl view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v12;
  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGenericDetailViewControllerOOPWrapperImpl view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v19);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  v2 = EKUIContainedControllerIdealWidth();
  v3 = EKUIContainedControllerIdealHeight();
  v4 = v2;
  result.height = v3;
  result.width = v4;
  return result;
}

- (UIColor)oopContentBackgroundColor
{
  void *v2;
  void *v3;

  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oopContentBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setOopContentBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOopContentBackgroundColor:", v4);

}

- (void)setLeftBarButtonActions:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  NSArray *leftBarButtonItems;
  NSArray *v17;
  void *v18;
  id v19;
  NSArray *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_leftBarButtonActions, a3);
  if (-[NSArray count](self->_leftBarButtonActions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = v5;
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
          +[EKRemoteUIButtonAction Done](_TtC10EventKitUI22EKRemoteUIButtonAction, "Done", v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v11) = objc_msgSend(v11, "isEqual:", v12);

          if ((_DWORD)v11)
          {
            v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_leftBarButtonTapped_);
            if (v13)
            {
              v14 = (void *)v13;
              -[NSArray addObject:](v20, "addObject:", v13);

            }
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    v5 = v19;
    v15 = v20;
  }
  else
  {
    v15 = 0;
  }
  leftBarButtonItems = self->_leftBarButtonItems;
  self->_leftBarButtonItems = v15;
  v17 = v15;

  -[EKEventGenericDetailViewControllerOOPWrapperImpl navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLeftBarButtonItems:", v17);

}

- (void)setRightBarButtonActions:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  NSArray *v19;
  NSArray *rightBarButtonItems;
  NSArray *v21;
  void *v22;
  id v23;
  NSArray *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_rightBarButtonActions, a3);
  if (!-[NSArray count](self->_rightBarButtonActions, "count"))
  {
    v19 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = v5;
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v7)
    goto LABEL_15;
  v8 = v7;
  v9 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v26 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      +[EKRemoteUIButtonAction PresentShareSheet](_TtC10EventKitUI22EKRemoteUIButtonAction, "PresentShareSheet", v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v13)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel_rightBarButtonTapped_);
        if (v14)
          goto LABEL_12;
      }
      else
      {
        +[EKRemoteUIButtonAction PresentEmailCompose](_TtC10EventKitUI22EKRemoteUIButtonAction, "PresentEmailCompose");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v11, "isEqual:", v15);

        if (v16)
        {
          v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
          objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("envelope"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v17, "initWithImage:style:target:action:", v18, 0, self, sel_rightBarButtonTapped_);

          if (v14)
          {
LABEL_12:
            -[NSArray addObject:](v24, "addObject:", v14);

            continue;
          }
        }
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v8);
LABEL_15:

  v5 = v23;
  v19 = v24;
LABEL_17:
  rightBarButtonItems = self->_rightBarButtonItems;
  self->_rightBarButtonItems = v19;
  v21 = v19;

  -[EKEventGenericDetailViewControllerOOPWrapperImpl navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setRightBarButtonItems:", v21);

}

- (void)setBottomStatusButtonActions:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStatusButtonActions, a3);
  -[EKEventGenericDetailViewControllerOOPWrapperImpl _updateBottomButtons](self, "_updateBottomButtons");
}

- (id)_statusButtonsView
{
  EKUIEventStatusButtonsView *statusButtonsView;
  EKUIEventStatusButtonsView *v4;
  EKUIEventStatusButtonsView *v5;
  EKUIEventStatusButtonsView *v6;

  statusButtonsView = self->_statusButtonsView;
  if (!statusButtonsView)
  {
    v4 = [EKUIEventStatusButtonsView alloc];
    v5 = -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](v4, "initWithFrame:actions:delegate:options:", self->_bottomStatusButtonActions, self, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_statusButtonsView;
    self->_statusButtonsView = v5;

    -[EKUIEventStatusButtonsView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusButtonsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIEventStatusButtonsView setDisableButtonHighlights:](self->_statusButtonsView, "setDisableButtonHighlights:", 1);
    -[EKUIEventStatusButtonsView setTextSizeMode:](self->_statusButtonsView, "setTextSizeMode:", 1);
    statusButtonsView = self->_statusButtonsView;
  }
  return statusButtonsView;
}

- (id)_statusButtonsContainerView
{
  SingleToolbarItemContainerView *statusButtonsContainerView;
  SingleToolbarItemContainerView *v4;
  SingleToolbarItemContainerView *v5;
  SingleToolbarItemContainerView *v6;

  statusButtonsContainerView = self->_statusButtonsContainerView;
  if (!statusButtonsContainerView)
  {
    v4 = [SingleToolbarItemContainerView alloc];
    v5 = -[SingleToolbarItemContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_statusButtonsContainerView;
    self->_statusButtonsContainerView = v5;

    -[SingleToolbarItemContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusButtonsContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    statusButtonsContainerView = self->_statusButtonsContainerView;
  }
  return statusButtonsContainerView;
}

- (void)_updateBottomButtons
{
  NSArray *bottomStatusButtonActions;
  void *v4;
  NSUInteger v5;
  void *v6;
  void *v7;
  void *v8;
  SingleToolbarItemContainerView *statusButtonsContainerView;
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
  bottomStatusButtonActions = self->_bottomStatusButtonActions;
  -[EKEventGenericDetailViewControllerOOPWrapperImpl _statusButtonsView](self, "_statusButtonsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", bottomStatusButtonActions);

  v5 = -[NSArray count](self->_bottomStatusButtonActions, "count");
  -[EKEventGenericDetailViewControllerOOPWrapperImpl navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setToolbarHidden:", 0);

    -[EKEventGenericDetailViewControllerOOPWrapperImpl toolbarItems](self, "toolbarItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8
      || (statusButtonsContainerView = self->_statusButtonsContainerView, v8, !statusButtonsContainerView))
    {
      -[EKEventGenericDetailViewControllerOOPWrapperImpl _statusButtonsContainerView](self, "_statusButtonsContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventGenericDetailViewControllerOOPWrapperImpl _statusButtonsView](self, "_statusButtonsView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v11);
      v22 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v11, "leadingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v25;
      objc_msgSend(v11, "trailingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v21;
      objc_msgSend(v11, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2] = v14;
      objc_msgSend(v11, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[3] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "activateConstraints:", v18);

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v10);
      v28 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventGenericDetailViewControllerOOPWrapperImpl setToolbarItems:animated:](self, "setToolbarItems:animated:", v20, 1);

    }
  }
  else
  {
    objc_msgSend(v6, "setToolbarHidden:", 1);

    -[EKEventGenericDetailViewControllerOOPWrapperImpl setToolbarItems:animated:](self, "setToolbarItems:animated:", 0, 1);
  }
}

- (void)leftBarButtonTapped:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if (-[NSArray count](self->_leftBarButtonActions, "count") && -[NSArray count](self->_leftBarButtonItems, "count"))
  {
    v5 = -[NSArray indexOfObject:](self->_leftBarButtonItems, "indexOfObject:", v4);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL || (v6 = v5, v5 >= -[NSArray count](self->_leftBarButtonActions, "count")))
    {
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        -[EKEventGenericDetailViewControllerOOPWrapperImpl leftBarButtonTapped:].cold.2();
    }
    else
    {
      v7 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEFAULT, "EKEventGenericDetailViewControllerOOPWrapperImpl leftBarButtonTapped", v10, 2u);
      }
      -[NSArray objectAtIndexedSubscript:](self->_leftBarButtonActions, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leftBarButtonTapped:", v8);

    }
  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventGenericDetailViewControllerOOPWrapperImpl leftBarButtonTapped:].cold.1();
  }

}

- (void)rightBarButtonTapped:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if (-[NSArray count](self->_rightBarButtonActions, "count") && -[NSArray count](self->_rightBarButtonItems, "count"))
  {
    v5 = -[NSArray indexOfObject:](self->_rightBarButtonItems, "indexOfObject:", v4);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL || (v6 = v5, v5 >= -[NSArray count](self->_rightBarButtonActions, "count")))
    {
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        -[EKEventGenericDetailViewControllerOOPWrapperImpl rightBarButtonTapped:].cold.2();
    }
    else
    {
      v7 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEFAULT, "EKEventGenericDetailViewControllerOOPWrapperImpl rightBarButtonTapped", v10, 2u);
      }
      -[NSArray objectAtIndexedSubscript:](self->_rightBarButtonActions, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rightBarButtonTapped:", v8);

    }
  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    -[EKEventGenericDetailViewControllerOOPWrapperImpl rightBarButtonTapped:].cold.1();
  }

}

- (void)bottomStatusButtonTapped:(int64_t)a3
{
  id v4;

  -[EKEventGenericDetailViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomStatusButtonTapped:", a3);

}

- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  -[EKEventGenericDetailViewControllerOOPWrapperImpl bottomStatusButtonTapped:](self, "bottomStatusButtonTapped:", a4);
}

- (double)eventStatusButtonsViewButtonFontSize:(id)a3
{
  return self->_statusButtonsViewCachedFontSize;
}

- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4
{
  self->_statusButtonsViewCachedFontSize = a4;
}

- (NSArray)leftBarButtonActions
{
  return self->_leftBarButtonActions;
}

- (NSArray)leftBarButtonItems
{
  return self->_leftBarButtonItems;
}

- (void)setLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_leftBarButtonItems, a3);
}

- (NSArray)rightBarButtonActions
{
  return self->_rightBarButtonActions;
}

- (NSArray)rightBarButtonItems
{
  return self->_rightBarButtonItems;
}

- (void)setRightBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButtonItems, a3);
}

- (NSArray)bottomStatusButtonActions
{
  return self->_bottomStatusButtonActions;
}

- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)vc
{
  return self->_vc;
}

- (void)setVc:(id)a3
{
  objc_storeStrong((id *)&self->_vc, a3);
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return self->_messageSendingManager;
}

- (void)setMessageSendingManager:(id)a3
{
  objc_storeStrong((id *)&self->_messageSendingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_storeStrong((id *)&self->_vc, 0);
  objc_storeStrong((id *)&self->_bottomStatusButtonActions, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_rightBarButtonActions, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonActions, 0);
  objc_storeStrong((id *)&self->_statusButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_statusButtonsView, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_viewID, 0);
}

- (void)leftBarButtonTapped:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF84D000, v0, v1, "leftBarButtonTapped: _leftBarButtonActions or _leftBarButtonItems is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)leftBarButtonTapped:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF84D000, v0, v1, "leftBarButtonTapped: the buttonIndex is out of bounds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)rightBarButtonTapped:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF84D000, v0, v1, "rightBarButtonTapped: _rightBarButtonActions or _rightBarButtonItems is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)rightBarButtonTapped:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF84D000, v0, v1, "rightBarButtonTapped: the buttonIndex is out of bounds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
