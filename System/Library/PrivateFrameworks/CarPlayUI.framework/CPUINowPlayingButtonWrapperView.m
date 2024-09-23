@implementation CPUINowPlayingButtonWrapperView

- (CPUINowPlayingButtonWrapperView)initWithFrame:(CGRect)a3 bundleIdentifier:(id)a4
{
  double y;
  double x;
  id v7;
  CPUINowPlayingButton *v8;
  double v9;
  CPUINowPlayingButtonWrapperView *v10;
  CPUINowPlayingButtonWrapperView *v11;
  double v12;
  objc_super v14;

  y = a3.origin.y;
  x = a3.origin.x;
  v7 = a4;
  v8 = -[CPUINowPlayingButton initWithBundleIdentifier:]([CPUINowPlayingButton alloc], "initWithBundleIdentifier:", v7);

  -[CPUINowPlayingButton frame](v8, "frame");
  v14.receiver = self;
  v14.super_class = (Class)CPUINowPlayingButtonWrapperView;
  v10 = -[CPUINowPlayingButtonWrapperView initWithFrame:](&v14, sel_initWithFrame_, x, y, v9 + 6.0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_nowPlayingButton, v8);
    -[CPUINowPlayingButtonWrapperView addSubview:](v11, "addSubview:", v8);
    if (-[CPUINowPlayingButtonWrapperView effectiveUserInterfaceLayoutDirection](v11, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[CPUINowPlayingButton frame](v8, "frame");
      -[CPUINowPlayingButton setFrame:](v8, "setFrame:", v12 + 6.0);
    }
  }

  return v11;
}

- (CPUINowPlayingButton)nowPlayingButton
{
  return self->_nowPlayingButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingButton, 0);
}

@end
