@implementation NUFeedTitleView

- (void)applyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4
{
  -[NUFeedTitleView applyFeedTitleViewUpdate:animation:force:](self, "applyFeedTitleViewUpdate:animation:force:", a3, a4, 0);
}

- (NUFeedTitleView)initWithFrame:(CGRect)a3
{
  NUFeedTitleView *v3;
  NUTitleViewStyler *v4;
  NUTitleView *v5;
  NUTitleView *titleView;
  NSMutableArray *v7;
  NSMutableArray *titleViewUpdateStack;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NUFeedTitleView;
  v3 = -[NUFeedTitleView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(NUTitleViewStyler);
    v5 = -[NUTitleView initWithStyler:]([NUTitleView alloc], "initWithStyler:", v4);
    titleView = v3->_titleView;
    v3->_titleView = v5;

    -[NUTitleView setDelegate:](v3->_titleView, "setDelegate:", v3);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    titleViewUpdateStack = v3->_titleViewUpdateStack;
    v3->_titleViewUpdateStack = v7;

    -[NUFeedTitleView addSubview:](v3, "addSubview:", v3->_titleView);
  }
  return v3;
}

- (void)applyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4 force:(BOOL)a5
{
  id v7;

  -[NUFeedTitleView titleViewUpdateForFeedTitleViewUpdate:force:](self, "titleViewUpdateForFeedTitleViewUpdate:force:", a3, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NUFeedTitleView applyTitleViewUpdate:animation:](self, "applyTitleViewUpdate:animation:", v7, a4);

}

- (id)titleViewUpdateForFeedTitleViewUpdate:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "convertToTitleViewUpdateWithCompact:", -[NUFeedTitleView useCompactTitleViewUpdates](self, "useCompactTitleViewUpdates"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCancelPendingUpdates:", v4);
  objc_msgSend(v6, "accessibilityTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessibilityTitle:", v8);
  return v7;
}

- (BOOL)useCompactTitleViewUpdates
{
  void *v2;
  BOOL v3;

  -[NUFeedTitleView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass") == 1;

  return v3;
}

- (void)applyTitleViewUpdate:(id)a3 animation:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  -[NUFeedTitleView lastQueuedTitleViewUpdate](self, "lastQueuedTitleViewUpdate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[NUFeedTitleView lastQueuedTitleViewUpdate](self, "lastQueuedTitleViewUpdate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqual:", v11),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    -[NUFeedTitleView setLastQueuedTitleViewUpdate:](self, "setLastQueuedTitleViewUpdate:", v11);
    -[NUFeedTitleView titleView](self, "titleView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applyTitleViewUpdate:animation:", v11, -[NUFeedTitleView titleViewAnimationForAnimation:](self, "titleViewAnimationForAnimation:", a4));

  }
}

- (NUTitleViewUpdate)lastQueuedTitleViewUpdate
{
  return self->_lastQueuedTitleViewUpdate;
}

- (void)setLastQueuedTitleViewUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastQueuedTitleViewUpdate, a3);
}

- (void)setStyler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NUFeedTitleView titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyler:", v4);

  -[NUFeedTitleView setLastQueuedTitleViewUpdate:](self, "setLastQueuedTitleViewUpdate:", 0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NUFeedTitleView;
  -[NUFeedTitleView layoutSubviews](&v12, sel_layoutSubviews);
  -[NUFeedTitleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NUFeedTitleView titleView](self, "titleView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (NUTitleView)titleView
{
  return self->_titleView;
}

- (unint64_t)titleViewAnimationForAnimation:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return qword_21684D930[a3 - 1];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)pushApplyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4
{
  -[NUFeedTitleView pushApplyFeedTitleViewUpdate:animation:force:](self, "pushApplyFeedTitleViewUpdate:animation:force:", a3, a4, 0);
}

- (void)pushApplyFeedTitleViewUpdate:(id)a3 animation:(unint64_t)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  -[NUFeedTitleView lastQueuedTitleViewUpdate](self, "lastQueuedTitleViewUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NUFeedTitleView titleViewUpdateStack](self, "titleViewUpdateStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUFeedTitleView lastQueuedTitleViewUpdate](self, "lastQueuedTitleViewUpdate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  -[NUFeedTitleView titleViewUpdateForFeedTitleViewUpdate:force:](self, "titleViewUpdateForFeedTitleViewUpdate:force:", v12, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUFeedTitleView applyTitleViewUpdate:animation:](self, "applyTitleViewUpdate:animation:", v11, a4);

}

- (void)popApplyFeedTitleViewUpdateWithAnimation:(unint64_t)a3
{
  -[NUFeedTitleView popApplyFeedTitleViewUpdateWithAnimation:force:](self, "popApplyFeedTitleViewUpdateWithAnimation:force:", a3, 0);
}

- (void)popApplyFeedTitleViewUpdateWithAnimation:(unint64_t)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  -[NUFeedTitleView titleViewUpdateStack](self, "titleViewUpdateStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[NUFeedTitleView titleViewUpdateStack](self, "titleViewUpdateStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fc_popLastObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setCancelPendingUpdates:", v4);
    -[NUFeedTitleView applyTitleViewUpdate:animation:](self, "applyTitleViewUpdate:animation:", v10, a3);

  }
}

- (NUTitleViewStyler)styler
{
  void *v2;
  void *v3;

  -[NUFeedTitleView titleView](self, "titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "styler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NUTitleViewStyler *)v3;
}

- (void)relayoutWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NUFeedTitleView titleView](self, "titleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relayoutWithAnimation:", v3);

}

- (void)titleViewDidTapOnTitleView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[NUFeedTitleView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NUFeedTitleView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "feedTitleViewDidTapOnTitleView:", self);

  }
}

- (NUFeedTitleViewDelegate)delegate
{
  return (NUFeedTitleViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableArray)titleViewUpdateStack
{
  return self->_titleViewUpdateStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleViewUpdateStack, 0);
  objc_storeStrong((id *)&self->_lastQueuedTitleViewUpdate, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
