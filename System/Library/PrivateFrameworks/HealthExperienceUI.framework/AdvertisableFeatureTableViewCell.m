@implementation AdvertisableFeatureTableViewCell

- (NSString)reuseIdentifier
{
  void *v2;

  _s18HealthExperienceUI32AdvertisableFeatureTableViewCellC15reuseIdentifierSSvgZ_0();
  v2 = (void *)sub_1A9A9580C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell *)sub_1A9661DD0(v4, v5);
}

- (_TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  char *v5;
  id v6;
  _TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell_baseIdentifier);
  *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell____lazy_storage___featureContentView) = 0;
  v6 = a3;

  result = (_TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI32AdvertisableFeatureTableViewCell____lazy_storage___featureContentView));
}

@end
