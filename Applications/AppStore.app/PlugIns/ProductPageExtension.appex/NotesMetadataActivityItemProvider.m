@implementation NotesMetadataActivityItemProvider

- (id)item
{
  _TtC20ProductPageExtension33NotesMetadataActivityItemProvider *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  uint64_t v7[3];
  uint64_t v8;

  v2 = self;
  sub_1002AB448(v7);

  v3 = v8;
  v4 = sub_100010F08(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v7);
  return v5;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC20ProductPageExtension33NotesMetadataActivityItemProvider *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD v17[3];
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1002AB53C((uint64_t)a4, (uint64_t)v17);

  v9 = v18;
  if (!v18)
    return 0;
  v10 = sub_100010F08(v17, v18);
  v11 = *(_QWORD *)(v9 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v11 + 16))(v14, v12);
  v15 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v14, v9);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v17);
  return v15;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC20ProductPageExtension33NotesMetadataActivityItemProvider *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1002AB904(a4);
  v10 = v9;

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return v11;
}

- (_TtC20ProductPageExtension33NotesMetadataActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC20ProductPageExtension33NotesMetadataActivityItemProvider *result;
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  result = (_TtC20ProductPageExtension33NotesMetadataActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.NotesMetadataActivityItemProvider", 54, "init(placeholderItem:)", 22, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1002AB898(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension33NotesMetadataActivityItemProvider____lazy_storage___notesMetadata), *(_QWORD *)&self->metadata[OBJC_IVAR____TtC20ProductPageExtension33NotesMetadataActivityItemProvider____lazy_storage___notesMetadata]);
}

@end
