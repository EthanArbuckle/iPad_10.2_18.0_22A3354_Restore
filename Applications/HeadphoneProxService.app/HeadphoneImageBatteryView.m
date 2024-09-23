@implementation HeadphoneImageBatteryView

- (_TtC20HeadphoneProxService25HeadphoneImageBatteryView)initWithCoder:(id)a3
{
  id v4;
  _TtC20HeadphoneProxService25HeadphoneImageBatteryView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_stackView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_AXConstraints) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_nonAXConstraints) = (Class)&_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC20HeadphoneProxService25HeadphoneImageBatteryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010008BD10, "HeadphoneProxService/HeadphoneImageBatteryView.swift", 52, 2, 148, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20HeadphoneProxService25HeadphoneImageBatteryView *v6;

  v5 = a3;
  v6 = self;
  sub_10001CE3C(a3, (uint64_t)v6);

}

- (_TtC20HeadphoneProxService25HeadphoneImageBatteryView)initWithFrame:(CGRect)a3
{
  sub_10001D140((__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height, (uint64_t)self, (uint64_t)a2, (uint64_t)"HeadphoneProxService.HeadphoneImageBatteryView", 46);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_batteryView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_imageViews));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_stackView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_AXConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_nonAXConstraints));
}

@end
