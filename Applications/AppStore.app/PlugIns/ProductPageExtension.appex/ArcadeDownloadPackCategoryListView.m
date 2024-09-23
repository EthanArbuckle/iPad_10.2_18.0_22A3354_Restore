@implementation ArcadeDownloadPackCategoryListView

- (_TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView *)sub_1004B0240(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004B141C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[ArcadeDownloadPackCategoryListView traitCollection](v5, "traitCollection");
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView_contentView), "systemLayoutSizeFittingSize:", width, height);
  v8 = v7;
  v10 = v9;
  v11 = sub_1004B0818();
  objc_msgSend(v11, "constant");
  v13 = v12;

  v14 = v10 + v13;
  v15 = v8;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView *v2;

  v2 = self;
  sub_1004B0F4C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView_firstColumn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView_secondColumn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView____lazy_storage___topContentConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension34ArcadeDownloadPackCategoryListView_categoryViews));
}

@end
