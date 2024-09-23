@implementation Component

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore9Component *v5;

  v4 = a3;
  v5 = self;
  sub_23A62DFC8(v4);

}

- (_TtC11DockKitCore9Component)initWithCoder:(id)a3
{
  id v3;
  _TtC11DockKitCore9Component *v4;

  v3 = a3;
  v4 = (_TtC11DockKitCore9Component *)sub_23A62EFC8();

  return v4;
}

- (_TtC11DockKitCore9Component)init
{
  _TtC11DockKitCore9Component *result;

  result = (_TtC11DockKitCore9Component *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
