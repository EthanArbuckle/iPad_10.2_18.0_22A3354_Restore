@implementation PHSublayerResizingView

- (PHSublayerResizingView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHSublayerResizingView;
  return -[PHSublayerResizingView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(PHSublayerResizingLayer, a2);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PHSublayerResizingView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17.receiver = self;
  v17.super_class = (Class)PHSublayerResizingView;
  -[PHSublayerResizingView setFrame:](&v17, "setFrame:", x, y, width, height);
  if ((-[PHSublayerResizingView isHidden](self, "isHidden") & 1) == 0)
  {
    v18.origin.x = v9;
    v18.origin.y = v11;
    v18.size.width = v13;
    v18.size.height = v15;
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    if (!CGRectEqualToRect(v18, v19))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v16, "postNotificationName:object:", CFSTR("PHSublayerResizingViewDidResizeNotification"), 0);

    }
  }
}

@end
