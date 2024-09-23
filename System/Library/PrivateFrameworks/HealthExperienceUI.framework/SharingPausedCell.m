@implementation SharingPausedCell

- (_TtC18HealthExperienceUI17SharingPausedCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI17SharingPausedCell *)SharingPausedCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI17SharingPausedCell)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC18HealthExperienceUI17SharingPausedCell *result;

  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI17SharingPausedCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = a3;

  result = (_TtC18HealthExperienceUI17SharingPausedCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17SharingPausedCell_tileView));
  sub_1A968DF64((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI17SharingPausedCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0, MEMORY[0x1E0D2A060]);
}

@end
