@implementation AppPromotionCardView

- (_TtC22SubscribePageExtension20AppPromotionCardView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20AppPromotionCardView *)sub_1004DF064();
}

- (_TtC22SubscribePageExtension20AppPromotionCardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004DFEA4();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC22SubscribePageExtension20AppPromotionCardView *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupTapGestureRecognizer);
  if (v4)
    objc_msgSend(v4, "removeTarget:action:", self, 0);
  else
    v5 = self;
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[AppPromotionCardView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_mediaContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_artworkFallbackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_kindLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_subtitleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupTapGestureRecognizer));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupViewTappedAction), *(_QWORD *)&self->shadowView[OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupViewTappedAction]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_videoView);
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension20AppPromotionCardView *v2;

  v2 = self;
  sub_1004DDB60();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension20AppPromotionCardView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1004DCB1C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC22SubscribePageExtension20AppPromotionCardView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupViewTappedAction);
  if (v3)
  {
    v5 = *(_QWORD *)&self->shadowView[OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupViewTappedAction];
    v6 = a3;
    v8 = self;
    v7 = sub_100019320((uint64_t)v3, v5);
    v3(v7);
    sub_100019310((uint64_t)v3, v5);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v5;

  v5 = objc_opt_self(UIPanGestureRecognizer);
  return swift_dynamicCastObjCClass(a4, v5) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC22SubscribePageExtension20AppPromotionCardView *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1004DFFE8(v7);

  return v9;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_kindLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_subtitleView)
                                                                                        + qword_1008037C0));
}

- (_TtC22SubscribePageExtension22SubscriptionLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension22SubscriptionLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension20AppPromotionCardView_lockupView);
}

@end
