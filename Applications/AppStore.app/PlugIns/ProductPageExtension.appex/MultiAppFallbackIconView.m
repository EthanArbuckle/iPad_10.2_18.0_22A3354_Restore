@implementation MultiAppFallbackIconView

- (_TtC20ProductPageExtension24MultiAppFallbackIconView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension24MultiAppFallbackIconView *)sub_10014ED84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension24MultiAppFallbackIconView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10014F91C();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension24MultiAppFallbackIconView *v2;

  v2 = self;
  sub_10014EFC4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension24MultiAppFallbackIconView *v5;
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
  v7 = sub_10014F2F0((uint64_t)v6, width, height);
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
                                     + OBJC_IVAR____TtC20ProductPageExtension24MultiAppFallbackIconView_iconViews));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension24MultiAppFallbackIconView_iconReusePool;
  v4 = sub_10000DAF8((uint64_t *)&unk_100811760);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

@end
