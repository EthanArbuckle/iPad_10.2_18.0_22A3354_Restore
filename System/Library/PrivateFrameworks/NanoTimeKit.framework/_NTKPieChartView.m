@implementation _NTKPieChartView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_NTKPieChartView)initWithFrame:(CGRect)a3
{
  _NTKPieChartView *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NTKPieChartView;
  v3 = -[_NTKPieChartView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKPieChartView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;
    -[_NTKPieChartView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentsScale:", v7);

  }
  return v3;
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  void *v6;
  id v7;

  if (a4)
  {
    -[_NTKPieChartView layer](self, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProgress:", a3);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 0);
    -[_NTKPieChartView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProgress:", a3);

    objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 1);
  }
}

@end
