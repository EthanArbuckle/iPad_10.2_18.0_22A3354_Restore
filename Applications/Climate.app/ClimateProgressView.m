@implementation ClimateProgressView

- (_TtC7Climate19ClimateProgressView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000229F8();
}

- (_TtC7Climate19ClimateProgressView)initWithFrame:(CGRect)a3
{
  _TtC7Climate19ClimateProgressView *result;

  result = (_TtC7Climate19ClimateProgressView *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateProgressView", 27, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Climate19ClimateProgressView_progressColorConfig);
  v4 = *(void **)&self->currentValue[OBJC_IVAR____TtC7Climate19ClimateProgressView_progressColorConfig];
  v5 = *(void **)&self->contentView[OBJC_IVAR____TtC7Climate19ClimateProgressView_progressColorConfig + 4];
  swift_bridgeObjectRelease(*(_QWORD *)&self->range[OBJC_IVAR____TtC7Climate19ClimateProgressView_progressColorConfig
                                                  + 4]);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate19ClimateProgressView_centerSymbolYConstraint));
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end
