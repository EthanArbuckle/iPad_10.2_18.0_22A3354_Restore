@implementation SUUIStandardInteractiveDividerView

- (SUUIStandardInteractiveDividerView)initWithFrame:(CGRect)a3
{
  SUUIStandardInteractiveDividerView *v3;
  SUUIStandardInteractiveDividerView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIStandardInteractiveDividerView;
  v3 = -[SUUIStandardInteractiveDividerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIStandardInteractiveDividerView tintColor](v3, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStandardInteractiveDividerView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIStandardInteractiveDividerView;
  -[SUUIStandardInteractiveDividerView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[SUUIStandardInteractiveDividerView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStandardInteractiveDividerView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

+ (double)defaultWidth
{
  return 1.0;
}

@end
