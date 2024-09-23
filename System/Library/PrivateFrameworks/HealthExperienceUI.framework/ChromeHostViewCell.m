@implementation ChromeHostViewCell

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC18HealthExperienceUI18ChromeHostViewCell *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  sub_1A9706B74(width, height, a4, a5);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (_TtC18HealthExperienceUI18ChromeHostViewCell)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for ChromeHostViewCell(0);
  return -[HostViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI18ChromeHostViewCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI18ChromeHostViewCell *)sub_1A9707460(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ChromeHostViewCell);
}

@end
