@implementation ISDarkBackgroundResource

- (ISDarkBackgroundResource)init
{
  void *v3;
  void *v4;
  ISDarkBackgroundResource *v5;
  objc_super v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.1922, 0.1922, 0.1922, 1.0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", 0.0784, 0.0784, 0.0784, 1.0);
  v7.receiver = self;
  v7.super_class = (Class)ISDarkBackgroundResource;
  v5 = -[ISCubicInterpolationLinearGradientResource initWithStartingColor:endingColor:](&v7, sel_initWithStartingColor_endingColor_, v4, v3);

  return v5;
}

@end
