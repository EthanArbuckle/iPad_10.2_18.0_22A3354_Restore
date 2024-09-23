@implementation ControlsConfigurationXPCContainer

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE1EF0E1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE1EF0E1 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9WidgetKit33ControlsConfigurationXPCContainer *v5;

  v4 = a3;
  v5 = self;
  sub_190A25780(v4);

}

- (_TtC9WidgetKit33ControlsConfigurationXPCContainer)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit33ControlsConfigurationXPCContainer *)ControlsConfigurationXPCContainer.init(coder:)(a3);
}

- (_TtC9WidgetKit33ControlsConfigurationXPCContainer)init
{
  _TtC9WidgetKit33ControlsConfigurationXPCContainer *result;

  result = (_TtC9WidgetKit33ControlsConfigurationXPCContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
