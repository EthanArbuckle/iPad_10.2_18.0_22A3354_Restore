@implementation CameraLimit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore11CameraLimit *v5;

  v4 = a3;
  v5 = self;
  CameraLimit.encode(with:)((NSCoder)v4);

}

- (_TtC11DockKitCore11CameraLimit)initWithCoder:(id)a3
{
  id v3;
  _TtC11DockKitCore11CameraLimit *v4;

  v3 = a3;
  v4 = (_TtC11DockKitCore11CameraLimit *)sub_23A5C9D78();

  return v4;
}

- (_TtC11DockKitCore11CameraLimit)init
{
  _TtC11DockKitCore11CameraLimit *result;

  result = (_TtC11DockKitCore11CameraLimit *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
