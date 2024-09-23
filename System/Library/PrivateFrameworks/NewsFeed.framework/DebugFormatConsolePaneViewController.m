@implementation DebugFormatConsolePaneViewController

- (_TtC8NewsFeed36DebugFormatConsolePaneViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  id v8;
  id v9;
  _TtC8NewsFeed36DebugFormatConsolePaneViewController *result;

  v5 = OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_styler;
  type metadata accessor for DebugFormatStyler();
  v6 = (objc_class *)swift_allocObject();
  *((_QWORD *)v6 + 2) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v5) = v6;
  v7 = OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_separatorView;
  v8 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)objc_msgSend(v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed36DebugFormatConsolePaneViewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8NewsFeed36DebugFormatConsolePaneViewController *v2;

  v2 = self;
  sub_1BB5D203C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  -[DebugFormatConsolePaneViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_logViewController], sel_toolbar, v7.receiver, v7.super_class);
  sub_1BB80F56C(v5);

  v6 = objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_debuggerPaneViewController], sel_toolbar);
  sub_1BB80F56C(v6);

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeed36DebugFormatConsolePaneViewController *v2;

  v2 = self;
  sub_1BB5D24F4();

}

- (_TtC8NewsFeed36DebugFormatConsolePaneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed36DebugFormatConsolePaneViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed36DebugFormatConsolePaneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_logViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_debuggerPaneViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_separatorView));
}

@end
