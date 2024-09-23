@implementation WFOpacitySlider

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect result;

  v16.receiver = self;
  v16.super_class = (Class)WFOpacitySlider;
  -[WFOpacitySlider trackRectForBounds:](&v16, sel_trackRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = 2.0 / v10;

  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end
