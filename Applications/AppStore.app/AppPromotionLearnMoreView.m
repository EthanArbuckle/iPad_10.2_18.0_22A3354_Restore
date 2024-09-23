@implementation AppPromotionLearnMoreView

- (_TtC8AppStore25AppPromotionLearnMoreView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100243C70();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStore25AppPromotionLearnMoreView *v3;

  v3 = self;
  sub_100243550((uint64_t)v3, v2);

}

- (_TtC8AppStore25AppPromotionLearnMoreView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore25AppPromotionLearnMoreView *result;

  result = (_TtC8AppStore25AppPromotionLearnMoreView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.AppPromotionLearnMoreView", 34, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25AppPromotionLearnMoreView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25AppPromotionLearnMoreView_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25AppPromotionLearnMoreView_learnMoreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25AppPromotionLearnMoreView_backButtonAction));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore25AppPromotionLearnMoreView_mediaOverlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
