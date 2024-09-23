@implementation DynamicHeightLabelView

- (_TtC16HealthArticlesUI22DynamicHeightLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI22DynamicHeightLabelView *)sub_1BC9608B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI22DynamicHeightLabelView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16HealthArticlesUI22DynamicHeightLabelView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_text);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes) = (Class)7;
  v5 = a3;

  result = (_TtC16HealthArticlesUI22DynamicHeightLabelView *)sub_1BC98028C();
  __break(1u);
  return result;
}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC16HealthArticlesUI22DynamicHeightLabelView *v2;

  v2 = self;
  sub_1BC960B6C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView____lazy_storage___label));
  swift_bridgeObjectRelease();
  sub_1BC961808(*(unint64_t *)((char *)&self->super.super.super.isa
                                    + OBJC_IVAR____TtC16HealthArticlesUI22DynamicHeightLabelView_attributes));
}

@end
