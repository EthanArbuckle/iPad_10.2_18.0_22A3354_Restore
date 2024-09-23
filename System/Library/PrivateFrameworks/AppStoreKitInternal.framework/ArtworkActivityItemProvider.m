@implementation ArtworkActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC19AppStoreKitInternal27ArtworkActivityItemProvider *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  void *v15;
  __int128 v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D8678EC4((uint64_t)v8, a4, &v17);

  v9 = v18;
  if (!v18)
    return 0;
  v10 = __swift_project_boxed_opaque_existential_1Tm(&v17, v18);
  v11 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v11 + 16))(v14, v12);
  v15 = (void *)sub_1D892BD8C();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
  return v15;
}

- (id)item
{
  _TtC19AppStoreKitInternal27ArtworkActivityItemProvider *v2;
  void *v3;
  _QWORD v5[4];

  v2 = self;
  sub_1D8679140(v5);

  __swift_project_boxed_opaque_existential_1Tm(v5, v5[3]);
  v3 = (void *)sub_1D892BD8C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (_TtC19AppStoreKitInternal27ArtworkActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtC19AppStoreKitInternal27ArtworkActivityItemProvider *result;

  swift_unknownObjectRetain();
  sub_1D892B954();
  swift_unknownObjectRelease();
  result = (_TtC19AppStoreKitInternal27ArtworkActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
