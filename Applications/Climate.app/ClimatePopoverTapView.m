@implementation ClimatePopoverTapView

- (_TtC7Climate21ClimatePopoverTapView)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate21ClimatePopoverTapView_tapHandler);
  v4 = (objc_class *)type metadata accessor for ClimatePopoverTapView();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[ClimatePopoverTapView initWithFrame:](&v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (_TtC7Climate21ClimatePopoverTapView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC7Climate21ClimatePopoverTapView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate21ClimatePopoverTapView_tapHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC7Climate21ClimatePopoverTapView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010008BA30, "Climate/ClimateQuickActionPopover.swift", 39, 2, 300, 0);
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void (*v4)(_QWORD);
  uint64_t v6;
  id v7;
  _TtC7Climate21ClimatePopoverTapView *v8;

  v4 = *(void (**)(_QWORD))((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate21ClimatePopoverTapView_tapHandler);
  if (v4)
  {
    v6 = *(_QWORD *)&self->tapHandler[OBJC_IVAR____TtC7Climate21ClimatePopoverTapView_tapHandler];
    v7 = a4;
    v8 = self;
    sub_10001BDD0((uint64_t)v4, v6);
    v4(0);
    sub_100005118((uint64_t)v4, v6);

  }
  return 0;
}

- (_TtC7Climate21ClimatePopoverTapView)initWithFrame:(CGRect)a3
{
  _TtC7Climate21ClimatePopoverTapView *result;

  result = (_TtC7Climate21ClimatePopoverTapView *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimatePopoverTapView", 29, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005118(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Climate21ClimatePopoverTapView_tapHandler), *(_QWORD *)&self->tapHandler[OBJC_IVAR____TtC7Climate21ClimatePopoverTapView_tapHandler]);
}

@end
