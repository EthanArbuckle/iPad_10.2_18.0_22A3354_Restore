@implementation CNUIImage

+ (id)resizeImage:(id)a3 toFitWidth:(double)a4 scale:(double)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  CGSize v17;

  v7 = a3;
  objc_msgSend(v7, "size");
  if (v8 <= a4)
  {
    v15 = v7;
  }
  else
  {
    objc_msgSend(v7, "size");
    v10 = v9 / a4;
    objc_msgSend(v7, "size");
    v12 = v11 / v10;
    objc_msgSend(v7, "size");
    v14 = v13 / v10;
    v17.width = v12;
    v17.height = v14;
    UIGraphicsBeginImageContextWithOptions(v17, 0, a5);
    objc_msgSend(v7, "drawInRect:", 0.0, 0.0, v12, v14);
    UIGraphicsGetImageFromCurrentImageContext();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v15;
}

+ (id)cropImageCircular:(id)a3 withCornerRadius:(double)a4 scale:(double)a5
{
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  CGSize v17;

  v7 = (objc_class *)MEMORY[0x1E0CEA658];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithImage:", v8);

  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMasksToBounds:", 1);

  objc_msgSend(v9, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", a4);

  objc_msgSend(v9, "bounds");
  v17.width = v12;
  v17.height = v13;
  UIGraphicsBeginImageContextWithOptions(v17, 0, a5);
  objc_msgSend(v9, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v15;
}

@end
