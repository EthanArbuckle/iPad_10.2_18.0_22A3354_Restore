@implementation AppShowcaseCollectionViewCell

- (_TtC22SubscribePageExtension29AppShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29AppShowcaseCollectionViewCell *)sub_1003E0308(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29AppShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC22SubscribePageExtension29AppShowcaseCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension29AppShowcaseCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = OBJC_IVAR____TtC22SubscribePageExtension29AppShowcaseCollectionViewCell_lockupView;
  v8 = objc_allocWithZone((Class)type metadata accessor for AppShowcaseLockupView(0));
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC22SubscribePageExtension29AppShowcaseCollectionViewCell_videoView);
  v10 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension29AppShowcaseCollectionViewCell_showcaseType;
  v11 = enum case for AppShowcaseType.large(_:);
  v12 = type metadata accessor for AppShowcaseType(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);

  result = (_TtC22SubscribePageExtension29AppShowcaseCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/AppShowcaseCollectionViewCell.swift", 58, 2, 94, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension29AppShowcaseCollectionViewCell *v2;

  v2 = self;
  sub_1003E07FC();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension29AppShowcaseCollectionViewCell *v2;

  v2 = self;
  sub_1003E08EC();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension29AppShowcaseCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppShowcaseCollectionViewCell_lockupView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension29AppShowcaseCollectionViewCell_videoView);
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension29AppShowcaseCollectionViewCell_showcaseType;
  v4 = type metadata accessor for AppShowcaseType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
