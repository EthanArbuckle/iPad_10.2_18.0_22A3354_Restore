@implementation RadioCarManager

- (_TtC5Media15RadioCarManager)init
{
  _TtC5Media15RadioCarManager *result;

  sub_1000083A8();
  return result;
}

- (void)nowPlayingTapped
{
  _TtC5Media15RadioCarManager *v2;

  v2 = self;
  sub_10000B4B0();

}

- (void)dismissSettingsModal
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Media15RadioCarManager_navigationController);
  if (v2)
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)showSoundSettingsWithOverrideDark:(BOOL)a3
{
  _TtC5Media15RadioCarManager *v4;

  v4 = self;
  sub_10000B658(a3);

}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC5Media15RadioCarManager *v7;

  v6 = a3;
  v7 = self;
  sub_10000B968((uint64_t)v6, a4);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC5Media15RadioCarManager *v7;

  v6 = a3;
  v7 = self;
  sub_10000B9D0((uint64_t)v6, a4);

}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4;
  _TtC5Media15RadioCarManager *v5;

  v4 = a3;
  v5 = self;
  sub_10000BBFC(v4);

}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5;
  _TtC5Media15RadioCarManager *v6;

  v5 = a3;
  v6 = self;
  sub_10000C1A4(v5, "%@ has updated receivedAllValues");

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC5Media15RadioCarManager *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_10000C350(v8);

}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  _TtC5Media15RadioCarManager *v5;

  v4 = a3;
  v5 = self;
  sub_10000C418();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Media15RadioCarManager_nowPlayingManager), a2);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Media15RadioCarManager_cancelSet));
}

@end
