@implementation CKBackBarButtonItem

- (CKBackBarButtonItem)initWithUnreadCount:(int64_t)a3
{
  CKBackBarButtonItem *v4;
  CKBackBarButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKBackBarButtonItem;
  v4 = -[CKBackBarButtonItem initWithTitle:style:target:action:](&v10, sel_initWithTitle_style_target_action_, 0, 0, 0, 0);
  v5 = v4;
  if (a3 >= 1 && v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__ck_localizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKBackBarButtonItem unnreadButtonImageWithString:](v5, "unnreadButtonImageWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBackBarButtonItem setImage:](v5, "setImage:", v8);

  }
  return v5;
}

- (CKBackBarButtonItem)initWithTitle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBackBarButtonItem;
  return -[CKBackBarButtonItem initWithTitle:style:target:action:](&v4, sel_initWithTitle_style_target_action_, a3, 0, 0, 0);
}

- (id)unnreadButtonImageWithString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double Width;
  double v19;
  CGContext *CurrentContext;
  id v21;
  id v22;
  const CGPath *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CGSize v37;
  CGRect v38;
  CGRect v39;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  _drawingAttributes();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 19.0;
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 33, v8, 0, 40.0, 19.0);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v38.origin.x = v11;
  v38.origin.y = v13;
  v38.size.width = v15;
  v38.size.height = v17;
  Width = CGRectGetWidth(v38);
  if (UIAccessibilityIsBoldTextEnabled())
    v9 = 21.0;
  if (v9 - Width <= 10.0)
    v19 = Width + 12.0;
  else
    v19 = v9;
  v37.width = v19;
  v37.height = v9;
  UIGraphicsBeginImageContextWithOptions(v37, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v21, "CGColor"));

  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  v39.size.width = v19;
  v39.size.height = v9;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v19, v9, CGRectGetHeight(v39) * 0.5);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = (const CGPath *)objc_msgSend(v22, "CGPath");

  CGContextAddPath(CurrentContext, v23);
  CGContextFillPath(CurrentContext);
  UIRectCenteredIntegralRectScale();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  _drawingAttributes();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "drawWithRect:options:attributes:context:", 33, v32, 0, v25, v27, v29, v31, 0);

  UIGraphicsGetImageFromCurrentImageContext();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v33, "_imageThatSuppressesAccessibilityHairlineThickening");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "imageWithRenderingMode:", 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

@end
