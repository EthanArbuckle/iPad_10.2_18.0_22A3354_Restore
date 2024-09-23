@implementation DebugFormatDebuggerViewController

- (_TtC8NewsFeed33DebugFormatDebuggerViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8NewsFeed33DebugFormatDebuggerViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC8NewsFeed33DebugFormatDebuggerViewController_selectedCallStackFrame;
  v6 = type metadata accessor for FormatDebuggerCallStackFrame(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC8NewsFeed33DebugFormatDebuggerViewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8NewsFeed33DebugFormatDebuggerViewController *v2;

  v2 = self;
  sub_1BB441E68();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed33DebugFormatDebuggerViewController_debuggerPaneViewController));
  swift_release();
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed33DebugFormatDebuggerViewController_selectedCallStackFrame, (uint64_t (*)(_QWORD))sub_1BB444DFC);
}

@end
