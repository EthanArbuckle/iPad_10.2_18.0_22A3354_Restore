@implementation HistoryService

- (_TtC7NewsUI214HistoryService)init
{
  _TtC7NewsUI214HistoryService *result;

  result = (_TtC7NewsUI214HistoryService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI214HistoryService_headlineModelFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI214HistoryService_headlineService);
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC7NewsUI214HistoryService *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC7NewsUI214HistoryService *v12;

  if (a4)
  {
    sub_1D5E6F04C(0, (unint64_t *)&qword_1ED5F4780);
    v6 = sub_1D6E267D4();
    v7 = a3;
    v8 = self;
    v9 = sub_1D60FF73C(v6);
    __swift_project_boxed_opaque_existential_1((Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC7NewsUI214HistoryService_headlineService), *(_QWORD *)&v8->issueReadingHistory[OBJC_IVAR____TtC7NewsUI214HistoryService_headlineService]);
    v10 = *MEMORY[0x1E0D58640];
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v8;
    v12 = v8;
    sub_1D69DE640(v9, v10, 17, (uint64_t)sub_1D681FCA0, v11);

    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC7NewsUI214HistoryService *v8;

  if (a4)
    v6 = sub_1D6E26D80();
  else
    v6 = 0;
  v7 = a3;
  v8 = self;
  sub_1D681E498(a3, v6);

  swift_bridgeObjectRelease();
}

- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4
{
  sub_1D681F1D8(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1D681F744);
}

- (void)readingHistory:(id)a3 didChangeOffensiveStateForArticlesWithIDs:(id)a4
{
  sub_1D681F1D8(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1D681F9DC);
}

@end
