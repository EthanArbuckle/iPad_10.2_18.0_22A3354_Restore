@implementation MSMessageLayout

- (MSMessageLayout)init
{
  abort();
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSMessageLayout;
  return -[MSMessageLayout init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MSMessageLayout _init]([MSMessageLayout alloc], "_init");
}

@end
