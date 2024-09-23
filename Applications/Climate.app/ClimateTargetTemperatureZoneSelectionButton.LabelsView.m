@implementation ClimateTargetTemperatureZoneSelectionButton.LabelsView

- (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView)init
{
  return (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView *)sub_10000CAE4();
}

- (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView *result;

  v5 = OBJC_IVAR____TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView_temperatureLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010008BA30, "Climate/ClimateTargetTemperatureZoneSelectionButton.swift", 57, 2, 255, 0);
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ClimateTargetTemperatureZoneSelectionButton.LabelsView();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[ClimateTargetTemperatureZoneSelectionButton.LabelsView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_100006B04(0, (unint64_t *)&qword_1000B75A0, UIView_ptr);
    v11 = v7;
    v7 = v10;
    LOBYTE(v10) = static NSObject.== infix(_:_:)(v7);

    if ((v10 & 1) == 0)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView)initWithFrame:(CGRect)a3
{
  _TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView *result;

  result = (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView *)_swift_stdlib_reportUnimplementedInitializer("Climate.LabelsView", 18, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView_temperatureLabel));
}

@end
