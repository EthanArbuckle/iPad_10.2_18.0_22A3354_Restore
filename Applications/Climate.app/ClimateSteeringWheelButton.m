@implementation ClimateSteeringWheelButton

- (_TtC7Climate26ClimateSteeringWheelButton)init
{
  uint64_t v3;
  _TtC7Climate26ClimateSteeringWheelButton *result;

  *(_DWORD *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate26ClimateSteeringWheelButton_currentValue) = 0;
  v3 = OBJC_IVAR____TtC7Climate26ClimateSteeringWheelButton_autoModeGlyph;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");

  result = (_TtC7Climate26ClimateSteeringWheelButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x800000010008BB20, "Climate/ClimateSteeringWheelButton.swift", 40, 2, 96, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate26ClimateSteeringWheelButton_steeringWheel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate26ClimateSteeringWheelButton_progressCircle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate26ClimateSteeringWheelButton_autoModeGlyph));
}

- (void)steeringWheelHeatingCoolingService:(id)a3 didUpdateHeatingCoolingLevel:(int)a4
{
  id v5;
  _TtC7Climate26ClimateSteeringWheelButton *v6;

  v5 = a3;
  v6 = self;
  sub_100035544();

}

- (void)steeringWheelHeatingCoolingService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v5;
  _TtC7Climate26ClimateSteeringWheelButton *v6;

  v5 = a3;
  v6 = self;
  sub_100035544();

}

@end
