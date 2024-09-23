@implementation LinkableFooterView

- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView *)sub_100401C14(v3, v4);
}

- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  _TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView *result;
  uint64_t v15;

  v5 = type metadata accessor for FontUseCase(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView_linkedLabel;
  v10 = qword_1007F2740;
  v11 = a3;
  if (v10 != -1)
    swift_once(&qword_1007F2740, sub_1004170B4);
  v12 = sub_1000117A8(v5, (uint64_t)qword_100855AA8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  v13 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel(0));
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_100059FA0((uint64_t)v8, 0, 0, 0);

  result = (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/GenericAccountPageViewController.swift", 61, 2, 460, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView *v2;

  v2 = self;
  sub_100401FFC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView *v6;

  v5 = a3;
  v6 = self;
  sub_100402234((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D718LinkableFooterView_linkedLabel));
}

@end
