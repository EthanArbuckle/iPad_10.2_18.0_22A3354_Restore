@implementation HKBreathingDisturbancesAxis

+ (id)standardAxisWith:(id)a3
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for BreathingDisturbancesAxis());
  return BreathingDisturbancesAxis.init(displayType:)(a3);
}

- (HKBreathingDisturbancesAxis)initWithDisplayType:(id)a3
{
  return (HKBreathingDisturbancesAxis *)BreathingDisturbancesAxis.init(displayType:)(a3);
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5;
  HKBreathingDisturbancesAxis *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = self;
  v7 = sub_1D7B2D3C0(v5);

  if (v7)
  {
    sub_1D7AEB688();
    v8 = (void *)sub_1D7B4A4A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)adjustValueRangeForLabels:(id)a3
{
  id v4;
  HKBreathingDisturbancesAxis *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1D7B2CAFC(v4);

  return v6;
}

- (HKBreathingDisturbancesAxis)initWithConfiguration:(id)a3
{
  id v3;
  HKBreathingDisturbancesAxis *result;

  v3 = a3;
  result = (HKBreathingDisturbancesAxis *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
