@implementation CLSRegionOfInterestQueryPerformer

- (CLSRegionOfInterestQueryPerformer)initWithROICache:(id)a3 locationCache:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSRegionOfInterestQueryPerformer;
  return -[CLSBusinessItemGenericQueryPerformer initWithBusinessCategoryCache:locationCache:](&v5, sel_initWithBusinessCategoryCache_locationCache_, a3, a4);
}

+ (double)defaultPrecision
{
  return 1000.0;
}

+ (id)categories
{
  return +[CLSNewLocationInformant regionOfInterestCategories](CLSNewLocationInformant, "regionOfInterestCategories");
}

@end
