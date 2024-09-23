@implementation CPContactDirectionsButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContactDirectionsButton)initWithHandler:(void *)handler
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPContactDirectionsButton;
  return -[CPButton initWithImage:handler:](&v4, sel_initWithImage_handler_, 0, handler);
}

@end
