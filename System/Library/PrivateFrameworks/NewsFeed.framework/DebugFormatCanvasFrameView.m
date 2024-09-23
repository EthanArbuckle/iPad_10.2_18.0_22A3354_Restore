@implementation DebugFormatCanvasFrameView

- (_TtC8NewsFeed26DebugFormatCanvasFrameView)initWithCoder:(id)a3
{
  _TtC8NewsFeed26DebugFormatCanvasFrameView *result;

  result = (_TtC8NewsFeed26DebugFormatCanvasFrameView *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (NSString)description
{
  _TtC8NewsFeed26DebugFormatCanvasFrameView *v2;
  _QWORD *v3;
  void *v4;

  v2 = self;
  sub_1BB873CB4();
  sub_1BB872AFC("rmatCanvasFrameView");
  sub_1BB86D57C();
  sub_1BB873E34();
  sub_1BB872AFC(v3);

  v4 = (void *)sub_1BB872970();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC8NewsFeed26DebugFormatCanvasFrameView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed26DebugFormatCanvasFrameView *result;

  result = (_TtC8NewsFeed26DebugFormatCanvasFrameView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8NewsFeed26DebugFormatCanvasFrameView_cursorFrame;
  v3 = sub_1BB86D57C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
