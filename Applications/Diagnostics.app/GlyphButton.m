@implementation GlyphButton

- (UILabel)buttonTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonTitleLabel));
}

- (_TtC11Diagnostics11GlyphButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100064E40();
}

- (void)handleTouchUpInside
{
  uint64_t v2;
  void (*v3)(_TtC11Diagnostics11GlyphButton *);
  _TtC11Diagnostics11GlyphButton *v4;

  v3 = *(void (**)(_TtC11Diagnostics11GlyphButton *))&self->imageAndLabelGapConstraint[OBJC_IVAR____TtC11Diagnostics11GlyphButton_action];
  v2 = *(_QWORD *)&self->imageAndLabelGap[OBJC_IVAR____TtC11Diagnostics11GlyphButton_action];
  v4 = self;
  swift_retain(v2);
  v3(v4);

  swift_release(v2);
}

- (_TtC11Diagnostics11GlyphButton)initWithFrame:(CGRect)a3
{
  _TtC11Diagnostics11GlyphButton *result;

  result = (_TtC11Diagnostics11GlyphButton *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.GlyphButton", 23, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonTopMarginConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_imageAndLabelGapConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonLabelColor));
  v3 = *(_QWORD *)&self->buttonWidthConstraint[OBJC_IVAR____TtC11Diagnostics11GlyphButton_action];
  v4 = *(void **)&self->buttonHeightConstraint[OBJC_IVAR____TtC11Diagnostics11GlyphButton_action];
  swift_release(*(_QWORD *)&self->imageAndLabelGap[OBJC_IVAR____TtC11Diagnostics11GlyphButton_action]);

  swift_bridgeObjectRelease(v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics11GlyphButton_buttonTitleLabel));
}

@end
