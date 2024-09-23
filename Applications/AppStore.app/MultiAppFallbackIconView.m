@implementation MultiAppFallbackIconView

- (_TtC8AppStore24MultiAppFallbackIconView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24MultiAppFallbackIconView *)sub_10018FA10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24MultiAppFallbackIconView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001905B0();
}

- (void)layoutSubviews
{
  _TtC8AppStore24MultiAppFallbackIconView *v2;

  v2 = self;
  sub_10018FC50();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore24MultiAppFallbackIconView *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[MultiAppFallbackIconView traitCollection](v5, "traitCollection");
  v7 = sub_10018FF7C((uint64_t)v6, width, height);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore24MultiAppFallbackIconView_iconViews));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore24MultiAppFallbackIconView_iconReusePool;
  v4 = sub_10007B804(&qword_1008318F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore24MultiAppFallbackIconView_configuration));
}

@end
