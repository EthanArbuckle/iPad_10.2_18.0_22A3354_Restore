@implementation JSRandomObject

- (_TtC9JetEngine14JSRandomObject)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[JSRandomObject init](&v3, sel_init);
}

- (id)nextBoolean
{
  return (id)sub_19CF0DE8C();
}

- (id)nextNumber
{
  return (id)sub_19CF0DF78();
}

- (id)nextUUID
{
  return (id)sub_19CF0E078();
}

@end
