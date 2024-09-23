@implementation DebugFormatConsoleViewController

- (_TtC8NewsFeed32DebugFormatConsoleViewController)initWithCoder:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  _TtC8NewsFeed32DebugFormatConsoleViewController *result;

  v4 = (char *)self + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController_consoleHeight;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController_consolePanSession;
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = 0;
  v5[24] = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController____lazy_storage___panGestureRecognizer) = 0;
  v6 = a3;

  result = (_TtC8NewsFeed32DebugFormatConsoleViewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8NewsFeed32DebugFormatConsoleViewController *v2;

  v2 = self;
  sub_1BAAAF844();

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeed32DebugFormatConsoleViewController *v2;

  v2 = self;
  sub_1BAAAFC40();

}

- (void)doPanGestureWithGesture:(id)a3
{
  id v4;
  _TtC8NewsFeed32DebugFormatConsoleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BAAB00C0(v4);

}

- (_TtC8NewsFeed32DebugFormatConsoleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed32DebugFormatConsoleViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed32DebugFormatConsoleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController_editorContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController_consoleContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController____lazy_storage___panGestureRecognizer));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC8NewsFeed32DebugFormatConsoleViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1BAAB079C();

  return self & 1;
}

@end
