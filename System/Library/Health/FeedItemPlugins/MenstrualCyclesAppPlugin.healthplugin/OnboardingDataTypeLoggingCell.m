@implementation OnboardingDataTypeLoggingCell

- (_TtC24MenstrualCyclesAppPlugin29OnboardingDataTypeLoggingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  _TtC24MenstrualCyclesAppPlugin29OnboardingDataTypeLoggingCell *v7;
  objc_super v9;

  if (a4)
  {
    _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    v6 = (void *)sub_231CA1BD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for OnboardingDataTypeLoggingCell();
  v7 = -[DataTypeLoggingCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, v6);

  return v7;
}

- (_TtC24MenstrualCyclesAppPlugin29OnboardingDataTypeLoggingCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OnboardingDataTypeLoggingCell();
  return -[DataTypeLoggingCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
