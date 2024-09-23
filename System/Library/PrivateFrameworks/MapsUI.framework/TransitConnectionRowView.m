@implementation TransitConnectionRowView

- (_TtC6MapsUI24TransitConnectionRowView)initWithCoder:(id)a3
{
  id v4;
  _TtC6MapsUI24TransitConnectionRowView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI24TransitConnectionRowView_infoPlatterSizeLayout) = 0;
  v4 = a3;

  result = (_TtC6MapsUI24TransitConnectionRowView *)sub_191EEB2C0();
  __break(1u);
  return result;
}

- (_TtC6MapsUI24TransitConnectionRowView)initWithFrame:(CGRect)a3
{
  _TtC6MapsUI24TransitConnectionRowView *result;

  result = (_TtC6MapsUI24TransitConnectionRowView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI24TransitConnectionRowView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI24TransitConnectionRowView_headsignLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI24TransitConnectionRowView_infoPlatterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI24TransitConnectionRowView_infoPlatterSizeLayout));
}

@end
