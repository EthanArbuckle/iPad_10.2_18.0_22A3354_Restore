@implementation TitleEmptyStateCollectionViewCell

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitleEmptyStateCollectionViewCell();
  v2 = v3.receiver;
  -[TitleEmptyStateCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  objc_msgSend(v2, sel_setUserInteractionEnabled_, 0, v3.receiver, v3.super_class);

}

- (_TtC18HealthExperienceUI33TitleEmptyStateCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TitleEmptyStateCollectionViewCell();
  return -[ContentConfigurationCollectionViewListCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI33TitleEmptyStateCollectionViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TitleEmptyStateCollectionViewCell();
  return -[ContentConfigurationCollectionViewListCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
