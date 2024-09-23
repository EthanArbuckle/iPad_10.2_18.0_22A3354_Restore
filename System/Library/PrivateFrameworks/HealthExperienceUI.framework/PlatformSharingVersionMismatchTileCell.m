@implementation PlatformSharingVersionMismatchTileCell

- (_TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell *)sub_1A9959D28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell_tileView));
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI38PlatformSharingVersionMismatchTileCell_item);
}

@end
