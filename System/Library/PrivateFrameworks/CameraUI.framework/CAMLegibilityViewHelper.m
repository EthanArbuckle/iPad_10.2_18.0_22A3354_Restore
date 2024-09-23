@implementation CAMLegibilityViewHelper

+ (id)newLegibilityViewWithSettings:(id)a3 forLabel:(id)a4 sizeToFit:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  objc_msgSend(a1, "_imageFromLabel:sizeToFit:", a4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0DC4278]);
  v11 = (void *)objc_msgSend(v10, "initWithSettings:strength:image:shadowImage:options:", v8, v9, 0, *MEMORY[0x1E0DC5970], *MEMORY[0x1E0DC5958]);

  return v11;
}

+ (id)_imageFromLabel:(id)a3 sizeToFit:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  CGContext *CurrentContext;
  void *v17;
  CGSize v19;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  if (v4)
  {
    objc_msgSend(v5, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    UIRectIntegralWithScale();
    objc_msgSend(v5, "setFrame:");
  }
  objc_msgSend(v5, "frame");
  v13 = 0;
  if (v11 > 0.0 && v12 > 0.0)
  {
    v14 = v9;
    v15 = v10;
    v19.width = v11;
    v19.height = v12;
    UIGraphicsBeginImageContextWithOptions(v19, 0, v8);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, -v14, -v15);
    objc_msgSend(v5, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "renderInContext:", CurrentContext);

    UIGraphicsGetImageFromCurrentImageContext();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v13;
}

+ (id)imageForText:(id)a3 font:(id)a4 textAlignment:(int64_t)a5 constrainedToSize:(CGSize)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v31[3];
  _QWORD v32[4];
  CGSize v33;

  height = a6.height;
  width = a6.width;
  v32[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void *)MEMORY[0x1E0DC3BF8];
  v12 = a4;
  objc_msgSend(v11, "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;

  v16 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v16, "setAlignment:", a5);
  v17 = *MEMORY[0x1E0DC1138];
  v32[0] = v12;
  v18 = *MEMORY[0x1E0DC1140];
  v31[0] = v17;
  v31[1] = v18;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = *MEMORY[0x1E0DC1178];
  v32[1] = v19;
  v32[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v20, 0, width, height);
  UIRectIntegralWithScale();
  v25 = 0;
  if (v23 > 0.0)
  {
    v26 = v24;
    if (v24 > 0.0)
    {
      v27 = v21;
      v28 = v22;
      v29 = v23;
      v33.width = v23;
      v33.height = v24;
      UIGraphicsBeginImageContextWithOptions(v33, 0, v15);
      objc_msgSend(v10, "drawWithRect:options:attributes:context:", 1, v20, 0, v27, v28, v29, v26);
      UIGraphicsGetImageFromCurrentImageContext();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
  }

  return v25;
}

@end
