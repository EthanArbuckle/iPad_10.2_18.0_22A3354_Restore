@implementation HKVerticalMarginView

- (HKVerticalMarginView)initWithSubview:(id)a3 offsetOptions:(unint64_t)a4
{
  id v6;
  HKVerticalMarginView *v7;
  HKVerticalMarginView *v8;
  HKVerticalMarginDelegate *marginDelegate;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKVerticalMarginView;
  v7 = -[HKVerticalMarginView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_offsetOptions = a4;
    marginDelegate = v7->_marginDelegate;
    v7->_marginDelegate = 0;

    v8->_currentKeyboardHeight = 0.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKVerticalMarginView setBackgroundColor:](v8, "setBackgroundColor:", v10);

    -[HKVerticalMarginView addSubview:](v8, "addSubview:", v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel_keyboardWasShown_, *MEMORY[0x1E0DC4E70], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v8, sel_keyboardWillBeHidden_, *MEMORY[0x1E0DC4FE0], 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E70], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

  v5.receiver = self;
  v5.super_class = (Class)HKVerticalMarginView;
  -[HKVerticalMarginView dealloc](&v5, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HKVerticalMarginView;
  -[HKVerticalMarginView layoutSubviews](&v17, sel_layoutSubviews);
  -[HKVerticalMarginView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKVerticalMarginView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[HKVerticalMarginView _findViewController](self, "_findViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVerticalMarginView _topOffsetWithController:](self, "_topOffsetWithController:", v13);
  v15 = v14;
  -[HKVerticalMarginView _bottomOffsetWithController:](self, "_bottomOffsetWithController:", v13);
  objc_msgSend(v4, "setFrame:", v6, v8 + v15, v10, v12 - (v15 + v16));

}

- (void)keyboardWasShown:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;

  self->_currentKeyboardHeight = v6;
  -[HKVerticalMarginView setNeedsLayout](self, "setNeedsLayout");

}

- (void)keyboardWillBeHidden:(id)a3
{
  self->_currentKeyboardHeight = 0.0;
  -[HKVerticalMarginView setNeedsLayout](self, "setNeedsLayout", a3);
}

- (double)_topOffsetWithController:(id)a3
{
  id v4;
  void *v5;
  unint64_t offsetOptions;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  HKVerticalMarginDelegate *marginDelegate;
  double v19;

  v4 = a3;
  v5 = v4;
  offsetOptions = self->_offsetOptions;
  if ((offsetOptions & 1) != 0)
  {
    objc_msgSend(v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusBarManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusBarFrame");
    v13 = v12;

    v7 = v13 + 0.0;
    if ((self->_offsetOptions & 2) == 0)
      goto LABEL_9;
  }
  else
  {
    v7 = 0.0;
    if ((offsetOptions & 2) == 0)
      goto LABEL_9;
  }
  objc_msgSend(v5, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && (objc_msgSend(v14, "isNavigationBarHidden") & 1) == 0)
  {
    objc_msgSend(v15, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v7 = v7 + v17;

  }
LABEL_9:
  marginDelegate = self->_marginDelegate;
  if (marginDelegate)
  {
    -[HKVerticalMarginDelegate verticalMarginTopOffset](marginDelegate, "verticalMarginTopOffset");
    v7 = v7 + v19;
  }

  return v7;
}

- (double)_bottomOffsetWithController:(id)a3
{
  id v4;
  unint64_t offsetOptions;
  double currentKeyboardHeight;
  double v7;

  v4 = a3;
  offsetOptions = self->_offsetOptions;
  if ((offsetOptions & 8) != 0)
  {
    currentKeyboardHeight = self->_currentKeyboardHeight;
    if (currentKeyboardHeight > 0.0)
      goto LABEL_5;
  }
  v7 = 0.0;
  if ((offsetOptions & 4) != 0)
  {
    -[HKVerticalMarginView _findTabBarHeightWithController:](self, "_findTabBarHeightWithController:", v4);
LABEL_5:
    v7 = currentKeyboardHeight + 0.0;
  }

  return v7;
}

- (double)_findTabBarHeightWithController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a3, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "tabBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0.0;
    if ((objc_msgSend(v5, "isHidden") & 1) == 0)
    {
      objc_msgSend(v5, "frame");
      v6 = v7;
    }

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)_findViewController
{
  HKVerticalMarginView *v2;
  uint64_t v3;

  v2 = self;
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      -[HKVerticalMarginView nextResponder](v2, "nextResponder");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (HKVerticalMarginView *)v3;
      if (!v3)
        goto LABEL_6;
    }
    v2 = v2;
  }
LABEL_6:

  return v2;
}

- (unint64_t)offsetOptions
{
  return self->_offsetOptions;
}

- (void)setOffsetOptions:(unint64_t)a3
{
  self->_offsetOptions = a3;
}

- (HKVerticalMarginDelegate)marginDelegate
{
  return self->_marginDelegate;
}

- (void)setMarginDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_marginDelegate, a3);
}

- (double)currentKeyboardHeight
{
  return self->_currentKeyboardHeight;
}

- (void)setCurrentKeyboardHeight:(double)a3
{
  self->_currentKeyboardHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marginDelegate, 0);
}

@end
