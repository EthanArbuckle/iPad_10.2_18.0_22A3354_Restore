@implementation _SFWebClipViewController

- (_SFWebClipViewController)initWithStyle:(int64_t)a3
{
  _SFWebClipViewController *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _SFWebClipViewController *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_SFWebClipViewController;
  v3 = -[_SFWebClipViewController initWithStyle:](&v14, sel_initWithStyle_, 1);
  if (v3)
  {
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebClipViewController setTitle:](v3, "setTitle:", v4);

    v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, v3, sel__add);

    -[_SFWebClipViewController navigationItem](v3, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v7);

    objc_msgSend(v7, "setEnabled:", 0);
    v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v10 = (void *)objc_msgSend(v9, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E0DC34F0], "_sf_popoverCancelButtonItem"), v3, sel__cancel);
    -[_SFWebClipViewController navigationItem](v3, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);

    v3->_canEditAndSave = 0;
    v12 = v3;

  }
  return v3;
}

- (void)loadView
{
  _SFBookmarkTextEntryTableViewCell *v3;
  UITableViewCell *titleCell;
  void *v5;
  UITableViewCell *v6;
  UITableViewCell *addressCell;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImageView *v12;
  UIImageView *iconImageView;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_SFWebClipViewController;
  -[_SFWebClipViewController loadView](&v16, sel_loadView);
  v3 = -[_SFBookmarkTextEntryTableViewCell initWithText:autocapitalizationType:autocorrectionType:]([_SFBookmarkTextEntryTableViewCell alloc], "initWithText:autocapitalizationType:autocorrectionType:", 0, 2, 0);
  titleCell = self->_titleCell;
  self->_titleCell = &v3->super;

  -[UITableViewCell setSelectionStyle:](self->_titleCell, "setSelectionStyle:", 0);
  -[UITableViewCell editableTextField](self->_titleCell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", self->_canEditAndSave);

  v6 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
  addressCell = self->_addressCell;
  self->_addressCell = v6;

  -[UITableViewCell setSelectionStyle:](self->_addressCell, "setSelectionStyle:", 0);
  -[UITableViewCell textLabel](self->_addressCell, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

  -[UITableViewCell editableTextField](self->_titleCell, "editableTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__textFieldChanged_, *MEMORY[0x1E0DC54D0], v9);

  -[_SFWebClipViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 60.0, 60.0);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v12;

  -[UIImageView layer](self->_iconImageView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setZPosition:", 1.0);

  objc_msgSend(v11, "addSubview:", self->_iconImageView);
  if (-[_SFWebClipViewController _shouldUseTranslucentAppearance](self, "_shouldUseTranslucentAppearance"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v15);

  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFWebClipViewController;
  -[_SFWebClipViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[_SFWebClipViewController updateUIAnimated:](self, "updateUIAnimated:", 0);
}

- (void)updateUIAnimated:(BOOL)a3
{
  _BOOL4 v3;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v3 = a3;
  if (-[_SFWebClipViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIWebClip title](self->_webClip, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITableViewCell editableTextField](self->_titleCell, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[UIWebClip pageURL](self->_webClip, "pageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_userVisibleString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](self->_addressCell, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    -[_SFWebClipViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "footerViewForSection:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "defaultContentConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebClipViewController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebClipViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v16);

    objc_msgSend(v13, "setContentConfiguration:", v14);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __45___SFWebClipViewController_updateUIAnimated___block_invoke;
    v21[3] = &unk_1E4ABFE00;
    v21[4] = self;
    v17 = MEMORY[0x1A8598C40](v21);
    v18 = (void *)v17;
    if (v3)
    {
      v19 = (void *)MEMORY[0x1E0DC3F10];
      -[_SFWebClipViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "transitionWithView:duration:options:animations:completion:", v20, 5242880, v18, 0, 0.349999994);

    }
    else
    {
      (*(void (**)(uint64_t))(v17 + 16))(v17);
    }

  }
}

- (void)setCanEditAndSave:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_canEditAndSave != a3)
  {
    self->_canEditAndSave = a3;
    -[UITableViewCell editableTextField](self->_titleCell, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", self->_canEditAndSave);

    -[_SFWebClipViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", -[_SFWebClipViewController _canAddWebClip](self, "_canAddWebClip"));

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SFWebClipViewController;
  -[_SFWebClipViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[_SFWebClipViewController updateUIAnimated:](self, "updateUIAnimated:", 0);
  self->_suspendAfterDismiss = 0;
  -[_SFWebClipViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[_SFWebClipViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "cellForRowAtIndexPath:", v6);

  if ((-[_SFWebClipViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) == 0)
  {
    -[UITableViewCell editableTextField](self->_titleCell, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "becomeFirstResponder");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[UITableViewCell editableTextField](self->_titleCell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  v6.receiver = self;
  v6.super_class = (Class)_SFWebClipViewController;
  -[_SFWebClipViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _SFWebClipViewController *v6;
  id WeakRetained;
  objc_super v8;

  v3 = a3;
  -[_SFWebClipViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (_SFWebClipViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    if (self->_suspendAfterDismiss)
    {
      self->_suspendAfterDismiss = 0;
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "suspend");
    }
    v8.receiver = self;
    v8.super_class = (Class)_SFWebClipViewController;
    -[_SFWebClipViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, v3);
    if (!self->_delegateNotifiedOfResult)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "webClipViewController:didFinishWithResult:", self, 0);

    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  int *v6;

  v5 = objc_msgSend(a4, "row", a3);
  v6 = &OBJC_IVAR____SFWebClipViewController__addressCell;
  if (!v5)
    v6 = &OBJC_IVAR____SFWebClipViewController__titleCell;
  return *(id *)((char *)&self->super.super.super.super.isa + *v6);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5;
  UIWebClip *webClip;
  void *v7;

  v5 = a3;
  webClip = self->_webClip;
  if (webClip)
    -[UIWebClip fullScreen](webClip, "fullScreen");
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_canEditAndSave && !objc_msgSend(v7, "row"))
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  _SFBookmarkTextEntryTableViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFBookmarkTextEntryTableViewController *v9;

  v5 = [_SFBookmarkTextEntryTableViewController alloc];
  -[UITableViewCell editableTextField](self->_titleCell, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_SFBookmarkTextEntryTableViewController initWithBookmarkInfoViewField:text:autocapitalizationType:autocorrectionType:delegate:](v5, "initWithBookmarkInfoViewField:text:autocapitalizationType:autocorrectionType:delegate:", 0, v7, 2, 0, self);

  -[_SFWebClipViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v9, 1);

}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 80.5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v4;
  double v5;
  double v6;
  double result;

  -[_SFWebClipViewController tableView](self, "tableView", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;

  result = *MEMORY[0x1E0DC53D8];
  if (v6 <= 0.0)
    return 80.5;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (UIEdgeInsets)_cellInset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  -[_SFWebClipViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sf_safeAreaInsetsFlippedForLayoutDirectionality");
  v4 = v3 + 90.0;

  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v8;
  result.top = v5;
  return result;
}

- (CGPoint)_centerForIconView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;
  CGRect v24;

  -[_SFWebClipViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectForSection:", 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "rectForHeaderInSection:", 0);
  v13 = v12;
  objc_msgSend(v3, "rectForFooterInSection:", 0);
  v15 = v14;
  -[_SFWebClipViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_sf_usesLeftToRightLayout");

  objc_msgSend(v3, "safeAreaInsets");
  v24.size.height = v11 + v13 - v15;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  CGRectGetMidY(v24);
  _SFRoundPointToPixels();
  v18 = v17;
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (void)viewDidLayoutSubviews
{
  UIImageView *iconImageView;
  void *v4;
  id v5;
  CGRect v6;

  iconImageView = self->_iconImageView;
  -[_SFWebClipViewController _centerForIconView](self, "_centerForIconView");
  -[UIImageView setCenter:](iconImageView, "setCenter:");
  -[_SFWebClipViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFWebClipViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "sizeThatFits:", CGRectGetWidth(v6), 1.79769313e308);
  -[_SFWebClipViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;

  -[UITableViewCell editableTextField](self->_titleCell, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  -[UITableViewCell setAccessoryType:](self->_titleCell, "setAccessoryType:", 0);
  -[UITableViewCell setSelectionStyle:](self->_titleCell, "setSelectionStyle:", 0);
  -[_SFWebClipViewController _cellInset](self, "_cellInset");
  -[UITableViewCell setSeparatorInset:](self->_titleCell, "setSeparatorInset:");
  -[_SFWebClipViewController _cellInset](self, "_cellInset");
  -[UITableViewCell setSeparatorInset:](self->_addressCell, "setSeparatorInset:");
}

- (void)_cancel
{
  id WeakRetained;

  -[UIWebClip cancelMediaUpdate](self->_webClip, "cancelMediaUpdate");
  self->_delegateNotifiedOfResult = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "webClipViewController:didFinishWithResult:", self, 0);

}

- (void)_add
{
  void *v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;

  if (!-[_SFWebClipViewController _showDemoModeFeatureDisabledAlert](self, "_showDemoModeFeatureDisabledAlert"))
  {
    -[UITableViewCell editableTextField](self->_titleCell, "editableTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resignFirstResponder");

    if (objc_msgSend(MEMORY[0x1E0D8A8F8], "hasInternalContent"))
    {
      if (!+[_SFFeatureAvailability isHSWADisabled](_SFFeatureAvailability, "isHSWADisabled"))
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("SFWebClipsAlwaysFullScreen"));

        if (v5)
          -[UIWebClip setFullScreen:](self->_webClip, "setFullScreen:", 1);
      }
    }
    v6 = -[_SFWebClipViewController createAndAddToHomeScreenBundle](self, "createAndAddToHomeScreenBundle");
    if (v6)
    {
      self->_suspendAfterDismiss = 1;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0DC3450];
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addAction:", v13);
      -[_SFWebClipViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

    }
    -[UIWebClip cancelMediaUpdate](self->_webClip, "cancelMediaUpdate");
    self->_delegateNotifiedOfResult = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "webClipViewController:didFinishWithResult:", self, v6);

  }
}

- (BOOL)_showDemoModeFeatureDisabledAlert
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v3 = objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode");
  if (v3 && !self->_showingDemoModeAlert)
  {
    self->_showingDemoModeAlert = 1;
    v4 = (void *)MEMORY[0x1E0DC3450];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61___SFWebClipViewController__showDemoModeFeatureDisabledAlert__block_invoke;
    v11[3] = &unk_1E4AC0010;
    v11[4] = self;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v9);

    -[_SFWebClipViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
  return v3;
}

- (BOOL)createAndAddToHomeScreenBundle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;

  -[UIWebClip pageURL](self->_webClip, "pageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length")
    || (-[UIWebClip title](self->_webClip, "title"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        !v6))
  {
    v16 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_SFWebClipViewController createAndAddToHomeScreenBundle].cold.1(v16);
    goto LABEL_9;
  }
  if (!-[UIWebClip createOnDisk](self->_webClip, "createOnDisk"))
  {
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v7 = (void *)*MEMORY[0x1E0DC4730];
  -[UIWebClip identifier](self->_webClip, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addWebClipToHomeScreen:", v8);

  -[UIWebClip _sf_applicationManifest](self->_webClip, "_sf_applicationManifest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB36F8];
    -[UIWebClip _sf_applicationManifest](self->_webClip, "_sf_applicationManifest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIWebClip _sf_applicationManifestPath](self->_webClip, "_sf_applicationManifestPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "writeToURL:atomically:", v13, 1);

  }
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didAddWebClip");

  v15 = 1;
LABEL_10:

  return v15;
}

- (BOOL)_canAddWebClip
{
  void *v2;
  BOOL v3;

  if (!self->_canEditAndSave)
    return 0;
  -[UIWebClip title](self->_webClip, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  _BOOL4 v4;

  v4 = -[_SFWebClipViewController _canAddWebClip](self, "_canAddWebClip", a3);
  if (v4)
    -[_SFWebClipViewController _add](self, "_add");
  return v4;
}

- (void)_textFieldChanged:(id)a3
{
  UIWebClip *webClip;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  id v10;

  webClip = self->_webClip;
  -[UITableViewCell editableTextField](self->_titleCell, "editableTextField", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_web_stringByTrimmingWhitespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWebClip setTitle:](webClip, "setTitle:", v7);

  v8 = -[_SFWebClipViewController _canAddWebClip](self, "_canAddWebClip");
  -[_SFWebClipViewController navigationItem](self, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v8);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UITableViewCell editableTextField](self->_titleCell, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)_SFWebClipViewController;
  -[_SFWebClipViewController dealloc](&v5, sel_dealloc);
}

- (BOOL)_shouldUseTranslucentAppearance
{
  if ((-[_SFWebClipViewController safari_isPresentedByActivityViewController](self, "safari_isPresentedByActivityViewController") & 1) != 0)return 0;
  else
    return -[_SFWebClipViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
}

- (void)bookmarkTextEntryTableViewController:(id)a3 dismissedWithText:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "length"))
    -[UIWebClip setTitle:](self->_webClip, "setTitle:", v5);

}

- (BOOL)bookmarkTextEntryTableViewControllerShouldUseTranslucentAppearance:(id)a3
{
  return 0;
}

- (UIWebClip)webClip
{
  return (UIWebClip *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setWebClip:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (_SFWebClipViewControllerDelegate)delegate
{
  return (_SFWebClipViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canEditAndSave
{
  return self->_canEditAndSave;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_addressCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)createAndAddToHomeScreenBundle
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Can't create Web Clip: no URL or title", v1, 2u);
}

@end
