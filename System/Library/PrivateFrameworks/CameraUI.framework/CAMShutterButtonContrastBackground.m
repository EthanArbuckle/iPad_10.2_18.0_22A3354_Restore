@implementation CAMShutterButtonContrastBackground

- (CAMShutterButtonContrastBackground)initWithFrame:(CGRect)a3
{
  CAMShutterButtonContrastBackground *v3;
  CAMShutterButtonContrastBackground *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMShutterButtonContrastBackground;
  v3 = -[CAMShutterButtonContrastBackground initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMShutterButtonContrastBackground setOpaque:](v3, "setOpaque:", 0);
    -[CAMShutterButtonContrastBackground setContentMode:](v4, "setContentMode:", 3);
  }
  return v4;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[CAMShutterButtonContrastBackground _strokeWidth](self, "_strokeWidth");
  v3 = v2;
  v4 = v2;
  v5 = v2;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  CGRect v16;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[CAMShutterButtonContrastBackground _strokeWidth](self, "_strokeWidth");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMShutterButtonContrastBackground bounds](self, "bounds");
  -[CAMShutterButtonContrastBackground alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v15, "set");
  CGContextSetLineWidth(CurrentContext, v6);
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  CGContextStrokeEllipseInRect(CurrentContext, v16);

}

@end
