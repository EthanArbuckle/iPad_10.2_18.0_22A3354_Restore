@implementation SUUIViewControllerContainerCollectionViewCell

- (SUUIViewControllerContainerCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIViewControllerContainerCollectionViewCell *v3;
  SUUIViewControllerContainerCollectionViewCell *v4;
  void *v5;
  SUUIViewControllerContainerView *v6;
  uint64_t v7;
  SUUIViewControllerContainerView *viewControllerContainerView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIViewControllerContainerCollectionViewCell;
  v3 = -[SUUIViewControllerContainerCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_managesViewControllerContainerViewLayout = 1;
    -[SUUIViewControllerContainerCollectionViewCell setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    -[SUUIViewControllerContainerCollectionViewCell contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 1);
    v6 = [SUUIViewControllerContainerView alloc];
    objc_msgSend(v5, "bounds");
    v7 = -[SUUIViewControllerContainerView initWithFrame:](v6, "initWithFrame:");
    viewControllerContainerView = v4->_viewControllerContainerView;
    v4->_viewControllerContainerView = (SUUIViewControllerContainerView *)v7;

    -[SUUIViewControllerContainerView setPreservesSuperviewLayoutMargins:](v4->_viewControllerContainerView, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(v5, "addSubview:", v4->_viewControllerContainerView);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;

  v22.receiver = self;
  v22.super_class = (Class)SUUIViewControllerContainerCollectionViewCell;
  -[SUUIViewControllerContainerCollectionViewCell layoutSubviews](&v22, sel_layoutSubviews);
  if (self->_managesViewControllerContainerViewLayout)
  {
    -[SUUIViewControllerContainerCollectionViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    if (self->_maximumContentWidth > 0.00000011920929)
    {
      -[SUUIViewControllerContainerCollectionViewCell traitCollection](self, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayScale");
      v14 = v13;
      if (v13 <= 0.00000011920929)
      {
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scale");
        v14 = v16;

      }
      v23.origin.x = v5;
      v23.origin.y = v7;
      v23.size.width = v9;
      v23.size.height = v11;
      CGRectGetWidth(v23);
      v21 = v14;
      UIRectCenteredXInRectScale();
      v5 = v17;
      v7 = v18;
      v9 = v19;
      v11 = v20;

    }
    -[SUUIViewControllerContainerView setFrame:](self->_viewControllerContainerView, "setFrame:", v5, v7, v9, v11, *(_QWORD *)&v21);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  NSIndexPath *v5;
  NSIndexPath *indexPath;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIViewControllerContainerCollectionViewCell;
  v4 = a3;
  -[SUUIViewControllerContainerCollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "indexPath", v7.receiver, v7.super_class);
  v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  indexPath = self->_indexPath;
  self->_indexPath = v5;

}

- (void)setViewController:(id)a3
{
  -[SUUIViewControllerContainerView setViewController:](self->_viewControllerContainerView, "setViewController:", a3);
}

- (void)setMaximumContentWidth:(double)a3
{
  if (vabdd_f64(self->_maximumContentWidth, a3) > 0.00000011920929)
  {
    self->_maximumContentWidth = a3;
    -[SUUIViewControllerContainerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setManagesViewControllerContainerViewLayout:(BOOL)a3
{
  if (self->_managesViewControllerContainerViewLayout != a3)
  {
    self->_managesViewControllerContainerViewLayout = a3;
    if (a3)
      -[SUUIViewControllerContainerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIViewController)viewController
{
  return -[SUUIViewControllerContainerView viewController](self->_viewControllerContainerView, "viewController");
}

- (UIView)viewControllerContainerView
{
  return (UIView *)self->_viewControllerContainerView;
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (BOOL)managesViewControllerContainerViewLayout
{
  return self->_managesViewControllerContainerViewLayout;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_viewControllerContainerView, 0);
}

@end
