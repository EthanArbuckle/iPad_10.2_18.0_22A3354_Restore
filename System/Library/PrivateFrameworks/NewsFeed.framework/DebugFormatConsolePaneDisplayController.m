@implementation DebugFormatConsolePaneDisplayController

- (void)doConsolePaneDebuggerDisplay
{
  _TtC8NewsFeed39DebugFormatConsolePaneDisplayController *v2;

  v2 = self;
  sub_1BB2A2C50();

}

- (void)doConsolePaneLoggerDisplay
{
  _TtC8NewsFeed39DebugFormatConsolePaneDisplayController *v2;

  v2 = self;
  sub_1BB2A2D40();

}

- (_TtC8NewsFeed39DebugFormatConsolePaneDisplayController)init
{
  _TtC8NewsFeed39DebugFormatConsolePaneDisplayController *result;

  result = (_TtC8NewsFeed39DebugFormatConsolePaneDisplayController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatConsolePaneDisplayController____lazy_storage___consolePaneDebuggerButtonItem));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatConsolePaneDisplayController____lazy_storage___consolePaneLoggerButtonItem));
}

@end
