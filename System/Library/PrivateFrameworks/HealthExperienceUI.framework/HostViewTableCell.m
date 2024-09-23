@implementation HostViewTableCell

- (_TtC18HealthExperienceUI17HostViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)_sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC18HealthExperienceUI17HostViewTableCell *)HostViewTableCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC18HealthExperienceUI17HostViewTableCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI17HostViewTableCell *)HostViewTableCell.init(coder:)(a3);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC18HealthExperienceUI17HostViewTableCell *v9;
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
  sub_1A962BB54(&OBJC_IVAR____TtC18HealthExperienceUI17HostViewTableCell_hostView, type metadata accessor for HostViewTableCell, width, height, a4, a5);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
  sub_1A962BFD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18HealthExperienceUI17HostViewTableCell_hostView, &OBJC_IVAR____TtC18HealthExperienceUI17HostViewTableCell_item, &OBJC_IVAR____TtC18HealthExperienceUI17HostViewTableCell_sectionContext);
}

@end
