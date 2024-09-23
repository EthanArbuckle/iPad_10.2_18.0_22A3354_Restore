@implementation DSShapeView

+ (id)circleWithFrame:(CGRect)a3 radius:(double)a4 color:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  DSShapeView *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  v11 = -[DSShapeView initWithFrame:]([DSShapeView alloc], "initWithFrame:", x, y, width, height);
  -[DSShapeView setBackgroundColor:](v11, "setBackgroundColor:", v10);
  -[DSShapeView layer](v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", a4);

  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v13, "CGColor");

  -[DSShapeView layer](v11, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBorderColor:", v14);

  -[DSShapeView layer](v11, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBorderWidth:", 4.0);

  -[DSShapeView setClipsToBounds:](v11, "setClipsToBounds:", 1);
  -[DSShapeView setAlpha:](v11, "setAlpha:", 1.0);
  return v11;
}

+ (id)rectangleWithFrame:(CGRect)a3 borderColor:(id)a4 fillColor:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  DSShapeView *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  v11 = a4;
  v12 = -[DSShapeView initWithFrame:]([DSShapeView alloc], "initWithFrame:", x, y, width, height);
  -[DSShapeView setBackgroundColor:](v12, "setBackgroundColor:", v10);

  v13 = objc_retainAutorelease(v11);
  v14 = objc_msgSend(v13, "CGColor");

  -[DSShapeView layer](v12, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBorderColor:", v14);

  -[DSShapeView layer](v12, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBorderWidth:", 4.0);

  -[DSShapeView setClipsToBounds:](v12, "setClipsToBounds:", 1);
  -[DSShapeView setAlpha:](v12, "setAlpha:", 1.0);
  return v12;
}

+ (id)rectangleWithFrame:(CGRect)a3 borderColor:(id)a4 fillColor:(id)a5 borderWidth:(int)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  DSShapeView *v14;
  id v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v13 = a4;
  v14 = -[DSShapeView initWithFrame:]([DSShapeView alloc], "initWithFrame:", x, y, width, height);
  -[DSShapeView setBackgroundColor:](v14, "setBackgroundColor:", v12);

  v15 = objc_retainAutorelease(v13);
  v16 = objc_msgSend(v15, "CGColor");

  -[DSShapeView layer](v14, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBorderColor:", v16);

  v18 = (double)a6;
  -[DSShapeView layer](v14, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBorderWidth:", v18);

  -[DSShapeView setClipsToBounds:](v14, "setClipsToBounds:", 1);
  -[DSShapeView setAlpha:](v14, "setAlpha:", 1.0);
  return v14;
}

@end
