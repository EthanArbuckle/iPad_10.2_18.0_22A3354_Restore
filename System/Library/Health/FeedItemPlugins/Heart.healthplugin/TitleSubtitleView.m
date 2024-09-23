@implementation TitleSubtitleView

- (_TtC5Heart17TitleSubtitleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC5Heart17TitleSubtitleView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___subtitleLabel) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC5Heart17TitleSubtitleView_item;
  v9 = (objc_class *)type metadata accessor for TitleSubtitleView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[TitleSubtitleView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_23138516C();

  return v10;
}

- (_TtC5Heart17TitleSubtitleView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC5Heart17TitleSubtitleView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___subtitleLabel) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC5Heart17TitleSubtitleView_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC5Heart17TitleSubtitleView *)sub_231414EE4();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart17TitleSubtitleView____lazy_storage___subtitleLabel));
  sub_2312D1D70((uint64_t)self + OBJC_IVAR____TtC5Heart17TitleSubtitleView_item);
}

@end
