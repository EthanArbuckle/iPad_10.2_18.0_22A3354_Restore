@implementation HeadphoneBatteryContainer

- (void)updateConstraints
{
  uint64_t v2;
  _TtC20HeadphoneProxService25HeadphoneBatteryContainer *v3;

  v3 = self;
  sub_10006C9AC((uint64_t)v3, v2);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20HeadphoneProxService25HeadphoneBatteryContainer *v6;

  v5 = a3;
  v6 = self;
  sub_10006D828((uint64_t)a3, (uint64_t)v6);

}

- (_TtC20HeadphoneProxService25HeadphoneBatteryContainer)initWithFrame:(CGRect)a3
{
  return (_TtC20HeadphoneProxService25HeadphoneBatteryContainer *)sub_10006D9CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC20HeadphoneProxService25HeadphoneBatteryContainer)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC20HeadphoneProxService25HeadphoneBatteryContainer *)sub_10006DB20(v3, v4);
}

- (void).cxx_destruct
{
  uint64_t v3[27];

  sub_10001B808((uint64_t)self + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneBatteryContainer_layoutMetrics, (uint64_t)v3);
  sub_10001B8AC(v3);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneBatteryContainer_arrangedSubviews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneBatteryContainer_arrangedConstraints));
}

@end
