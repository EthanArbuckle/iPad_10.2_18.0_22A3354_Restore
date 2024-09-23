@implementation SharingPuzzleTextActivityItemSource

- (_TtC8NewsFeed35SharingPuzzleTextActivityItemSource)init
{
  _TtC8NewsFeed35SharingPuzzleTextActivityItemSource *result;

  result = (_TtC8NewsFeed35SharingPuzzleTextActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1BAB5D8AC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_shareData), *(_QWORD *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_shareData], *(_QWORD *)&self->shareData[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_shareData], *(_QWORD *)&self->shareData[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_shareData + 8]);
  sub_1BB21EC8C((uint64_t)self + OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource_puzzleRankProvider);
  swift_bridgeObjectRelease();
  sub_1BA6E3730(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___completeSolvedWithTimeText), *(_QWORD *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___completeSolvedWithTimeText]);
  sub_1BA6E3730(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___completeSolvedWithRankText), *(_QWORD *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___completeSolvedWithRankText]);
  sub_1BA6E3730(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedPuzzleTypeText), *(_QWORD *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedPuzzleTypeText]);
  sub_1BA6E3730(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedWithTimeText), *(_QWORD *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedWithTimeText]);
  sub_1BA6E3730(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedWithRank), *(_QWORD *)&self->puzzle[OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedWithRank]);
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v4;
  _TtC8NewsFeed35SharingPuzzleTextActivityItemSource *v5;

  v4 = a3;
  v5 = self;
  sub_1BB21ECE8();

  return (id)sub_1BB87453C();
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC8NewsFeed35SharingPuzzleTextActivityItemSource *v8;
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
  SharingPuzzleTextActivityItemSource.activityViewController(_:itemForActivityType:)(a4, (uint64_t)v17);

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
  _TtC8NewsFeed35SharingPuzzleTextActivityItemSource *v10;
  id v11;
  _TtC8NewsFeed35SharingPuzzleTextActivityItemSource *v12;
  char v13;
  id v14;
  id v15;
  _TtC8NewsFeed35SharingPuzzleTextActivityItemSource *v16;
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

    self = (_TtC8NewsFeed35SharingPuzzleTextActivityItemSource *)a4;
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
  _TtC8NewsFeed35SharingPuzzleTextActivityItemSource *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1BB21F428(&OBJC_IVAR____TtC8NewsFeed35SharingPuzzleTextActivityItemSource____lazy_storage___solvedPuzzleTypeText, sub_1BB21F24C);
  if (!v9)
    sub_1BB21ECE8();

  v10 = (void *)sub_1BB872970();
  swift_bridgeObjectRelease();
  return v10;
}

@end
