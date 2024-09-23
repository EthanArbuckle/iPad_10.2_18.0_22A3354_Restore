@implementation BNBannerSourceListenerPresentableViewControllerView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id WeakRetained;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BNBannerSourceListenerPresentableViewControllerView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)BNBannerSourceListenerPresentableViewControllerView;
  -[BNBannerSourceListenerPresentableViewControllerView setFrame:](&v21, sel_setFrame_, x, y, width, height);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[BNBannerSourceListenerPresentableViewControllerView frame](self, "frame");
  v23.origin.x = v17;
  v23.origin.y = v18;
  v23.size.width = v19;
  v23.size.height = v20;
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  if (!CGRectEqualToRect(v22, v23) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bannerSourceListenerPresentableViewControllerViewDidChangeSize:", self);

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  double v13;
  double v14;
  BOOL v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BNBannerSourceListenerPresentableViewControllerView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)BNBannerSourceListenerPresentableViewControllerView;
  -[BNBannerSourceListenerPresentableViewControllerView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[BNBannerSourceListenerPresentableViewControllerView bounds](self, "bounds");
  v15 = v9 == v14 && v11 == v13;
  if (!v15 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bannerSourceListenerPresentableViewControllerViewDidChangeSize:", self);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  BOOL v9;
  BOOL v10;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "contentInsetsForBannerSourceListenerPresentableViewControllerView:", self);
    -[BNBannerSourceListenerPresentableViewControllerView bounds](self, "bounds");
    UIRectInset();
    v13.x = x;
    v13.y = y;
    v9 = CGRectContainsPoint(v14, v13);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BNBannerSourceListenerPresentableViewControllerView;
    v9 = -[BNBannerSourceListenerPresentableViewControllerView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y);
  }
  v10 = v9;

  return v10;
}

- (BNBannerSourceListenerPresentableViewControllerViewDelegate)delegate
{
  return (BNBannerSourceListenerPresentableViewControllerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
