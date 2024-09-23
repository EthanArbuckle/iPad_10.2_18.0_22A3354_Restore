@implementation PreorderDisclaimerCollectionViewCell

- (_TtC8AppStore36PreorderDisclaimerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36PreorderDisclaimerCollectionViewCell *)sub_1005225A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36PreorderDisclaimerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100522B00();
}

- (void)layoutSubviews
{
  _TtC8AppStore36PreorderDisclaimerCollectionViewCell *v2;

  v2 = self;
  sub_100522914();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36PreorderDisclaimerCollectionViewCell_disclaimerLabel));
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore36PreorderDisclaimerCollectionViewCell_itemLayoutContext);
}

@end
