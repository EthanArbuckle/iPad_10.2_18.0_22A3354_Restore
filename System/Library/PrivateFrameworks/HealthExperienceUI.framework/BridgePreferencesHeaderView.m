@implementation BridgePreferencesHeaderView

- (_TtC18HealthExperienceUI27BridgePreferencesHeaderView)initWithSpecifier:(id)a3
{
  return (_TtC18HealthExperienceUI27BridgePreferencesHeaderView *)BridgePreferencesHeaderView.init(specifier:)(a3);
}

- (_TtC18HealthExperienceUI27BridgePreferencesHeaderView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BridgePreferencesHeaderView();
  return -[BridgePreferencesHeaderView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC18HealthExperienceUI27BridgePreferencesHeaderView)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI27BridgePreferencesHeaderView *result;

  result = (_TtC18HealthExperienceUI27BridgePreferencesHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  _TtC18HealthExperienceUI27BridgePreferencesHeaderView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = self;
  -[BridgePreferencesHeaderView directionalLayoutMargins](v4, sel_directionalLayoutMargins);
  v6 = a3 - v5;
  -[BridgePreferencesHeaderView directionalLayoutMargins](v4, sel_directionalLayoutMargins);
  v8 = v6 - v7;
  LODWORD(v9) = 1148846080;
  LODWORD(v7) = 1112014848;
  -[BridgePreferencesHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v4, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v8, 0.0, v9, v7);
  v11 = v10;

  return v11;
}

@end
