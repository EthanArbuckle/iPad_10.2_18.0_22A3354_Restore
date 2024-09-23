@implementation NSMeasurement(GEOExtras)

+ (id)_geo_distanceMeasurementForMeters:()GEOExtras
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3758]);
  objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDoubleValue:unit:", v3, a1);

  return v4;
}

@end
