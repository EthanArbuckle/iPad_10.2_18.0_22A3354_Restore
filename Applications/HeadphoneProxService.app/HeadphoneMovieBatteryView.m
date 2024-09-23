@implementation HeadphoneMovieBatteryView

- (_TtC20HeadphoneProxService25HeadphoneMovieBatteryView)initWithCoder:(id)a3
{
  id v4;
  _TtC20HeadphoneProxService25HeadphoneMovieBatteryView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneMovieBatteryView_batteryType) = 3;
  v4 = a3;

  result = (_TtC20HeadphoneProxService25HeadphoneMovieBatteryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010008BD10, "HeadphoneProxService/HeadphoneMovieBatteryView.swift", 52, 2, 81, 0);
  __break(1u);
  return result;
}

- (_TtC20HeadphoneProxService25HeadphoneMovieBatteryView)initWithFrame:(CGRect)a3
{
  _TtC20HeadphoneProxService25HeadphoneMovieBatteryView *result;

  result = (_TtC20HeadphoneProxService25HeadphoneMovieBatteryView *)_swift_stdlib_reportUnimplementedInitializer("HeadphoneProxService.HeadphoneMovieBatteryView", 46, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneMovieBatteryView_batteryViews));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneMovieBatteryView_videoView));
}

@end
