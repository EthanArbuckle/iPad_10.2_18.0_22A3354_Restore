@implementation RPSessionAccessoryView

- (_TtC14ReplayKitAngel22RPSessionAccessoryView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC14ReplayKitAngel22RPSessionAccessoryView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState);
  v5 = a3;
  v6 = sub_10002320C();
  v8 = *(_QWORD *)v6;
  v7 = *((_QWORD *)v6 + 1);
  *v4 = v8;
  v4[1] = v7;
  swift_bridgeObjectRetain(v7);

  result = (_TtC14ReplayKitAngel22RPSessionAccessoryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "ReplayKitAngel/RPSystemApertureElementViewController.swift", 58, 2, 54, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC14ReplayKitAngel22RPSessionAccessoryView *v2;

  v2 = self;
  sub_10000925C();

}

- (CGSize)intrinsicContentSize
{
  _TtC14ReplayKitAngel22RPSessionAccessoryView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_1000096C0();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC14ReplayKitAngel22RPSessionAccessoryView)initWithFrame:(CGRect)a3
{
  _TtC14ReplayKitAngel22RPSessionAccessoryView *result;

  result = (_TtC14ReplayKitAngel22RPSessionAccessoryView *)_swift_stdlib_reportUnimplementedInitializer("ReplayKitAngel.RPSessionAccessoryView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package));
  swift_bridgeObjectRelease(*(_QWORD *)&self->role[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState]);
}

@end
