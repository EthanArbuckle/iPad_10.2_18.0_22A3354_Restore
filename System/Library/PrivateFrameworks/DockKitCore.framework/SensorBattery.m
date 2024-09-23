@implementation SensorBattery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore21AccessoryBatteryState)state
{
  return (_TtC11DockKitCore21AccessoryBatteryState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC11DockKitCore13SensorBattery_state));
}

- (void)setState:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore13SensorBattery_state);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore13SensorBattery_state) = (Class)a3;
  v3 = a3;

}

- (NSString)description
{
  _TtC11DockKitCore13SensorBattery *v2;
  void *v3;

  v2 = self;
  sub_23A5F29C0();

  v3 = (void *)sub_23A690E04();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _TtC11DockKitCore13SensorBattery *v8;

  v5 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11DockKitCore13SensorBattery_state);
  v6 = a3;
  v8 = self;
  v7 = (void *)sub_23A690E04();
  objc_msgSend(v6, sel_encodeObject_forKey_, v5, v7);

  sub_23A62DFC8(v6);
}

- (_TtC11DockKitCore13SensorBattery)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore13SensorBattery *)SensorBattery.init(coder:)(a3);
}

- (void).cxx_destruct
{

}

@end
