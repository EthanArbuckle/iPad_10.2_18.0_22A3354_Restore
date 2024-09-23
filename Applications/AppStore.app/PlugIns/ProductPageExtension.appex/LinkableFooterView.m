@implementation LinkableFooterView

- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView)initWithReuseIdentifier:(id)a3
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
  return (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView *)sub_100373BF8(v3, v4);
}

- (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView)initWithCoder:(id)a3
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
  _TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView *result;
  uint64_t v15;

  v5 = type metadata accessor for FontUseCase(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView_linkedLabel;
  v10 = qword_1008065B0;
  v11 = a3;
  if (v10 != -1)
    swift_once(&qword_1008065B0, sub_1004C9698);
  v12 = sub_10000EFC4(v5, (uint64_t)qword_10086A1E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  v13 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel(0));
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_10043D680((uint64_t)v8, 0, 0, 0);

  result = (_TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/GenericAccountPageViewController.swift", 59, 2, 460, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView *v2;

  v2 = self;
  sub_100373FE0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView *v6;

  v5 = a3;
  v6 = self;
  sub_100374218((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_03F67F16EB9B4C87DFA8E646A61E036118LinkableFooterView_linkedLabel));
}

@end
