@implementation TitleOptionalDetailsView

- (_TtC5Heart24TitleOptionalDetailsView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC5Heart24TitleOptionalDetailsView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart24TitleOptionalDetailsView_details);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart24TitleOptionalDetailsView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart24TitleOptionalDetailsView____lazy_storage___detailLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart24TitleOptionalDetailsView____lazy_storage___noDetailsConstraints) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart24TitleOptionalDetailsView____lazy_storage___detailsConstraints) = 0;
  v5 = a3;

  result = (_TtC5Heart24TitleOptionalDetailsView *)sub_231414EE4();
  __break(1u);
  return result;
}

- (_TtC5Heart24TitleOptionalDetailsView)initWithFrame:(CGRect)a3
{
  _TtC5Heart24TitleOptionalDetailsView *result;

  result = (_TtC5Heart24TitleOptionalDetailsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart24TitleOptionalDetailsView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart24TitleOptionalDetailsView____lazy_storage___detailLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
