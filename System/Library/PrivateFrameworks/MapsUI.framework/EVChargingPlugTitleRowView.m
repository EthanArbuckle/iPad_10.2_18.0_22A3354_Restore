@implementation EVChargingPlugTitleRowView

- (_TtC6MapsUI26EVChargingPlugTitleRowView)initWithCoder:(id)a3
{
  id v4;
  _TtC6MapsUI26EVChargingPlugTitleRowView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI26EVChargingPlugTitleRowView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI26EVChargingPlugTitleRowView____lazy_storage___iconView) = 0;
  v4 = a3;

  result = (_TtC6MapsUI26EVChargingPlugTitleRowView *)sub_191EEB2C0();
  __break(1u);
  return result;
}

- (_TtC6MapsUI26EVChargingPlugTitleRowView)initWithFrame:(CGRect)a3
{
  sub_191DCCF08();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI26EVChargingPlugTitleRowView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI26EVChargingPlugTitleRowView____lazy_storage___iconView));
}

@end
