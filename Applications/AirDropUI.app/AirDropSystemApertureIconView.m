@implementation AirDropSystemApertureIconView

- (CGSize)intrinsicContentSize
{
  double *v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_overrideIntrinsicContentSize);
  if ((self->progress[OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_overrideIntrinsicContentSize] & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for AirDropSystemApertureIconView(0);
    -[AirDropSystemApertureIconView intrinsicContentSize](&v5, "intrinsicContentSize");
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

- (_TtC9AirDropUI29AirDropSystemApertureIconView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC9AirDropUI29AirDropSystemApertureIconView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_progress) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_transferState;
  v6 = enum case for SFAirDropReceive.Transfer.State.created(_:);
  v7 = type metadata accessor for SFAirDropReceive.Transfer.State(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_thumbnailImage) = 0;
  v8 = a3;

  result = (_TtC9AirDropUI29AirDropSystemApertureIconView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000F05A0, "AirDropUI/AirDropUISystemApertureIconView.swift", 47, 2, 97, 0);
  __break(1u);
  return result;
}

- (_TtC9AirDropUI29AirDropSystemApertureIconView)init
{
  _TtC9AirDropUI29AirDropSystemApertureIconView *result;

  result = (_TtC9AirDropUI29AirDropSystemApertureIconView *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.AirDropSystemApertureIconView", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_transferState;
  v4 = type metadata accessor for SFAirDropReceive.Transfer.State(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_airDropMicaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_thumbnailImage));
}

@end
