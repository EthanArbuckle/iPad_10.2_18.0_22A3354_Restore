@implementation DTError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC17DistributedTimers7DTError)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[DTError initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC17DistributedTimers7DTError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  _TtC17DistributedTimers7DTError *result;

  result = (_TtC17DistributedTimers7DTError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
