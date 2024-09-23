@implementation ISCodableIcon

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISCodableIcon;
  return -[ISIcon _init](&v3, sel__init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
