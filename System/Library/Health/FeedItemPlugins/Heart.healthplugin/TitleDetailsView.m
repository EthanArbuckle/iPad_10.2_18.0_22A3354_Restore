@implementation TitleDetailsView

- (_TtC5Heart16TitleDetailsView)initWithCoder:(id)a3
{
  id v4;
  _TtC5Heart16TitleDetailsView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart16TitleDetailsView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart16TitleDetailsView____lazy_storage___detailLabel) = 0;
  v4 = a3;

  result = (_TtC5Heart16TitleDetailsView *)sub_231414EE4();
  __break(1u);
  return result;
}

- (_TtC5Heart16TitleDetailsView)initWithFrame:(CGRect)a3
{
  _TtC5Heart16TitleDetailsView *result;

  result = (_TtC5Heart16TitleDetailsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart16TitleDetailsView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart16TitleDetailsView____lazy_storage___detailLabel));
}

@end
