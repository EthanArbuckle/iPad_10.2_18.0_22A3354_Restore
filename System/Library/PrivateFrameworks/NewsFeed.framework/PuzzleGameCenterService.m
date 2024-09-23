@implementation PuzzleGameCenterService

- (_TtC8NewsFeed23PuzzleGameCenterService)init
{
  _TtC8NewsFeed23PuzzleGameCenterService *result;

  swift_defaultActor_initialize();
  result = (_TtC8NewsFeed23PuzzleGameCenterService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)networkReachabilityDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  sub_1BA81D6FC(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  swift_retain();
  if (objc_msgSend(a3, sel_isNetworkReachable))
  {
    v8 = sub_1BB872F94();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = self;
    swift_retain();
    sub_1BB1B6AEC((uint64_t)v7, (uint64_t)&unk_1EF2C5FA0, (uint64_t)v9);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
  }
  swift_release();
}

@end
