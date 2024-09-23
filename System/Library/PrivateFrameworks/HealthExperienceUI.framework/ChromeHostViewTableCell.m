@implementation ChromeHostViewTableCell

- (_TtC18HealthExperienceUI23ChromeHostViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  _TtC18HealthExperienceUI23ChromeHostViewTableCell *v7;
  objc_super v9;

  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ChromeHostViewTableCell(0);
  v7 = -[HostViewTableCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, v6);

  return v7;
}

- (_TtC18HealthExperienceUI23ChromeHostViewTableCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI23ChromeHostViewTableCell *)sub_1A9707460(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ChromeHostViewTableCell);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC18HealthExperienceUI23ChromeHostViewTableCell *v9;
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
  sub_1A970758C(width, height, a4, a5);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

@end
