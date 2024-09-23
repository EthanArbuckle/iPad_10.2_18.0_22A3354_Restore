@implementation ArcadeHeaderView

- (_TtC20ProductPageExtension16ArcadeHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16ArcadeHeaderView *)sub_1000E6488(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension16ArcadeHeaderView *v2;

  v2 = self;
  sub_1000E6A74();

}

- (void)preferredContentSizeCategoryDidChange
{
  void *v2;
  _TtC20ProductPageExtension16ArcadeHeaderView *v3;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension15TitleHeaderView_titleLabel);
  v3 = self;
  -[ArcadeHeaderView addSubview:](v3, "addSubview:", v2);
  objc_msgSend(v2, "setNeedsLayout");
  objc_msgSend(v2, "layoutIfNeeded");
  objc_msgSend(v2, "removeFromSuperview");
  -[ArcadeHeaderView setNeedsLayout](v3, "setNeedsLayout");

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension16ArcadeHeaderView_effect;
  v4 = type metadata accessor for TitleEffect(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16ArcadeHeaderView_gradientLayer));
}

@end
