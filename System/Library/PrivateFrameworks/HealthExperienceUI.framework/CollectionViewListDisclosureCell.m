@implementation CollectionViewListDisclosureCell

- (_TtC18HealthExperienceUI32CollectionViewListDisclosureCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI32CollectionViewListDisclosureCell *)CollectionViewListDisclosureCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI32CollectionViewListDisclosureCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI32CollectionViewListDisclosureCell *)CollectionViewListDisclosureCell.init(coder:)(a3);
}

- (void)dealloc
{
  _TtC18HealthExperienceUI32CollectionViewListDisclosureCell *v2;

  v2 = self;
  CollectionViewListDisclosureCell.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1A9623874((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewListDisclosureCell_item, (uint64_t (*)(_QWORD))sub_1A9618454);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewListDisclosureCell____lazy_storage___textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewListDisclosureCell____lazy_storage___detailTextLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewListDisclosureCell_detailTextObservation));
}

- (void)prepareForReuse
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollectionViewListDisclosureCell();
  v2 = v6.receiver;
  -[CollectionViewListDisclosureCell prepareForReuse](&v6, sel_prepareForReuse);
  v3 = sub_1A9896660();
  objc_msgSend(v3, sel_setText_, 0, v6.receiver, v6.super_class);

  v4 = sub_1A989673C();
  objc_msgSend(v4, sel_setText_, 0);

  v5 = sub_1A989673C();
  objc_msgSend(v5, sel_setHidden_, 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI32CollectionViewListDisclosureCell *v6;

  v5 = a3;
  v6 = self;
  sub_1A9899C7C(a3);

}

- (NSString)description
{
  _TtC18HealthExperienceUI32CollectionViewListDisclosureCell *v2;
  void *v3;

  v2 = self;
  sub_1A9899E50();

  v3 = (void *)sub_1A9A9580C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)didMoveToSuperview
{
  _TtC18HealthExperienceUI32CollectionViewListDisclosureCell *v2;

  v2 = self;
  sub_1A989A074();

}

@end
