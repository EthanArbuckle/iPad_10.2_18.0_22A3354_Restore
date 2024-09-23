@implementation SLSheetPreComposedAppIconImageView

- (SLSheetPreComposedAppIconImageView)init
{
  double v2;
  double v3;
  SLSheetPreComposedAppIconImageView *v4;
  SLSheetPreComposedAppIconImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v15.receiver = self;
  v15.super_class = (Class)SLSheetPreComposedAppIconImageView;
  v4 = -[SLSheetImagePreviewView initWithFrame:](&v15, sel_initWithFrame_, v2, v3, 110.0, 110.0);
  v5 = v4;
  if (v4)
  {
    -[SLSheetPreComposedAppIconImageView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldRasterize:", 1);

    -[SLSheetPreComposedAppIconImageView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    objc_msgSend(v7, "setRasterizationScale:");

    v9 = objc_alloc(MEMORY[0x1E0CEA658]);
    v16.origin.x = v2;
    v16.origin.y = v3;
    v16.size.width = 110.0;
    v16.size.height = 110.0;
    v17 = CGRectInset(v16, 6.5, 6.5);
    v10 = (void *)objc_msgSend(v9, "initWithFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
    -[SLSheetImagePreviewView setImageView:](v5, "setImageView:", v10);

    -[SLSheetImagePreviewView imageView](v5, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentMode:", 2);

    -[SLSheetImagePreviewView imageView](v5, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClipsToBounds:", 1);

    -[SLSheetImagePreviewView imageView](v5, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetPreComposedAppIconImageView addSubview:](v5, "addSubview:", v13);

    -[SLSheetPreComposedAppIconImageView setNeedsLayout](v5, "setNeedsLayout");
  }
  return v5;
}

- (void)setImage:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double width;
  double v9;
  double height;
  double v11;
  double x;
  double v13;
  double y;
  void *v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v5 = a3;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "size");
    width = v7;
    height = v9;
    -[SLSheetPreComposedAppIconImageView bounds](self, "bounds");
    x = (v11 - width) * 0.5;
    -[SLSheetPreComposedAppIconImageView bounds](self, "bounds");
    y = (v13 - height) * 0.5;
  }
  else
  {
    -[SLSheetPreComposedAppIconImageView bounds](self, "bounds");
    v18 = CGRectInset(v17, 6.5, 6.5);
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
  }
  -[SLSheetImagePreviewView imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", x, y, width, height);

  v16.receiver = self;
  v16.super_class = (Class)SLSheetPreComposedAppIconImageView;
  -[SLSheetImagePreviewView setImage:](&v16, sel_setImage_, v6);

}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 8.0;
  v3 = 8.0;
  v4 = 8.0;
  v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 94.0;
  v3 = 94.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
