@implementation FavoriteColorPickerView.Coordinator

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10002BD94((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (void)showDeleteCallout:(id)a3
{
  id v4;
  _TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100023A78(v4);

}

- (_TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator)init
{
  _TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator *result;

  result = (_TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("ColorPickerUIService.Coordinator", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent);
  v4 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent
                              + 16];
  v5 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent
                              + 40];
  swift_bridgeObjectRelease(*(_QWORD *)&self->parent[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_parent
                                                   + 32]);
  swift_release(v4);
  swift_release(v3);
  swift_release(v5);
  swift_release(*(_QWORD *)&self->parent[OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator__colorPickerState]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_dataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_collectionView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedFavoriteColors));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV20ColorPickerUIService23FavoriteColorPickerView11Coordinator_appliedSuggestedColors));
}

@end
