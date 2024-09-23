@implementation FMBlurView

- (FMBlurView)initWithFrame:(CGRect)a3 autosizesToFitSuperview:(BOOL)a4
{
  _BOOL8 v4;
  FMBlurView *v5;
  FMBlurView *v6;
  void *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)FMBlurView;
  v5 = -[FMBlurView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[FMBlurView setAutosizesToFitSuperview:](v5, "setAutosizesToFitSuperview:", v4);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.9686, 0.96);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMBlurView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    if (-[FMBlurView autosizesToFitSuperview](v6, "autosizesToFitSuperview"))
      -[FMBlurView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  }
  return v6;
}

- (FMBlurView)init
{
  return -[FMBlurView initWithFrame:autosizesToFitSuperview:](self, "initWithFrame:autosizesToFitSuperview:", 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (FMBlurView)initWithFrame:(CGRect)a3
{
  return -[FMBlurView initWithFrame:autosizesToFitSuperview:](self, "initWithFrame:autosizesToFitSuperview:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToSuperview
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Width;
  CGRect v13;
  CGRect v14;

  if (-[FMBlurView autosizesToFitSuperview](self, "autosizesToFitSuperview"))
  {
    -[FMBlurView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v13.origin.x = v5;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    Width = CGRectGetWidth(v13);
    v14.origin.x = v5;
    v14.origin.y = v7;
    v14.size.width = v9;
    v14.size.height = v11;
    -[FMBlurView setFrame:](self, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v14));
  }
  -[FMBlurView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)autosizesToFitSuperview
{
  return self->_autosizesToFitSuperview;
}

- (void)setAutosizesToFitSuperview:(BOOL)a3
{
  self->_autosizesToFitSuperview = a3;
}

@end
