@implementation AttributionViewWrapperView

- (_TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView)initWithCoder:(id)a3
{
  _TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView *result;

  result = (_TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v6;
  _TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView_attributionView);
  swift_getObjectType();
  v7 = self;
  sub_1BA0BE0FC();
  objc_msgSend(v6, sel_bounds);
  v9 = v8;

  if (v9 > height)
    v10 = v9;
  else
    v10 = height;
  v11 = width;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  _TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView *v2;

  v2 = self;
  sub_1B9F3755C();

}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  id v10;
  _TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView *v11;
  id v12;
  objc_super v13;

  v5 = sub_1BA0BE360();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for AttributionViewWrapperView();
  v13.receiver = self;
  v13.super_class = v9;
  v10 = a3;
  v11 = self;
  -[AttributionViewWrapperView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v10);
  v12 = -[AttributionViewWrapperView traitCollection](v11, sel_traitCollection);
  sub_1B9F37780(v12, (uint64_t)v8);

  swift_getObjectType();
  sub_1BA0BE108();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (BOOL)attributionViewShouldDisableHackForNewsLayout
{
  return 1;
}

- (_TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView)initWithFrame:(CGRect)a3
{
  _TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView *result;

  result = (_TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView_attributionView));
  v3 = (char *)self
     + OBJC_IVAR____TtC12NewsArticlesP33_AB2C07DEED72E6BCD424DDADA40C3A3026AttributionViewWrapperView_navigationItemStyle;
  v4 = sub_1BA0BB600();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
