@implementation LinkableFooterView

- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView)initWithReuseIdentifier:(id)a3
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
  return (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView *)sub_100521434(v3, v4);
}

- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView)initWithCoder:(id)a3
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
  _TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView *result;
  uint64_t v15;

  v5 = type metadata accessor for FontUseCase(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView_linkedLabel;
  v10 = qword_100828278;
  v11 = a3;
  if (v10 != -1)
    swift_once(&qword_100828278, sub_1003A770C);
  v12 = sub_10007AF70(v5, (uint64_t)qword_10088E198);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  v13 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel(0));
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_1002B1698((uint64_t)v8, 0, 0, 0);

  result = (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/GenericAccountPageViewController.swift", 47, 2, 460, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView *v2;

  v2 = self;
  sub_10052181C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView *v6;

  v5 = a3;
  v6 = self;
  sub_100521A54((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B118LinkableFooterView_linkedLabel));
}

@end
