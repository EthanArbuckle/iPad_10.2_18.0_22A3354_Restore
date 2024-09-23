@implementation AirDropSystemApertureProgressView

- (CGSize)intrinsicContentSize
{
  double *v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_overrideIntrinsicContentSize);
  if ((self->progress[OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_overrideIntrinsicContentSize] & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for AirDropSystemApertureProgressView();
    -[AirDropSystemApertureProgressView intrinsicContentSize](&v5, "intrinsicContentSize");
  }
  else
  {
    v3 = *v2;
    v4 = v2[1];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9AirDropUI33AirDropSystemApertureProgressView)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC9AirDropUI33AirDropSystemApertureProgressView *result;

  v5 = OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_progress;
  v6 = (void *)objc_opt_self(NSProgress);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "progressWithTotalUnitCount:", 1000);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_cancelAction) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_isTouchingDownButton) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_didPostAccessibilityLayoutChangeNotification) = 0;

  result = (_TtC9AirDropUI33AirDropSystemApertureProgressView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000F05A0, "AirDropUI/AirDropSystemApertureProgressView.swift", 49, 2, 134, 0);
  __break(1u);
  return result;
}

- (void)touchedDownCancelButton
{
  _TtC9AirDropUI33AirDropSystemApertureProgressView *v2;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_isTouchingDownButton) = 1;
  v2 = self;
  sub_1000DCBAC();

}

- (void)touchedUpCancelButton
{
  _TtC9AirDropUI33AirDropSystemApertureProgressView *v2;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_isTouchingDownButton) = 0;
  v2 = self;
  sub_1000DCBAC();

}

- (_TtC9AirDropUI33AirDropSystemApertureProgressView)init
{
  _TtC9AirDropUI33AirDropSystemApertureProgressView *result;

  result = (_TtC9AirDropUI33AirDropSystemApertureProgressView *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.AirDropSystemApertureProgressView", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_progress));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_cancelAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_progressMicaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_transparentCancelButton));
}

@end
