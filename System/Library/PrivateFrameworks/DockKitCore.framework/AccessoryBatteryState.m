@implementation AccessoryBatteryState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore21AccessoryBatteryState *v5;

  v4 = a3;
  v5 = self;
  AccessoryBatteryState.encode(with:)((NSCoder)v4);

}

- (_TtC11DockKitCore21AccessoryBatteryState)initWithCoder:(id)a3
{
  id v3;
  _TtC11DockKitCore21AccessoryBatteryState *v4;

  v3 = a3;
  v4 = (_TtC11DockKitCore21AccessoryBatteryState *)sub_23A5CB818();

  return v4;
}

- (_TtC11DockKitCore21AccessoryBatteryState)init
{
  _TtC11DockKitCore21AccessoryBatteryState *result;

  result = (_TtC11DockKitCore21AccessoryBatteryState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
