@implementation LUIImageManipulation

+ (id)sharedInstance
{
  if (qword_100088E68 != -1)
    dispatch_once(&qword_100088E68, &stru_100069CA0);
  return (id)qword_100088E60;
}

- (id)squareImageFromImage:(id)a3 scaledToSize:(double)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  char v21;
  double v22;
  double v23;
  CGContext *CurrentContext;
  UIImage *ImageFromCurrentImageContext;
  void *v26;
  CGAffineTransform v28;
  CGAffineTransform v29;

  v5 = a3;
  memset(&v29, 0, sizeof(v29));
  objc_msgSend(v5, "size");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;
  objc_msgSend(v5, "size");
  if (v7 <= v9)
  {
    CGAffineTransformMakeScale(&v29, a4 / v10, a4 / v10);
    objc_msgSend(v5, "size");
    v18 = v17;
    objc_msgSend(v5, "size");
    v16 = (v18 - v19) * -0.5;
    v15 = 0.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v29, a4 / v11, a4 / v11);
    objc_msgSend(v5, "size");
    v13 = v12;
    objc_msgSend(v5, "size");
    v15 = (v13 - v14) * -0.5;
    v16 = 0.0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v21 = objc_opt_respondsToSelector(v20, "scale");

  v22 = a4;
  v23 = a4;
  if ((v21 & 1) != 0)
    UIGraphicsBeginImageContextWithOptions(*(CGSize *)&v22, 1, 0.0);
  else
    UIGraphicsBeginImageContext(*(CGSize *)&v22);
  CurrentContext = UIGraphicsGetCurrentContext();
  v28 = v29;
  CGContextConcatCTM(CurrentContext, &v28);
  objc_msgSend(v5, "drawAtPoint:", v15, v16);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v26 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);

  UIGraphicsEndImageContext();
  return v26;
}

- (id)squareImageFromImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "size");
    if (v5 >= v6)
      v5 = v6;
    if (v5 >= 256.0)
      v5 = 256.0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIImageManipulation squareImageFromImage:scaledToSize:](self, "squareImageFromImage:scaledToSize:", v4, v5));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
