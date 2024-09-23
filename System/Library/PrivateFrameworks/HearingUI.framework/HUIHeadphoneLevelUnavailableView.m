@implementation HUIHeadphoneLevelUnavailableView

- (HUIHeadphoneLevelUnavailableView)initWithFrame:(CGRect)a3
{
  HUIHeadphoneLevelUnavailableView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUIHeadphoneLevelUnavailableView;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 4, 23.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemImageNamed:withConfiguration:", CFSTR("headphones"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    HUICCImageViewWithImage(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUICCCapsuleButton setIconView:](v3, "setIconView:", v7);

    -[HUICCCapsuleButton titleLabel](v3, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    hearingLocString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    -[HUICCCapsuleButton subtitleLabel](v3, "subtitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    hearingLocString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

  }
  return v3;
}

- (id)contentValue
{
  return 0;
}

- (BOOL)enabled
{
  return 1;
}

- (BOOL)shouldAutoExpandForView:(id)a3
{
  return 0;
}

@end
