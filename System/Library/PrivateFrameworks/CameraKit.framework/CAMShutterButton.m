@implementation CAMShutterButton

+ (id)shutterButtonWithSpec:(CAMShutterButtonSpec)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CAMShutterButton;
  objc_msgSendSuper2(&v4, sel_shutterButtonWithDesiredSpec_, a3.var0, a3.var1, a3.var2, a3.var3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)mode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMShutterButton;
  return -[CMKShutterButton buttonMode](&v3, sel_buttonMode);
}

- (void)setMode:(int64_t)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMShutterButton;
  -[CMKShutterButton setButtonMode:animated:](&v4, sel_setButtonMode_animated_, a3, a4);
}

@end
