@implementation GuidedSearchTokenCell

- (_TtC20ProductPageExtension21GuidedSearchTokenCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21GuidedSearchTokenCell *)sub_10054EA0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension21GuidedSearchTokenCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10054FE20();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension21GuidedSearchTokenCell *v2;

  v2 = self;
  sub_10054F12C();

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC20ProductPageExtension21GuidedSearchTokenCell *v5;

  v4 = a3;
  v5 = self;
  sub_10054F524(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21GuidedSearchTokenCell_pill));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21GuidedSearchTokenCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21GuidedSearchTokenCell_closeImage));
}

@end
