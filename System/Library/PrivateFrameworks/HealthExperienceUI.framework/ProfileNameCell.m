@implementation ProfileNameCell

- (_TtC18HealthExperienceUI15ProfileNameCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI15ProfileNameCell *)ProfileNameCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI15ProfileNameCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI15ProfileNameCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI15ProfileNameCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameCell_profileNameView));
  sub_1A9761AD0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameCell_item, (uint64_t)&qword_1ED27B9E0, (uint64_t)&qword_1ED27B9D0, MEMORY[0x1E0D2A060], (uint64_t (*)(_QWORD))sub_1A961F3D8);
}

@end
