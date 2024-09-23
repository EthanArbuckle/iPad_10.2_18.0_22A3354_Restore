@implementation GEOMapAccessBuilding

- (GEOMapAccessBuilding)initWithBuildingFeature:(id)a3
{
  id v5;
  GEOMapAccessBuilding *v6;
  GEOMapAccessBuilding *v7;
  void *v8;
  NSArray *v9;
  unint64_t v10;
  GEOMapAccessBuildingSection *v11;
  NSArray *sections;
  GEOMapAccessBuilding *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapAccessBuilding;
  v6 = -[GEOMapAccessBuilding init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_buildingFeature, a3);
    -[GEOBuildingFootprintFeature feature](v7->_buildingFeature, "feature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "sectionCount"));
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "sectionCount"))
    {
      v10 = 0;
      do
      {
        v11 = -[GEOMapAccessBuildingSection initWithFeature:sectionIndex:]([GEOMapAccessBuildingSection alloc], "initWithFeature:sectionIndex:", v5, v10);
        -[NSArray addObject:](v9, "addObject:", v11);

        ++v10;
      }
      while (v10 < objc_msgSend(v8, "sectionCount"));
    }
    sections = v7->_sections;
    v7->_sections = v9;

    v13 = v7;
  }

  return v7;
}

- (void)dealloc
{
  GEOBuildingFootprintFeature *buildingFeature;
  objc_super v4;

  buildingFeature = self->_buildingFeature;
  if (buildingFeature)
  {
    self->_buildingFeature = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)GEOMapAccessBuilding;
  -[GEOMapAccessBuilding dealloc](&v4, sel_dealloc);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_buildingFeature, 0);
}

@end
