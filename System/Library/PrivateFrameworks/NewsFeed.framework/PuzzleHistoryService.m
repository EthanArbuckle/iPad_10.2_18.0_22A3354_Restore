@implementation PuzzleHistoryService

- (_TtC8NewsFeed20PuzzleHistoryService)init
{
  _TtC8NewsFeed20PuzzleHistoryService *result;

  result = (_TtC8NewsFeed20PuzzleHistoryService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed20PuzzleHistoryService_puzzleService);
  swift_bridgeObjectRelease();
}

- (void)puzzleHistory:(id)a3 didAddPuzzleItems:(id)a4 modifiedPuzzleItems:(id)a5 removedPuzzleItems:(id)a6
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC8NewsFeed20PuzzleHistoryService *v12;

  sub_1BA49A224(0, (unint64_t *)&unk_1EF2C8828);
  v8 = sub_1BB872DB4();
  v9 = sub_1BB872DB4();
  v10 = sub_1BB872DB4();
  v11 = a3;
  v12 = self;
  sub_1BB5DF544(v8, v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  _TtC8NewsFeed20PuzzleHistoryService *v6;
  id v7;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = objc_msgSend(a4, sel_puzzlesConfig);
  objc_msgSend(*(id *)((char *)&v6->super.isa + OBJC_IVAR____TtC8NewsFeed20PuzzleHistoryService_puzzleHistory), sel_setAllowLowerProgressOnCompletedPuzzles_, objc_msgSend(v7, sel_allowLowerProgressOnCompletedPuzzles));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

@end
