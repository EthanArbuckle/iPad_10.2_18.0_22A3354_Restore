@implementation DarkModeConfiguration

- (_TtC12NewsArticles21DarkModeConfiguration)init
{
  _TtC12NewsArticles21DarkModeConfiguration *result;

  result = (_TtC12NewsArticles21DarkModeConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (BOOL)isAutoDarkModeEnabled
{
  _TtC12NewsArticles21DarkModeConfiguration *v2;
  char v3;

  v2 = self;
  v3 = sub_1BA08393C();

  return v3 & 1;
}

- (unint64_t)inversionBehavior
{
  uint64_t v3;
  _TtC12NewsArticles21DarkModeConfiguration *v4;
  unsigned __int8 v6;

  swift_getObjectType();
  v3 = qword_1ED5908B0;
  v4 = self;
  if (v3 != -1)
    swift_once();
  sub_1BA084034();
  swift_retain();
  sub_1BA0B9BCC();

  swift_release();
  return v6;
}

- (double)saturationThreshold
{
  uint64_t v3;
  _TtC12NewsArticles21DarkModeConfiguration *v4;
  float v6;

  swift_getObjectType();
  v3 = qword_1ED5908B0;
  v4 = self;
  if (v3 != -1)
    swift_once();
  sub_1BA084034();
  swift_retain();
  sub_1BA0B9BCC();

  swift_release();
  return v6;
}

- (NSDictionary)colors
{
  _TtC12NewsArticles21DarkModeConfiguration *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1BA083C04();

  if (v3)
  {
    v4 = (void *)sub_1BA0BE75C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

@end
