@implementation PKInkAttributesPicker

+ (double)defaultMinimumOpacityValue
{
  return 0.1;
}

- (PKInkAttributesPicker)initWithInk:(id)a3 toolConfiguration:(id)a4
{
  id v6;
  id v7;
  PKInkAttributesPicker *v8;
  PKInkAttributesPicker *v9;
  _PKInkAttributesPickerView *v10;
  _PKInkAttributesPickerView *pickerView;
  id v12;
  void *v13;
  uint64_t v14;
  UIStackView *stackView;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKInkAttributesPicker;
  v8 = -[PKInkAttributesPicker init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_minimumOpacityValue = 0.1;
    v10 = -[_PKInkAttributesPickerView initWithInk:toolConfiguration:]([_PKInkAttributesPickerView alloc], "initWithInk:toolConfiguration:", v6, v7);
    pickerView = v9->_pickerView;
    v9->_pickerView = v10;

    -[_PKInkAttributesPickerView setDelegate:](v9->_pickerView, "setDelegate:", v9);
    -[_PKInkAttributesPickerView setDisplayMode:](v9->_pickerView, "setDisplayMode:", -[PKInkAttributesPicker displayMode](v9, "displayMode"));
    v12 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v18[0] = v9->_pickerView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithArrangedSubviews:", v13);
    stackView = v9->_stackView;
    v9->_stackView = (UIStackView *)v14;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v9->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v9->_stackView, "setAxis:", 1);
    -[_PKInkAttributesPickerView sizeThatFits:](v9->_pickerView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[PKInkAttributesPicker setPreferredContentSize:](v9, "setPreferredContentSize:");
    -[PKInkAttributesPicker _updateUI](v9, "_updateUI");
  }

  return v9;
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKInkAttributesPicker;
  -[PKInkAttributesPicker viewDidLoad](&v24, sel_viewDidLoad);
  -[PKInkAttributesPicker view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_stackView);

  -[PKInkAttributesPicker view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[PKInkAttributesPicker view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaLayoutGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[PKInkAttributesPicker view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[PKInkAttributesPicker view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setTopViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_topViewController;
  UIViewController *topViewController;
  UIView *topViewControllerViewWrapper;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  double v20;
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
  uint8_t v35[16];

  v5 = (UIViewController *)a3;
  p_topViewController = &self->_topViewController;
  topViewController = self->_topViewController;
  if (topViewController != v5)
  {
    if (topViewController)
    {
      -[UIViewController willMoveToParentViewController:](topViewController, "willMoveToParentViewController:", 0);
      -[UIView removeFromSuperview](self->_topViewControllerViewWrapper, "removeFromSuperview");
      -[UIViewController removeFromParentViewController](*p_topViewController, "removeFromParentViewController");
      topViewControllerViewWrapper = self->_topViewControllerViewWrapper;
      self->_topViewControllerViewWrapper = 0;

    }
    objc_storeStrong((id *)&self->_topViewController, a3);
    -[_PKInkAttributesPickerView setShowsTopSeparator:](self->_pickerView, "setShowsTopSeparator:", *p_topViewController != 0);
    -[_PKInkAttributesPickerView sizeThatFits:](self->_pickerView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v10 = v9;
    v12 = v11;
    if (*p_topViewController)
    {
      v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v14 = self->_topViewControllerViewWrapper;
      self->_topViewControllerViewWrapper = v13;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_topViewControllerViewWrapper, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView setClipsToBounds:](self->_topViewControllerViewWrapper, "setClipsToBounds:", 1);
      -[UIViewController view](*p_topViewController, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_topViewControllerViewWrapper, "addSubview:", v15);
      -[PKInkAttributesPicker addChildViewController:](self, "addChildViewController:", *p_topViewController);
      -[UIStackView insertArrangedSubview:atIndex:](self->_stackView, "insertArrangedSubview:atIndex:", self->_topViewControllerViewWrapper, 0);
      -[UIViewController didMoveToParentViewController:](*p_topViewController, "didMoveToParentViewController:", self);
      -[UIViewController preferredContentSize](*p_topViewController, "preferredContentSize");
      v18 = v17;
      if (v16 == 0.0)
      {
        v19 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v35 = 0;
          _os_log_error_impl(&dword_1BE213000, v19, OS_LOG_TYPE_ERROR, "View controller from viewControllerProvider has a preferredContentSize height of zero. Defaulting to 50pt height.", v35, 2u);
        }

        v20 = 50.0;
      }
      else
      {
        v20 = v16;
      }
      if (v10 < v18)
        v10 = v18;
      v12 = v12 + v20;
      -[UIView heightAnchor](self->_topViewControllerViewWrapper, "heightAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToConstant:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setActive:", 1);

      objc_msgSend(v15, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_topViewControllerViewWrapper, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActive:", 1);

      objc_msgSend(v15, "trailingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_topViewControllerViewWrapper, "trailingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setActive:", 1);

      objc_msgSend(v15, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_topViewControllerViewWrapper, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setActive:", 1);

      objc_msgSend(v15, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_topViewControllerViewWrapper, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setActive:", 1);

    }
    -[PKInkAttributesPicker setPreferredContentSize:](self, "setPreferredContentSize:", v10, v12);
  }

}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  id v4;

  -[PKInkAttributesPicker pickerView](self, "pickerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorUserInterfaceStyle:", a3);

}

- (int64_t)colorUserInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[PKInkAttributesPicker pickerView](self, "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "colorUserInterfaceStyle");

  return v3;
}

- (void)setMinimumOpacityValue:(double)a3
{
  if (self->_minimumOpacityValue != a3)
  {
    self->_minimumOpacityValue = a3;
    -[PKInkAttributesPicker _updateUI](self, "_updateUI");
  }
}

- (void)_updateUI
{
  double v3;
  double v4;
  id v5;

  -[PKInkAttributesPicker minimumOpacityValue](self, "minimumOpacityValue");
  v4 = v3;
  -[PKInkAttributesPicker pickerView](self, "pickerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumOpacityValue:", v4);

}

- (PKInk)selectedInk
{
  void *v2;
  void *v3;

  -[PKInkAttributesPicker pickerView](self, "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKInk *)v3;
}

- (void)setSelectedInk:(id)a3
{
  -[PKInkAttributesPicker setSelectedInk:animated:](self, "setSelectedInk:animated:", a3, 0);
}

- (void)setSelectedInk:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PKInkAttributesPicker pickerView](self, "pickerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInk:animated:", v6, v4);

}

- (unint64_t)displayMode
{
  void *v2;
  unint64_t v3;

  -[PKInkAttributesPicker pickerView](self, "pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayMode");

  return v3;
}

- (void)setDisplayMode:(unint64_t)a3
{
  void *v5;
  id v6;

  -[PKInkAttributesPicker pickerView](self, "pickerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayMode:", a3);

  -[PKInkAttributesPicker pickerView](self, "pickerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[PKInkAttributesPicker setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)_notifyInkAttributesPickerDidChangeInk
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[PKInkAttributesPicker delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PKInkAttributesPicker delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[PKInkAttributesPicker delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inkAttributesPickerDidChangeSelectedInk:", self);

    }
  }
}

- (void)inkAttributesPickerViewDidChangeInkThickness:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[PKPaletteAttributeViewController setDidExperienceUserInteraction:](self, "setDidExperienceUserInteraction:", 1);
  -[PKInkAttributesPicker _notifyInkAttributesPickerDidChangeInk](self, "_notifyInkAttributesPickerDidChangeInk");
  -[PKInkAttributesPicker delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PKInkAttributesPicker delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PKInkAttributesPicker delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inkAttributesPickerDidChangeInkThickness:", self);

    }
  }
}

- (void)inkAttributesPickerViewDidChangeInkOpacity:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[PKPaletteAttributeViewController setDidExperienceUserInteraction:](self, "setDidExperienceUserInteraction:", 1);
  -[PKInkAttributesPicker _notifyInkAttributesPickerDidChangeInk](self, "_notifyInkAttributesPickerDidChangeInk");
  -[PKInkAttributesPicker delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PKInkAttributesPicker delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PKInkAttributesPicker delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inkAttributesPickerDidChangeInkOpacity:", self);

    }
  }
}

- (void)_inkAttributesPickerViewUserDidStartDraggingSlider:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  self->_updatingOpacityValue = 1;
  -[PKPaletteAttributeViewController setDidExperienceUserInteraction:](self, "setDidExperienceUserInteraction:", 1);
  -[PKInkAttributesPicker delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PKInkAttributesPicker delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PKInkAttributesPicker delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_inkAttributesPickerUserDidStartDraggingSlider:", self);

    }
  }
}

- (void)_inkAttributesPickerViewUserDidEndDraggingSlider:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  self->_updatingOpacityValue = 0;
  -[PKPaletteAttributeViewController setDidExperienceUserInteraction:](self, "setDidExperienceUserInteraction:", 1);
  -[PKInkAttributesPicker delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PKInkAttributesPicker delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PKInkAttributesPicker delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_inkAttributesPickerUserDidEndDraggingSlider:", self);

    }
  }
}

- (UIViewController)topViewController
{
  return self->_topViewController;
}

- (PKInkAttributesPickerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (_PKInkAttributesPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerView, a3);
}

- (double)minimumOpacityValue
{
  return self->_minimumOpacityValue;
}

- (BOOL)isUpdatingOpacityValue
{
  return self->_updatingOpacityValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_topViewController, 0);
  objc_storeStrong((id *)&self->_topViewControllerViewWrapper, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
