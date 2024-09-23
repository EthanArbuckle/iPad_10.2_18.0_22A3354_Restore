@implementation GKTopClipView

- (GKTopClipView)initWithFrame:(CGRect)a3
{
  GKTopClipView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKTopClipView;
  v3 = -[GKTopClipView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTopClipView setBackgroundColor:](v3, "setBackgroundColor:", v5);

  }
  return v3;
}

@end
