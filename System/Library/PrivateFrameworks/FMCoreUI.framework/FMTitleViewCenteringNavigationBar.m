@implementation FMTitleViewCenteringNavigationBar

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  CGFloat v32;
  double x;
  double y;
  double width;
  double height;
  void *v37;
  void *v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;

  v39.receiver = self;
  v39.super_class = (Class)FMTitleViewCenteringNavigationBar;
  -[FMTitleViewCenteringNavigationBar layoutSubviews](&v39, sel_layoutSubviews);
  -[FMTitleViewCenteringNavigationBar topItem](self, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FMTitleViewCenteringNavigationBar currentLeftView](self, "currentLeftView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0.0;
    v7 = 0.0;
    if (v5)
    {
      -[FMTitleViewCenteringNavigationBar currentLeftView](self, "currentLeftView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      v10 = v9;
      v12 = v11;

      v7 = v10 + v12;
    }
    -[FMTitleViewCenteringNavigationBar currentRightView](self, "currentRightView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[FMTitleViewCenteringNavigationBar currentRightView](self, "currentRightView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      v16 = v15;

      -[FMTitleViewCenteringNavigationBar frame](self, "frame");
      v6 = v17 - v16;
    }
    -[FMTitleViewCenteringNavigationBar topItem](self, "topItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "titleView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    -[FMTitleViewCenteringNavigationBar bounds](self, "bounds");
    if (v7 >= v6)
      v32 = v7;
    else
      v32 = v6;
    v40 = CGRectInset(*(CGRect *)&v28, v32, 0.0);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
    v40.origin.x = v21;
    v40.origin.y = v23;
    v40.size.width = v25;
    v40.size.height = v27;
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    if (!CGRectEqualToRect(v40, v41))
    {
      -[FMTitleViewCenteringNavigationBar topItem](self, "topItem");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "titleView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFrame:", x, y, width, height);

    }
  }
}

@end
