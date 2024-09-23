@implementation MKPlaceCardActionSectionView

- (MKPlaceCardActionSectionView)initWithLeftActionItem:(id)a3 rightActionItem:(id)a4 useSmallFonts:(BOOL)a5 singleItemIsFullWidth:(BOOL)a6
{
  return -[MKPlaceCardActionSectionView initWithLeftActionItem:rightActionItem:useSmallFonts:singleItemIsFullWidth:useMarginLayout:](self, "initWithLeftActionItem:rightActionItem:useSmallFonts:singleItemIsFullWidth:useMarginLayout:", a3, a4, a5, a6, 1);
}

- (MKPlaceCardActionSectionView)initWithLeftActionItem:(id)a3 rightActionItem:(id)a4 useSmallFonts:(BOOL)a5 singleItemIsFullWidth:(BOOL)a6 useMarginLayout:(BOOL)a7
{
  id v13;
  id v14;
  char *v15;
  char *v16;
  id *v17;
  void *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MKPlaceCardActionSectionView;
  v15 = -[MKPlaceCardActionSectionView init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15[464] = a7;
    v17 = (id *)(v15 + 512);
    objc_storeStrong((id *)v15 + 64, a3);
    objc_msgSend(*v17, "addObserver:forKeyPath:options:context:", v16, CFSTR("enabled"), 1, 0);
    objc_msgSend(*v17, "addObserver:forKeyPath:options:context:", v16, CFSTR("selected"), 1, 0);
    objc_storeStrong((id *)v16 + 65, a4);
    v16[465] = a5;
    v16[504] = a6;
    objc_msgSend(v16, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v16, "_setUpViewWithButtons");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v16, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

  }
  return (MKPlaceCardActionSectionView *)v16;
}

- (id)currentLeftItem
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(*(id *)&self->_singleItemIsFullWidth, "selectedItem");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3, v5 = objc_msgSend(*(id *)&self->_singleItemIsFullWidth, "selected"), v4, v5))
  {
    objc_msgSend(*(id *)&self->_singleItemIsFullWidth, "selectedItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = *(id *)&self->_singleItemIsFullWidth;
  }
  return v6;
}

- (void)_setUpViewWithButtons
{
  UIButton *rightButton;
  MKPlaceCardActionItem *rightItem;
  MKPlaceCardActionSectionViewDelegate *delegate;
  void *v6;
  uint64_t v7;
  void *v8;
  MKPlaceCardActionItem *leftItem;
  MKPlaceCardActionItem *v10;
  MKPlaceCardActionItem *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  uint64_t v15;
  NSLayoutConstraint *leftButtonYConstraint;
  void *v17;
  _BOOL4 selected;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIButton *v23;
  UIButton *v24;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *heightAnchor;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;

  -[UIButton removeFromSuperview](self->_rightButton, "removeFromSuperview");
  rightButton = self->_rightButton;
  self->_rightButton = 0;

  -[MKPlaceCardActionItem removeFromSuperview](self->_rightItem, "removeFromSuperview");
  rightItem = self->_rightItem;
  self->_rightItem = 0;

  -[MKPlaceCardActionSectionViewDelegate removeFromSuperview](self->_delegate, "removeFromSuperview");
  delegate = self->_delegate;
  self->_delegate = 0;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCardActionSectionView heightAnchor](self, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 0.0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)&self->_useMarginLayout;
  *(_QWORD *)&self->_useMarginLayout = v7;

  objc_msgSend(v53, "addObject:", *(_QWORD *)&self->_useMarginLayout);
  leftItem = self->_leftItem;
  if (leftItem)
  {
    -[MKPlaceCardActionSectionView _makePlaceActionButtonWithActionItem:isLeftItem:useSmallFonts:](self, "_makePlaceActionButtonWithActionItem:isLeftItem:useSmallFonts:", leftItem, 0, self->super._highlighted);
    v10 = (MKPlaceCardActionItem *)objc_claimAutoreleasedReturnValue();
    v11 = self->_rightItem;
    self->_rightItem = v10;

    -[MKPlaceCardActionSectionView addSubview:](self, "addSubview:", self->_rightItem);
    -[MKPlaceCardActionItem centerYAnchor](self->_rightItem, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCardActionSectionView centerYAnchor](self, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v15 = 488;
    leftButtonYConstraint = self->_leftButtonYConstraint;
    self->_leftButtonYConstraint = v14;

    objc_msgSend(v53, "addObject:", self->_leftButtonYConstraint);
    -[MKPlaceCardActionItem trailingAnchor](self->_rightItem, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    selected = self->super._selected;
    if (self->super._selected)
    {
      -[MKPlaceCardActionSectionView layoutMarginsGuide](self, "layoutMarginsGuide");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v15, "trailingAnchor");
    }
    else
    {
      -[MKPlaceCardActionSectionView trailingAnchor](self, "trailingAnchor");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObject:", v20);

    if (selected)
    {

      v19 = (void *)v15;
    }

  }
  -[MKPlaceCardActionSectionView currentLeftItem](self, "currentLeftItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[MKPlaceCardActionSectionView currentLeftItem](self, "currentLeftItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCardActionSectionView _makePlaceActionButtonWithActionItem:isLeftItem:useSmallFonts:](self, "_makePlaceActionButtonWithActionItem:isLeftItem:useSmallFonts:", v22, 1, self->super._highlighted);
    v23 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v24 = self->_rightButton;
    self->_rightButton = v23;

    -[MKPlaceCardActionSectionView addSubview:](self, "addSubview:", self->_rightButton);
    -[UIButton centerYAnchor](self->_rightButton, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCardActionSectionView centerYAnchor](self, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    heightAnchor = self->_heightAnchor;
    self->_heightAnchor = v27;

    objc_msgSend(v53, "addObject:", self->_heightAnchor);
    -[UIButton topAnchor](self->_rightButton, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCardActionSectionView topAnchor](self, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObject:", v31);

    -[UIButton bottomAnchor](self->_rightButton, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCardActionSectionView bottomAnchor](self, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObject:", v34);

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "userInterfaceIdiom");

    -[UIButton leadingAnchor](self->_rightButton, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = self->super._selected;
    if (v36 == 5)
    {
      if (self->super._selected)
      {
        -[MKPlaceCardActionSectionView layoutMarginsGuide](self, "layoutMarginsGuide");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "leadingAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[MKPlaceCardActionSectionView leadingAnchor](self, "leadingAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v40;
      }
      objc_msgSend(v37, "constraintEqualToAnchor:constant:", v40, 30.0);
      v41 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (self->super._selected)
      {
        -[MKPlaceCardActionSectionView layoutMarginsGuide](self, "layoutMarginsGuide");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "leadingAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[MKPlaceCardActionSectionView leadingAnchor](self, "leadingAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v40;
      }
      objc_msgSend(v37, "constraintEqualToAnchor:", v40);
      v41 = objc_claimAutoreleasedReturnValue();
    }
    v42 = (void *)v41;
    objc_msgSend(v53, "addObject:", v41);

    if (v38)
    if (!self->_leftItem)
    {
      -[UIButton trailingAnchor](self->_rightButton, "trailingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = self->super._selected;
      if (self->super._selected)
      {
        -[MKPlaceCardActionSectionView layoutMarginsGuide](self, "layoutMarginsGuide");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "trailingAnchor");
      }
      else
      {
        -[MKPlaceCardActionSectionView trailingAnchor](self, "trailingAnchor");
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:", v46);

      if (v44)
      {

        v45 = v39;
      }

    }
    if (self->_rightItem)
    {
      -[MKPlaceCardActionSectionView currentLeftItem](self, "currentLeftItem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        LODWORD(v48) = 1148846080;
        -[UIButton _mapkit_setContentCompressionResistancePriority:forAxis:](self->_rightButton, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v48);
        -[UIButton trailingAnchor](self->_rightButton, "trailingAnchor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceCardActionItem leadingAnchor](self->_rightItem, "leadingAnchor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "constraintLessThanOrEqualToAnchor:constant:", v50, -20.0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        -[MKPlaceCardActionItem titleLabel](self->_rightItem, "titleLabel");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setLineBreakMode:", 3);

        objc_msgSend(v53, "addObject:", v51);
      }
    }
  }
  -[MKPlaceCardActionSectionView _contentSizeDidChange](self, "_contentSizeDidChange");
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v53);

}

- (id)glyphFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 5)
  {
    objc_msgSend((id)objc_opt_class(), "_font:", self->super._highlighted);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pointSize");
    v8 = v7 / 13.0;

    v9 = round(v8 * 16.0);
    if (v9 > 42.0)
      v9 = 42.0;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)setTopHairlineHidden:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  void *v6;
  double v7;
  NSLayoutConstraint *leftButtonYConstraint;
  double v9;
  double v10;
  NSLayoutConstraint *heightAnchor;
  double v12;
  objc_super v13;

  v3 = a3;
  if (-[MKViewWithHairline isTopHairlineHidden](self, "isTopHairlineHidden") != a3)
  {
    if (v3)
      v5 = -6.0;
    else
      v5 = 6.0;
    v6 = *(void **)&self->_useMarginLayout;
    objc_msgSend(v6, "constant");
    objc_msgSend(v6, "setConstant:", v5 + v7);
    leftButtonYConstraint = self->_leftButtonYConstraint;
    v9 = v5 * 0.5;
    -[NSLayoutConstraint constant](leftButtonYConstraint, "constant");
    -[NSLayoutConstraint setConstant:](leftButtonYConstraint, "setConstant:", v9 + v10);
    heightAnchor = self->_heightAnchor;
    -[NSLayoutConstraint constant](heightAnchor, "constant");
    -[NSLayoutConstraint setConstant:](heightAnchor, "setConstant:", v9 + v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)MKPlaceCardActionSectionView;
  -[MKViewWithHairline setTopHairlineHidden:](&v13, sel_setTopHairlineHidden_, v3);
}

- (void)infoCardThemeChanged
{
  UIButton *rightButton;
  void *v4;
  void *v5;
  MKPlaceCardActionItem *rightItem;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKPlaceCardActionSectionView;
  -[MKPlaceSectionItemView infoCardThemeChanged](&v9, sel_infoCardThemeChanged);
  rightButton = self->_rightButton;
  -[UIView mk_theme](self, "mk_theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](rightButton, "setTitleColor:forState:", v5, 0);

  rightItem = self->_rightItem;
  -[UIView mk_theme](self, "mk_theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCardActionItem setTitleColor:forState:](rightItem, "setTitleColor:forState:", v8, 0);

}

+ (id)_font:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "attributionFont");
  else
    objc_msgSend(v4, "bodyFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_contentSizeDidChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  id v9;

  objc_msgSend((id)objc_opt_class(), "_font:", self->super._highlighted);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  v4 = 40.0;
  if (!self->super._highlighted)
    v4 = 60.0;
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", v4);
  v6 = v5;
  v7 = -[MKViewWithHairline isTopHairlineHidden](self, "isTopHairlineHidden");
  v8 = 6.0;
  if (v7)
    v8 = 0.0;
  objc_msgSend(*(id *)&self->_useMarginLayout, "setConstant:", v6 + v8);

}

- (id)_makePlaceActionButtonWithActionItem:(id)a3 isLeftItem:(BOOL)a4 useSmallFonts:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CEA3A0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend((id)objc_opt_class(), "_setButtonString:forActionItem:isLeftItem:", v8, v7, v5);

  return v8;
}

- (void)_leftButtonIsPressed:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[MKPlaceCardActionSectionView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKPlaceCardActionSectionView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCardActionSectionView currentLeftItem](self, "currentLeftItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placeCardActionSectionView:buttonWithActionItemPressed:", self, v6);

  }
}

- (void)_rightButtonIsPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[MKPlaceCardActionSectionView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKPlaceCardActionSectionView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeCardActionSectionView:buttonWithActionItemPressed:", self, self->_leftItem);

  }
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(*(id *)&self->_singleItemIsFullWidth, "removeObserver:forKeyPath:", self, CFSTR("enabled"));
  objc_msgSend(*(id *)&self->_singleItemIsFullWidth, "removeObserver:forKeyPath:", self, CFSTR("selected"));
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceCardActionSectionView;
  -[MKPlaceCardActionSectionView dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("enabled")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("selected")))
  {
    -[MKPlaceCardActionSectionView _setUpViewWithButtons](self, "_setUpViewWithButtons");
  }

}

- (MKPlaceCardActionItem)leftItem
{
  return *(MKPlaceCardActionItem **)&self->_singleItemIsFullWidth;
}

- (void)setLeftItem:(id)a3
{
  objc_storeStrong((id *)&self->_singleItemIsFullWidth, a3);
}

- (MKPlaceCardActionItem)rightItem
{
  return self->_leftItem;
}

- (void)setRightItem:(id)a3
{
  objc_storeStrong((id *)&self->_leftItem, a3);
}

- (BOOL)singleItemIsFullWidth
{
  return (BOOL)self->_platterSizeConstraint;
}

- (void)setSingleItemIsFullWidth:(BOOL)a3
{
  LOBYTE(self->_platterSizeConstraint) = a3;
}

- (UIButton)rightButton
{
  return (UIButton *)self->_rightItem;
}

- (void)setRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightItem, a3);
}

- (UIButton)leftButton
{
  return self->_rightButton;
}

- (void)setLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightButton, a3);
}

- (MKPlaceCardActionSectionViewDelegate)delegate
{
  return (MKPlaceCardActionSectionViewDelegate *)objc_loadWeakRetained((id *)&self->_leftButton);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_leftButton, a3);
}

- (UIView)accessoryView
{
  return (UIView *)self->_delegate;
}

- (void)setAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_leftButton);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_rightItem, 0);
  objc_storeStrong((id *)&self->_leftItem, 0);
  objc_storeStrong((id *)&self->_singleItemIsFullWidth, 0);
  objc_storeStrong((id *)&self->_rightButtonYConstraint, 0);
  objc_storeStrong((id *)&self->_leftButtonYConstraint, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_useMarginLayout, 0);
}

@end
