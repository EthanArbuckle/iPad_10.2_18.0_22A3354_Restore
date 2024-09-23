@implementation ProfileSharingWithYouTileCell

- (_TtC18HealthExperienceUI29ProfileSharingWithYouTileCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI29ProfileSharingWithYouTileCell *)sub_1A97D660C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI29ProfileSharingWithYouTileCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A97DE478();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI29ProfileSharingWithYouTileCell *v6;

  v5 = a3;
  v6 = self;
  sub_1A97D7738((uint64_t)a3);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileSharingWithYouTileCell____lazy_storage___gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileSharingWithYouTileCell____lazy_storage___nameHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileSharingWithYouTileCell____lazy_storage___tileContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileSharingWithYouTileCell____lazy_storage___spinner));
  sub_1A97A6764((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29ProfileSharingWithYouTileCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0, MEMORY[0x1E0D2A060]);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI29ProfileSharingWithYouTileCell *v8;
  uint64_t v9;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  sub_1A97D930C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
