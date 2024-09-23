@implementation HUVisualEffectContainerView

- (HUVisualEffectContainerView)initWithInnerContentView:(id)a3
{
  id v4;
  HUVisualEffectContainerView *v5;
  HUVisualEffectContainerView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUVisualEffectContainerView;
  v5 = -[HUVisualEffectContainerView init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HUVisualEffectContainerView setInnerContentView:](v5, "setInnerContentView:", v4);

  return v6;
}

- (void)setInnerContentView:(id)a3
{
  UIView *v5;
  UIView *innerContentView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  innerContentView = self->_innerContentView;
  v8 = v5;
  if (innerContentView != v5)
  {
    -[UIView removeFromSuperview](innerContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_innerContentView, a3);
    -[HUVisualEffectContainerView contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[HUVisualEffectContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[HUVisualEffectContainerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUVisualEffectContainerView innerContentView](self, "innerContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUVisualEffectContainerView innerContentView](self, "innerContentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v14 = a4;
    *(float *)&v15 = a5;
    objc_msgSend(v13, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v14, v15);
    v17 = v16;
    v19 = v18;

    v20 = v17;
    v21 = v19;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)HUVisualEffectContainerView;
    *(float *)&v11 = a4;
    *(float *)&v12 = a5;
    -[HUVisualEffectContainerView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v22, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  }
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUVisualEffectContainerView innerContentView](self, "innerContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUVisualEffectContainerView innerContentView](self, "innerContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUVisualEffectContainerView;
  -[HUVisualEffectContainerView layoutSubviews](&v4, sel_layoutSubviews);
  -[HUVisualEffectContainerView innerContentView](self, "innerContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUVisualEffectContainerView bounds](self, "bounds");
  objc_msgSend(v3, "hu_setFramePreservingTransform:");

}

- (UIView)innerContentView
{
  return self->_innerContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerContentView, 0);
}

@end
