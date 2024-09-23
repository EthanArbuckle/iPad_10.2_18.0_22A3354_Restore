@implementation _LSQueryResult

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_LSQueryResult;
  return -[_LSQueryResult init](&v3, sel_init);
}

- (_LSQueryResult)init
{
  abort();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
