@implementation NTKMoonPhaseDailyDividerView

- (NTKMoonPhaseDailyDividerView)initWithFrame:(CGRect)a3
{
  NTKMoonPhaseDailyDividerView *v3;
  void *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKMoonPhaseDailyDividerView;
  v3 = -[NTKMoonPhaseDailyDividerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKMoonPhaseDailyDividerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[NTKMoonPhaseDailyDividerView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[NTKMoonPhaseDailyDividerView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 0, v5);
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = 1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

@end
