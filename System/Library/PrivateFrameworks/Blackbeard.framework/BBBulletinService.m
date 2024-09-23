@implementation BBBulletinService

- (id)initNoop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BBBulletinService;
  return -[BBBulletinService init](&v3, sel_init);
}

@end
