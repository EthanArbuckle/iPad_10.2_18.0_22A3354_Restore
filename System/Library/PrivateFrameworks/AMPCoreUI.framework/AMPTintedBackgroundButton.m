@implementation AMPTintedBackgroundButton

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMPTintedBackgroundButton;
  -[AMPTintedBackgroundButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[AMPTintedBackgroundButton updateBackgroundColor](self, "updateBackgroundColor");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMPTintedBackgroundButton;
  -[AMPTintedBackgroundButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[AMPTintedBackgroundButton updateBackgroundColor](self, "updateBackgroundColor");
}

- (void)updateBackgroundColor
{
  char v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[AMPTintedBackgroundButton isHighlighted](self, "isHighlighted");
  -[AMPTintedBackgroundButton tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMPTintedBackgroundButton setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  else
  {
    -[AMPTintedBackgroundButton setBackgroundColor:](self, "setBackgroundColor:", v4);
  }

}

@end
