@implementation DebugFormatDebuggerSourceViewController

- (_TtC8NewsFeed39DebugFormatDebuggerSourceViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB0F10E0();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed39DebugFormatDebuggerSourceViewController *v2;

  v2 = self;
  sub_1BB0EEF5C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  -[DebugFormatDebuggerSourceViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  v5 = (void *)sub_1BB8733C0();

  if (v5)
  {
    v6 = objc_msgSend(v4, sel_navigationController, v8.receiver, v8.super_class);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, sel_setToolbarHidden_animated_, 0, 0);

      v4 = v7;
    }
  }

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeed39DebugFormatDebuggerSourceViewController *v2;

  v2 = self;
  sub_1BB0EF6C8();

}

- (_TtC8NewsFeed39DebugFormatDebuggerSourceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed39DebugFormatDebuggerSourceViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed39DebugFormatDebuggerSourceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _QWORD v3[16];

  sub_1BAF97E40((uint64_t)self + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController_sourceFile, (uint64_t)v3);
  sub_1BA6A0C50(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BAF927BC);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController____lazy_storage___highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController_lineNumberLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController_edgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController____lazy_storage___breakpointView));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8NewsFeed39DebugFormatDebuggerSourceViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB0EFB78(v4);

}

@end
