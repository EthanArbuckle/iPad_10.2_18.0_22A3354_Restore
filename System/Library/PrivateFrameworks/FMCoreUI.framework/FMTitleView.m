@implementation FMTitleView

- (void)layoutSubviews
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
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
  objc_super v38;
  CGRect v39;
  CGRect v40;

  v38.receiver = self;
  v38.super_class = (Class)FMTitleView;
  -[FMTitleView layoutSubviews](&v38, sel_layoutSubviews);
  -[FMTitleView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FMTitleView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v5, "superview");
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v6;
      }
      while (v6);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMTitleView.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[navbar isKindOfClass:[UINavigationBar class]]"));

    }
    objc_msgSend(v5, "currentLeftView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0.0;
    v9 = 0.0;
    if (v7)
    {
      objc_msgSend(v5, "currentLeftView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;
      v14 = v13;

      v9 = v12 + v14;
    }
    objc_msgSend(v5, "currentRightView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v5, "currentRightView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      v18 = v17;

      objc_msgSend(v5, "frame");
      v8 = v19 - v18;
    }
    -[FMTitleView frame](self, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v5, "bounds");
    if (v9 >= v8)
      v32 = v9;
    else
      v32 = v8;
    v39 = CGRectInset(*(CGRect *)&v28, v32, 0.0);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    v39.origin.x = v21;
    v39.origin.y = v23;
    v39.size.width = v25;
    v39.size.height = v27;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    if (!CGRectEqualToRect(v39, v40))
      -[FMTitleView setFrame:](self, "setFrame:", x, y, width, height);

  }
}

@end
