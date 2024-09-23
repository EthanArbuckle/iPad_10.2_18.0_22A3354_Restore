@implementation ClimateStepper

- (void)layoutSubviews
{
  _TtC7Climate14ClimateStepper *v2;

  v2 = self;
  ClimateStepper.layoutSubviews()();

}

- (void)longPressTriggered:(id)a3
{
  id v4;
  _TtC7Climate14ClimateStepper *v5;

  v4 = a3;
  v5 = self;
  ClimateStepper.longPressTriggered(_:)(v4);

}

- (_TtC7Climate14ClimateStepper)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s7Climate0A7StepperC5coderACSgSo7NSCoderC_tcfc_0();
}

- (_TtC7Climate14ClimateStepper)initWithFrame:(CGRect)a3
{
  _TtC7Climate14ClimateStepper *result;

  result = (_TtC7Climate14ClimateStepper *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateStepper", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  sub_10001BF8C((uint64_t)self + OBJC_IVAR____TtC7Climate14ClimateStepper_popoverDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate14ClimateStepper_activeConstraints));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate14ClimateStepper_downColorConfig);
  v4 = *(void **)&self->range[OBJC_IVAR____TtC7Climate14ClimateStepper_downColorConfig];
  swift_bridgeObjectRelease(*(_QWORD *)&self->popoverDelegate[OBJC_IVAR____TtC7Climate14ClimateStepper_downColorConfig]);

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate14ClimateStepper_upColorConfig);
  v6 = *(void **)&self->range[OBJC_IVAR____TtC7Climate14ClimateStepper_upColorConfig];
  swift_bridgeObjectRelease(*(_QWORD *)&self->popoverDelegate[OBJC_IVAR____TtC7Climate14ClimateStepper_upColorConfig]);

  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate14ClimateStepper_colorConfig);
  v8 = *(void **)&self->range[OBJC_IVAR____TtC7Climate14ClimateStepper_colorConfig];
  swift_bridgeObjectRelease(*(_QWORD *)&self->popoverDelegate[OBJC_IVAR____TtC7Climate14ClimateStepper_colorConfig]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->range[OBJC_IVAR____TtC7Climate14ClimateStepper_accessibilityIdentifierModifier]);
}

@end
