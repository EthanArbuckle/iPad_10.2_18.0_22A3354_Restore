@implementation HUBlendedSeparatorView

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModePlusLighter);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFill");
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fill");

}

@end
