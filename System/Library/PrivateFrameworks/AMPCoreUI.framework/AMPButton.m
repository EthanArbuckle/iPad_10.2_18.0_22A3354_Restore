@implementation AMPButton

- (AMPButton)initWithFrame:(CGRect)a3
{
  AMPButton *v3;
  AMPButton *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMPButton;
  v3 = -[AMPButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AMPButton tintColor](v3, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMPButton setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[AMPButton layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 8.0);

    -[AMPButton setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMPButton setTitleColor:forState:](v4, "setTitleColor:forState:", v7, 0);

  }
  return v4;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMPButton;
  -[AMPButton tintColorDidChange](&v4, sel_tintColorDidChange);
  -[AMPButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPButton setBackgroundColor:](self, "setBackgroundColor:", v3);

}

@end
