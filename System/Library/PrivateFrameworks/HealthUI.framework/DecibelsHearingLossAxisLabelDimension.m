@implementation DecibelsHearingLossAxisLabelDimension

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v6;
  _TtC8HealthUI37DecibelsHearingLossAxisLabelDimension *v7;
  id v8;
  double v9;
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = self;
  v8 = a4;
  objc_msgSend(v6, sel_doubleValue);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, -v9);
  v14.receiver = v7;
  v14.super_class = (Class)type metadata accessor for DecibelsHearingLossAxisLabelDimension();
  v11 = -[HKAxisLabelDimensionScalar stringForLocation:formatterForStepSize:](&v14, sel_stringForLocation_formatterForStepSize_, v10, v8);

  if (v11)
  {
    sub_1D7B4A3BC();

    v12 = (void *)sub_1D7B4A38C();
    swift_bridgeObjectRelease();
  }
  else
  {

    v12 = 0;
  }
  return v12;
}

- (_TtC8HealthUI37DecibelsHearingLossAxisLabelDimension)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DecibelsHearingLossAxisLabelDimension();
  return -[DecibelsHearingLossAxisLabelDimension init](&v3, sel_init);
}

@end
