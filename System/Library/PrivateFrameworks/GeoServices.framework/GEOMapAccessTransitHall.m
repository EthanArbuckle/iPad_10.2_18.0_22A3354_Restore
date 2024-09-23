@implementation GEOMapAccessTransitHall

- (unint64_t)stationID
{
  unint64_t *v2;

  v2 = *(unint64_t **)(*((_QWORD *)self->super._node.__ptr_ + 5) + 256);
  if (v2)
    return *v2;
  else
    return 0;
}

- (id)findStation:(id)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  GEOMapAccess *map;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  GEOMapAccessTransitHall *v19;
  void (**v20)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!self->_station)
  {
    v10 = *(uint64_t **)(*((_QWORD *)self->super._node.__ptr_ + 5) + 256);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        v15 = MEMORY[0x1E0C809B0];
        v16 = 3221225472;
        v17 = __57__GEOMapAccessTransitHall_findStation_completionHandler___block_invoke;
        v18 = &unk_1E1C02B58;
        v19 = self;
        v20 = v6;
        v12 = (void *)MEMORY[0x18D765024](&v15);
        map = self->super._map;
        -[GEOMapAccessTransitNodeBase coordinate](self, "coordinate", v15, v16, v17, v18, v19);
        -[GEOMapAccess findTransitStationWithID:near:stationHandler:completionHandler:](map, "findTransitStationWithID:near:stationHandler:completionHandler:", v11, v12, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
    if (v7)
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
      v9 = 0;
      goto LABEL_12;
    }
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if (v6)
    v6[2](v6);
  if (!v8)
    goto LABEL_11;
  v8[2](v8, 0);
  v9 = 0;
LABEL_12:

  return v9;
}

void __57__GEOMapAccessTransitHall_findStation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

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
    v16[2] = __55__GEOMapAccessTransitHall_findStops_completionHandler___block_invoke;
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

uint64_t __55__GEOMapAccessTransitHall_findStops_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_station, 0);
}

@end
