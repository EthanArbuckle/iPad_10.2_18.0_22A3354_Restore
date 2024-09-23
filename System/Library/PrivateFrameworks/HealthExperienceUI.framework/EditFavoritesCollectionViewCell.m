@implementation EditFavoritesCollectionViewCell

- (BOOL)axItemIsFavorited
{
  _TtC18HealthExperienceUI31EditFavoritesCollectionViewCell *v2;
  char v3;

  v2 = self;
  v3 = sub_1A9636650();

  return v3 & 1;
}

- (_TtC18HealthExperienceUI31EditFavoritesCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI31EditFavoritesCollectionViewCell *)sub_1A96367A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI31EditFavoritesCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI31EditFavoritesCollectionViewCell *)sub_1A963692C(a3);
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell_textStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell____lazy_storage___font));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell____lazy_storage___imageForUnpinnedState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell____lazy_storage___imageForPinnedState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell____lazy_storage___accessoryImageView));
}

@end
