@implementation PreorderDisclaimerCollectionViewCell

- (_TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell *)sub_100213750(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100213D28();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell *v3;

  v3 = self;
  sub_100213AC0((uint64_t)v3, v2);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell_disclaimerLabel));
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36PreorderDisclaimerCollectionViewCell_itemLayoutContext);
}

@end
