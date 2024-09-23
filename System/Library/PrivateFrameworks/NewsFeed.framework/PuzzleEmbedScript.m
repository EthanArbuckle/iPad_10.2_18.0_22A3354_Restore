@implementation PuzzleEmbedScript

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BB872970();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (WKUserScript)userScript
{
  return (WKUserScript *)0;
}

- (NSString)executableScript
{
  _TtC8NewsFeed17PuzzleEmbedScript *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  PuzzleEmbedScript.executableScript.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)queueable
{
  return 0;
}

- (_TtC8NewsFeed17PuzzleEmbedScript)init
{
  _TtC8NewsFeed17PuzzleEmbedScript *result;

  result = (_TtC8NewsFeed17PuzzleEmbedScript *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
