@implementation NumberedTextView

- (_TtC5Heart16NumberedTextView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC5Heart16NumberedTextView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart16NumberedTextView_title);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart16NumberedTextView____lazy_storage___numberBubbleView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart16NumberedTextView____lazy_storage___numberLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart16NumberedTextView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart16NumberedTextView____lazy_storage___detailLabel) = 0;
  v5 = a3;

  result = (_TtC5Heart16NumberedTextView *)sub_231414EE4();
  __break(1u);
  return result;
}

- (_TtC5Heart16NumberedTextView)initWithFrame:(CGRect)a3
{
  _TtC5Heart16NumberedTextView *result;

  result = (_TtC5Heart16NumberedTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart16NumberedTextView____lazy_storage___numberBubbleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart16NumberedTextView____lazy_storage___numberLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart16NumberedTextView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart16NumberedTextView____lazy_storage___detailLabel));
}

@end
