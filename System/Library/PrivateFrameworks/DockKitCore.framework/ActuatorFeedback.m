@implementation ActuatorFeedback

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore16ActuatorFeedback *v5;

  v4 = a3;
  v5 = self;
  ActuatorFeedback.encode(with:)((NSCoder)v4);

}

- (_TtC11DockKitCore16ActuatorFeedback)initWithCoder:(id)a3
{
  id v3;
  _TtC11DockKitCore16ActuatorFeedback *v4;

  v3 = a3;
  v4 = (_TtC11DockKitCore16ActuatorFeedback *)sub_23A63EA38();

  return v4;
}

- (_TtC11DockKitCore16ActuatorFeedback)init
{
  _TtC11DockKitCore16ActuatorFeedback *result;

  result = (_TtC11DockKitCore16ActuatorFeedback *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
