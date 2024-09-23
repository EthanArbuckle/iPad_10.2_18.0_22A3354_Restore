@implementation CondensedAppEventCardView

- (_TtC8AppStore25CondensedAppEventCardView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore25CondensedAppEventCardView *)sub_1004D9B00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore25CondensedAppEventCardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004DC6C0();
}

- (void)dealloc
{
  void *v2;
  _TtC8AppStore25CondensedAppEventCardView *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventTapGestureRecognizer);
  v3 = self;
  objc_msgSend(v2, "removeTarget:action:", v3, 0);
  objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_viewButton), "removeTarget:action:forControlEvents:", v3, "handleTapWithGestureRecognizer:", 0xFFFFFFFFLL);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CondensedAppEventCardView();
  -[CondensedAppEventCardView dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventFormattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_viewButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventTapGestureRecognizer));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventViewTappedAction), *(_QWORD *)&self->appEventFormattedDateView[OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventViewTappedAction]);
}

- (void)layoutSubviews
{
  _TtC8AppStore25CondensedAppEventCardView *v2;

  v2 = self;
  sub_1004DA2D4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore25CondensedAppEventCardView *v6;

  v5 = a3;
  v6 = self;
  sub_1004DB0F8(a3);

}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC8AppStore25CondensedAppEventCardView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventViewTappedAction);
  if (v3)
  {
    v5 = *(_QWORD *)&self->appEventFormattedDateView[OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventViewTappedAction];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityAppPromotionFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_appEventFormattedDateView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore25CondensedAppEventCardView_titleLabel));
}

@end
