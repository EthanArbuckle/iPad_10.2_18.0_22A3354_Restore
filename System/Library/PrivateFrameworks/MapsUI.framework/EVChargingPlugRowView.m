@implementation EVChargingPlugRowView

- (_TtC6MapsUI21EVChargingPlugRowView)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  _TtC6MapsUI21EVChargingPlugRowView *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView_areLabelsArrangedVertically) = 0;
  v4 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView_horizontalArrangementConstraints) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView_verticalArrangementConstraints) = v4;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView____lazy_storage___leadingOrTopLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView____lazy_storage___trailingOrBottomLabel) = 0;
  v5 = a3;

  result = (_TtC6MapsUI21EVChargingPlugRowView *)sub_191EEB2C0();
  __break(1u);
  return result;
}

- (_TtC6MapsUI21EVChargingPlugRowView)initWithFrame:(CGRect)a3
{
  sub_191DCCF08();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView_leadingText;
  v4 = sub_191EEAB40();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView_trailingText));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView____lazy_storage___leadingOrTopLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI21EVChargingPlugRowView____lazy_storage___trailingOrBottomLabel));
}

@end
