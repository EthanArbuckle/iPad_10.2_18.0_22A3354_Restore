@implementation SKSceneUnarchiveDummy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKSceneUnarchiveDummy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKSceneUnarchiveDummy;
  return -[SKSceneUnarchiveDummy init](&v4, sel_init, a3);
}

@end
