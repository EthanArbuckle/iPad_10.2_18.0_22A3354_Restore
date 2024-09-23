@implementation UIPointerShape(SafariServicesExtras)

+ (id)sf_shapeForToolbarButton:()SafariServicesExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v4, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    objc_msgSend(v4, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_selectedIndicatorBounds");
    objc_msgSend(v16, "convertRect:fromView:", v4);
    v9 = v17;
    v11 = v18;
    v13 = v19;
    v15 = v20;

  }
  v29.origin.x = v9;
  v29.origin.y = v11;
  v29.size.width = v13;
  v29.size.height = v15;
  v30 = CGRectInset(v29, -12.0, 0.0);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v25 = fmin((CGRectGetWidth(v30) + -51.0) * 0.5, 0.0);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v26 = fmin((CGRectGetHeight(v31) + -37.0) * 0.5, 0.0);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v33 = CGRectInset(v32, v25, v26);
  objc_msgSend(a1, "shapeWithRoundedRect:cornerRadius:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height, 8.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

@end
