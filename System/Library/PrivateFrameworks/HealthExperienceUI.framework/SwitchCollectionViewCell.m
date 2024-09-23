@implementation SwitchCollectionViewCell

- (_TtC18HealthExperienceUI24SwitchCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI24SwitchCollectionViewCell *)sub_1A96A1B54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI24SwitchCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A96A4100();
}

- (void)switchTapped
{
  _TtC18HealthExperienceUI24SwitchCollectionViewCell *v2;

  v2 = self;
  sub_1A96A1D4C();

}

- (BOOL)isHighlighted
{
  return 0;
}

- (BOOL)isSelected
{
  return 0;
}

- (void).cxx_destruct
{
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCollectionViewCell_switchView));
  swift_bridgeObjectRelease();
  sub_1A9623874((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCollectionViewCell____lazy_storage___imageAccessory, (uint64_t (*)(_QWORD))sub_1A96A3FEC);
  sub_1A9623874((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24SwitchCollectionViewCell____lazy_storage___switchViewAccessory, (uint64_t (*)(_QWORD))sub_1A96A2468);
}

@end
