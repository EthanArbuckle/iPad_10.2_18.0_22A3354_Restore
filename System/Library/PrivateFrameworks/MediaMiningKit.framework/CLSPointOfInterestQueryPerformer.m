@implementation CLSPointOfInterestQueryPerformer

- (CLSPointOfInterestQueryPerformer)initWithPOICache:(id)a3 locationCache:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSPointOfInterestQueryPerformer;
  return -[CLSBusinessItemGenericQueryPerformer initWithBusinessCategoryCache:locationCache:](&v5, sel_initWithBusinessCategoryCache_locationCache_, a3, a4);
}

- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4
{
  id v6;
  id v7;
  double v8;
  BOOL v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "radius");
  if (v8 <= 20.0)
  {
    v11.receiver = self;
    v11.super_class = (Class)CLSPointOfInterestQueryPerformer;
    v9 = -[CLSBusinessItemGenericQueryPerformer shouldQueryItemsForRegion:selectedRegions:](&v11, sel_shouldQueryItemsForRegion_selectedRegions_, v6, v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (double)defaultPrecision
{
  return 100.0;
}

+ (id)categories
{
  return +[CLSNewLocationInformant pointOfInterestCategories](CLSNewLocationInformant, "pointOfInterestCategories");
}

@end
