@implementation CLSNatureQueryPerformer

- (CLSNatureQueryPerformer)initWithNatureCache:(id)a3 locationCache:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSNatureQueryPerformer;
  return -[CLSBusinessItemGenericQueryPerformer initWithBusinessCategoryCache:locationCache:](&v5, sel_initWithBusinessCategoryCache_locationCache_, a3, a4);
}

- (BOOL)shouldQueryItemsForRegion:(id)a3 selectedRegions:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  BOOL v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLSNatureQueryPerformer;
  if (-[CLSBusinessItemGenericQueryPerformer shouldQueryItemsForRegion:selectedRegions:](&v16, sel_shouldQueryItemsForRegion_selectedRegions_, v6, a4))
  {
    v7 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(v6, "center");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "initWithCenter:radius:identifier:", v12, v9, v11, 1000.0);

    v14 = -[CLSBusinessCategoryCache numberOfBusinessItemsForRegion:](self->super._businessCategoryCache, "numberOfBusinessItemsForRegion:", v13) < 0x96;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (double)defaultPrecision
{
  return 20000.0;
}

+ (id)categories
{
  return +[CLSNewLocationInformant natureCategories](CLSNewLocationInformant, "natureCategories");
}

@end
