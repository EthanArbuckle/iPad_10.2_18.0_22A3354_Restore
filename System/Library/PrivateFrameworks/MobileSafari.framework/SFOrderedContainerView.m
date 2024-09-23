@implementation SFOrderedContainerView

- (void)didAddSubview:(id)a3
{
  void *v4;
  _BOOL4 settingOrderedSubviews;
  id WeakRetained;

  -[SFOrderedContainerView window](self, "window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    settingOrderedSubviews = self->_settingOrderedSubviews;

    if (!settingOrderedSubviews)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "updateOrderedSubviewsForOrderedContainerView:", self);

    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_sf_setOrderedSubviews:(id *)a3 count:(unint64_t)a4
{
  objc_super v5;

  self->_settingOrderedSubviews = 1;
  v5.receiver = self;
  v5.super_class = (Class)SFOrderedContainerView;
  -[UIView _sf_setOrderedSubviews:count:](&v5, sel__sf_setOrderedSubviews_count_, a3, a4);
  self->_settingOrderedSubviews = 0;
}

- (void)updateOrderedSubviews:(id *)a3 count:(unint64_t)a4
{
  id *v7;
  unint64_t v8;
  SFOrderedContainerView *v9;

  if (a4)
  {
    v7 = a3;
    v8 = a4;
    do
    {
      objc_msgSend(*v7, "superview");
      v9 = (SFOrderedContainerView *)objc_claimAutoreleasedReturnValue();

      if (v9 != self)
        *v7 = 0;
      ++v7;
      --v8;
    }
    while (v8);
  }
  -[SFOrderedContainerView _sf_setOrderedSubviews:count:](self, "_sf_setOrderedSubviews:count:", a3, a4);
}

- (void)willMoveToWindow:(id)a3
{
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFOrderedContainerView;
  -[SFOrderedContainerView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "updateOrderedSubviewsForOrderedContainerView:", self);

  }
}

- (SFOrderedContainerViewDelegate)delegate
{
  return (SFOrderedContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
