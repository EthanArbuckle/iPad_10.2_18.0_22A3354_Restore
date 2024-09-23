@implementation SearchHintsCollectionViewDelegate

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC8AppStore33SearchHintsCollectionViewDelegate *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_10041D94C();
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8AppStore33SearchHintsCollectionViewDelegate *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10041DBDC(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v3;
  id v5;
  _TtC8AppStore33SearchHintsCollectionViewDelegate *v6;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8AppStore33SearchHintsCollectionViewDelegate_impressionsCalculator);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    swift_retain(v3);
    ImpressionsCalculator.viewBounds.setter(objc_msgSend(v5, "bounds"));

    swift_release(v3);
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8AppStore33SearchHintsCollectionViewDelegate *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10041DEF0();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore33SearchHintsCollectionViewDelegate *v12;
  uint64_t v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = IndexPath.item.getter();
  dispatch thunk of SearchHintsPresenter.didSelectHint(at:)(v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  sub_10041CEC8(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))sub_10041E094);
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  sub_10041CEC8(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, char *))sub_10041E1C0);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8AppStore33SearchHintsCollectionViewDelegate *v15;
  __n128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  CGSize result;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v17 = sub_10041E2F0(v13, v16);
  v19 = v18;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (_TtC8AppStore33SearchHintsCollectionViewDelegate)init
{
  _TtC8AppStore33SearchHintsCollectionViewDelegate *result;

  result = (_TtC8AppStore33SearchHintsCollectionViewDelegate *)_swift_stdlib_reportUnimplementedInitializer("AppStore.SearchHintsCollectionViewDelegate", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8AppStore33SearchHintsCollectionViewDelegate_presenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8AppStore33SearchHintsCollectionViewDelegate_pageTraits));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8AppStore33SearchHintsCollectionViewDelegate_impressionsCalculator));
}

@end
