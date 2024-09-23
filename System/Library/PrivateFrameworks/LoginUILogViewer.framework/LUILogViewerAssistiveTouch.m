@implementation LUILogViewerAssistiveTouch

- (LUILogViewerAssistiveTouch)initWithFrame:(CGRect)a3
{
  LUILogViewerAssistiveTouch *v3;
  LUILogViewerAssistiveTouch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUILogViewerAssistiveTouch;
  v3 = -[LUILogViewerAssistiveTouch initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUILogViewerAssistiveTouch _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerAssistiveTouch setBackgroundColor:](self, "setBackgroundColor:", v4);

  -[LUILogViewerAssistiveTouch setTitle:forState:](self, "setTitle:forState:", CFSTR("L"), 0);
  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 25.0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerAssistiveTouch titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)LUILogViewerAssistiveTouch;
  -[LUILogViewerAssistiveTouch layoutSubviews](&v5, sel_layoutSubviews);
  -[LUILogViewerAssistiveTouch frame](self, "frame");
  v3 = CGRectGetWidth(v6) * 0.5;
  -[LUILogViewerAssistiveTouch layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

}

@end
