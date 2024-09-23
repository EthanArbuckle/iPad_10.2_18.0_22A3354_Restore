@implementation LUIMajorViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LUIMajorViewController;
  -[LUIMajorViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[LUIMajorViewController _initializeBottomLeftVibrantButtonIfNeeded](self, "_initializeBottomLeftVibrantButtonIfNeeded");
  -[LUIMajorViewController _initializeBottomRightVibrantButtonIfNeeded](self, "_initializeBottomRightVibrantButtonIfNeeded");
  -[LUIMajorViewController _updateBottomLeftVibrantButtonIfNeeded](self, "_updateBottomLeftVibrantButtonIfNeeded");
  -[LUIMajorViewController _updateBottomRightVibrantButtonIfNeeded](self, "_updateBottomRightVibrantButtonIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUIMajorViewController;
  -[LUIMajorViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  if (self->_bottomLeftVibrantButton)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIMajorViewController view](self, "view"));
    objc_msgSend(v3, "bringSubviewToFront:", self->_bottomLeftVibrantButton);

  }
  if (self->_bottomRightVibrantButton)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIMajorViewController view](self, "view"));
    objc_msgSend(v4, "bringSubviewToFront:", self->_bottomRightVibrantButton);

  }
}

- (void)bottomRightVibrantButtonTapped:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  LUIAnonymousViewController *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance", a3));
  v5 = objc_msgSend(v4, "presentUserLimitIsReachedAlertIfNeeded");

  if ((v5 & 1) == 0)
  {
    v7 = objc_opt_new(LUIAnonymousViewController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIMajorViewController navigationController](self, "navigationController"));
    objc_msgSend(v6, "pushViewController:animated:", v7, 1);

  }
}

- (BOOL)shouldShowBottomLeftVibrantButton
{
  return 0;
}

- (BOOL)shouldShowBottomRightVibrantButton
{
  return 0;
}

- (int64_t)imageTypeForBottomLeftVibrantButton
{
  return 0;
}

- (int64_t)imageTypeForBottomRightVibrantButton
{
  return 0;
}

- (id)titleForBottomLeftVibrantButton
{
  return 0;
}

- (id)titleForBottomRightVibrantButton
{
  return 0;
}

- (void)_initializeBottomLeftVibrantButtonIfNeeded
{
  SBUIVibrantButton *v3;
  SBUIVibrantButton *bottomLeftVibrantButton;
  void *v5;
  SBUIVibrantButton *v6;
  void *v7;
  id v8;

  if (-[LUIMajorViewController shouldShowBottomLeftVibrantButton](self, "shouldShowBottomLeftVibrantButton"))
  {
    if (!self->_bottomLeftVibrantButton)
    {
      v3 = (SBUIVibrantButton *)objc_claimAutoreleasedReturnValue(+[LUIVibrantButtonSupport defaultVibrantButtonWithImageType:vibrancyAllowed:](LUIVibrantButtonSupport, "defaultVibrantButtonWithImageType:vibrancyAllowed:", -[LUIMajorViewController imageTypeForBottomLeftVibrantButton](self, "imageTypeForBottomLeftVibrantButton"), 1));
      bottomLeftVibrantButton = self->_bottomLeftVibrantButton;
      self->_bottomLeftVibrantButton = v3;

      -[SBUIVibrantButton setTitle:](self->_bottomLeftVibrantButton, "setTitle:", CFSTR("test"));
      -[SBUIVibrantButton addTarget:action:forControlEvents:](self->_bottomLeftVibrantButton, "addTarget:action:forControlEvents:", self, "bottomLeftVibrantButtonTapped:", 64);
      -[SBUIVibrantButton setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomLeftVibrantButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIMajorViewController view](self, "view"));
      objc_msgSend(v5, "addSubview:", self->_bottomLeftVibrantButton);

      v6 = self->_bottomLeftVibrantButton;
      v8 = (id)objc_claimAutoreleasedReturnValue(-[LUIMajorViewController view](self, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[LUIVibrantButtonSupport defaultConstraintsForBottomLeftVibrantButton:inView:](LUIVibrantButtonSupport, "defaultConstraintsForBottomLeftVibrantButton:inView:", v6, v8));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

    }
  }
}

- (void)_initializeBottomRightVibrantButtonIfNeeded
{
  SBUIVibrantButton *v3;
  SBUIVibrantButton *bottomRightVibrantButton;
  void *v5;
  SBUIVibrantButton *v6;
  void *v7;
  id v8;

  if (-[LUIMajorViewController shouldShowBottomRightVibrantButton](self, "shouldShowBottomRightVibrantButton"))
  {
    if (!self->_bottomRightVibrantButton)
    {
      v3 = (SBUIVibrantButton *)objc_claimAutoreleasedReturnValue(+[LUIVibrantButtonSupport defaultVibrantButtonWithImageType:vibrancyAllowed:](LUIVibrantButtonSupport, "defaultVibrantButtonWithImageType:vibrancyAllowed:", -[LUIMajorViewController imageTypeForBottomRightVibrantButton](self, "imageTypeForBottomRightVibrantButton"), 1));
      bottomRightVibrantButton = self->_bottomRightVibrantButton;
      self->_bottomRightVibrantButton = v3;

      -[SBUIVibrantButton setTitle:](self->_bottomRightVibrantButton, "setTitle:", CFSTR("test"));
      -[SBUIVibrantButton addTarget:action:forControlEvents:](self->_bottomRightVibrantButton, "addTarget:action:forControlEvents:", self, "bottomRightVibrantButtonTapped:", 64);
      -[SBUIVibrantButton setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomRightVibrantButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIMajorViewController view](self, "view"));
      objc_msgSend(v5, "addSubview:", self->_bottomRightVibrantButton);

      v6 = self->_bottomRightVibrantButton;
      v8 = (id)objc_claimAutoreleasedReturnValue(-[LUIMajorViewController view](self, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[LUIVibrantButtonSupport defaultConstraintsForBottomRightVibrantButton:inView:](LUIVibrantButtonSupport, "defaultConstraintsForBottomRightVibrantButton:inView:", v6, v8));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

    }
  }
}

- (void)_updateBottomLeftVibrantButtonIfNeeded
{
  unsigned int v3;
  SBUIVibrantButton *bottomLeftVibrantButton;
  id v5;

  if (self->_bottomLeftVibrantButton)
  {
    v3 = -[LUIMajorViewController shouldShowBottomLeftVibrantButton](self, "shouldShowBottomLeftVibrantButton");
    bottomLeftVibrantButton = self->_bottomLeftVibrantButton;
    if (v3)
    {
      -[SBUIVibrantButton setHidden:](bottomLeftVibrantButton, "setHidden:", 0);
      v5 = (id)objc_claimAutoreleasedReturnValue(-[LUIMajorViewController titleForBottomLeftVibrantButton](self, "titleForBottomLeftVibrantButton"));
      -[SBUIVibrantButton setTitle:](self->_bottomLeftVibrantButton, "setTitle:", v5);

    }
    else
    {
      -[SBUIVibrantButton setHidden:](bottomLeftVibrantButton, "setHidden:", 1);
    }
  }
}

- (void)_updateBottomRightVibrantButtonIfNeeded
{
  unsigned int v3;
  SBUIVibrantButton *bottomRightVibrantButton;
  id v5;

  if (self->_bottomRightVibrantButton)
  {
    v3 = -[LUIMajorViewController shouldShowBottomRightVibrantButton](self, "shouldShowBottomRightVibrantButton");
    bottomRightVibrantButton = self->_bottomRightVibrantButton;
    if (v3)
    {
      -[SBUIVibrantButton setHidden:](bottomRightVibrantButton, "setHidden:", 0);
      v5 = (id)objc_claimAutoreleasedReturnValue(-[LUIMajorViewController titleForBottomRightVibrantButton](self, "titleForBottomRightVibrantButton"));
      -[SBUIVibrantButton setTitle:](self->_bottomRightVibrantButton, "setTitle:", v5);

    }
    else
    {
      -[SBUIVibrantButton setHidden:](bottomRightVibrantButton, "setHidden:", 1);
    }
  }
}

- (SBUIVibrantButton)bottomLeftVibrantButton
{
  return self->_bottomLeftVibrantButton;
}

- (void)setBottomLeftVibrantButton:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLeftVibrantButton, a3);
}

- (SBUIVibrantButton)bottomRightVibrantButton
{
  return self->_bottomRightVibrantButton;
}

- (void)setBottomRightVibrantButton:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRightVibrantButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRightVibrantButton, 0);
  objc_storeStrong((id *)&self->_bottomLeftVibrantButton, 0);
}

@end
