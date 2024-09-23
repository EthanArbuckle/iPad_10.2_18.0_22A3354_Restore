@implementation GEOMapFeatureBuilding

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GEOMapFeatureBuilding;
  -[GEOMapFeatureBuilding dealloc](&v2, sel_dealloc);
}

- (NSArray)sections
{
  return self->_sections;
}

- (unint64_t)buildingID
{
  return self->_buildingID;
}

- (int)tileSetStyle
{
  return self->_tileSetStyle;
}

- (BOOL)hasTerrainElevation
{
  return self->_hasTerrainElevation;
}

- (unint64_t)materialID
{
  return self->_materialID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_tile, 0);
}

- (GEOMapFeatureBuilding)initWithFeature:(id)a3
{
  id v5;
  GEOMapFeatureBuilding *v6;
  GEOMapFeatureBuilding *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  unint64_t i;
  void *v12;
  unint64_t v13;
  GEOMapFeatureBuildingSection *v14;
  NSArray *sections;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapFeatureBuilding;
  v6 = -[GEOMapFeatureBuilding init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feature, a3);
    v7->_tileSetStyle = 0;
    v8 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v5, "feature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "sectionCount"));
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

    for (i = 0; ; ++i)
    {
      objc_msgSend(v5, "feature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "sectionCount");

      if (i >= v13)
        break;
      v14 = -[GEOMapFeatureBuildingSection initWithFeature:sectionIndex:]([GEOMapFeatureBuildingSection alloc], "initWithFeature:sectionIndex:", v5, i);
      -[NSArray addObject:](v10, "addObject:", v14);

    }
    sections = v7->_sections;
    v7->_sections = v10;

    v7->_hasTerrainElevation = 0;
  }

  return v7;
}

- (GEOMapFeatureBuilding)initWithDaVinciTile:(id)a3 buildingIndex:(unint64_t)a4
{
  id v7;
  GEOMapFeatureBuilding *v8;
  GEOMapFeatureBuilding *v9;
  id *p_tile;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t v15;
  NSArray *v16;
  uint64_t v17;
  GEOMapFeatureBuildingSection *v18;
  NSArray *sections;
  unint64_t *v20;
  unint64_t v21;
  _BYTE v23[21];
  objc_super v24;

  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOMapFeatureBuilding;
  v8 = -[GEOMapFeatureBuilding init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    p_tile = (id *)&v8->_tile;
    objc_storeStrong((id *)&v8->_tile, a3);
    v9->_tileSetStyle = 1;
    if (objc_msgSend(v7, "daVinciBuildingCount") > a4)
    {
      v11 = objc_msgSend(v7, "daVinciBuildings");
      v12 = *(std::__shared_weak_count **)(v11 + 40 * a4 + 8);
      if (v12)
      {
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          v14 = __ldxr(p_shared_owners);
        while (__stxr(v14 + 1, p_shared_owners));
      }
      v15 = v11 + 40 * a4;
      *(_QWORD *)&v23[13] = *(_QWORD *)(v15 + 29);
      *(_OWORD *)v23 = *(_OWORD *)(v15 + 16);
      v9->_buildingID = *(_QWORD *)&v23[8];
      v9->_materialID = *(_QWORD *)v23;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(unsigned __int16 *)&v23[18]);
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (*(_WORD *)&v23[18])
      {
        v17 = 0;
        do
        {
          v18 = -[GEOMapFeatureBuildingSection initWithDaVinciTile:buildingIndex:sectionIndex:]([GEOMapFeatureBuildingSection alloc], "initWithDaVinciTile:buildingIndex:sectionIndex:", v7, a4, v17);
          -[NSArray addObject:](v16, "addObject:", v18);

          ++v17;
        }
        while (*(unsigned __int16 *)&v23[18] != v17);
      }
      sections = v9->_sections;
      v9->_sections = v16;

      if (v12)
      {
        v20 = (unint64_t *)&v12->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
    v9->_hasTerrainElevation = objc_msgSend(*p_tile, "buildingsHaveTerrainElevation");
  }

  return v9;
}

@end
