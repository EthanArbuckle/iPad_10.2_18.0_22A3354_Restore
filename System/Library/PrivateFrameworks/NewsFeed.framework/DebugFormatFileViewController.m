@implementation DebugFormatFileViewController

- (_TtC8NewsFeed29DebugFormatFileViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  id v7;
  _TtC8NewsFeed29DebugFormatFileViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed29DebugFormatFileViewController_sourceMetrics) = 0;
  v5 = OBJC_IVAR____TtC8NewsFeed29DebugFormatFileViewController_styler;
  type metadata accessor for DebugFormatStyler();
  v6 = (objc_class *)swift_allocObject();
  *((_QWORD *)v6 + 2) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v5) = v6;
  v7 = a3;

  result = (_TtC8NewsFeed29DebugFormatFileViewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8NewsFeed29DebugFormatFileViewController *v2;

  v2 = self;
  sub_1BB3B681C();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[DebugFormatFileViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8NewsFeed29DebugFormatFileViewController_fileViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (_TtC8NewsFeed29DebugFormatFileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed29DebugFormatFileViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed29DebugFormatFileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatFileViewController_fileViewController));
  swift_release();
}

@end
