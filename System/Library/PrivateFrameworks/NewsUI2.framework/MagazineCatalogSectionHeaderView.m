@implementation MagazineCatalogSectionHeaderView

- (_TtC7NewsUI232MagazineCatalogSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI232MagazineCatalogSectionHeaderView *)sub_1D68734BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI232MagazineCatalogSectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D687390C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI232MagazineCatalogSectionHeaderView_showingPrefixLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI232MagazineCatalogSectionHeaderView_selectCategoryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI232MagazineCatalogSectionHeaderView_onSelectCategoryButtonTap));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI232MagazineCatalogSectionHeaderView_sortByButton));
}

@end
