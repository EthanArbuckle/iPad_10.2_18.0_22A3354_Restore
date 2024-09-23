@implementation ICScrollViewDelegateViewController

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)ICScrollViewDelegateViewController;
  -[ICScrollViewDelegateViewController viewDidLayoutSubviews](&v24, sel_viewDidLayoutSubviews);
  -[ICScrollViewDelegateViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICScrollViewDelegateViewController scrollViewResizer](self, "scrollViewResizer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[ICScrollViewDelegateViewController scrollViewResizer](self, "scrollViewResizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isAutoResizing"))
      {

LABEL_9:
        goto LABEL_10;
      }
      if (-[ICScrollViewDelegateViewController _appearState](self, "_appearState") == 2)
      {

LABEL_8:
        -[ICScrollViewDelegateViewController scrollViewResizer](self, "scrollViewResizer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "startAutoResizing");
        goto LABEL_9;
      }
      v7 = -[ICScrollViewDelegateViewController _appearState](self, "_appearState");

      if (v7 == 1)
        goto LABEL_8;
    }
  }
LABEL_10:
  if (objc_msgSend(v3, "contentInsetAdjustmentBehavior") == 2)
  {
    -[ICScrollViewDelegateViewController scrollViewResizer](self, "scrollViewResizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICScrollViewDelegateViewController topInsetForResizer:](self, "topInsetForResizer:", v8);
    v10 = v9;

    objc_msgSend(v3, "contentInset");
    if (vabdd_f64(v10, v11) >= 0.00999999978)
    {
      objc_msgSend(v3, "contentInset");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v3, "verticalScrollIndicatorInsets");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      objc_msgSend(v3, "setContentInset:", v10, v13, v15, v17);
      objc_msgSend(v3, "setVerticalScrollIndicatorInsets:", v10, v19, v21, v23);
    }
  }

}

- (void)setupScrollViewKeyboardResizer
{
  void *v3;
  id v4;

  -[ICScrollViewDelegateViewController scrollViewResizer](self, "scrollViewResizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D64D18]), "initWithDelegate:", self);
    -[ICScrollViewDelegateViewController setScrollViewResizer:](self, "setScrollViewResizer:", v4);

  }
}

- (void)setScrollViewResizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewResizer, a3);
}

- (ICScrollViewKeyboardResizer)scrollViewResizer
{
  return self->_scrollViewResizer;
}

- (UIScrollView)keyboardResizerScrollView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICScrollViewDelegateViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v4;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[ICScrollViewDelegateViewController scrollViewResizer](self, "scrollViewResizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAutoResizing");

  v6.receiver = self;
  v6.super_class = (Class)ICScrollViewDelegateViewController;
  -[ICScrollViewDelegateViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (NotesBackgroundView)backgroundView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICScrollViewDelegateViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NotesBackgroundView *)v4;
}

- (UIScrollView)scrollView
{
  char IsTextKit2Enabled;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  objc_opt_class();
  -[ICScrollViewDelegateViewController backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((IsTextKit2Enabled & 1) != 0)
  {
    objc_msgSend(v5, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIScrollView *)v9;
}

- (double)consumedBottomAreaForResizer:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[ICScrollViewDelegateViewController scrollView](self, "scrollView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if (objc_msgSend(v4, "contentInsetAdjustmentBehavior") == 2)
  {
    -[ICScrollViewDelegateViewController ic_safeAreaDistanceFromBottom](self, "ic_safeAreaDistanceFromBottom");
    v5 = v6;
  }

  return v5;
}

- (double)topInsetForResizer:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[ICScrollViewDelegateViewController scrollView](self, "scrollView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if (objc_msgSend(v4, "contentInsetAdjustmentBehavior") == 2)
  {
    -[ICScrollViewDelegateViewController ic_safeAreaDistanceFromTop](self, "ic_safeAreaDistanceFromTop");
    v5 = v6;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewResizer, 0);
}

@end
