@implementation HealthArticleViewController

- (_TtC16HealthArticlesUI27HealthArticleViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16HealthArticlesUI27HealthArticleViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView) = 0;
  v4 = a3;

  result = (_TtC16HealthArticlesUI27HealthArticleViewController *)sub_1BC98028C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16HealthArticlesUI27HealthArticleViewController *v2;

  v2 = self;
  sub_1BC96AF3C();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for HealthArticleViewController();
  v4 = v16.receiver;
  -[HealthArticleViewController viewIsAppearing:](&v16, sel_viewIsAppearing_, v3);
  v5 = objc_msgSend(v4, sel_traitCollection, v16.receiver, v16.super_class);
  v6 = sub_1BC9800E8();

  objc_msgSend((id)objc_opt_self(), sel_edgeInsetsForWidthDesignation_, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = sub_1BC96A4E0();
  objc_msgSend(v15, sel_setDirectionalLayoutMargins_, v8, v10, v12, v14);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HealthArticleViewController();
  v4 = v5.receiver;
  -[HealthArticleViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_1BC96BA1C(0);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dismissArticleModal
{
  -[HealthArticleViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC16HealthArticlesUI27HealthArticleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BC96BA1C(1);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC16HealthArticlesUI27HealthArticleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BC96BA1C(0);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC16HealthArticlesUI27HealthArticleViewController *v6;

  if (!a4)
  {
    v5 = a3;
    v6 = self;
    sub_1BC96BA1C(0);

  }
}

- (_TtC16HealthArticlesUI27HealthArticleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16HealthArticlesUI27HealthArticleViewController *result;

  v4 = a4;
  result = (_TtC16HealthArticlesUI27HealthArticleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView));
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return -[HealthArticleViewController supportedInterfaceOrientations](self, sel_supportedInterfaceOrientations, a3);
}

@end
