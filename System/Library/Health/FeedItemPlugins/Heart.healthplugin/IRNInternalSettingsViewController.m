@implementation IRNInternalSettingsViewController

- (id)makeFeatureStateViewControllerForFeatureIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = objc_allocWithZone((Class)sub_2314133C0());
  v5 = a3;
  return (id)sub_2314133B4();
}

- (_TtC5Heart33IRNInternalSettingsViewController)initWithHealthStore:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IRNInternalSettingsViewController();
  return -[WDAtrialFibrillationInternalSettingsViewController initWithHealthStore:](&v5, sel_initWithHealthStore_, a3);
}

@end
