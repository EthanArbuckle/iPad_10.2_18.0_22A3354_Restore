@implementation ThresholdSpecifierViewControllerCell

- (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v5;
  _TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell *v6;
  objc_super v8;

  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v5 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ThresholdSpecifierViewControllerCell();
  v6 = -[ThresholdSpecifierViewControllerCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 3, v5);

  return v6;
}

- (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell *result;

  if (a4)
  {
    v7 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a5;
  sub_1A96F678C(a3, v7, v9, a5);
  return result;
}

- (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell *result;

  result = (_TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI36ThresholdSpecifierViewControllerCell *v6;

  v5 = a3;
  v6 = self;
  sub_1A96F69E8(a3);

}

@end
