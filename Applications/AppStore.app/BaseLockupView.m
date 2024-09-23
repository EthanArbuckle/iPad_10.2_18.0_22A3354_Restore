@implementation BaseLockupView

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore14BaseLockupView *v6;

  v5 = a3;
  v6 = self;
  sub_10003DACC(a3);

}

- (_TtC8AppStore14BaseLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore14BaseLockupView *)sub_10006014C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore14BaseLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10009F464();
}

- (void)dealloc
{
  _TtC8AppStore14BaseLockupView *v2;

  v2 = self;
  sub_10009E95C();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore14BaseLockupView_tertiaryTitleLabel));

  sub_1000608D4((uint64_t)self + OBJC_IVAR____TtC8AppStore14BaseLockupView_offerLabelPresenter);
  swift_bridgeObjectRelease(*(_QWORD *)&self->artworkView[OBJC_IVAR____TtC8AppStore14BaseLockupView_title]);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore14BaseLockupView_stateMachine));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityOrdinalLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore14BaseLockupView_ordinalLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore14BaseLockupView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore14BaseLockupView_subtitleLabel));
}

- (_TtC8AppStore11OfferButton)accessibilityOfferButton
{
  return (_TtC8AppStore11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore14BaseLockupView_offerButton));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTertiaryTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore14BaseLockupView_tertiaryTitleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore14BaseLockupView_headingLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityOfferLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore14BaseLockupView_offerLabel));
}

@end
