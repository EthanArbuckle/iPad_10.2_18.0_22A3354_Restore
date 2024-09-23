@implementation DebugFormatCodeDisplayViewController

- (_TtC8NewsFeed36DebugFormatCodeDisplayViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8NewsFeed36DebugFormatCodeDisplayViewController *result;

  v5 = OBJC_IVAR____TtC8NewsFeed36DebugFormatCodeDisplayViewController_textView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3E50]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed36DebugFormatCodeDisplayViewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8NewsFeed36DebugFormatCodeDisplayViewController *v2;

  v2 = self;
  sub_1BB3A5060();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  -[DebugFormatCodeDisplayViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed36DebugFormatCodeDisplayViewController_textView];
  v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewLayoutMarginsDidChange
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  -[DebugFormatCodeDisplayViewController viewLayoutMarginsDidChange](&v14, sel_viewLayoutMarginsDidChange);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed36DebugFormatCodeDisplayViewController_textView];
  v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_layoutMargins);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    MEMORY[0x1BCCE3B80](0.0, v7, v9, v11, v13);
    sub_1BB873288();
    objc_msgSend(v3, sel_setContentInset_);

  }
  else
  {
    __break(1u);
  }
}

- (void)doDismiss
{
  -[DebugFormatCodeDisplayViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC8NewsFeed36DebugFormatCodeDisplayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed36DebugFormatCodeDisplayViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed36DebugFormatCodeDisplayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed36DebugFormatCodeDisplayViewController_loader);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed36DebugFormatCodeDisplayViewController_textView));
}

@end
