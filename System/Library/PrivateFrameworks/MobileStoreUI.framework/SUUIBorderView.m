@implementation SUUIBorderView

- (void)setColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIBorderView;
  -[SUUIBorderView setBackgroundColor:](&v3, sel_setBackgroundColor_, a3);
}

- (UIColor)color
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIBorderView;
  -[SUUIBorderView backgroundColor](&v3, sel_backgroundColor);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

@end
