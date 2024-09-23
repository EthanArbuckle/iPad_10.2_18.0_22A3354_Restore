@implementation SummaryHeaderProfileAvatarImageCell

- (void)showProfileViewController
{
  _TtC18HealthExperienceUI35SummaryHeaderProfileAvatarImageCell *v2;

  v2 = self;
  sub_1A988161C();

}

- (_TtC18HealthExperienceUI35SummaryHeaderProfileAvatarImageCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SummaryHeaderProfileAvatarImageCell();
  return -[ProfileAvatarImageCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI35SummaryHeaderProfileAvatarImageCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SummaryHeaderProfileAvatarImageCell();
  return -[ProfileAvatarImageCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
