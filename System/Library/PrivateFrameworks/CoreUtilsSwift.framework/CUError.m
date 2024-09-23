@implementation CUError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14CoreUtilsSwift7CUError)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[CUError initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC14CoreUtilsSwift7CUError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  _TtC14CoreUtilsSwift7CUError *result;

  result = (_TtC14CoreUtilsSwift7CUError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
