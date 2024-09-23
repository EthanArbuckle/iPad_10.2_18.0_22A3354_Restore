@implementation BRTintColorButton

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRTintColorButton;
  -[BRTintColorButton tintColorDidChange](&v4, sel_tintColorDidChange);
  -[BRTintColorButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRTintColorButton setTitleColor:forState:](self, "setTitleColor:forState:", v3, 0);

  -[BRTintColorButton setNeedsDisplay](self, "setNeedsDisplay");
}

@end
