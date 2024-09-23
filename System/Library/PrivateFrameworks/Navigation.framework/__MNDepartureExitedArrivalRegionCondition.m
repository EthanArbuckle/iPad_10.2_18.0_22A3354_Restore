@implementation __MNDepartureExitedArrivalRegionCondition

- (__MNDepartureExitedArrivalRegionCondition)initWithUpdater:(id)a3 arrivalRegions:(id)a4
{
  id v6;
  id v7;
  __MNDepartureExitedArrivalRegionCondition *v8;
  __MNDepartureExitedArrivalRegionCondition *v9;
  uint64_t v10;
  NSMutableArray *regionDepartureHistory;
  __MNDepartureExitedArrivalRegionCondition *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)__MNDepartureExitedArrivalRegionCondition;
  v8 = -[__MNDepartureExitedArrivalRegionCondition init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_updater, v6);
    objc_storeStrong((id *)&v9->_arrivalRegions, a4);
    v9->_numHistoricalLocations = GEOConfigGetUInteger();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9->_numHistoricalLocations);
    regionDepartureHistory = v9->_regionDepartureHistory;
    v9->_regionDepartureHistory = (NSMutableArray *)v10;

    v12 = v9;
  }

  return v9;
}

- (double)scoreForLocation:(id)a3
{
  id v4;
  id WeakRetained;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  char v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  void *v34;
  int v35;
  double v36;
  __MNDepartureExitedArrivalRegionCondition *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_updater);

  if (!WeakRetained)
  {
    v29 = -1.0;
    goto LABEL_30;
  }
  if (-[NSMutableArray count](self->_regionDepartureHistory, "count") > self->_numHistoricalLocations - 1)
    -[NSMutableArray removeObjectAtIndex:](self->_regionDepartureHistory, "removeObjectAtIndex:", 0);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = self->_arrivalRegions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v7)
  {

LABEL_21:
    v28 = MEMORY[0x1E0C9AAA0];
    goto LABEL_22;
  }
  v8 = v7;
  v38 = self;
  v9 = 0;
  v10 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v40 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      if (objc_msgSend(v12, "arrivalRegionAction") == 5
        || objc_msgSend(v12, "arrivalRegionAction") == 2)
      {
        objc_msgSend(v4, "roadMatch");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "arrivalRegion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v4, "roadMatch");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "coordinateOnRoad");
          v17 = v16;
          v19 = v18;
          objc_msgSend(v4, "roadMatch");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "roadWidth");
          v22 = objc_msgSend(v14, "containsCoordinate:radius:", v17, v19, v21);

        }
        else
        {
          objc_msgSend(v4, "rawLocation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "coordinate");
          v24 = v23;
          v26 = v25;
          objc_msgSend(v4, "horizontalAccuracy");
          v22 = objc_msgSend(v14, "containsCoordinate:radius:", v24, v26, v27);
        }
        v9 |= v22 ^ 1;

      }
    }
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v8);

  self = v38;
  if ((v9 & 1) == 0)
    goto LABEL_21;
  v28 = MEMORY[0x1E0C9AAB0];
LABEL_22:
  -[NSMutableArray addObject:](self->_regionDepartureHistory, "addObject:", v28);
  v30 = (double)~(-1 << LODWORD(self->_numHistoricalLocations));
  v31 = -[NSMutableArray count](self->_regionDepartureHistory, "count");
  if (v31)
  {
    v32 = v31;
    v33 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_regionDepartureHistory, "objectAtIndex:", --v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "BOOLValue");

      v36 = (double)(1 << v32);
      if (!v35)
        v36 = -0.0;
      v33 = v33 + v36;
    }
    while (v32);
  }
  else
  {
    v33 = 0.0;
  }
  v29 = v33 / v30;
LABEL_30:

  return v29;
}

- (NSString)name
{
  return (NSString *)CFSTR("__MNDepartureExitedArrivalRegionCondition");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionDepartureHistory, 0);
  objc_storeStrong((id *)&self->_arrivalRegions, 0);
  objc_destroyWeak((id *)&self->_updater);
}

@end
