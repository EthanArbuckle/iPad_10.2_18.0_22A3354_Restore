@implementation MKTransitDeparturesDataProvider

- (MKTransitDeparturesDataProvider)initWithMapItem:(id)a3
{
  id v5;
  MKTransitDeparturesDataProvider *v6;
  MKTransitDeparturesDataProvider *v7;
  void *v8;
  void *v9;
  MKTransitItemIncidentsController *v10;
  MKTransitItemIncidentsController *incidentsController;
  NSMutableDictionary *v12;
  NSMutableDictionary *sectionControllers;
  NSMutableSet *v14;
  NSMutableSet *pagedSectionIdentifiers;
  NSMutableDictionary *v16;
  NSMutableDictionary *cachedSequencesForSection;
  uint64_t v18;
  NSMapTable *cachedDirectionsForSystem;
  uint64_t v20;
  NSMapTable *cachedSystemHasInactiveLines;
  MKTransitMapItemUpdater *v22;
  MKTransitMapItemUpdater *mapItemUpdater;
  uint64_t v24;
  GEOTransitSystem *selectedSystem;
  void *v26;
  void *v27;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MKTransitDeparturesDataProvider;
  v6 = -[MKTransitDeparturesDataProvider init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v7->_supportSystemSectionCollapsing = 1;
    -[MKTransitDeparturesDataProvider mapItem](v7, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_transitInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_wantsSystemSectionCollapsing = (unint64_t)objc_msgSend(v9, "systemsCount") > 1;

    v10 = -[MKTransitItemIncidentsController initWithMapItem:]([MKTransitItemIncidentsController alloc], "initWithMapItem:", v5);
    incidentsController = v7->_incidentsController;
    v7->_incidentsController = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionControllers = v7->_sectionControllers;
    v7->_sectionControllers = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pagedSectionIdentifiers = v7->_pagedSectionIdentifiers;
    v7->_pagedSectionIdentifiers = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedSequencesForSection = v7->_cachedSequencesForSection;
    v7->_cachedSequencesForSection = v16;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    cachedDirectionsForSystem = v7->_cachedDirectionsForSystem;
    v7->_cachedDirectionsForSystem = (NSMapTable *)v18;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v20 = objc_claimAutoreleasedReturnValue();
    cachedSystemHasInactiveLines = v7->_cachedSystemHasInactiveLines;
    v7->_cachedSystemHasInactiveLines = (NSMapTable *)v20;

    v22 = -[MKTransitMapItemUpdater initWithMapItem:delegate:]([MKTransitMapItemUpdater alloc], "initWithMapItem:delegate:", v7->_mapItem, v7);
    mapItemUpdater = v7->_mapItemUpdater;
    v7->_mapItemUpdater = v22;

    v7->_lastFailureDiagnosis = 0;
    -[MKTransitDeparturesDataProvider refreshStationSystems](v7, "refreshStationSystems");
    if (-[NSArray count](v7->_stationSystems, "count"))
    {
      -[NSArray firstObject](v7->_stationSystems, "firstObject");
      v24 = objc_claimAutoreleasedReturnValue();
      selectedSystem = v7->_selectedSystem;
      v7->_selectedSystem = (GEOTransitSystem *)v24;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v7, sel_reloadData, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v7, sel_reloadData, *MEMORY[0x1E0C998A0], 0);

  }
  return v7;
}

- (GEOMapItemTransitInfo)transitInfo
{
  void *v2;
  void *v3;

  -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transitInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemTransitInfo *)v3;
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    if (a3)
    {
      +[MKTransitItemReferenceDateUpdater referenceDate](MKTransitItemReferenceDateUpdater, "referenceDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitDeparturesDataProvider setDepartureCutoffDate:](self, "setDepartureCutoffDate:", v5);

    }
    -[MKTransitMapItemUpdater setActive:](self->_mapItemUpdater, "setActive:", v3);
  }
}

- (void)setSupportSystemSectionCollapsing:(BOOL)a3
{
  void *v4;
  void *v5;

  self->_supportSystemSectionCollapsing = a3;
  -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_transitInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wantsSystemSectionCollapsing = (unint64_t)objc_msgSend(v5, "systemsCount") > 1;

  -[MKTransitDeparturesDataProvider refreshSections](self, "refreshSections");
}

- (BOOL)allowsSystemSectionCollapsing
{
  return 0;
}

- (NSSet)disabledSections
{
  NSSet *disabledSections;
  NSSet *v4;
  NSSet *v5;

  disabledSections = self->_disabledSections;
  if (!disabledSections)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_disabledSections;
    self->_disabledSections = v4;

    disabledSections = self->_disabledSections;
  }
  return disabledSections;
}

- (void)refreshStationSystems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  int64_t v15;
  void *v16;
  BOOL v17;
  int v18;
  NSArray *v19;
  NSArray *stationSystems;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_transitInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 6, (_QWORD)v21))
        {
          -[MKTransitDeparturesDataProvider incidentsForSystemIncidentsSection:](self, "incidentsForSystemIncidentsSection:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count") != 0;

        }
        else
        {
          v14 = 0;
        }
        if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 4))
          v15 = -[MKTransitDeparturesDataProvider _numberOfDeparturesSectionsForSystem:](self, "_numberOfDeparturesSectionsForSystem:", v12);
        else
          v15 = 0;
        if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 7))
        {
          -[MKTransitDeparturesDataProvider _inactiveLinesForSystem:](self, "_inactiveLinesForSystem:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        if (objc_msgSend(v16, "count"))
          v17 = 0;
        else
          v17 = v15 <= 0;
        v18 = !v17 || v14;
        if (v18 == 1)
          objc_msgSend(v3, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v19 = (NSArray *)objc_msgSend(v3, "copy");
  stationSystems = self->_stationSystems;
  self->_stationSystems = v19;

}

- (void)refreshSections
{
  id v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *hiddenSections;
  NSArray *v8;
  void *v9;
  GEOTransitSystem *selectedSystem;
  GEOTransitSystem *v11;
  GEOTransitSystem *v12;
  uint64_t v13;
  id v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSMutableSet *v30;
  void *v31;
  NSDictionary *v32;
  NSDictionary *lineLookupBySection;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  _BOOL4 v39;
  id v40;
  uint64_t v41;
  MKTransitDeparturesDataProvider *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _QWORD v58[4];

  v58[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_transitInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[MKTransitDeparturesDataProvider _hasIncidentsSection](self, "_hasIncidentsSection"))
      objc_msgSend(v3, "addObject:", &unk_1E2158F50);
    if (-[MKTransitDeparturesDataProvider _hasPlaceCardMessageSection](self, "_hasPlaceCardMessageSection"))
      objc_msgSend(v3, "addObject:", &unk_1E2158F38);
    v37 = v3;
    if (self->_hiddenSections)
    {
      v39 = 0;
    }
    else
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      hiddenSections = self->_hiddenSections;
      self->_hiddenSections = v6;

      v39 = -[MKTransitDeparturesDataProvider allowsSystemSectionCollapsing](self, "allowsSystemSectionCollapsing");
    }
    -[MKTransitDeparturesDataProvider refreshStationSystems](self, "refreshStationSystems", v5);
    v8 = self->_stationSystems;
    v9 = v8;
    selectedSystem = self->_selectedSystem;
    if (selectedSystem
      || (-[NSArray firstObject](v8, "firstObject"),
          v11 = (GEOTransitSystem *)objc_claimAutoreleasedReturnValue(),
          v12 = self->_selectedSystem,
          self->_selectedSystem = v11,
          v12,
          (selectedSystem = self->_selectedSystem) != 0))
    {
      v58[0] = selectedSystem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v9;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v43)
    {
      v44 = 0;
      v41 = *(_QWORD *)v53;
      v42 = self;
      do
      {
        for (i = 0; i != v43; i = v29 + 1)
        {
          if (*(_QWORD *)v53 != v41)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 6))
          {
            -[MKTransitDeparturesDataProvider incidentsForSystemIncidentsSection:](self, "incidentsForSystemIncidentsSection:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count");

            if (v19)
              objc_msgSend(v17, "addObject:", &unk_1E2158F68);
          }
          if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 4))
          {
            v20 = -[MKTransitDeparturesDataProvider _numberOfDeparturesSectionsForSystem:](self, "_numberOfDeparturesSectionsForSystem:", v16);
            if (v20 >= 1)
            {
              do
              {
                objc_msgSend(v17, "addObject:", &unk_1E2158F80);
                --v20;
              }
              while (v20);
            }
          }
          v45 = v16;
          v46 = i;
          if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 7))
          {
            -[MKTransitDeparturesDataProvider _inactiveLinesForSystem:](self, "_inactiveLinesForSystem:", v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v21 = 0;
          }
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v22 = v21;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v49;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v49 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
                objc_msgSend(v17, "addObject:", &unk_1E2158F98);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, v28);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            }
            while (v24);
          }

          if (objc_msgSend(v17, "count"))
          {
            objc_msgSend(v17, "insertObject:atIndex:", &unk_1E2158FB0, 0);
            objc_msgSend(v40, "addObjectsFromArray:", v17);
            self = v42;
            v29 = v46;
            if (v39)
            {
              v30 = v42->_hiddenSections;
              -[MKTransitDeparturesDataProvider _identifierForSystem:](v42, "_identifierForSystem:", v45);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableSet addObject:](v30, "addObject:", v31);

            }
            ++v44;
          }
          else
          {
            self = v42;
            v29 = v46;
          }

        }
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v43);
    }
    else
    {
      v44 = 0;
    }

    v32 = (NSDictionary *)objc_msgSend(v14, "copy");
    lineLookupBySection = self->_lineLookupBySection;
    self->_lineLookupBySection = v32;

    v3 = v37;
    if (v44 || (objc_msgSend(v37, "containsObject:", &unk_1E2158F38) & 1) != 0)
      objc_msgSend(v37, "addObjectsFromArray:", v40);
    else
      objc_msgSend(v37, "addObject:", &unk_1E2158F38);
    v5 = v36;
    self->_wantsSystemSectionCollapsing = v44 > 1;
    if (!-[MKTransitDeparturesDataProvider allowsSystemSectionCollapsing](self, "allowsSystemSectionCollapsing"))
      -[NSMutableSet removeAllObjects](self->_hiddenSections, "removeAllObjects");
    if (-[MKTransitDeparturesDataProvider _hasConnectionsSection](self, "_hasConnectionsSection"))
      objc_msgSend(v37, "addObject:", &unk_1E2158FC8);
    objc_msgSend(v37, "addObject:", &unk_1E2158FE0);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __50__MKTransitDeparturesDataProvider_refreshSections__block_invoke;
    v47[3] = &unk_1E20DC688;
    v47[4] = self;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v47);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "filterUsingPredicate:", v34);

    objc_storeStrong((id *)&self->_sections, v37);
    -[MKTransitDeparturesDataProvider delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "transitDeparturesDataProviderDidReload:", self);

  }
  else
  {
    if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 1))
      objc_msgSend(v3, "addObject:", &unk_1E2158F38);
    objc_storeStrong((id *)&self->_sections, v3);
  }

}

uint64_t __50__MKTransitDeparturesDataProvider_refreshSections__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isSectionTypeEnabled:", objc_msgSend(a2, "integerValue"));
}

- (void)reloadData
{
  -[NSMutableDictionary removeAllObjects](self->_sectionControllers, "removeAllObjects");
  -[MKTransitDeparturesDataProvider refreshSections](self, "refreshSections");
}

- (int64_t)numberOfSections
{
  return -[NSMutableArray count](self->_sections, "count");
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;

  v5 = 0;
  switch(-[MKTransitDeparturesDataProvider sectionTypeAtIndex:](self, "sectionTypeAtIndex:"))
  {
    case 1:
    case 8:
      return 1;
    case 2:
      -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_transitInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "connections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      return v11;
    case 3:
      -[MKTransitDeparturesDataProvider incidentsForIncidentsSection](self, "incidentsForIncidentsSection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v13, "count");

      return v5;
    case 4:
    case 7:
      -[MKTransitDeparturesDataProvider _controllerForSection:](self, "_controllerForSection:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitDeparturesDataProvider systemForSection:](self, "systemForSection:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[MKTransitDeparturesDataProvider isHidingDeparturesForSystem:](self, "isHidingDeparturesForSystem:", v7))
      {

        return 0;
      }
      else
      {
        v14 = objc_msgSend(v6, "numberOfRows");

        return v14;
      }
    case 6:
      -[MKTransitDeparturesDataProvider systemForSection:](self, "systemForSection:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[MKTransitDeparturesDataProvider isHidingDeparturesForSystem:](self, "isHidingDeparturesForSystem:", v15))
      {
        v5 = 0;
      }
      else
      {
        -[MKTransitDeparturesDataProvider incidentsForSystemIncidentsSection:](self, "incidentsForSystemIncidentsSection:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v16, "count");

      }
      return v5;
    default:
      return v5;
  }
}

- (int64_t)sectionTypeAtIndex:(int64_t)a3
{
  void *v5;
  int64_t v6;

  if (a3 < 0 || -[MKTransitDeparturesDataProvider numberOfSections](self, "numberOfSections") <= a3)
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (int64_t)indexOfFirstSectionWithType:(int64_t)a3
{
  NSMutableArray *sections;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  sections = self->_sections;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__MKTransitDeparturesDataProvider_indexOfFirstSectionWithType___block_invoke;
  v6[3] = &unk_1E20DC6B0;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __63__MKTransitDeparturesDataProvider_indexOfFirstSectionWithType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "integerValue");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_isSectionTypeEnabled:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[MKTransitDeparturesDataProvider disabledSections](self, "disabledSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;

  return v6;
}

- (id)_identifierForSection:(int64_t)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *lineLookupBySection;
  void *v17;
  void *v18;

  switch(-[MKTransitDeparturesDataProvider sectionTypeAtIndex:](self, "sectionTypeAtIndex:"))
  {
    case 1:
      v5 = CFSTR("_mk_messageSection");
      return v5;
    case 2:
      v5 = CFSTR("_mk_connectionsSection");
      return v5;
    case 3:
      v5 = CFSTR("_mk_incidentsSection");
      return v5;
    case 4:
      -[MKTransitDeparturesDataProvider systemForSection:](self, "systemForSection:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "muid");
      -[MKTransitDeparturesDataProvider directionForSection:](self, "directionForSection:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("_mk_%@_%llu_%@_departure_section"), v8, v9, v10);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 5:
      -[MKTransitDeparturesDataProvider systemForSection:](self, "systemForSection:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitDeparturesDataProvider _identifierForSystem:](self, "_identifierForSystem:", v6);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 6:
      -[MKTransitDeparturesDataProvider systemForSection:](self, "systemForSection:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("_mk_%@_%llu_incidents"), v13, objc_msgSend(v11, "muid"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v5;
    case 7:
      -[MKTransitDeparturesDataProvider systemForSection:](self, "systemForSection:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v6, "muid");
      lineLookupBySection = self->_lineLookupBySection;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](lineLookupBySection, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("_mk_%@_%llu_%@_inactive_section"), v8, v15, v18);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_11:

      break;
    case 8:
      v5 = CFSTR("_mk_attributionSection");
      break;
    default:
      v5 = &stru_1E20DFC00;
      break;
  }
  return v5;
}

- (int64_t)_sectionForIdentifier:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  char v7;

  v4 = a3;
  if (-[MKTransitDeparturesDataProvider numberOfSections](self, "numberOfSections") < 1)
  {
LABEL_5:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = 0;
    while (1)
    {
      -[MKTransitDeparturesDataProvider _identifierForSection:](self, "_identifierForSection:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", v4);

      if ((v7 & 1) != 0)
        break;
      if (++v5 >= -[MKTransitDeparturesDataProvider numberOfSections](self, "numberOfSections"))
        goto LABEL_5;
    }
  }

  return v5;
}

- (BOOL)isHidingDeparturesForSystem:(id)a3
{
  NSMutableSet *hiddenSections;
  void *v4;

  hiddenSections = self->_hiddenSections;
  -[MKTransitDeparturesDataProvider _identifierForSystem:](self, "_identifierForSystem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(hiddenSections) = -[NSMutableSet containsObject:](hiddenSections, "containsObject:", v4);

  return (char)hiddenSections;
}

- (void)hideDeparturesForSystem:(id)a3 removedIndices:(id *)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[MKTransitDeparturesDataProvider _indexSetForHidingShowingSystem:](self, "_indexSetForHidingShowingSystem:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MKTransitDeparturesDataProvider _identifierForSystem:](self, "_identifierForSystem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObject:](self->_hiddenSections, "addObject:", v7);
  if (a4)
    *a4 = objc_retainAutorelease(v8);

}

- (void)showDeparturesForSystem:(id)a3 insertedIndices:(id *)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[MKTransitDeparturesDataProvider _identifierForSystem:](self, "_identifierForSystem:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](self->_hiddenSections, "removeObject:");
  -[MKTransitDeparturesDataProvider _indexSetForHidingShowingSystem:](self, "_indexSetForHidingShowingSystem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v7);

}

- (id)_indexSetForHidingShowingSystem:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[MKTransitDeparturesDataProvider _identifierForSystem:](self, "_identifierForSystem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MKTransitDeparturesDataProvider _sectionForIdentifier:](self, "_sectionForIdentifier:", v4) + 1;
  if (v5 >= -[NSMutableArray count](self->_sections, "count"))
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v5 + v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");

      if (v8 == 5)
        break;
      ++v6;
    }
    while (v5 + v6 < -[NSMutableArray count](self->_sections, "count"));
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isLastSectionForSystem:(id)a3
{
  void *v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  BOOL v13;

  -[MKTransitDeparturesDataProvider _identifierForSystem:](self, "_identifierForSystem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MKTransitDeparturesDataProvider _sectionForIdentifier:](self, "_sectionForIdentifier:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL
    && ((v6 = v5, v7 = v5 + 1, v5 < 0) || v7 < -[NSMutableArray count](self->_sections, "count"))
    && ((-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v7),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         v9 = objc_msgSend(v8, "integerValue"),
         v8,
         v9 != 7)
      ? (v10 = v9 == 4)
      : (v10 = 1),
        v10))
  {
    -[MKTransitDeparturesDataProvider systemForSection:](self, "systemForSection:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitDeparturesDataProvider systemForSection:](self, "systemForSection:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11 != v12;

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (id)directionForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v8;
  uint64_t v9;
  char v10;

  v10 = 0;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  -[MKTransitDeparturesDataProvider _systemForSection:directionIndex:](self, "_systemForSection:directionIndex:", a3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDeparturesDataProvider _directionsForSystem:hasSequencesWithNoDirection:](self, "_directionsForSystem:hasSequencesWithNoDirection:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "count");
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_2;
  v6 = 0;
  if (objc_msgSend(v5, "count"))
  {
    v8 = v9;
    if ((v9 & 0x8000000000000000) == 0)
    {
      if (v10)
      {
        if (v8 == objc_msgSend(v5, "count"))
        {
LABEL_2:
          v6 = 0;
          goto LABEL_3;
        }
        v8 = v9;
      }
      if (v8 < objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      goto LABEL_2;
    }
  }
LABEL_3:

  return v6;
}

- (void)showNextPageInSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[MKTransitDeparturesDataProvider _identifierForSection:](self, "_identifierForSection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NSMutableSet addObject:](self->_pagedSectionIdentifiers, "addObject:", v4);
    v4 = v5;
  }

}

- (void)setSelectedSystem:(id)a3
{
  GEOTransitSystem *v5;
  GEOTransitSystem *v6;

  v5 = (GEOTransitSystem *)a3;
  if (self->_selectedSystem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedSystem, a3);
    -[MKTransitDeparturesDataProvider refreshSections](self, "refreshSections");
    v5 = v6;
  }

}

- (id)_systemForSection:(int64_t)a3 directionIndex:(int64_t *)a4
{
  uint64_t v6;
  int64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  void *v19;
  id v20;
  int64_t v21;
  int64_t *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &unk_1E2158FB0);
  v7 = v6;
  if (a4)
    *a4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v30[0] = self->_selectedSystem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v22 = a4;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
        if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 4))
          v15 = -[MKTransitDeparturesDataProvider _numberOfDeparturesSectionsForSystem:](self, "_numberOfDeparturesSectionsForSystem:", v14);
        else
          v15 = 0;
        if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 6))
        {
          -[MKTransitDeparturesDataProvider incidentsForSystemIncidentsSection:](self, "incidentsForSystemIncidentsSection:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count") != 0;

        }
        else
        {
          v17 = 0;
        }
        v18 = v17 + v15;
        if (-[MKTransitDeparturesDataProvider _isSectionTypeEnabled:](self, "_isSectionTypeEnabled:", 7)
          && -[MKTransitDeparturesDataProvider _systemHasInactiveLines:](self, "_systemHasInactiveLines:", v14))
        {
          -[MKTransitDeparturesDataProvider _inactiveLinesForSystem:](self, "_inactiveLinesForSystem:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v18 += objc_msgSend(v19, "count") + 1;

        }
        if (v18)
        {
          v7 = v13 + v18 + 1;
          if (v7 > a3)
          {
            if (v22 && v15 >= 1)
            {
              v21 = ~(v17 + v13) + a3;
              if (v21 >= 0)
                *v22 = v21;
            }
            v20 = v14;
            goto LABEL_31;
          }
        }
        else
        {
          v7 = v13;
        }
        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_31:

  return v20;
}

- (id)systemForSection:(int64_t)a3
{
  return -[MKTransitDeparturesDataProvider _systemForSection:directionIndex:](self, "_systemForSection:directionIndex:", a3, 0);
}

- (id)_identifierForSystem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "muid");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("_mk_%@_%llu_system_section"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_directionsForSystem:(id)a3 hasSequencesWithNoDirection:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMapTable objectForKey:](self->_cachedDirectionsForSystem, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_transitInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitDeparturesDataProvider _blockedIncidentEntities](self, "_blockedIncidentEntities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__MKTransitDeparturesDataProvider__directionsForSystem_hasSequencesWithNoDirection___block_invoke;
    v15[3] = &unk_1E20DA950;
    v15[4] = self;
    objc_msgSend(v9, "departureSequenceContainersForSystem:excludingIncidentEntities:validForDateFromBlock:", v6, v10, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v16[0] = CFSTR("kCachedDirectionsDirectionsKey");
      v16[1] = CFSTR("kCachedDirectionsNoDirectionKey");
      v17[0] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable setObject:forKey:](self->_cachedDirectionsForSystem, "setObject:forKey:", v7, v6);
    }
    else
    {
      v7 = 0;
    }

  }
  if (a4)
    *a4 = 1;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCachedDirectionsDirectionsKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __84__MKTransitDeparturesDataProvider__directionsForSystem_hasSequencesWithNoDirection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_departureCutoffDateForSequence:", a2);
}

- (NSArray)incidents
{
  return (NSArray *)-[MKTransitItemIncidentsController validIncidents](self->_incidentsController, "validIncidents");
}

- (id)incidentsForIncidentsSection
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)incidentsForSystemIncidentsSection:(id)a3
{
  id v4;
  id v5;
  MKTransitItemIncidentsController *incidentsController;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  incidentsController = self->_incidentsController;
  -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitItemIncidentsController incidentsForMapItem:](incidentsController, "incidentsForMapItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "muid"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v11);
  }

  -[MKTransitItemIncidentsController incidentsForSystem:](self->_incidentsController, "incidentsForSystem:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v4;
  -[MKTransitItemIncidentsController incidentsForLinesInSystem:](self->_incidentsController, "incidentsForLinesInSystem:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v15;
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        if (objc_msgSend(v21, "isBlockingIncident"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v21, "muid"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v22);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v18);
  }
  -[MKTransitItemIncidentsController validIncidents](self->_incidentsController, "validIncidents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB3880];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __70__MKTransitDeparturesDataProvider_incidentsForSystemIncidentsSection___block_invoke;
  v32[3] = &unk_1E20DC6D8;
  v33 = v5;
  v25 = v5;
  objc_msgSend(v24, "predicateWithBlock:", v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filteredArrayUsingPredicate:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t __70__MKTransitDeparturesDataProvider_incidentsForSystemIncidentsSection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a2, "muid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)dominantIncidentForDepartureSequence:(id)a3
{
  void *v3;
  void *v4;

  -[MKTransitItemIncidentsController incidentsForDepartureSequence:](self->_incidentsController, "incidentsForDepartureSequence:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_hasIncidentsSection
{
  void *v2;
  BOOL v3;

  -[MKTransitDeparturesDataProvider incidentsForIncidentsSection](self, "incidentsForIncidentsSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)_blockedIncidentEntities
{
  return -[MKTransitItemIncidentsController blockedIncidentEntities](self->_incidentsController, "blockedIncidentEntities");
}

- (BOOL)isStuckWithExpiredInfo
{
  MKTransitMapItemUpdater *mapItemUpdater;
  void *v3;

  mapItemUpdater = self->_mapItemUpdater;
  -[MKTransitDeparturesDataProvider departureCutoffDate](self, "departureCutoffDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mapItemUpdater) = -[MKTransitMapItemUpdater isStuckWithExpiredInfoRelativeToDate:](mapItemUpdater, "isStuckWithExpiredInfoRelativeToDate:", v3);

  return (char)mapItemUpdater;
}

- (NSArray)sectionControllers
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_sectionControllers, "allValues");
}

- (id)_controllerForSection:(int64_t)a3
{
  void *v5;
  MKTransitInactiveLinesSectionController *v6;
  int64_t v7;
  MKTransitDeparturesSectionController *v8;
  void *v9;
  void *v10;
  void *v11;
  MKTransitInactiveLinesSectionController *v12;
  NSDictionary *lineLookupBySection;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[MKTransitDeparturesDataProvider _identifierForSection:](self, "_identifierForSection:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionControllers, "objectForKeyedSubscript:", v5);
  v6 = (MKTransitInactiveLinesSectionController *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_11;
  v7 = -[MKTransitDeparturesDataProvider sectionTypeAtIndex:](self, "sectionTypeAtIndex:", a3);
  if (v7 == 7)
  {
    v12 = [MKTransitInactiveLinesSectionController alloc];
    -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitDeparturesDataProvider systemForSection:](self, "systemForSection:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    lineLookupBySection = self->_lineLookupBySection;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](lineLookupBySection, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MKTransitInactiveLinesSectionController initWithMapItem:system:line:](v12, "initWithMapItem:system:line:", v9, v10, v14);

  }
  else
  {
    if (v7 != 4)
    {
      v6 = 0;
      goto LABEL_8;
    }
    v8 = [MKTransitDeparturesSectionController alloc];
    -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitDeparturesDataProvider systemForSection:](self, "systemForSection:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitDeparturesDataProvider directionForSection:](self, "directionForSection:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MKTransitDeparturesSectionController initWithMapItem:system:departureSequenceContainer:](v8, "initWithMapItem:system:departureSequenceContainer:", v9, v10, v11);
  }

LABEL_8:
  if (-[NSMutableSet containsObject:](self->_pagedSectionIdentifiers, "containsObject:", v5))
    -[MKTransitSectionController incrementPagingFilter](v6, "incrementPagingFilter");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionControllers, "setObject:forKeyedSubscript:", v6, v5);
LABEL_11:
  -[MKTransitDeparturesDataProvider departureCutoffDate](self, "departureCutoffDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitSectionController setDepartureCutoffDate:](v6, "setDepartureCutoffDate:", v15);

  if (-[MKTransitDeparturesDataProvider isStuckWithExpiredInfo](self, "isStuckWithExpiredInfo"))
  {
    -[MKTransitDeparturesDataProvider lastCutoffDateWithValidSchedule](self, "lastCutoffDateWithValidSchedule");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitSectionController setExpiredHighFrequencyCutoffDate:](v6, "setExpiredHighFrequencyCutoffDate:", v16);

  }
  else
  {
    -[MKTransitSectionController setExpiredHighFrequencyCutoffDate:](v6, "setExpiredHighFrequencyCutoffDate:", 0);
  }
  -[MKTransitDeparturesDataProvider _blockedIncidentEntities](self, "_blockedIncidentEntities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitSectionController setIncidentEntitiesToExclude:](v6, "setIncidentEntitiesToExclude:", v17);

  return v6;
}

- (id)_identifierForSequence:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "line");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "line");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "muid");
  objc_msgSend(v4, "direction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headsign");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("_mk_sequence_%@-%llu-%@-%@"), v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)departuresControllerForSection:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  -[MKTransitDeparturesDataProvider _controllerForSection:](self, "_controllerForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (int64_t)departureSequenceFrequencyTypeForSection:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t i;
  void *v12;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[MKTransitDeparturesDataProvider numberOfSections](self, "numberOfSections") <= a3
    || -[MKTransitDeparturesDataProvider sectionTypeAtIndex:](self, "sectionTypeAtIndex:", a3) != 4)
  {
    return 0;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MKTransitDeparturesDataProvider _departureSequencesForSection:](self, "_departureSequencesForSection:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
  {

    return 1;
  }
  v7 = v6;
  v8 = *(_QWORD *)v16;
  v9 = 1;
  v10 = 1;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      v9 &= objc_msgSend(v12, "isLowFrequency") ^ 1;
      v10 &= objc_msgSend(v12, "isLowFrequency");
      if ((v9 & 1) == 0 && (v10 & 1) == 0)
      {

        return 3;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
      continue;
    break;
  }
  if (v10)
    v13 = 2;
  else
    v13 = 3;

  if (v9)
    return 1;
  return v13;
}

- (id)_departureSequencesForSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[MKTransitDeparturesDataProvider departuresControllerForSection:](self, "departuresControllerForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sequences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_departureCutoffDateForLine:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if ((objc_msgSend(a3, "departuresAreVehicleSpecific") & 1) != 0
    || !-[MKTransitDeparturesDataProvider isStuckWithExpiredInfo](self, "isStuckWithExpiredInfo"))
  {
    -[MKTransitDeparturesDataProvider departureCutoffDate](self, "departureCutoffDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKTransitDeparturesDataProvider lastCutoffDateWithValidSchedule](self, "lastCutoffDateWithValidSchedule");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[MKTransitDeparturesDataProvider departureCutoffDate](self, "departureCutoffDate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  return v7;
}

- (id)_departureCutoffDateForSequence:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "line");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDeparturesDataProvider _departureCutoffDateForLine:](self, "_departureCutoffDateForLine:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)_numberOfDeparturesSectionsForSystem:(id)a3
{
  void *v3;
  int64_t v4;
  char v6;

  v6 = 0;
  -[MKTransitDeparturesDataProvider _directionsForSystem:hasSequencesWithNoDirection:](self, "_directionsForSystem:hasSequencesWithNoDirection:", a3, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)inactiveLinesForSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[MKTransitDeparturesDataProvider _inactiveLinesControllerForSection:](self, "_inactiveLinesControllerForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inactiveLines");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_inactiveLinesControllerForSection:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  -[MKTransitDeparturesDataProvider _controllerForSection:](self, "_controllerForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)_systemHasInactiveLines:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_cachedSystemHasInactiveLines, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[MKTransitDeparturesDataProvider _inactiveLinesForSystem:](self, "_inactiveLinesForSystem:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "count") != 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMapTable setObject:forKey:](self->_cachedSystemHasInactiveLines, "setObject:forKey:", v5, v4);
  }
  v8 = objc_msgSend(v5, "BOOLValue");

  return v8;
}

- (id)_inactiveLinesForSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MKTransitDeparturesDataProvider _blockedIncidentEntities](self, "_blockedIncidentEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_transitInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __59__MKTransitDeparturesDataProvider__inactiveLinesForSystem___block_invoke;
  v27[3] = &unk_1E20DA950;
  v27[4] = self;
  objc_msgSend(v7, "inactiveLinesForSystem:relativeToDateFromBlock:excludingIncidentEntities:usingContainers:", v4, v27, v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v20 = v4;
    v21 = (void *)objc_msgSend(v8, "mutableCopy");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
          -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_transitInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKTransitDeparturesDataProvider _departureCutoffDateForLine:](self, "_departureCutoffDateForLine:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "serviceResumesResultForLine:excludingIncidentEntities:afterDate:usingContainers:", v13, v5, v16, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v17, "blocked") & 1) == 0)
          {
            objc_msgSend(v17, "earliestNextDepartureDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
              objc_msgSend(v21, "removeObject:", v13);
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v10);
    }

    v8 = (void *)objc_msgSend(v21, "copy");
    v4 = v20;
  }

  return v8;
}

uint64_t __59__MKTransitDeparturesDataProvider__inactiveLinesForSystem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_departureCutoffDateForSequence:", a2);
}

- (BOOL)_hasConnectionsSection
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_transitInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)_hasPlaceCardMessageSection
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[MKTransitDeparturesDataProvider isStuckWithExpiredInfo](self, "isStuckWithExpiredInfo"))
    return 1;
  -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_transitInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MKTransitDeparturesDataProvider mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_transitInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v8, "count") == 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_updateRefreshFailureErrorDescription
{
  __CFString *v3;
  NSString *lastInfoRefreshErrorDescription;
  NSString *v5;

  if (-[MKTransitMapItemUpdater lastInfoRefreshFailed](self->_mapItemUpdater, "lastInfoRefreshFailed"))
  {
    switch(self->_lastFailureDiagnosis)
    {
      case 1:
        switch(MGGetSInt32Answer())
        {
          case 1u:
            v3 = CFSTR("TransitRefreshError_AirplaneMode_iPhone");
            break;
          case 2u:
            v3 = CFSTR("TransitRefreshError_AirplaneMode_iPod");
            break;
          case 3u:
            v3 = CFSTR("TransitRefreshError_AirplaneMode_iPad");
            break;
          case 6u:
            v3 = CFSTR("TransitRefreshError_AirplaneMode_Watch");
            break;
          default:
            v3 = CFSTR("TransitRefreshError_AirplaneMode_Device");
            break;
        }
        goto LABEL_10;
      case 2:
        v3 = CFSTR("TransitRefreshError_CellDataDisabled");
        goto LABEL_10;
      case 3:
        switch(MGGetSInt32Answer())
        {
          case 1u:
            v3 = CFSTR("TransitRefreshError_NoNetworkConnection_iPhone");
            break;
          case 2u:
            v3 = CFSTR("TransitRefreshError_NoNetworkConnection_iPod");
            break;
          case 3u:
            v3 = CFSTR("TransitRefreshError_NoNetworkConnection_iPad");
            break;
          case 6u:
            v3 = CFSTR("TransitRefreshError_NoNetworkConnection_Watch");
            break;
          default:
            v3 = CFSTR("TransitRefreshError_NoNetworkConnection_Device");
            break;
        }
        goto LABEL_10;
      case 4:
        v3 = CFSTR("TransitRefreshError_Generic");
LABEL_10:
        _MKLocalizedStringFromThisBundle(v3);
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        lastInfoRefreshErrorDescription = self->_lastInfoRefreshErrorDescription;
        self->_lastInfoRefreshErrorDescription = v5;
        goto LABEL_11;
      default:
        return;
    }
  }
  lastInfoRefreshErrorDescription = self->_lastInfoRefreshErrorDescription;
  self->_lastInfoRefreshErrorDescription = 0;
LABEL_11:

}

- (void)setDepartureCutoffDate:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSDate isEqualToDate:](self->_departureCutoffDate, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_departureCutoffDate, a3);
    -[NSMutableDictionary removeAllObjects](self->_cachedSequencesForSection, "removeAllObjects");
    -[NSMapTable removeAllObjects](self->_cachedDirectionsForSystem, "removeAllObjects");
    -[NSMapTable removeAllObjects](self->_cachedSystemHasInactiveLines, "removeAllObjects");
    -[MKTransitItemIncidentsController setReferenceDate:](self->_incidentsController, "setReferenceDate:", v5);
  }

}

- (NSDate)departureCutoffDate
{
  NSDate *departureCutoffDate;
  NSDate *v4;
  NSDate *v5;

  departureCutoffDate = self->_departureCutoffDate;
  if (!departureCutoffDate)
  {
    +[MKTransitItemReferenceDateUpdater referenceDate](MKTransitItemReferenceDateUpdater, "referenceDate");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_departureCutoffDate;
    self->_departureCutoffDate = v4;

    -[MKTransitItemIncidentsController setReferenceDate:](self->_incidentsController, "setReferenceDate:", self->_departureCutoffDate);
    departureCutoffDate = self->_departureCutoffDate;
  }
  return departureCutoffDate;
}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (-[MKTransitDeparturesDataProvider isStuckWithExpiredInfo](self, "isStuckWithExpiredInfo"))
  {
    -[MKTransitDeparturesDataProvider lastCutoffDateWithValidSchedule](self, "lastCutoffDateWithValidSchedule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[MKTransitDeparturesDataProvider departureCutoffDate](self, "departureCutoffDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitDeparturesDataProvider setLastCutoffDateWithValidSchedule:](self, "setLastCutoffDateWithValidSchedule:", v6);

    }
  }
  else
  {
    -[MKTransitDeparturesDataProvider setLastCutoffDateWithValidSchedule:](self, "setLastCutoffDateWithValidSchedule:", 0);
  }
  -[MKTransitDeparturesDataProvider setDepartureCutoffDate:](self, "setDepartureCutoffDate:", v7);
  -[MKTransitDeparturesDataProvider reloadData](self, "reloadData");

}

- (id)ticketForTransitMapItemUpdater:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MKTransitDeparturesDataProvider delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitsForTransitDeparturesDataProvider:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKMapItem _identifier](self->_mapItem, "_identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKMapService sharedService](MKMapService, "sharedService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ticketForFreshIdentifier:resultProviderID:contentProvider:traits:", v6, 0, 0, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)transitMapItemUpdater:(id)a3 updatedMapItem:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    -[MKTransitItemIncidentsController resetCache](self->_incidentsController, "resetCache");
    -[NSMapTable removeAllObjects](self->_cachedDirectionsForSystem, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_cachedSequencesForSection, "removeAllObjects");
    -[NSMapTable removeAllObjects](self->_cachedSystemHasInactiveLines, "removeAllObjects");
  }
  self->_lastFailureDiagnosis = MKCurrentNetworkConnectionFailureDiagnosis();
  -[MKTransitDeparturesDataProvider _updateRefreshFailureErrorDescription](self, "_updateRefreshFailureErrorDescription");
  self->_refreshing = 0;
  if (-[MKTransitDeparturesDataProvider isActive](self, "isActive"))
    -[MKTransitDeparturesDataProvider reloadData](self, "reloadData");

}

- (id)possibleActions
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MKTransitDeparturesDataProvider _hasIncidentsSection](self, "_hasIncidentsSection"))
    objc_msgSend(v3, "addObject:", &unk_1E2158FF8);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSArray)connections
{
  void *v2;
  void *v3;

  -[MKMapItem _transitInfo](self->_mapItem, "_transitInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)departuresSectionControllersForSystem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSMutableArray count](self->_sections, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "integerValue") == 4)
      {
        -[MKTransitDeparturesDataProvider sectionControllerForSection:](self, "sectionControllerForSection:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v7);

      }
      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_sections, "count"));
  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (id)inactiveLinesSectionControllersForSystem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSMutableArray count](self->_sections, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "integerValue") == 7)
      {
        -[MKTransitDeparturesDataProvider sectionControllerForSection:](self, "sectionControllerForSection:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v7);

      }
      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_sections, "count"));
  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (GEOTransitAttribution)transitAttribution
{
  return -[MKMapItem _transitAttribution](self->_mapItem, "_transitAttribution");
}

- (GEOAttribution)transitPunchoutAttribution
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeTileGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOAttribution *)v5;
}

- (NSDate)lastCutoffDateWithValidSchedule
{
  return self->_lastCutoffDateWithValidSchedule;
}

- (void)setLastCutoffDateWithValidSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_lastCutoffDateWithValidSchedule, a3);
}

- (GEOTransitSystem)selectedSystem
{
  return self->_selectedSystem;
}

- (MKTransitDeparturesDataProviderDelegate)delegate
{
  return (MKTransitDeparturesDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (NSString)lastInfoRefreshErrorDescription
{
  return self->_lastInfoRefreshErrorDescription;
}

- (NSArray)stationSystems
{
  return self->_stationSystems;
}

- (void)setDisabledSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)supportsSystemSectionCollapsing
{
  return self->_supportSystemSectionCollapsing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationSystems, 0);
  objc_storeStrong((id *)&self->_lastInfoRefreshErrorDescription, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedSystem, 0);
  objc_storeStrong((id *)&self->_lastCutoffDateWithValidSchedule, 0);
  objc_storeStrong((id *)&self->_departureCutoffDate, 0);
  objc_storeStrong((id *)&self->_lineLookupBySection, 0);
  objc_storeStrong((id *)&self->_mapItemUpdater, 0);
  objc_storeStrong((id *)&self->_cachedSystemHasInactiveLines, 0);
  objc_storeStrong((id *)&self->_cachedDirectionsForSystem, 0);
  objc_storeStrong((id *)&self->_cachedSequencesForSection, 0);
  objc_storeStrong((id *)&self->_pagedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_hiddenSections, 0);
  objc_storeStrong((id *)&self->_incidentsController, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_disabledSections, 0);
}

@end
