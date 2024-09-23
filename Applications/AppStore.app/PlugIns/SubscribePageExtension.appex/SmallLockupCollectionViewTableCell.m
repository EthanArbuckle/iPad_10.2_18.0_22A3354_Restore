@implementation SmallLockupCollectionViewTableCell

- (_TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell *)sub_1003FE03C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell_lockupView;
  v6 = type metadata accessor for SmallLockupView(0);
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(_QWORD *)&self->UICollectionViewTableCell_opaque[v5] = objc_msgSend(v7, "init");

  result = (_TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/SmallLockupCollectionViewTableCell.swift", 63, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell *v2;

  v2 = self;
  sub_1003FE268();

}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC22SubscribePageExtension34SmallLockupCollectionViewTableCell_lockupView];
}

- (void).cxx_destruct
{

}

@end
