@implementation SmallLockupCollectionViewTableCell

- (_TtC8AppStore34SmallLockupCollectionViewTableCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34SmallLockupCollectionViewTableCell *)sub_100409C18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34SmallLockupCollectionViewTableCell)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC8AppStore34SmallLockupCollectionViewTableCell *result;

  v5 = OBJC_IVAR____TtC8AppStore34SmallLockupCollectionViewTableCell_lockupView;
  v6 = type metadata accessor for SmallLockupView(0);
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(_QWORD *)&self->UICollectionViewTableCell_opaque[v5] = objc_msgSend(v7, "init");

  result = (_TtC8AppStore34SmallLockupCollectionViewTableCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/SmallLockupCollectionViewTableCell.swift", 49, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore34SmallLockupCollectionViewTableCell *v2;

  v2 = self;
  sub_100409E44();

}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC8AppStore34SmallLockupCollectionViewTableCell_lockupView];
}

- (void).cxx_destruct
{

}

@end
