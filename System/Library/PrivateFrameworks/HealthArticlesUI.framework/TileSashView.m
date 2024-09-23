@implementation TileSashView

- (_TtC16HealthArticlesUI12TileSashView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI12TileSashView *)sub_1BC97ED0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI12TileSashView)initWithCoder:(id)a3
{
  return (_TtC16HealthArticlesUI12TileSashView *)sub_1BC97EF5C(a3);
}

- (void)layoutSubviews
{
  _TtC16HealthArticlesUI12TileSashView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  objc_super v11;

  v2 = self;
  -[TileSashView frame](v2, sel_frame);
  v4 = v3;
  -[TileSashView layoutMargins](v2, sel_layoutMargins);
  v6 = v5;
  -[TileSashView layoutMargins](v2, sel_layoutMargins);
  v8 = v4 - (v6 + v7);
  v9 = sub_1BC97EC00();
  objc_msgSend(v9, sel_setPreferredMaxLayoutWidth_, v8);

  v10 = sub_1BC97EC0C();
  objc_msgSend(v10, sel_setPreferredMaxLayoutWidth_, v8);

  v11.receiver = v2;
  v11.super_class = (Class)type metadata accessor for TileSashView();
  -[TileSashView layoutSubviews](&v11, sel_layoutSubviews);

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC16HealthArticlesUI12TileSashView *v2;

  v2 = self;
  sub_1BC97F208();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI12TileSashView____lazy_storage___descriptionLabel));
}

@end
