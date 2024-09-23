@implementation CAMReviewViewControllerContainerView

- (CAMReviewViewControllerContainerView)initWithFrame:(CGRect)a3
{
  CAMReviewViewControllerContainerView *v3;
  CAMReviewViewControllerContainerView *v4;
  CAMReviewViewControllerContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMReviewViewControllerContainerView;
  v3 = -[CAMReviewViewControllerContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMReviewViewControllerContainerView _commonCAMReviewViewControllerContainerViewInitialization](v3, "_commonCAMReviewViewControllerContainerViewInitialization");
    v5 = v4;
  }

  return v4;
}

- (CAMReviewViewControllerContainerView)initWithCoder:(id)a3
{
  CAMReviewViewControllerContainerView *v3;
  CAMReviewViewControllerContainerView *v4;
  CAMReviewViewControllerContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMReviewViewControllerContainerView;
  v3 = -[CAMReviewViewControllerContainerView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMReviewViewControllerContainerView _commonCAMReviewViewControllerContainerViewInitialization](v3, "_commonCAMReviewViewControllerContainerViewInitialization");
    v5 = v4;
  }

  return v4;
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
  double MidX;
  double MidY;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)CAMReviewViewControllerContainerView;
  -[CAMReviewViewControllerContainerView layoutSubviews](&v14, sel_layoutSubviews);
  -[CAMReviewViewControllerContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMReviewViewControllerContainerView reviewView](self, "reviewView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  MidY = CGRectGetMidY(v16);
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  objc_msgSend(v11, "setCenter:", MidX, MidY);

}

- (void)setReviewView:(id)a3
{
  UIView *v5;
  UIView *reviewView;
  UIView *v7;

  v5 = (UIView *)a3;
  reviewView = self->_reviewView;
  if (reviewView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](reviewView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_reviewView, a3);
    -[CAMReviewViewControllerContainerView addSubview:](self, "addSubview:", self->_reviewView);
    v5 = v7;
  }

}

- (UIView)reviewView
{
  return self->_reviewView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewView, 0);
}

@end
