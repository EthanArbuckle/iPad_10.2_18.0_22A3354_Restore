@implementation ArcadeLockupView

- (_TtC22SubscribePageExtension16ArcadeLockupView)initWithFrame:(CGRect)a3
{
  uint64_t v4;
  _OWORD *v5;
  _QWORD *v6;
  _TtC22SubscribePageExtension16ArcadeLockupView *result;

  v4 = OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButton;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for OfferButton()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerLabelPresenter);
  *v5 = 0u;
  v5[1] = 0u;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButtonTapHandler);
  *v6 = 0;
  v6[1] = 0;

  result = (_TtC22SubscribePageExtension16ArcadeLockupView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000042, 0x80000001006498D0, "SubscribePageExtension/ArcadeLockupView.swift", 45, 2, 62, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension16ArcadeLockupView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _OWORD *v8;
  _QWORD *v9;
  _TtC22SubscribePageExtension16ArcadeLockupView *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButton;
  v6 = objc_allocWithZone((Class)type metadata accessor for OfferButton());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerLabelPresenter);
  *v8 = 0u;
  v8[1] = 0u;
  v9 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButtonTapHandler);
  *v9 = 0;
  v9[1] = 0;

  result = (_TtC22SubscribePageExtension16ArcadeLockupView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ArcadeLockupView.swift", 45, 2, 66, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC22SubscribePageExtension16ArcadeLockupView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1003E495C();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension16ArcadeLockupView *v2;

  v2 = self;
  sub_1003E4B90();

}

- (void)offerButtonWasTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC22SubscribePageExtension16ArcadeLockupView *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButtonTapHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->wordmarkView[OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButtonTapHandler];
    v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButton);
    v5 = self;
    sub_100019320((uint64_t)v2, v3);
    v2(v4);
    sub_100019310((uint64_t)v2, v3);

  }
}

- (NSString)accessibilityIdentifier
{
  uint64_t ObjectType;
  objc_class *ObjCClassFromMetadata;
  _TtC22SubscribePageExtension16ArcadeLockupView *v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;

  ObjectType = swift_getObjectType();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(ObjectType);
  v5 = self;
  v6 = NSStringFromClass(ObjCClassFromMetadata);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v9 = v8;

  sub_10037079C(v7, v9, 0, 0);
  v11 = v10;

  swift_bridgeObjectRelease(v9);
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  return (NSString *)v12;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC22SubscribePageExtension16ArcadeLockupView *v6;
  NSString v7;
  _TtC22SubscribePageExtension16ArcadeLockupView *v8;
  objc_super v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ArcadeLockupView(0);
  -[ArcadeLockupView setAccessibilityIdentifier:](&v9, "setAccessibilityIdentifier:", v7);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_subtitleLabel));
}

- (_TtC22SubscribePageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC22SubscribePageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButton));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButton));
  sub_1000131E0((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerLabelPresenter);
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_metrics;
  v4 = type metadata accessor for ArcadeLockupLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButtonTapHandler), *(_QWORD *)&self->wordmarkView[OBJC_IVAR____TtC22SubscribePageExtension16ArcadeLockupView_offerButtonTapHandler]);
}

@end
