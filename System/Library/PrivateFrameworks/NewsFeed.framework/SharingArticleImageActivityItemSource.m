@implementation SharingArticleImageActivityItemSource

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4;
  _TtC8NewsFeed37SharingArticleImageActivityItemSource *v5;
  void *v6;
  _QWORD v8[4];

  v4 = a3;
  v5 = self;
  SharingArticleImageActivityItemSource.activityViewControllerPlaceholderItem(_:)(v8);

  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v6 = (void *)sub_1BB874380();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC8NewsFeed37SharingArticleImageActivityItemSource *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD v17[3];
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = self;
  SharingArticleImageActivityItemSource.activityViewController(_:itemForActivityType:)(a4, (uint64_t)v17);

  v9 = v18;
  if (!v18)
    return 0;
  v10 = __swift_project_boxed_opaque_existential_1(v17, v18);
  v11 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v11 + 16))(v14, v12);
  v15 = (void *)sub_1BB874380();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return v15;
}

- (_TtC8NewsFeed37SharingArticleImageActivityItemSource)init
{
  _TtC8NewsFeed37SharingArticleImageActivityItemSource *result;

  result = (_TtC8NewsFeed37SharingArticleImageActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
