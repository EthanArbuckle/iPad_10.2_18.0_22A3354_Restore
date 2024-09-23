@implementation MKVibrantHairlineView

- (MKVibrantHairlineView)initWithFrame:(CGRect)a3
{
  MKVibrantHairlineView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKVibrantHairlineView;
  v3 = -[MKVibrantView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantHairlineView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[MKVibrantView setStyle:](v3, "setStyle:", 7);
  }
  return v3;
}

@end
