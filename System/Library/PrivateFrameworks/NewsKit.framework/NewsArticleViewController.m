@implementation NewsArticleViewController

- (_TtC7NewsKit25NewsArticleViewController)initWithCoder:(id)a3
{
  _TtC7NewsKit25NewsArticleViewController *result;

  result = (_TtC7NewsKit25NewsArticleViewController *)sub_21C1D94E0();
  __break(1u);
  return result;
}

- (void)loadView
{
  objc_class *v3;
  id v4;
  _TtC7NewsKit25NewsArticleViewController *v5;
  _TtC7NewsKit25NewsArticleViewController *v6;
  objc_super v7;
  _BYTE v8[40];

  sub_21C1CE6FC((uint64_t)self + OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_sceneProvider, (uint64_t)v8);
  v3 = (objc_class *)type metadata accessor for SceneProvidingView();
  v4 = objc_allocWithZone(v3);
  sub_21C1CE6FC((uint64_t)v8, (uint64_t)v4 + OBJC_IVAR____TtC7NewsKit18SceneProvidingView_sceneProvider);
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = self;
  v6 = -[NewsArticleViewController initWithFrame:](&v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  -[NewsArticleViewController setView:](v5, sel_setView_, v6);

}

- (void)viewDidLoad
{
  _TtC7NewsKit25NewsArticleViewController *v2;

  v2 = self;
  NewsArticleViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
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
  -[NewsArticleViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_contentViewController], sel_view, v15.receiver, v15.super_class);
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

- (_TtC7NewsKit25NewsArticleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsKit25NewsArticleViewController *result;

  v4 = a4;
  result = (_TtC7NewsKit25NewsArticleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_articleViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsKit25NewsArticleViewController_sceneProvider);
}

- (void)handleDone
{
  -[NewsArticleViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

@end
