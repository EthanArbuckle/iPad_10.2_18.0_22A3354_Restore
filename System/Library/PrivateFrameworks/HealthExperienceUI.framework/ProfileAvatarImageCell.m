@implementation ProfileAvatarImageCell

- (_TtC18HealthExperienceUI22ProfileAvatarImageCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI22ProfileAvatarImageCell *)ProfileAvatarImageCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI22ProfileAvatarImageCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI22ProfileAvatarImageCell *)ProfileAvatarImageCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ProfileAvatarImageCell_avatarImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ProfileAvatarImageCell_bottomAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ProfileAvatarImageCell_topAnchorConstraint));
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22ProfileAvatarImageCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

@end
