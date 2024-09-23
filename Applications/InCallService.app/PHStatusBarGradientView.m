@implementation PHStatusBarGradientView

- (PHStatusBarGradientView)initWithFrame:(CGRect)a3
{
  PHStatusBarGradientView *v3;
  PHStatusBarGradientView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHStatusBarGradientView;
  v3 = -[PHStatusBarGradientView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PHStatusBarGradientView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHStatusBarGradientView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  CGColorSpace *DeviceGray;
  CGGradient *v6;
  __int128 v7;
  __int128 v8;
  CGPoint v9;
  CGPoint v10;

  CurrentContext = UIGraphicsGetCurrentContext();
  v7 = xmmword_10023F468;
  v8 = unk_10023F478;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v6 = CGGradientCreateWithColorComponents(DeviceGray, (const CGFloat *)&v7, 0, 2uLL);
  -[PHStatusBarGradientView bounds](self, "bounds", v7, v8);
  v9.x = 0.0;
  v9.y = 0.0;
  v10.x = 0.0;
  CGContextDrawLinearGradient(CurrentContext, v6, v9, v10, 0);
  CFRelease(DeviceGray);
  CFRelease(v6);
}

@end
