@implementation CCUIModuleContentMetrics

- (UIImageSymbolConfiguration)symbolConfiguration
{
  return (UIImageSymbolConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___CCUIModuleContentMetrics_symbolConfiguration));
}

- (UIFont)symbolFont
{
  return (UIFont *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___CCUIModuleContentMetrics_symbolFont));
}

- (double)symbolScaleFactor
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_symbolScaleFactor);
}

- (double)metricsScaleFactor
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_metricsScaleFactor);
}

- (CCUIGridGeometryInfo)gridGeometryInfo
{
  double v2;
  double v3;
  CCUIGridGeometryInfo result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_gridGeometryInfo);
  v3 = *(double *)&self->symbolConfiguration[OBJC_IVAR___CCUIModuleContentMetrics_gridGeometryInfo];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (double)gridUnitDimension
{
  double result;

  -[CCUIModuleContentMetrics gridGeometryInfo](self, sel_gridGeometryInfo);
  return result;
}

- (double)gridUnitSpacing
{
  double v2;

  -[CCUIModuleContentMetrics gridGeometryInfo](self, sel_gridGeometryInfo);
  return v2;
}

- (CCUIModuleContentMetrics)initWithSymbolConfiguration:(id)a3 symbolFont:(id)a4 symbolScaleFactor:(double)a5 metricsScaleFactor:(double)a6 gridGeometryInfo:(CCUIGridGeometryInfo)a7
{
  id v8;
  id v9;
  objc_super v11;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_symbolConfiguration) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_symbolFont) = (Class)a4;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_symbolScaleFactor) = a5;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_metricsScaleFactor) = a6;
  *(CCUIGridGeometryInfo *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_gridGeometryInfo) = a7;
  v11.receiver = self;
  v11.super_class = (Class)CCUIModuleContentMetrics;
  v8 = a3;
  v9 = a4;
  return -[CCUIModuleContentMetrics init](&v11, sel_init);
}

+ (id)defaultMetricsForGridGeometryInfo:(CCUIGridGeometryInfo)a3
{
  double var1;
  double var0;

  var1 = a3.var1;
  var0 = a3.var0;
  swift_getObjCClassMetadata();
  return sub_1D03183CC(var0, var1);
}

- (NSString)description
{
  CCUIModuleContentMetrics *v2;
  void *v3;

  v2 = self;
  CCUIModuleContentMetrics.description.getter();

  v3 = (void *)sub_1D031D52C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CCUIModuleContentMetrics)init
{
  CCUIModuleContentMetrics *result;

  result = (CCUIModuleContentMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
