@implementation AppEventCardView

- (_TtC20ProductPageExtension16AppEventCardView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16AppEventCardView *)sub_10011C120();
}

- (_TtC20ProductPageExtension16AppEventCardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10011CC80();
}

- (void)dealloc
{
  _TtC20ProductPageExtension16AppEventCardView *v2;
  uint64_t v3;

  v2 = self;
  sub_1001198D0((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_mediaContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_kindLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_notifyMeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupTapGestureRecognizer));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupViewTappedAction), *(_QWORD *)&self->shadowView[OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupViewTappedAction]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_videoView);
  swift_release();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension16AppEventCardView *v2;

  v2 = self;
  sub_10011A57C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _TtC20ProductPageExtension16AppEventCardView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = type metadata accessor for AppEventCardLayout(0);
  __chkstk_darwin(v6);
  v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = self;
  sub_10011AA04((uint64_t)v8);
  sub_1001ED7B0(v9, v8, width, height);
  v11 = v10;
  v13 = v12;
  sub_100020684((uint64_t)v8);

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC20ProductPageExtension16AppEventCardView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupViewTappedAction);
  if (v3)
  {
    v5 = *(_QWORD *)&self->shadowView[OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupViewTappedAction];
    v6 = a3;
    v8 = self;
    v7 = sub_100018918((uint64_t)v3, v5);
    v3(v7);
    sub_100018908((uint64_t)v3, v5);

  }
}

- (void)notifyMeButtonTapped:(id)a3
{
  uint64_t v3;
  id v5;
  _TtC20ProductPageExtension16AppEventCardView *v6;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_notifyMeButtonPresenter);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    swift_retain(v3);
    NotifyMeButtonPresenter.didTapButton(sender:)((UIButton)v5);

    swift_release();
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
  _TtC20ProductPageExtension16AppEventCardView *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10011CD6C(v7);

  return v9;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_kindLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_subtitleLabel));
}

- (_TtC20ProductPageExtension14NotifyMeButton)accessibilityNotifyMeButton
{
  return (_TtC20ProductPageExtension14NotifyMeButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                               + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_notifyMeButton));
}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupView));
}

@end
