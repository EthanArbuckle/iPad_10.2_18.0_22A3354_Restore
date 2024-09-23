@implementation SFCreditCardSeparator

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("CreditCardSeparator");
}

- (SFCreditCardSeparator)initWithFrame:(CGRect)a3
{
  SFCreditCardSeparator *v3;
  void *v4;
  SFCreditCardSeparator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFCreditCardSeparator;
  v3 = -[SFCreditCardSeparator initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCreditCardSeparator setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = v3;
  }

  return v3;
}

@end
