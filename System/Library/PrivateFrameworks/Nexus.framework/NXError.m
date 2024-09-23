@implementation NXError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC5Nexus7NXError)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[NXError initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC5Nexus7NXError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  _TtC5Nexus7NXError *result;

  result = (_TtC5Nexus7NXError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
