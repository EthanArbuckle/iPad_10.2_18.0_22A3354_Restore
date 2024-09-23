@implementation TableOfContentsViewController

- (_TtC12NewsArticles29TableOfContentsViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC12NewsArticles29TableOfContentsViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12NewsArticles29TableOfContentsViewController_pageIdentifierToDisplay);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC12NewsArticles29TableOfContentsViewController *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles29TableOfContentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles29TableOfContentsViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles29TableOfContentsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29TableOfContentsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TableOfContentsViewController_blueprintViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29TableOfContentsViewController_purchasePresenter);
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  _TtC12NewsArticles29TableOfContentsViewController *v2;

  v2 = self;
  sub_1B9EE879C();

}

- (void)viewWillLayoutSubviews
{
  _TtC12NewsArticles29TableOfContentsViewController *v2;

  v2 = self;
  sub_1B9EE8CB0();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_1B9EE8EC8(self, (uint64_t)a2, a3, (SEL *)&selRef_viewWillAppear_);
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1B9EE8EC8(self, (uint64_t)a2, a3, (SEL *)&selRef_viewDidAppear_);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NewsArticles29TableOfContentsViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1B9EE8F14((uint64_t)a3);

}

@end
