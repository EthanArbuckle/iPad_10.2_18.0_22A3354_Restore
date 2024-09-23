@implementation SharingArticleTextActivityItemSource

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  swift_bridgeObjectRetain();
  return (id)sub_1BB87453C();
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC8NewsFeed36SharingArticleTextActivityItemSource *v8;
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
  SharingArticleTextActivityItemSource.activityViewController(_:itemForActivityType:)(a4, (uint64_t)v17);

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

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  uint64_t v7;
  id v8;
  id v9;
  _TtC8NewsFeed36SharingArticleTextActivityItemSource *v10;
  id v11;
  _TtC8NewsFeed36SharingArticleTextActivityItemSource *v12;
  char v13;
  id v14;
  id v15;
  _TtC8NewsFeed36SharingArticleTextActivityItemSource *v16;
  void *v17;

  if (a4)
  {
    if (sub_1BB8729A0() == 0xD000000000000026 && v7 == 0x80000001BB968360)
    {
      v8 = a4;
      v9 = a3;
      v10 = self;
      swift_bridgeObjectRelease();
    }
    else
    {
      v13 = sub_1BB874398();
      v14 = a4;
      v15 = a3;
      v16 = self;
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
      {

        goto LABEL_9;
      }
    }

    self = (_TtC8NewsFeed36SharingArticleTextActivityItemSource *)a4;
  }
  else
  {
    v11 = a3;
    v12 = self;
  }
LABEL_9:

  v17 = (void *)sub_1BB872970();
  swift_bridgeObjectRelease();
  return v17;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC8NewsFeed36SharingArticleTextActivityItemSource *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s8NewsFeed36SharingArticleTextActivityItemSourceC22activityViewController_010subjectForF4TypeSSSo010UIActivityjK0C_So0oN0aSgtF_0();

  v9 = (void *)sub_1BB872970();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC8NewsFeed36SharingArticleTextActivityItemSource)init
{
  _TtC8NewsFeed36SharingArticleTextActivityItemSource *result;

  result = (_TtC8NewsFeed36SharingArticleTextActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end
