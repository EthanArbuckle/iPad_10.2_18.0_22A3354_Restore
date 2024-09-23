@implementation NonInteractiveCollectionViewListDisclosureCell

- (_TtC18HealthExperienceUI46NonInteractiveCollectionViewListDisclosureCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC18HealthExperienceUI46NonInteractiveCollectionViewListDisclosureCell *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NonInteractiveCollectionViewListDisclosureCell();
  v7 = -[CollectionViewListDisclosureCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  -[NonInteractiveCollectionViewListDisclosureCell setUserInteractionEnabled:](v7, sel_setUserInteractionEnabled_, 0);
  return v7;
}

- (_TtC18HealthExperienceUI46NonInteractiveCollectionViewListDisclosureCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NonInteractiveCollectionViewListDisclosureCell();
  return -[CollectionViewListDisclosureCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
