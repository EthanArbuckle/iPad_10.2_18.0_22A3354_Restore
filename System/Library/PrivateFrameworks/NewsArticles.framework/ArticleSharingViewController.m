@implementation ArticleSharingViewController

- (NAArticleFooterDelegate)footerDelegate
{
  return (NAArticleFooterDelegate *)(id)MEMORY[0x1BCCD5CF8]((char *)self+ OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_footerDelegate, a2);
}

- (void)setFooterDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtC12NewsArticles28ArticleSharingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BA090140();
}

- (_TtC12NewsArticles28ArticleSharingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles28ArticleSharingViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles28ArticleSharingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_footerDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_styler);
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_shareAction));
}

- (void)viewDidLoad
{
  _TtC12NewsArticles28ArticleSharingViewController *v2;

  v2 = self;
  sub_1BA08FC60();

}

- (void)traitCollectionDidChange:(id)a3
{
  char *v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = (char *)v8.receiver;
  v5 = a3;
  -[ArticleSharingViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v5);
  v6 = objc_msgSend(v4, sel_traitCollection, v8.receiver, v8.super_class);
  v7 = objc_msgSend(v4, sel_view);
  if (v7)
  {

    sub_1BA061DD8(*(_QWORD *)&v4[OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_shareButton]);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  _TtC12NewsArticles28ArticleSharingViewController *v2;

  v2 = self;
  sub_1BA08FF00();

}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  double v5;
  void *v6;
  id v7;
  _TtC12NewsArticles28ArticleSharingViewController *v8;
  double v9;
  double v10;
  double v11;

  v5 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_topPadding);
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_shareButton);
  v7 = a4;
  v8 = self;
  objc_msgSend(v6, sel_intrinsicContentSize);
  v10 = v5 + v9;
  v11 = *(double *)((char *)&v8->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_bottomPadding);

  return v10 + v11;
}

- (void)scrollViewController:(id)a3 didApplyDocumentStyle:(id)a4
{
  id v6;
  _TtC12NewsArticles28ArticleSharingViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1BA090228((uint64_t)a4);

  swift_unknownObjectRelease();
}

@end
