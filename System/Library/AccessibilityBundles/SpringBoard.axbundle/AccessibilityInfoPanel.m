@implementation AccessibilityInfoPanel

- (AccessibilityInfoPanel)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AccessibilityInfoPanel;
  return -[AccessibilityInfoPanel init](&v3, sel_init);
}

- (AccessibilityInfoPanel)initWithTitle:(id)a3
{
  id v4;
  AccessibilityInfoPanel *v5;
  AccessibilityInfoPanel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AccessibilityInfoPanel;
  v5 = -[AccessibilityInfoPanel init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AccessibilityInfoPanel setTitle:](v5, "setTitle:", v4);
    -[AccessibilityInfoPanel _setup](v6, "_setup");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[AccessibilityInfoPanelWindow setHidden:](self->_accessibilityInfoPanelWindow, "setHidden:", 1);
  -[AccessibilityInfoPanelWindow setRootViewController:](self->_accessibilityInfoPanelWindow, "setRootViewController:", 0);
  -[UIViewController setView:](self->_accessibilityInfoPanelController, "setView:", 0);
  -[UILabel removeFromSuperview](self->_labelView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_accessibilityInfoPanelView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_rootView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)AccessibilityInfoPanel;
  -[AccessibilityInfoPanel dealloc](&v3, sel_dealloc);
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AccessibilityInfoPanel _rootView](self, "_rootView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AccessibilityInfoPanel _accessibilityInfoPanelView](self, "_accessibilityInfoPanelView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityInfoPanel _accessibilityInfoPanelWindow](self, "_accessibilityInfoPanelWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityInfoPanel _accessibilityInfoPanelController](self, "_accessibilityInfoPanelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v6);
  objc_msgSend(v6, "addSubview:", v3);
  objc_msgSend(v5, "setView:", v3);
  objc_msgSend(v6, "layoutSubviews");

}

- (BOOL)displayOnBottomEdge
{
  return self->_displayOnBottomEdge;
}

- (void)setDisplayOnBottomEdge:(BOOL)a3
{
  self->_displayOnBottomEdge = a3;
  -[AccessibilityInfoPanel _layoutSubviews](self, "_layoutSubviews");
}

- (void)show
{
  int v3;
  UIView *accessibilityInfoPanelView;
  _QWORD v5[5];

  v3 = -[AccessibilityInfoPanelWindow isHidden](self->_accessibilityInfoPanelWindow, "isHidden");
  accessibilityInfoPanelView = self->_accessibilityInfoPanelView;
  if (v3)
  {
    -[UIView setAlpha:](accessibilityInfoPanelView, "setAlpha:", 0.0);
    -[AccessibilityInfoPanelWindow setHidden:](self->_accessibilityInfoPanelWindow, "setHidden:", 0);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __30__AccessibilityInfoPanel_show__block_invoke;
    v5[3] = &unk_250367AD0;
    v5[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v5, 0.5);
  }
  else
  {
    -[UIView setAlpha:](accessibilityInfoPanelView, "setAlpha:", 1.0);
    -[UILabel setAlpha:](self->_labelView, "setAlpha:", 1.0);
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.6);
  }
}

uint64_t __30__AccessibilityInfoPanel_show__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAlpha:", 0.6);
}

- (void)hide
{
  -[AccessibilityInfoPanelWindow setHidden:](self->_accessibilityInfoPanelWindow, "setHidden:", 1);
}

- (void)fadeOut
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__AccessibilityInfoPanel_fadeOut__block_invoke;
  v3[3] = &unk_250367AD0;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __33__AccessibilityInfoPanel_fadeOut__block_invoke_2;
  v2[3] = &unk_250367C40;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v3, v2, 1.0);
}

uint64_t __33__AccessibilityInfoPanel_fadeOut__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAlpha:", 0.0);
}

uint64_t __33__AccessibilityInfoPanel_fadeOut__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hide");
}

- (CGRect)_displayFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 displayOnBottomEdge;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  displayOnBottomEdge = self->_displayOnBottomEdge;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  v11 = -v5;
  if (displayOnBottomEdge)
  {
    v12 = v7 + -80.0;
    if (v10 == 1)
      v13 = 0.75;
    else
      v13 = 0.9;
    v14 = v5 + v11 * v13;
  }
  else
  {
    if (v10 == 1)
    {
      v13 = 0.75;
      v14 = v5 + v11 * 0.75;
      *(double *)&v15 = 80.0;
    }
    else
    {
      v13 = 0.9;
      v14 = v5 + v11 * 0.9;
      *(double *)&v15 = 40.0;
    }
    v12 = *(double *)&v15;
  }
  v16 = v5 * v13;
  v17 = v14 * 0.5;
  v18 = 60.0;
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v12;
  result.origin.x = v17;
  return result;
}

- (id)_accessibilityInfoPanelController
{
  UIViewController *accessibilityInfoPanelController;
  UIViewController *v4;
  UIViewController *v5;

  accessibilityInfoPanelController = self->_accessibilityInfoPanelController;
  if (!accessibilityInfoPanelController)
  {
    v4 = (UIViewController *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF6F98]), "init");
    v5 = self->_accessibilityInfoPanelController;
    self->_accessibilityInfoPanelController = v4;

    accessibilityInfoPanelController = self->_accessibilityInfoPanelController;
  }
  return accessibilityInfoPanelController;
}

- (id)_accessibilityInfoPanelWindow
{
  AccessibilityInfoPanelWindow *accessibilityInfoPanelWindow;
  void *v4;
  AccessibilityInfoPanelWindow *v5;
  void *v6;
  AccessibilityInfoPanelWindow *v7;
  AccessibilityInfoPanelWindow *v8;
  AccessibilityInfoPanelWindow *v9;
  void *v10;

  accessibilityInfoPanelWindow = self->_accessibilityInfoPanelWindow;
  if (!accessibilityInfoPanelWindow)
  {
    -[AccessibilityInfoPanel _accessibilityInfoPanelController](self, "_accessibilityInfoPanelController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [AccessibilityInfoPanelWindow alloc];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = -[AccessibilityInfoPanelWindow initWithFrame:](v5, "initWithFrame:");
    v8 = self->_accessibilityInfoPanelWindow;
    self->_accessibilityInfoPanelWindow = v7;

    -[AccessibilityInfoPanelWindow setAlpha:](self->_accessibilityInfoPanelWindow, "setAlpha:", 1.0);
    -[AccessibilityInfoPanelWindow setHidden:](self->_accessibilityInfoPanelWindow, "setHidden:", 1);
    -[AccessibilityInfoPanelWindow setWindowLevel:](self->_accessibilityInfoPanelWindow, "setWindowLevel:", 10000021.0);
    -[AccessibilityInfoPanelWindow setAccessibilityElementsHidden:](self->_accessibilityInfoPanelWindow, "setAccessibilityElementsHidden:", 1);
    -[AccessibilityInfoPanelWindow _setAccessibilityWindowVisible:](self->_accessibilityInfoPanelWindow, "_setAccessibilityWindowVisible:", 0);
    v9 = self->_accessibilityInfoPanelWindow;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AccessibilityInfoPanelWindow setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[AccessibilityInfoPanelWindow setRootViewController:](self->_accessibilityInfoPanelWindow, "setRootViewController:", v4);
    -[AccessibilityInfoPanelWindow setUserInteractionEnabled:](self->_accessibilityInfoPanelWindow, "setUserInteractionEnabled:", 0);
    -[AccessibilityInfoPanelWindow setDelegate:](self->_accessibilityInfoPanelWindow, "setDelegate:", v4);

    accessibilityInfoPanelWindow = self->_accessibilityInfoPanelWindow;
  }
  return accessibilityInfoPanelWindow;
}

- (void)_layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *backgroundView;
  UILabel *labelView;
  double v13;
  double v14;
  double v15;
  UILabel *v16;
  id v17;

  -[AccessibilityInfoPanel _displayFrame](self, "_displayFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_accessibilityInfoPanelView, "setFrame:");
  backgroundView = self->_backgroundView;
  -[UIView bounds](self->_accessibilityInfoPanelView, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");
  labelView = self->_labelView;
  -[UIView bounds](self->_accessibilityInfoPanelView, "bounds");
  -[UILabel setFrame:](labelView, "setFrame:");
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 18.0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString _legacy_sizeWithFont:constrainedToSize:lineBreakMode:](self->_title, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v8, 3.40282347e38);
  if (v13 > v10)
  {
    v14 = v13 + 10.0;
    v15 = v13 + 10.0 - v10;
    if (v6 <= 160.0)
      v15 = 0.0;
    v6 = v6 - v15;
    v10 = v14;
  }
  -[UIView setFrame:](self->_accessibilityInfoPanelView, "setFrame:", v4, v6, v8, v10);
  v16 = self->_labelView;
  -[UIView bounds](self->_accessibilityInfoPanelView, "bounds");
  -[UILabel setFrame:](v16, "setFrame:");

}

- (id)_accessibilityInfoPanelView
{
  UIView *accessibilityInfoPanelView;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  id v12;
  UIView *v13;
  UIView *backgroundView;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  UILabel *v23;
  UILabel *labelView;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  void *v30;
  void *v31;

  accessibilityInfoPanelView = self->_accessibilityInfoPanelView;
  if (!accessibilityInfoPanelView)
  {
    -[AccessibilityInfoPanel _displayFrame](self, "_displayFrame");
    v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v4, v5, v6, v7);
    v9 = self->_accessibilityInfoPanelView;
    self->_accessibilityInfoPanelView = v8;

    -[UIView setAccessibilityElementsHidden:](self->_accessibilityInfoPanelView, "setAccessibilityElementsHidden:", 1);
    -[UIView setUserInteractionEnabled:](self->_accessibilityInfoPanelView, "setUserInteractionEnabled:", 0);
    v10 = self->_accessibilityInfoPanelView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[UIView bounds](self->_accessibilityInfoPanelView, "bounds");
    v13 = (UIView *)objc_msgSend(v12, "initWithFrame:");
    backgroundView = self->_backgroundView;
    self->_backgroundView = v13;

    -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
    v15 = self->_backgroundView;
    objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView layer](self->_backgroundView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", 5.0);

    -[UIView layer](self->_backgroundView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShadowOffset:", 3.0, 3.0);

    -[UIView layer](self->_backgroundView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = 0.75;
    objc_msgSend(v19, "setShadowOpacity:", v20);

    -[UIView setTag:](self->_backgroundView, "setTag:", 100);
    -[UIView addSubview:](self->_accessibilityInfoPanelView, "addSubview:", self->_backgroundView);
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 18.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_allocWithZone(MEMORY[0x24BDF6B68]);
    -[UIView bounds](self->_accessibilityInfoPanelView, "bounds");
    v23 = (UILabel *)objc_msgSend(v22, "initWithFrame:");
    labelView = self->_labelView;
    self->_labelView = v23;

    v25 = self->_labelView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v25, "setBackgroundColor:", v26);

    -[UILabel setTextAlignment:](self->_labelView, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](self->_labelView, "setLineBreakMode:", 0);
    v27 = self->_labelView;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v28);

    -[UILabel setNumberOfLines:](self->_labelView, "setNumberOfLines:", 0);
    -[UILabel setTag:](self->_labelView, "setTag:", 200);
    v29 = self->_labelView;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "colorWithAlphaComponent:", 0.75);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](v29, "setShadowColor:", v31);

    -[UILabel setShadowOffset:](self->_labelView, "setShadowOffset:", 1.0, 1.0);
    -[UILabel setText:](self->_labelView, "setText:", self->_title);
    -[UILabel setFont:](self->_labelView, "setFont:", v21);
    -[UILabel setUserInteractionEnabled:](self->_labelView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](self->_accessibilityInfoPanelView, "addSubview:", self->_labelView);
    -[AccessibilityInfoPanel _layoutSubviews](self, "_layoutSubviews");

    accessibilityInfoPanelView = self->_accessibilityInfoPanelView;
  }
  return accessibilityInfoPanelView;
}

- (id)_rootView
{
  UIView *rootView;
  void *v4;
  id v5;
  UIView *v6;
  UIView *v7;

  rootView = self->_rootView;
  if (!rootView)
  {
    -[AccessibilityInfoPanel _accessibilityInfoPanelWindow](self, "_accessibilityInfoPanelWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend(v4, "bounds");
    v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    v7 = self->_rootView;
    self->_rootView = v6;

    -[UIView setAccessibilityElementsHidden:](self->_rootView, "setAccessibilityElementsHidden:", 1);
    rootView = self->_rootView;
  }
  return rootView;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_rootView, 0);
  objc_storeStrong((id *)&self->_accessibilityInfoPanelView, 0);
  objc_storeStrong((id *)&self->_accessibilityInfoPanelWindow, 0);
  objc_storeStrong((id *)&self->_accessibilityInfoPanelController, 0);
}

@end
