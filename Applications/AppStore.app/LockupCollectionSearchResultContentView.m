@implementation LockupCollectionSearchResultContentView

- (_TtC8AppStore39LockupCollectionSearchResultContentView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore39LockupCollectionSearchResultContentView *result;

  sub_1001CB238(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC8AppStore39LockupCollectionSearchResultContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001CE8A0();
}

- (void)layoutSubviews
{
  _TtC8AppStore39LockupCollectionSearchResultContentView *v2;

  v2 = self;
  sub_1001CBEFC();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore39LockupCollectionSearchResultContentView *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1001CF050((uint64_t)v10);

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
  _TtC8AppStore39LockupCollectionSearchResultContentView *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1001CF2F4((uint64_t)v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_lockupDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_iconHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_titleHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_lockupCollectionView));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_impressionsCalculator);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_impressionsUpdateBlock), *(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_impressionsUpdateBlock]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_impressionsCoordinator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_impressionsScrollObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LockupCollectionSearchResultContentView_compoundScrollObserver));
}

@end
