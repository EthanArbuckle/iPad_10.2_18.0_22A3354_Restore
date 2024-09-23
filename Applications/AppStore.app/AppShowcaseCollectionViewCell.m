@implementation AppShowcaseCollectionViewCell

- (_TtC8AppStore29AppShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29AppShowcaseCollectionViewCell *)sub_10012EE84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29AppShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC8AppStore29AppShowcaseCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_lockupView;
  v8 = objc_allocWithZone((Class)type metadata accessor for AppShowcaseLockupView(0));
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_videoView, 0);
  v10 = (char *)self + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_showcaseType;
  v11 = enum case for AppShowcaseType.large(_:);
  v12 = type metadata accessor for AppShowcaseType(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);

  result = (_TtC8AppStore29AppShowcaseCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/AppShowcaseCollectionViewCell.swift", 44, 2, 94, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC8AppStore29AppShowcaseCollectionViewCell *v2;

  v2 = self;
  sub_10012F448();

}

- (void)layoutSubviews
{
  _TtC8AppStore29AppShowcaseCollectionViewCell *v2;

  v2 = self;
  sub_10012F538();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_lockupView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_videoView);
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_showcaseType;
  v4 = type metadata accessor for AppShowcaseType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
