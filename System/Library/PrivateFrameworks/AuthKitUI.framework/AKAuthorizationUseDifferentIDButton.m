@implementation AKAuthorizationUseDifferentIDButton

- (AKAuthorizationUseDifferentIDButton)initWithFrame:(CGRect)a3
{
  AKAuthorizationUseDifferentIDButton *v3;
  AKAuthorizationUseDifferentIDButton *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationUseDifferentIDButton;
  v3 = -[AKAuthorizationUseDifferentIDButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v7.receiver = v3;
    v7.super_class = (Class)AKAuthorizationUseDifferentIDButton;
    -[AKAuthorizationButton setupButton](&v7, sel_setupButton);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationUseDifferentIDButton setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (AKAuthorizationUseDifferentIDButton)initWithCoder:(id)a3
{
  AKAuthorizationUseDifferentIDButton *v3;
  AKAuthorizationUseDifferentIDButton *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKAuthorizationUseDifferentIDButton;
  v3 = -[AKAuthorizationUseDifferentIDButton initWithCoder:](&v8, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v7.receiver = v3;
    v7.super_class = (Class)AKAuthorizationUseDifferentIDButton;
    -[AKAuthorizationButton setupButton](&v7, sel_setupButton);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationUseDifferentIDButton setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

@end
