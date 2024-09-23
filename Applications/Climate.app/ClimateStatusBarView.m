@implementation ClimateStatusBarView

- (_TtC7Climate20ClimateStatusBarView)initWithCoder:(id)a3
{
  id v4;
  _TtC7Climate20ClimateStatusBarView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate20ClimateStatusBarView_temperatureIndicator) = 0;
  v4 = a3;

  result = (_TtC7Climate20ClimateStatusBarView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010008BA30, "Climate/ClimateStatusBarView.swift", 34, 2, 37, 0);
  __break(1u);
  return result;
}

- (_TtC7Climate20ClimateStatusBarView)initWithFrame:(CGRect)a3
{
  _TtC7Climate20ClimateStatusBarView *result;

  result = (_TtC7Climate20ClimateStatusBarView *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateStatusBarView", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003C604((uint64_t)self + OBJC_IVAR____TtC7Climate20ClimateStatusBarView_climateZone);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate20ClimateStatusBarView_temperatureIndicator));
}

@end
