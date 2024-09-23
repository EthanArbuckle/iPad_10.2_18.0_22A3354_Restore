@implementation MagazineGridSectionHeaderView

- (_TtC7NewsUI229MagazineGridSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI229MagazineGridSectionHeaderView *)sub_1D67C4474(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI229MagazineGridSectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D67C47F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229MagazineGridSectionHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229MagazineGridSectionHeaderView_sortByButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229MagazineGridSectionHeaderView_detailLabel));
}

@end
