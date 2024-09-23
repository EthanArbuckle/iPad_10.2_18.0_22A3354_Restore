@implementation AppPromotionLearnMoreView

- (_TtC22SubscribePageExtension25AppPromotionLearnMoreView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005AB448();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension25AppPromotionLearnMoreView *v2;

  v2 = self;
  sub_1005AAD28();

}

- (_TtC22SubscribePageExtension25AppPromotionLearnMoreView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension25AppPromotionLearnMoreView *result;

  result = (_TtC22SubscribePageExtension25AppPromotionLearnMoreView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.AppPromotionLearnMoreView", 48, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension25AppPromotionLearnMoreView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension25AppPromotionLearnMoreView_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension25AppPromotionLearnMoreView_learnMoreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension25AppPromotionLearnMoreView_backButtonAction));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension25AppPromotionLearnMoreView_mediaOverlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
