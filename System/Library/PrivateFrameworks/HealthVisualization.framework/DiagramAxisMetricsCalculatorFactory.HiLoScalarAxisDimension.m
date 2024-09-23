@implementation DiagramAxisMetricsCalculatorFactory.HiLoScalarAxisDimension

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  _TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = self;
  v7 = a3;
  v8 = a4;
  sub_1BCA1F9F8(a3);
  v10 = v9;

  if (v10)
  {
    v11 = (void *)sub_1BCAB5EE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (_TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension)init
{
  _TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension *result;

  result = (_TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension_displayType));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension_valueFormatter));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension_unitPreferenceController));
}

@end
