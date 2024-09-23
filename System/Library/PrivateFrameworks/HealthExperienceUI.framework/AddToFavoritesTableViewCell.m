@implementation AddToFavoritesTableViewCell

- (_TtC18HealthExperienceUI27AddToFavoritesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _TtC18HealthExperienceUI27AddToFavoritesTableViewCell *v9;
  objc_super v11;

  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___pinImage) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___unpinImage) = (Class)1;
  if (v6)
  {
    v8 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AddToFavoritesTableViewCell();
  v9 = -[AddToFavoritesTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, 1, v8);

  return v9;
}

- (_TtC18HealthExperienceUI27AddToFavoritesTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI27AddToFavoritesTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___pinImage) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___unpinImage) = (Class)1;
  v5 = a3;

  result = (_TtC18HealthExperienceUI27AddToFavoritesTableViewCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
  sub_1A9673FA0(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___pinImage));
  sub_1A9673FA0(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC18HealthExperienceUI27AddToFavoritesTableViewCell____lazy_storage___unpinImage));
}

@end
