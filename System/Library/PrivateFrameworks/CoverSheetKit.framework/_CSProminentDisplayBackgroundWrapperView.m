@implementation _CSProminentDisplayBackgroundWrapperView

- (void)layoutSubviews
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  -[_CSProminentDisplayBackgroundWrapperView layoutSubviews](&v4, sel_layoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedView);
  -[_CSProminentDisplayBackgroundWrapperView bounds](self, "bounds");
  objc_msgSend(WeakRetained, "setFrame:");

}

- (void)setWrappedView:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  objc_super v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedView);

  if (WeakRetained != v4)
  {
    v6 = objc_loadWeakRetained((id *)&self->_wrappedView);
    objc_msgSend(v6, "removeFromSuperview");

    objc_storeWeak((id *)&self->_wrappedView, v4);
    v7.receiver = self;
    v7.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
    -[_CSProminentDisplayBackgroundWrapperView insertSubview:atIndex:](&v7, sel_insertSubview_atIndex_, v4, 0);
    -[_CSProminentDisplayBackgroundWrapperView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)addSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  -[_CSProminentDisplayBackgroundWrapperView addSubview:](&v4, sel_addSubview_, a3);
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)_ensureWrappedViewIsAtIndexZero
{
  id WeakRetained;
  id v3;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 52);

    if (WeakRetained)
    {
      v3 = objc_loadWeakRetained(a1 + 52);
      objc_msgSend(a1, "sendSubviewToBack:", v3);

    }
  }
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  -[_CSProminentDisplayBackgroundWrapperView insertSubview:atIndex:](&v5, sel_insertSubview_atIndex_, a3, a4);
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  -[_CSProminentDisplayBackgroundWrapperView exchangeSubviewAtIndex:withSubviewAtIndex:](&v5, sel_exchangeSubviewAtIndex_withSubviewAtIndex_, a3, a4);
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)insertSubview:(id)a3 belowSubview:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  -[_CSProminentDisplayBackgroundWrapperView insertSubview:belowSubview:](&v5, sel_insertSubview_belowSubview_, a3, a4);
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)insertSubview:(id)a3 aboveSubview:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  -[_CSProminentDisplayBackgroundWrapperView insertSubview:aboveSubview:](&v5, sel_insertSubview_aboveSubview_, a3, a4);
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)bringSubviewToFront:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  -[_CSProminentDisplayBackgroundWrapperView bringSubviewToFront:](&v4, sel_bringSubviewToFront_, a3);
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)sendSubviewToBack:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  -[_CSProminentDisplayBackgroundWrapperView sendSubviewToBack:](&v4, sel_sendSubviewToBack_, a3);
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (UIView)wrappedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_wrappedView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wrappedView);
}

@end
