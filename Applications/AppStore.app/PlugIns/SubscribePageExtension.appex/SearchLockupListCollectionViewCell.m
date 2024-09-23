@implementation SearchLockupListCollectionViewCell

- (_TtC22SubscribePageExtension34SearchLockupListCollectionViewCell)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension34SearchLockupListCollectionViewCell *result;

  sub_100378EFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC22SubscribePageExtension34SearchLockupListCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10037B064();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension34SearchLockupListCollectionViewCell *v2;

  v2 = self;
  sub_100379B90();

}

- (void)prepareForReuse
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SearchLockupListCollectionViewCell();
  v2 = (char *)v5.receiver;
  -[SearchLockupListCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_impressionsCoordinator];
  if (v3)
  {
    swift_retain(*(_QWORD *)&v2[OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_impressionsCoordinator]);
    dispatch thunk of NestedCollectionViewImpressionsCoordinator.prepareForReuse()(v4);

    swift_release(v3);
  }
  else
  {
    __break(1u);
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC22SubscribePageExtension34SearchLockupListCollectionViewCell *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10037B784((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC22SubscribePageExtension34SearchLockupListCollectionViewCell *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10037BA28((uint64_t)v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_lockupDataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_iconHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_titleHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_lockupCollectionView));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_impressionsCalculator);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->lockupDataSource[OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_impressionsUpdateBlock]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_impressionsCoordinator));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_impressionsScrollObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_compoundScrollObserver));
}

@end
