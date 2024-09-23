@implementation InterstitialAdPreviewViewController

- (_TtC12NewsArticles35InterstitialAdPreviewViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC12NewsArticles35InterstitialAdPreviewViewController *result;

  v5 = OBJC_IVAR____TtC12NewsArticles35InterstitialAdPreviewViewController_coverViewManager;
  sub_1BA0BB0C0();
  swift_allocObject();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1BA0BB0B4();
  v7 = OBJC_IVAR____TtC12NewsArticles35InterstitialAdPreviewViewController_eventManager;
  sub_1B9E91D7C();
  swift_allocObject();
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)sub_1BA0BA0A0();

  result = (_TtC12NewsArticles35InterstitialAdPreviewViewController *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles35InterstitialAdPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles35InterstitialAdPreviewViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles35InterstitialAdPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles35InterstitialAdPreviewViewController_styler);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles35InterstitialAdPreviewViewController_interstitialModule);
  swift_release();
  swift_release();
}

- (void)viewDidLoad
{
  _TtC12NewsArticles35InterstitialAdPreviewViewController *v2;

  v2 = self;
  sub_1B9FB9D60();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[InterstitialAdPreviewViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_1BA0BA07C();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[InterstitialAdPreviewViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_1BA0BB090();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NewsArticles35InterstitialAdPreviewViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1B9FBA2FC((uint64_t)a3);

}

- (void)done
{
  -[InterstitialAdPreviewViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

@end
