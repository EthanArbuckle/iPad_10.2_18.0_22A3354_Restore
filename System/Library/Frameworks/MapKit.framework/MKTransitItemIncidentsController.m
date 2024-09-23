@implementation MKTransitItemIncidentsController

- (MKTransitItemIncidentsController)initWithMapItem:(id)a3
{
  id v5;
  MKTransitItemIncidentsController *v6;
  MKTransitItemIncidentsController *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *incidentsForDepartureSequence;
  NSMutableDictionary *v10;
  NSMutableDictionary *incidentsForSystem;
  NSMutableDictionary *v12;
  NSMutableDictionary *incidentsForLinesInSystem;
  NSMutableDictionary *v14;
  NSMutableDictionary *incidentsForLine;
  NSMutableDictionary *v16;
  NSMutableDictionary *incidentsForMapItem;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MKTransitItemIncidentsController;
  v6 = -[MKTransitItemIncidentsController init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    incidentsForDepartureSequence = v7->_incidentsForDepartureSequence;
    v7->_incidentsForDepartureSequence = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    incidentsForSystem = v7->_incidentsForSystem;
    v7->_incidentsForSystem = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    incidentsForLinesInSystem = v7->_incidentsForLinesInSystem;
    v7->_incidentsForLinesInSystem = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    incidentsForLine = v7->_incidentsForLine;
    v7->_incidentsForLine = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    incidentsForMapItem = v7->_incidentsForMapItem;
    v7->_incidentsForMapItem = v16;

  }
  return v7;
}

- (MKTransitItemIncidentsController)initWithLineItem:(id)a3
{
  id v5;
  MKTransitItemIncidentsController *v6;
  MKTransitItemIncidentsController *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *incidentsForLine;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKTransitItemIncidentsController;
  v6 = -[MKTransitItemIncidentsController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lineItem, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    incidentsForLine = v7->_incidentsForLine;
    v7->_incidentsForLine = v8;

  }
  return v7;
}

- (void)setReferenceDate:(id)a3
{
  NSDate *v4;
  NSDate *referenceDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  referenceDate = self->_referenceDate;
  self->_referenceDate = v4;

  -[MKTransitItemIncidentsController resetCache](self, "resetCache");
}

- (void)resetCache
{
  MKMapItem *mapItem;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *validIncidents;
  id v9;
  id v10;
  _QWORD v11[5];

  mapItem = self->_mapItem;
  if (mapItem)
  {
    -[MKMapItem _transitInfo](mapItem, "_transitInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "incidents");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GEOTransitLineItem incidents](self->_lineItem, "incidents");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__MKTransitItemIncidentsController_resetCache__block_invoke;
  v11[3] = &unk_1E20D9350;
  v11[4] = self;
  objc_msgSend(v9, "indexesOfObjectsPassingTest:", v11, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  validIncidents = self->_validIncidents;
  self->_validIncidents = v7;

  -[NSMutableDictionary removeAllObjects](self->_incidentsForDepartureSequence, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_incidentsForSystem, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_incidentsForLine, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_incidentsForMapItem, "removeAllObjects");

}

uint64_t __46__MKTransitItemIncidentsController_resetCache__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL4 v7;
  double v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v7 = 1;
    if (v5)
      goto LABEL_3;
LABEL_5:
    v9 = 1;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "timeIntervalSinceDate:", v4);
  v7 = v6 >= 0.0;
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v9 = v8 >= 0.0;
LABEL_6:
  v10 = v7 & v9;

  return v10;
}

uint64_t __46__MKTransitItemIncidentsController_resetCache__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isBlockingIncident");
  if (v6 == objc_msgSend(v5, "isBlockingIncident"))
  {
    objc_msgSend(v4, "startDate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = (void *)v8,
          objc_msgSend(v5, "startDate"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      objc_msgSend(v5, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v12);
      if (v13 < 0.0)
        v7 = 1;
      else
        v7 = -1;

    }
    else
    {
      objc_msgSend(v5, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v7 = -1;
      else
        v7 = 1;

    }
  }
  else if (objc_msgSend(v4, "isBlockingIncident"))
  {
    v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)validIncidents
{
  return self->_validIncidents;
}

- (id)_incidentsAffectingMuid:(unint64_t)a3
{
  void *v4;
  NSArray *validIncidents;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  validIncidents = self->_validIncidents;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__MKTransitItemIncidentsController__incidentsAffectingMuid___block_invoke;
  v10[3] = &unk_1E20D9350;
  v11 = v4;
  v6 = v4;
  -[NSArray indexesOfObjectsPassingTest:](validIncidents, "indexesOfObjectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectsAtIndexes:](self->_validIncidents, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __60__MKTransitItemIncidentsController__incidentsAffectingMuid___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "affectedEntities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "muid"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));
  return v11;
}

- (id)incidentsForLinesInSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSArray *validIncidents;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  MKTransitItemIncidentsController *v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  GEOTransitLineItem *lineItem;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForLinesInSystem, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[MKMapItem _transitInfo](self->_mapItem, "_transitInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lines");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v28 = v5;
    v29 = self;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      lineItem = self->_lineItem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &lineItem, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v17, "system");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "muid");
          v20 = objc_msgSend(v4, "muid");

          if (v19 == v20)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v17, "muid"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v21);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v14);
    }

    self = v29;
    validIncidents = v29->_validIncidents;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __62__MKTransitItemIncidentsController_incidentsForLinesInSystem___block_invoke;
    v30[3] = &unk_1E20D9350;
    v31 = v7;
    v23 = v7;
    -[NSArray indexesOfObjectsPassingTest:](validIncidents, "indexesOfObjectsPassingTest:", v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectsAtIndexes:](v29->_validIncidents, "objectsAtIndexes:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v28;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29->_incidentsForLinesInSystem, "setObject:forKeyedSubscript:", v25, v28);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForLinesInSystem, "objectForKeyedSubscript:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __62__MKTransitItemIncidentsController_incidentsForLinesInSystem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a2, "affectedEntities", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "muid"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9);

        if ((v8 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)incidentsForSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSArray *validIncidents;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  MKTransitItemIncidentsController *v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  GEOTransitLineItem *lineItem;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForSystem, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[MKTransitItemIncidentsController _incidentsAffectingMuid:](self, "_incidentsAffectingMuid:", objc_msgSend(v4, "muid"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[MKMapItem _transitInfo](self->_mapItem, "_transitInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lines");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v30 = v5;
    v31 = self;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      lineItem = self->_lineItem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &lineItem, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v17, "system", v29);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "muid");
          v20 = objc_msgSend(v4, "muid");

          if (v19 == v20)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v17, "muid"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v21);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
    }

    self = v31;
    validIncidents = v31->_validIncidents;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __55__MKTransitItemIncidentsController_incidentsForSystem___block_invoke;
    v32[3] = &unk_1E20D9350;
    v33 = v7;
    v23 = v7;
    -[NSArray indexesOfObjectsPassingTest:](validIncidents, "indexesOfObjectsPassingTest:", v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectsAtIndexes:](v31->_validIncidents, "objectsAtIndexes:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v30;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v31->_incidentsForSystem, "setObject:forKeyedSubscript:", v26, v30);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForSystem, "objectForKeyedSubscript:", v5, v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t __55__MKTransitItemIncidentsController_incidentsForSystem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isBlockingIncident"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "affectedEntities", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "muid"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

          if ((v9 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_13:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)incidentsForLine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForLine, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[MKTransitItemIncidentsController _incidentsAffectingMuid:](self, "_incidentsAffectingMuid:", objc_msgSend(v4, "muid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_incidentsForLine, "setObject:forKeyedSubscript:", v7, v5);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForLine, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)incidentsForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSArray *validIncidents;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "_muid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForMapItem, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v4, "_transitInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          -[MKTransitItemIncidentsController incidentsForSystem:](self, "incidentsForSystem:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v11);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "_transitInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lines");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          -[MKTransitItemIncidentsController incidentsForLine:](self, "incidentsForLine:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v20));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v18);
    }

    validIncidents = self->_validIncidents;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __56__MKTransitItemIncidentsController_incidentsForMapItem___block_invoke;
    v28[3] = &unk_1E20D9350;
    v29 = v7;
    v23 = v7;
    -[NSArray indexesOfObjectsPassingTest:](validIncidents, "indexesOfObjectsPassingTest:", v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectsAtIndexes:](self->_validIncidents, "objectsAtIndexes:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_incidentsForMapItem, "setObject:forKeyedSubscript:", v25, v5);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForMapItem, "objectForKeyedSubscript:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __56__MKTransitItemIncidentsController_incidentsForMapItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)incidentsForDepartureSequence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSArray *validIncidents;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37A0];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "line");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "muid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "nextStopIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v9, "appendFormat:", CFSTR("_%@"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForDepartureSequence, "objectForKeyedSubscript:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    validIncidents = self->_validIncidents;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__MKTransitItemIncidentsController_incidentsForDepartureSequence___block_invoke_2;
    v24[3] = &unk_1E20D9350;
    v25 = v4;
    -[NSArray indexesOfObjectsPassingTest:](validIncidents, "indexesOfObjectsPassingTest:", v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectsAtIndexes:](self->_validIncidents, "objectsAtIndexes:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_incidentsForDepartureSequence, "setObject:forKeyedSubscript:", v21, v9);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForDepartureSequence, "objectForKeyedSubscript:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __66__MKTransitItemIncidentsController_incidentsForDepartureSequence___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __66__MKTransitItemIncidentsController_incidentsForDepartureSequence___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "affectedEntities", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if ((GEOTransitIncidentEntityAffectsSequence() & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (id)blockedIncidentEntities
{
  NSSet *blockedIncidentEntities;
  NSSet *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSSet *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  blockedIncidentEntities = self->_blockedIncidentEntities;
  if (!blockedIncidentEntities)
  {
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = self->_validIncidents;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v10, "isBlockingIncident"))
          {
            v20 = 0u;
            v21 = 0u;
            v18 = 0u;
            v19 = 0u;
            objc_msgSend(v10, "affectedEntities", 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v19;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v19 != v14)
                    objc_enumerationMutation(v11);
                  -[NSSet addObject:](v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              }
              while (v13);
            }

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    v16 = self->_blockedIncidentEntities;
    self->_blockedIncidentEntities = v4;

    blockedIncidentEntities = self->_blockedIncidentEntities;
  }
  return blockedIncidentEntities;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_blockedIncidentEntities, 0);
  objc_storeStrong((id *)&self->_incidentsForLinesInSystem, 0);
  objc_storeStrong((id *)&self->_incidentsForMapItem, 0);
  objc_storeStrong((id *)&self->_incidentsForLine, 0);
  objc_storeStrong((id *)&self->_incidentsForSystem, 0);
  objc_storeStrong((id *)&self->_incidentsForDepartureSequence, 0);
  objc_storeStrong((id *)&self->_validIncidents, 0);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
