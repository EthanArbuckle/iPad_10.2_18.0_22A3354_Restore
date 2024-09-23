@implementation BatteryCenterObserver

- (_TtC15BatteryCenterUI21BatteryCenterObserver)init
{
  return (_TtC15BatteryCenterUI21BatteryCenterObserver *)sub_1D2A6BF4C();
}

- (void)connectedDevicesDidChange:(id)a3
{
  unint64_t v4;
  _TtC15BatteryCenterUI21BatteryCenterObserver *v5;

  sub_1D2A4150C(0, &qword_1ED1BE750);
  v4 = sub_1D2A81CC4();
  v5 = self;
  sub_1D2A6C58C(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15BatteryCenterUI21BatteryCenterObserver_batteryController));
  swift_release();
}

@end
