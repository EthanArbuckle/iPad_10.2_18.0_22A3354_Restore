@implementation GEOMapAccessTransitStation

- (id)findStops:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  GEOMapAccess *map;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    map = self->super._map;
    v9 = -[GEOMapAccessTransitNodeBase transitID](self, "transitID");
    -[GEOMapAccessTransitNodeBase coordinate](self, "coordinate");
    v11 = v10;
    v13 = v12;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__GEOMapAccessTransitStation_findStops_completionHandler___block_invoke;
    v16[3] = &unk_1E1C02B30;
    v17 = v6;
    -[GEOMapAccess findTransitPointWithParentID:near:type:pointHandler:completionHandler:](map, "findTransitPointWithParentID:near:type:pointHandler:completionHandler:", v9, 2, v16, v7, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __58__GEOMapAccessTransitStation_findStops_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)findAccessPoints:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  GEOMapAccess *map;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    map = self->super._map;
    v9 = -[GEOMapAccessTransitNodeBase transitID](self, "transitID");
    -[GEOMapAccessTransitNodeBase coordinate](self, "coordinate");
    v11 = v10;
    v13 = v12;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__GEOMapAccessTransitStation_findAccessPoints_completionHandler___block_invoke;
    v16[3] = &unk_1E1C02B30;
    v17 = v6;
    -[GEOMapAccess findTransitPointWithParentID:near:type:pointHandler:completionHandler:](map, "findTransitPointWithParentID:near:type:pointHandler:completionHandler:", v9, 1, v16, v7, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __65__GEOMapAccessTransitStation_findAccessPoints_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
