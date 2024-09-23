@implementation ProfileCollectionViewListCell

- (_TtC18HealthExperienceUI29ProfileCollectionViewListCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI29ProfileCollectionViewListCell *)ProfileCollectionViewListCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI29ProfileCollectionViewListCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI29ProfileCollectionViewListCell *)ProfileCollectionViewListCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29ProfileCollectionViewListCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileCollectionViewListCell____lazy_storage___textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileCollectionViewListCell____lazy_storage___detailTextLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
