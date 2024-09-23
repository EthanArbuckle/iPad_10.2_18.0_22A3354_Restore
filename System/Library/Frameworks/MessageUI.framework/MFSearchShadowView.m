@implementation MFSearchShadowView

- (MFSearchShadowView)initWithFrame:(CGRect)a3
{
  MFSearchShadowView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFSearchShadowView;
  v3 = -[MFSearchShadowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_shadowImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSearchShadowView setImage:](v3, "setImage:", v4);

    -[MFSearchShadowView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

+ (id)_shadowImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("search_shadow"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)defaultHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_shadowImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;

  return v4;
}

@end
