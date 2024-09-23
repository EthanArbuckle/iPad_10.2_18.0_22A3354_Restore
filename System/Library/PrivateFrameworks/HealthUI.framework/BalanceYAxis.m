@implementation BalanceYAxis

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5;
  _TtC8HealthUI12BalanceYAxis *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = self;
  v7 = sub_1D7B307C8(v5);

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

- (_TtC8HealthUI12BalanceYAxis)initWithConfiguration:(id)a3
{
  id v3;
  _TtC8HealthUI12BalanceYAxis *result;

  v3 = a3;
  result = (_TtC8HealthUI12BalanceYAxis *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
