@implementation ContentConfigurationCollectionViewListCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell *v8;
  uint64_t v9;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  sub_1A98DA980((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell_item;
  v9 = (objc_class *)type metadata accessor for ContentConfigurationCollectionViewListCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[PresentationBasedCollectionViewListCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell *)sub_1A98DC050((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell_item, type metadata accessor for ContentConfigurationCollectionViewListCell);
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI42ContentConfigurationCollectionViewListCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

@end
