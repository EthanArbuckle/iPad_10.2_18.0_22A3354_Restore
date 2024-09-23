@implementation ClimateZonePositionView

- (_TtC7Climate23ClimateZonePositionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100066840();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateZonePositionView(0);
  v2 = v3.receiver;
  -[ClimateZonePositionView layoutSubviews](&v3, "layoutSubviews");
  sub_100064A60();

}

- (_TtC7Climate23ClimateZonePositionView)initWithFrame:(CGRect)a3
{
  _TtC7Climate23ClimateZonePositionView *result;

  result = (_TtC7Climate23ClimateZonePositionView *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateZonePositionView", 31, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  __n128 v4;
  uint64_t v5;

  sub_10003C604((uint64_t)self + OBJC_IVAR____TtC7Climate23ClimateZonePositionView_zone);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC7Climate23ClimateZonePositionView_activeZoneTracker));
  v3 = (char *)self + OBJC_IVAR____TtC7Climate23ClimateZonePositionView_layoutInfo;
  v5 = type metadata accessor for CAUVehicleLayoutInfo(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView_activeButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView_cancellables));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView_activeButtonConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView____lazy_storage___yConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView____lazy_storage___xConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView____lazy_storage___heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate23ClimateZonePositionView____lazy_storage___widthConstraint));
}

@end
