@implementation ControlCenterClient

- (_TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient)init
{
  _TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient *result;

  result = (_TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient__processHandle));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient__queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient__queue_connection));
}

- (void)reloadAllControlsForBundleIdentifier:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient *v7;

  if (a3)
  {
    v4 = sub_1D29C59E8();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1D2940F04(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)reloadControlsOfKind:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient *v7;

  v4 = sub_1D29C59E8();
  v6 = v5;
  v7 = self;
  sub_1D2941914(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)currentConfigurations:(id)a3
{
  void *v4;
  _TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1D29429C0((uint64_t)v5, v4);
  _Block_release(v4);
  _Block_release(v4);

}

@end
