@implementation VOActivityKeyedArchiveHelper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sub_18C71215C();
  __break(1u);
}

- (VOActivityKeyedArchiveHelper)initWithCoder:(id)a3
{
  id v3;
  VOActivityKeyedArchiveHelper *v4;

  v3 = a3;
  v4 = (VOActivityKeyedArchiveHelper *)sub_18C7069F8();

  return v4;
}

- (VOActivityKeyedArchiveHelper)init
{
  VOActivityKeyedArchiveHelper *result;

  result = (VOActivityKeyedArchiveHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
