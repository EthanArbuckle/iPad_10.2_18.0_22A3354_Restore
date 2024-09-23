@implementation DataTypeDetailFavoritesCell

- (_TtC18HealthExperienceUI27DataTypeDetailFavoritesCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI27DataTypeDetailFavoritesCell *)sub_1A97BFE9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI27DataTypeDetailFavoritesCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI27DataTypeDetailFavoritesCell *)sub_1A97BFFB0(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI27DataTypeDetailFavoritesCell *v8;
  uint64_t v9;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  sub_1A97C00BC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_1A9761AD0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeDetailFavoritesCell_item, (uint64_t)&qword_1ED27B9E0, (uint64_t)&qword_1ED27B9D0, MEMORY[0x1E0D2A060], (uint64_t (*)(_QWORD))sub_1A961F3D8);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeDetailFavoritesCell_textStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeDetailFavoritesCell____lazy_storage___imageForUnpinnedState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeDetailFavoritesCell____lazy_storage___imageForPinnedState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeDetailFavoritesCell____lazy_storage___accessoryImageView));
}

@end
