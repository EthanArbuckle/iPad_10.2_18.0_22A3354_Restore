@implementation ArticleFooterPaywall

- (NAArticleFooterDelegate)footerDelegate
{
  return (NAArticleFooterDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setFooterDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles20ArticleFooterPaywall_footerDelegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC12NewsArticles20ArticleFooterPaywall)initWithCoder:(id)a3
{
  id v4;
  _TtC12NewsArticles20ArticleFooterPaywall *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles20ArticleFooterPaywall_footerDelegate) = 0;
  v4 = a3;

  result = (_TtC12NewsArticles20ArticleFooterPaywall *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC12NewsArticles20ArticleFooterPaywall *v2;

  v2 = self;
  sub_1B9FB6F84();

}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC12NewsArticles20ArticleFooterPaywall_paywallHeight);
}

- (id)sectionItemViewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC12NewsArticles20ArticleFooterPaywall_paywallViewController));
}

- (_TtC12NewsArticles20ArticleFooterPaywall)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles20ArticleFooterPaywall *result;

  v4 = a4;
  result = (_TtC12NewsArticles20ArticleFooterPaywall *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles20ArticleFooterPaywall_paywallViewController));
}

@end
