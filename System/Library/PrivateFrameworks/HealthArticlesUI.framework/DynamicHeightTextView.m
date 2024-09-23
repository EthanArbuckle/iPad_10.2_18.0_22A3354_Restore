@implementation DynamicHeightTextView

- (_TtC16HealthArticlesUI21DynamicHeightTextView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI21DynamicHeightTextView *)sub_1BC971CA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI21DynamicHeightTextView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16HealthArticlesUI21DynamicHeightTextView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView____lazy_storage___textView) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_text);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes) = (Class)7;
  v5 = a3;

  result = (_TtC16HealthArticlesUI21DynamicHeightTextView *)sub_1BC98028C();
  __break(1u);
  return result;
}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC16HealthArticlesUI21DynamicHeightTextView *v2;

  v2 = self;
  sub_1BC971934();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView____lazy_storage___textView));
  swift_bridgeObjectRelease();
  sub_1BC961808(*(unint64_t *)((char *)&self->super.super.super.isa
                                    + OBJC_IVAR____TtC16HealthArticlesUI21DynamicHeightTextView_attributes));
}

@end
