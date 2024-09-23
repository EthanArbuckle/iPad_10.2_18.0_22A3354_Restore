@implementation RadioFavoritesCollectionCell

- (_TtC5Media28RadioFavoritesCollectionCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Media28RadioFavoritesCollectionCell *)sub_10002DFC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Media28RadioFavoritesCollectionCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000303F8();
}

- (void)unfavorite
{
  uint64_t v2;
  _TtC5Media28RadioFavoritesCollectionCell *v3;
  uint64_t v4;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_config);
  if (v2)
  {
    v3 = self;
    swift_retain();
    TerrestrialRadioStation.setFavorite(_:)(0);

    swift_release(v2, v4);
  }
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_stationLogoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_backgroundPlatter));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_config), v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_waveformView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell____lazy_storage___deleteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell____lazy_storage___secondaryLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Media28RadioFavoritesCollectionCell_labelConstraints));
}

@end
