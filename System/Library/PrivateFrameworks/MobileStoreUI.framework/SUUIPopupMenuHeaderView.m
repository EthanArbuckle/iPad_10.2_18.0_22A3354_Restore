@implementation SUUIPopupMenuHeaderView

- (SUUIPopupMenuHeaderView)initWithFrame:(CGRect)a3
{
  SUUIPopupMenuHeaderView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIPopupMenuHeaderView;
  v3 = -[SUUIPopupMenuHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPopupMenuHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPopoverController setDelegate:](self->_menuPopoverController, "setDelegate:", 0);
  -[SUUIMenuViewController setDelegate:](self->_menuViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIPopupMenuHeaderView;
  -[SUUIPopupMenuHeaderView dealloc](&v3, sel_dealloc);
}

- (void)setColoringWithColorScheme:(id)a3
{
  UILabel *menuLabel;
  id v6;
  void *v7;
  UILabel *titleLabel;
  void *v9;
  UILabel *v10;
  void *v11;
  id v12;
  void *v13;
  UILabel *v14;
  id v15;

  menuLabel = self->_menuLabel;
  if (a3)
  {
    v6 = a3;
    objc_msgSend(v6, "secondaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](menuLabel, "setTextColor:", v7);

    titleLabel = self->_titleLabel;
    objc_msgSend(v6, "primaryTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = titleLabel;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BEBD4B8];
    v12 = 0;
    objc_msgSend(v11, "colorWithWhite:alpha:", 0.0, 0.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](menuLabel, "setTextColor:", v13);

    v14 = self->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
  }
  -[UILabel setTextColor:](v10, "setTextColor:", v9);

  objc_msgSend(a3, "backgroundColor");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIPopupMenuHeaderView setBackgroundColor:](self, "setBackgroundColor:", v15);
}

- (void)setMenuItemTitles:(id)a3
{
  NSArray *v4;
  NSArray *menuItemTitles;

  if (self->_menuItemTitles != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    menuItemTitles = self->_menuItemTitles;
    self->_menuItemTitles = v4;

    -[SUUIPopupMenuHeaderView _reloadMenuButton](self, "_reloadMenuButton");
  }
}

- (void)setMenuLabelTitle:(id)a3
{
  NSString *v4;
  NSString *menuLabelTitle;

  if (self->_menuLabelTitle != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    menuLabelTitle = self->_menuLabelTitle;
    self->_menuLabelTitle = v4;

    -[SUUIPopupMenuHeaderView _reloadMenuButton](self, "_reloadMenuButton");
  }
}

- (void)setSelectedMenuItemIndex:(int64_t)a3
{
  if (self->_selectedMenuItemIndex != a3)
  {
    self->_selectedMenuItemIndex = a3;
    -[SUUIPopupMenuHeaderView _reloadMenuButton](self, "_reloadMenuButton");
  }
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIPopupMenuHeaderView _titleLabel](self, "_titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIButton *menuButton;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  float v13;
  double v14;
  UILabel *menuLabel;
  double v16;
  double v17;
  float v18;
  UILabel *titleLabel;
  double v20;
  double v21;
  double v22;
  CGRect v23;

  -[SUUIPopupMenuHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5 + -15.0;
  menuButton = self->_menuButton;
  if (menuButton)
  {
    -[UIButton frame](menuButton, "frame");
    v9 = v8;
    v11 = v10;
    v12 = v6 - v8;
    v13 = (v4 - v10) * 0.5;
    v14 = floorf(v13);
    -[UIButton setFrame:](self->_menuButton, "setFrame:", v12, v14);
    menuLabel = self->_menuLabel;
    if (menuLabel)
    {
      -[UILabel frame](menuLabel, "frame");
      v9 = v16;
      v11 = v17;
      v12 = v12 - v16 + -5.0;
      v18 = (v4 - v17) * 0.5;
      v14 = floorf(v18);
      -[UILabel setFrame:](self->_menuLabel, "setFrame:", v12, v14);
    }
    v23.origin.x = v12;
    v23.origin.y = v14;
    v23.size.width = v9;
    v23.size.height = v11;
    v6 = CGRectGetMinX(v23) + -15.0;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6 + -15.0, 1.79769313e308);
    v21 = v20;
    *(float *)&v20 = (v4 - v22) * 0.5;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, floorf(*(float *)&v20), v21, v22);
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIButton *menuButton;
  id v5;
  UILabel *menuLabel;
  void *v7;
  UILabel *titleLabel;
  void *v9;
  objc_super v10;

  menuButton = self->_menuButton;
  v5 = a3;
  -[UIButton setBackgroundColor:](menuButton, "setBackgroundColor:", v5);
  menuLabel = self->_menuLabel;
  if (v5)
  {
    -[UILabel setBackgroundColor:](self->_menuLabel, "setBackgroundColor:", v5);
    -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](menuLabel, "setBackgroundColor:", v7);

    titleLabel = self->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](titleLabel, "setBackgroundColor:", v9);

  }
  v10.receiver = self;
  v10.super_class = (Class)SUUIPopupMenuHeaderView;
  -[SUUIPopupMenuHeaderView setBackgroundColor:](&v10, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 44.0;
  result.height = v3;
  return result;
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  SUUIPopupMenuDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;
  UIPopoverController *menuPopoverController;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  if (self->_selectedMenuItemIndex != a4)
  {
    self->_selectedMenuItemIndex = a4;
    p_delegate = &self->_delegate;
    v20 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "popupMenuHeader:didSelectMenuItemAtIndex:", self, a4);

    }
    -[SUUIPopupMenuHeaderView _reloadMenuButton](self, "_reloadMenuButton");
    -[SUUIPopupMenuHeaderView layoutIfNeeded](self, "layoutIfNeeded");
    menuPopoverController = self->_menuPopoverController;
    -[UIButton frame](self->_menuButton, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[UIButton superview](self->_menuButton, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](menuPopoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v19, 1, 1, v12, v14, v16, v18);

    objc_msgSend(v20, "setIndexOfCheckedTitle:", self->_selectedMenuItemIndex);
  }
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  SUUIMenuViewController *menuViewController;
  UIPopoverController *menuPopoverController;

  -[SUUIMenuViewController setDelegate:](self->_menuViewController, "setDelegate:", 0);
  menuViewController = self->_menuViewController;
  self->_menuViewController = 0;

  -[UIPopoverController setDelegate:](self->_menuPopoverController, "setDelegate:", 0);
  menuPopoverController = self->_menuPopoverController;
  self->_menuPopoverController = 0;

}

- (void)_menuButtonAction:(id)a3
{
  id v4;
  SUUIMenuViewController *v5;
  SUUIMenuViewController *menuViewController;
  double v7;
  UIPopoverController *v8;
  UIPopoverController *menuPopoverController;
  UIPopoverController *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  if (!self->_menuPopoverController)
  {
    v4 = a3;
    v5 = -[SUUIMenuViewController initWithMenuTitles:]([SUUIMenuViewController alloc], "initWithMenuTitles:", self->_menuItemTitles);
    menuViewController = self->_menuViewController;
    self->_menuViewController = v5;

    -[SUUIMenuViewController setDelegate:](self->_menuViewController, "setDelegate:", self);
    -[SUUIMenuViewController setIndexOfCheckedTitle:](self->_menuViewController, "setIndexOfCheckedTitle:", self->_selectedMenuItemIndex);
    v7 = (double)(45 * -[NSArray count](self->_menuItemTitles, "count"));
    -[SUUIMenuViewController setPreferredContentSize:](self->_menuViewController, "setPreferredContentSize:", 320.0, v7);
    v8 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD858]), "initWithContentViewController:", self->_menuViewController);
    menuPopoverController = self->_menuPopoverController;
    self->_menuPopoverController = v8;

    -[UIPopoverController setDelegate:](self->_menuPopoverController, "setDelegate:", self);
    -[UIPopoverController setPopoverContentSize:](self->_menuPopoverController, "setPopoverContentSize:", 320.0, v7);
    v10 = self->_menuPopoverController;
    objc_msgSend(v4, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v4, "superview");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v10, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v19, 1, 1, v12, v14, v16, v18);
  }
}

- (void)_reloadMenuButton
{
  unint64_t selectedMenuItemIndex;
  uint64_t v4;
  uint64_t v5;
  UIButton *menuButton;
  UIButton *v7;
  UIButton *v8;
  UIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *menuLabelTitle;
  UILabel *menuLabel;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  UIButton *v24;
  UILabel *v25;

  selectedMenuItemIndex = self->_selectedMenuItemIndex;
  if (selectedMenuItemIndex < -[NSArray count](self->_menuItemTitles, "count")
    && (-[NSArray objectAtIndex:](self->_menuItemTitles, "objectAtIndex:", self->_selectedMenuItemIndex),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    menuButton = self->_menuButton;
    v25 = (UILabel *)v5;
    if (!menuButton)
    {
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
      v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v8 = self->_menuButton;
      self->_menuButton = v7;

      -[UIButton addTarget:action:forControlEvents:](self->_menuButton, "addTarget:action:forControlEvents:", self, sel__menuButtonAction_, 0xFFFFFFFFLL);
      v9 = self->_menuButton;
      -[SUUIPopupMenuHeaderView backgroundColor](self, "backgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setBackgroundColor:](v9, "setBackgroundColor:", v10);

      -[UIButton titleLabel](self->_menuButton, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFont:", v12);

      -[SUUIPopupMenuHeaderView addSubview:](self, "addSubview:", self->_menuButton);
      v5 = (uint64_t)v25;
      menuButton = self->_menuButton;
    }
    -[UIButton setTitle:forState:](menuButton, "setTitle:forState:", v5, 0);
    -[UIButton sizeToFit](self->_menuButton, "sizeToFit");
    menuLabelTitle = self->_menuLabelTitle;
    if (menuLabelTitle)
    {
      menuLabel = self->_menuLabel;
      if (!menuLabel)
      {
        v15 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v16 = self->_menuLabel;
        self->_menuLabel = v15;

        v17 = self->_menuLabel;
        -[SUUIPopupMenuHeaderView backgroundColor](self, "backgroundColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

        v19 = self->_menuLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v19, "setFont:", v20);

        v21 = self->_menuLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v21, "setTextColor:", v22);

        -[SUUIPopupMenuHeaderView addSubview:](self, "addSubview:", self->_menuLabel);
        menuLabel = self->_menuLabel;
        menuLabelTitle = self->_menuLabelTitle;
      }
      -[UILabel setText:](menuLabel, "setText:", menuLabelTitle);
      -[UILabel sizeToFit](self->_menuLabel, "sizeToFit");
    }
    -[SUUIPopupMenuHeaderView setNeedsLayout](self, "setNeedsLayout");
    v23 = v25;
  }
  else
  {
    -[UIButton removeTarget:action:forControlEvents:](self->_menuButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
    -[UIButton removeFromSuperview](self->_menuButton, "removeFromSuperview");
    v24 = self->_menuButton;
    self->_menuButton = 0;

    -[UILabel removeFromSuperview](self->_menuLabel, "removeFromSuperview");
    v23 = self->_menuLabel;
    self->_menuLabel = 0;
  }

}

- (id)_titleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    v6 = self->_titleLabel;
    -[SUUIPopupMenuHeaderView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = self->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    v10 = self->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[SUUIPopupMenuHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (SUUIPopupMenuDelegate)delegate
{
  return (SUUIPopupMenuDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)menuItemTitles
{
  return self->_menuItemTitles;
}

- (NSString)menuLabelTitle
{
  return self->_menuLabelTitle;
}

- (int64_t)selectedMenuItemIndex
{
  return self->_selectedMenuItemIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_menuPopoverController, 0);
  objc_storeStrong((id *)&self->_menuViewController, 0);
  objc_storeStrong((id *)&self->_menuItemTitles, 0);
  objc_storeStrong((id *)&self->_menuLabelTitle, 0);
  objc_storeStrong((id *)&self->_menuLabel, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
