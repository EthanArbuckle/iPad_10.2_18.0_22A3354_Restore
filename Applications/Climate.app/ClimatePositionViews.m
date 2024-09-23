@implementation ClimatePositionViews

- (_TtC7Climate20ClimatePositionViews)initWithCoder:(id)a3
{
  id v4;
  _TtC7Climate20ClimatePositionViews *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate20ClimatePositionViews_scale) = (Class)0x3FF0000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Climate20ClimatePositionViews____lazy_storage___heightConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Climate20ClimatePositionViews____lazy_storage___widthConstraint) = 0;
  v4 = a3;

  result = (_TtC7Climate20ClimatePositionViews *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010008BA30, "Climate/ClimatePositionViews.swift", 34, 2, 70, 0);
  __break(1u);
  return result;
}

- (_TtC7Climate20ClimatePositionViews)initWithFrame:(CGRect)a3
{
  _TtC7Climate20ClimatePositionViews *result;

  result = (_TtC7Climate20ClimatePositionViews *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimatePositionViews", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000AB60((uint64_t)self + OBJC_IVAR____TtC7Climate20ClimatePositionViews_climateSystem, type metadata accessor for ClimateSystemManager);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC7Climate20ClimatePositionViews_activeZoneTracker));
  sub_10000AB60((uint64_t)self + OBJC_IVAR____TtC7Climate20ClimatePositionViews_assets, type metadata accessor for ClimateAssets);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate20ClimatePositionViews_positions));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate20ClimatePositionViews____lazy_storage___heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate20ClimatePositionViews____lazy_storage___widthConstraint));
}

@end
