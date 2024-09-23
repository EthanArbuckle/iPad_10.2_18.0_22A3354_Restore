@implementation MagazineV2GridSectionHeaderView

- (_TtC7NewsUI231MagazineV2GridSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI231MagazineV2GridSectionHeaderView *)sub_1D670AB68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI231MagazineV2GridSectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D670AF20();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231MagazineV2GridSectionHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231MagazineV2GridSectionHeaderView_sortByButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231MagazineV2GridSectionHeaderView_detailLabel));
}

@end
