@implementation SSSBoundsFittingView

- (void)setManagedView:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_managedView);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_managedView);
    objc_msgSend(v5, "removeFromSuperview");

    v6 = objc_storeWeak((id *)&self->_managedView, obj);
    -[SSSBoundsFittingView addSubview:](self, "addSubview:", obj);

    -[SSSBoundsFittingView setNeedsLayout](self, "setNeedsLayout");
  }

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
  id WeakRetained;

  -[SSSBoundsFittingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_managedView);
  objc_msgSend(WeakRetained, "setFrame:", v4, v6, v8, v10);

}

- (UIView)managedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_managedView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_managedView);
}

@end
