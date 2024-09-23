@implementation BadgeView

- (_TtC22SubscribePageExtension9BadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension9BadgeView *)sub_1002F3FD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension9BadgeView)initWithCoder:(id)a3
{
  id v3;
  __n128 v4;

  v3 = a3;
  sub_1002F6C08(v4);
}

- (void)dealloc
{
  void *v3;
  _TtC22SubscribePageExtension9BadgeView *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for BadgeView(0);
  -[BadgeView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  __n128 v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __n128 v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_leadingValue;
  v4 = type metadata accessor for BadgeLeadingValue(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->caption[OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_caption]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_captionView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->caption[OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_heading]);
  v5 = swift_bridgeObjectRelease(*(_QWORD *)&self->caption[OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_valueText]);
  v6 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_captionCappingType;
  v7 = type metadata accessor for BadgeCaptionCappingType(0, v5);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_valueView));
  v8 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_valueViewAlignment;
  v9 = type metadata accessor for BadgeValueViewAlignment(0);
  v10.n128_f64[0] = (*(double (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v11 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_spacing;
  v12 = type metadata accessor for BadgeViewSpacing(0, v10);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_action, (uint64_t *)&unk_1008052E0);
  v13 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_badgeType;
  v14 = type metadata accessor for BadgeType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_headingLabel));
}

- (void)tintColorDidChange
{
  _TtC22SubscribePageExtension9BadgeView *v2;

  v2 = self;
  sub_1002F4D7C();

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BadgeView(0);
  v2 = v3.receiver;
  -[BadgeView _dynamicUserInterfaceTraitDidChange](&v3, "_dynamicUserInterfaceTraitDidChange");
  sub_1002F4EE8();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension9BadgeView *v2;

  v2 = self;
  sub_1002F54E4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  _TtC22SubscribePageExtension9BadgeView *v5;
  __n128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6.n128_f64[0] = width;
  v7 = sub_1002F5798(v6, height);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension9BadgeView *v6;

  v5 = a3;
  v6 = self;
  sub_1002F5A10((uint64_t)a3);

}

- (void)didTapBadgeView:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension9BadgeView *v5;

  v4 = a3;
  v5 = self;
  sub_1002F6EC8();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityValueLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_valueLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityCaptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_captionLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_headingLabel));
}

- (UIView)accessibilityValueView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC22SubscribePageExtension9BadgeView_valueView));
}

@end
