@implementation AKAuthorizationContinueButton

- (AKAuthorizationContinueButton)initWithFrame:(CGRect)a3
{
  AKAuthorizationContinueButton *v3;
  AKAuthorizationContinueButton *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationContinueButton;
  v3 = -[AKAuthorizationContinueButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v7.receiver = v3;
    v7.super_class = (Class)AKAuthorizationContinueButton;
    -[AKAuthorizationButton setupButton](&v7, sel_setupButton);
    +[AKAuthorizationAppearance continueButtonDefaultColor](AKAuthorizationAppearance, "continueButtonDefaultColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationContinueButton setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (AKAuthorizationContinueButton)initWithCoder:(id)a3
{
  AKAuthorizationContinueButton *v3;
  AKAuthorizationContinueButton *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationContinueButton;
  v3 = -[AKAuthorizationContinueButton initWithCoder:](&v8, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v7.receiver = v3;
    v7.super_class = (Class)AKAuthorizationContinueButton;
    -[AKAuthorizationButton setupButton](&v7, sel_setupButton);
    +[AKAuthorizationAppearance continueButtonDefaultColor](AKAuthorizationAppearance, "continueButtonDefaultColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationContinueButton setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[AKAuthorizationContinueButton isHighlighted](self, "isHighlighted") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)AKAuthorizationContinueButton;
    -[AKAuthorizationContinueButton setHighlighted:](&v6, sel_setHighlighted_, v3);
    if (v3)
      +[AKAuthorizationAppearance continueButtonHighlightedColor](AKAuthorizationAppearance, "continueButtonHighlightedColor");
    else
      +[AKAuthorizationAppearance continueButtonDefaultColor](AKAuthorizationAppearance, "continueButtonDefaultColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationContinueButton setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[AKAuthorizationContinueButton isEnabled](self, "isEnabled") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)AKAuthorizationContinueButton;
    -[AKAuthorizationContinueButton setEnabled:](&v6, sel_setEnabled_, v3);
    if (v3)
      +[AKAuthorizationAppearance continueButtonDefaultColor](AKAuthorizationAppearance, "continueButtonDefaultColor");
    else
      +[AKAuthorizationAppearance continueButtonDisabledColor](AKAuthorizationAppearance, "continueButtonDisabledColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationContinueButton setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
}

@end
