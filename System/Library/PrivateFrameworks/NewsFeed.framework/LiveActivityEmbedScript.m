@implementation LiveActivityEmbedScript

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BB872970();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)queueable
{
  return 0;
}

- (WKUserScript)userScript
{
  _TtC8NewsFeed23LiveActivityEmbedScript *v2;
  id v3;

  v2 = self;
  v3 = sub_1BB367F64();

  return (WKUserScript *)v3;
}

- (NSString)executableScript
{
  _TtC8NewsFeed23LiveActivityEmbedScript *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1BB3680F4();
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

- (_TtC8NewsFeed23LiveActivityEmbedScript)init
{
  _TtC8NewsFeed23LiveActivityEmbedScript *result;

  result = (_TtC8NewsFeed23LiveActivityEmbedScript *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
