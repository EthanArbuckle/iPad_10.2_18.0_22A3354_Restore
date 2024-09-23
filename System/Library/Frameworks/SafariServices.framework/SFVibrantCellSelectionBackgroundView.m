@implementation SFVibrantCellSelectionBackgroundView

- (SFVibrantCellSelectionBackgroundView)initWithFrame:(CGRect)a3
{
  SFVibrantCellSelectionBackgroundView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  SFVibrantCellSelectionBackgroundView *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SFVibrantCellSelectionBackgroundView;
  v3 = -[SFVibrantCellSelectionBackgroundView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFVibrantCellSelectionBackgroundView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)-[SFVibrantCellSelectionBackgroundView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v7, v3, sel_updateSelectionEffect);

    -[SFVibrantCellSelectionBackgroundView updateSelectionEffect](v3, "updateSelectionEffect");
    v9 = v3;
  }

  return v3;
}

- (void)updateSelectionEffect
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[SFVibrantCellSelectionBackgroundView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sf_backgroundBlurEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultPopoverBackgroundEffect");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v8, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFVibrantCellSelectionBackgroundView setEffect:](self, "setEffect:", v7);

}

@end
