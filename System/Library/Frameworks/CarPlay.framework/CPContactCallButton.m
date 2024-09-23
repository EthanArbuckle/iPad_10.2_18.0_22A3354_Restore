@implementation CPContactCallButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPContactCallButton)initWithHandler:(void *)handler
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPContactCallButton;
  return -[CPButton initWithImage:handler:](&v4, sel_initWithImage_handler_, 0, handler);
}

@end
