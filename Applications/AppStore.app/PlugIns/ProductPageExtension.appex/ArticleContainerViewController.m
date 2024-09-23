@implementation ArticleContainerViewController

- (_TtC20ProductPageExtension30ArticleContainerViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtension30ArticleContainerViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension30ArticleContainerViewController_allowTraitCollectionOverrides) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension30ArticleContainerViewController_previousShouldOverrideTraitCollections) = 0;
  v4 = a3;

  result = (_TtC20ProductPageExtension30ArticleContainerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ArticleContainerViewController.swift", 57, 2, 100, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC20ProductPageExtension30ArticleContainerViewController *v2;

  v2 = self;
  sub_1004BFB8C();

}

- (void)viewDidLoad
{
  _TtC20ProductPageExtension30ArticleContainerViewController *v2;

  v2 = self;
  sub_1004BFEFC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[ArticleContainerViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_1004BFC7C();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC20ProductPageExtension30ArticleContainerViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[ArticleContainerViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  return (UIViewController *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension30ArticleContainerViewController_wrapperViewController), "topViewController");
}

- (_TtC20ProductPageExtension30ArticleContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension30ArticleContainerViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension30ArticleContainerViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.ArticleContainerViewController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArticleContainerViewController_wrapperViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ArticleContainerViewController_articleViewController));
}

@end
