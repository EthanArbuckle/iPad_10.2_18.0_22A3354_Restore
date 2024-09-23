@implementation ModalArticleViewerViewController

- (_TtC12NewsArticles32ModalArticleViewerViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC12NewsArticles32ModalArticleViewerViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles32ModalArticleViewerViewController_brandbar) = 0;
  v4 = a3;

  result = (_TtC12NewsArticles32ModalArticleViewerViewController *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (void)brandbarCtaButtonTapped
{
  _TtC12NewsArticles32ModalArticleViewerViewController *v2;

  v2 = self;
  sub_1B9ECEED0();

}

- (_TtC12NewsArticles32ModalArticleViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles32ModalArticleViewerViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles32ModalArticleViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles32ModalArticleViewerViewController_brandBarConfigManager);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles32ModalArticleViewerViewController_brandBarRenderer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles32ModalArticleViewerViewController_content));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles32ModalArticleViewerViewController_brandbar));
}

- (void)viewDidLoad
{
  _TtC12NewsArticles32ModalArticleViewerViewController *v2;

  v2 = self;
  sub_1B9F0D080();

}

- (void)viewWillLayoutSubviews
{
  _TtC12NewsArticles32ModalArticleViewerViewController *v2;

  v2 = self;
  sub_1B9F0D590();

}

@end
