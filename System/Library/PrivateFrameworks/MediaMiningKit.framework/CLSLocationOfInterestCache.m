@implementation CLSLocationOfInterestCache

- (CLSLocationOfInterestCache)initWithLocationCache:(id)a3
{
  id v5;
  CLSLocationOfInterestCache *v6;
  CLSLocationOfInterestCache *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *visitsCache;
  NSMutableDictionary *v10;
  NSMutableDictionary *transitionsCache;
  NSMutableSet *v12;
  NSMutableSet *allLocationsOfInterest;
  NSMutableSet *v14;
  NSMutableSet *allLocationsOfInterestTransitionIdentifiers;
  NSMutableSet *v16;
  NSMutableSet *homeLocations;
  NSMutableSet *v18;
  NSMutableSet *workLocations;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLSLocationOfInterestCache;
  v6 = -[CLSLocationOfInterestCache init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locationCache, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    visitsCache = v7->_visitsCache;
    v7->_visitsCache = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transitionsCache = v7->_transitionsCache;
    v7->_transitionsCache = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allLocationsOfInterest = v7->_allLocationsOfInterest;
    v7->_allLocationsOfInterest = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allLocationsOfInterestTransitionIdentifiers = v7->_allLocationsOfInterestTransitionIdentifiers;
    v7->_allLocationsOfInterestTransitionIdentifiers = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    homeLocations = v7->_homeLocations;
    v7->_homeLocations = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    workLocations = v7->_workLocations;
    v7->_workLocations = v18;

  }
  return v7;
}

- (void)addLocationOfInterest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  id *p_lastLocationOfInterestVisit;
  id *location;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "visits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_allLocationsOfInterest, "containsObject:", v4) & 1) != 0)
    goto LABEL_35;
  self->_numberOfLocationsOfInterestVisits += objc_msgSend(v5, "count");
  -[NSMutableSet addObject:](self->_allLocationsOfInterest, "addObject:", v4);
  if (!objc_msgSend(v4, "type"))
  {
    v6 = 48;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "type") == 1)
  {
    v6 = 56;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v6), "addObject:", v4);
  }
  v33 = v5;
  v34 = v4;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v5;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v52;
    location = (id *)&self->_earliestVisitStartDate;
    v40 = 0;
    p_lastLocationOfInterestVisit = (id *)&self->_lastLocationOfInterestVisit;
    v7 = &off_1E84F6000;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v8);
        objc_msgSend(v9, "visitInterval");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "endDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!*location || objc_msgSend(*location, "compare:", v11) == 1)
          objc_storeStrong(location, v11);
        v45 = v10;
        v46 = v8;
        v44 = v11;
        if (!*p_lastLocationOfInterestVisit || objc_msgSend(v40, "compare:", v12) == -1)
        {
          objc_storeStrong(p_lastLocationOfInterestVisit, v9);
          v13 = v12;

          v40 = v13;
        }
        v43 = v12;
        objc_msgSend(v9, "visitInterval");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v7[80];
        objc_msgSend(v14, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "validDateForDate:", v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v18 = v7[80];
        v42 = v14;
        objc_msgSend(v14, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "validDateForDate:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = (void *)v17;
        objc_msgSend(v7[80], "startOfDayForDate:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "compare:", v20) == -1)
        {
          do
          {
            +[CLSCalendar components:fromDate:](CLSCalendar, "components:fromDate:", 28, v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%ld-%ld"), objc_msgSend(v24, "year"), objc_msgSend(v24, "month"), objc_msgSend(v24, "day"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v25);
            +[CLSCalendar dateByAddingDays:toDate:](CLSCalendar, "dateByAddingDays:toDate:", 1, v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = v23;
          }
          while (objc_msgSend(v23, "compare:", v20) == -1);
        }
        else
        {
          v23 = v21;
        }

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v26 = v22;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v48 != v29)
                objc_enumerationMutation(v26);
              v31 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_visitsCache, "objectForKeyedSubscript:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v32)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_visitsCache, "setObject:forKeyedSubscript:", v32, v31);
              }
              objc_msgSend(v32, "addObject:", v9);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          }
          while (v28);
        }

        v8 = v46 + 1;
        v7 = &off_1E84F6000;
      }
      while (v46 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v37);
  }
  else
  {
    v40 = 0;
  }

  v5 = v33;
  v4 = v34;
LABEL_35:

}

- (id)locationsOfInterestOfType:(int64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[CLSLocationOfInterestCache workLocations](self, "workLocations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (a3)
      goto LABEL_6;
    -[CLSLocationOfInterestCache homeLocations](self, "homeLocations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_6;
  }
  return v3;
}

- (id)closestLocationOfInterestVisitToLocation:(id)a3 withinDistance:(double)a4 inDateInterval:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  id v29;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[CLSLocationOfInterestCache locationsOfInterestVisitsInDateInterval:](self, "locationsOfInterestVisitsInDateInterval:", v9);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v31 = v9;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v34;
    v15 = 1.79769313e308;
    v16 = 1.79769313e308;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v18, "locationOfInterest", v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "location");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "distanceFromLocation:", v8);
        if (v21 < v16)
        {
          v22 = v21;
          v23 = v18;
          v24 = v13;
          v13 = v23;

          v16 = v22;
        }
        objc_msgSend(v19, "placemarkLocationDistanceFromLocation:locationCache:", v8, self->_locationCache);
        if (v25 < v15)
        {
          v26 = v25;
          v27 = v18;

          v15 = v26;
          v12 = v27;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
    v9 = v31;
    if (v12 && (v28 = v12, v15 - a4 <= 2.22044605e-16) || (v29 = 0, v13) && (v28 = v13, v16 - a4 <= 2.22044605e-16))
      v29 = v28;
  }
  else
  {
    v13 = 0;
    v12 = 0;
    v29 = 0;
  }

  return v29;
}

- (id)locationOfInterestAtLocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[CLSLocationOfInterestCache allLocationsOfInterest](self, "allLocationsOfInterest", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "location");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "distanceFromLocation:", v4);
        v14 = v13;

        if (v14 <= 2.22044605e-16)
        {
          v15 = v11;

          v8 = v15;
        }
        objc_msgSend(v11, "placemarkLocationDistanceFromLocation:locationCache:", v4, self->_locationCache);
        if (v16 <= 2.22044605e-16)
        {
          v17 = v11;
          if (v17)
          {
            v18 = v17;
            goto LABEL_15;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
    v18 = 0;
  }
  else
  {
    v18 = 0;
    v8 = 0;
  }
LABEL_15:

  if (v18)
    v19 = v18;
  else
    v19 = v8;
  v20 = v19;

  return v20;
}

- (id)locationsOfInterestVisitsAtLocation:(id)a3 inDateInterval:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  double v30;
  BOOL v31;
  double v32;
  void *v33;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v41 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar validDateForDate:](CLSCalendar, "validDateForDate:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar validDateForDate:](CLSCalendar, "validDateForDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)v9;
  +[CLSCalendar startOfDayForDate:](CLSCalendar, "startOfDayForDate:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "compare:", v11) == -1)
  {
    do
    {
      +[CLSCalendar components:fromDate:](CLSCalendar, "components:fromDate:", 28, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%ld-%ld"), objc_msgSend(v15, "year"), objc_msgSend(v15, "month"), objc_msgSend(v15, "day"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v16);
      +[CLSCalendar dateByAddingDays:toDate:](CLSCalendar, "dateByAddingDays:toDate:", 1, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v14;
    }
    while (objc_msgSend(v14, "compare:", v11) == -1);
  }
  else
  {
    v14 = v12;
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v13;
  v17 = (void *)v41;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v47;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(obj);
        v38 = v18;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_visitsCache, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v43 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_msgSend(v24, "visitInterval");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "intersectsDateInterval:", v7);

              if (v26)
              {
                if (v5)
                {
                  objc_msgSend(v24, "locationOfInterest");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = v27;
                  if (v27)
                  {
                    objc_msgSend(v27, "location");
                    v29 = objc_claimAutoreleasedReturnValue();
                    -[NSObject distanceFromLocation:](v29, "distanceFromLocation:", v5);
                    if (v29)
                      v31 = v30 > 2.22044605e-16;
                    else
                      v31 = 1;
                    if (!v31
                      || (objc_msgSend(v28, "placemarkLocationDistanceFromLocation:locationCache:", v5, self->_locationCache), v32 <= 2.22044605e-16))
                    {
                      objc_msgSend(v17, "addObject:", v24);
                    }
                  }
                  else
                  {
                    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "loggingConnection");
                    v29 = objc_claimAutoreleasedReturnValue();

                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138477827;
                      v51 = v24;
                      _os_log_error_impl(&dword_1CAB79000, v29, OS_LOG_TYPE_ERROR, "LOI nil for visit %{private}@", buf, 0xCu);
                    }
                    v17 = (void *)v41;
                  }

                }
                else
                {
                  objc_msgSend(v17, "addObject:", v24);
                }
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          }
          while (v21);
        }

        v18 = v38 + 1;
      }
      while (v38 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v37);
  }

  return v17;
}

- (id)locationsOfInterestVisitsInDateInterval:(id)a3
{
  return -[CLSLocationOfInterestCache locationsOfInterestVisitsAtLocation:inDateInterval:](self, "locationsOfInterestVisitsAtLocation:inDateInterval:", 0, a3);
}

- (unint64_t)numberOfLocationsOfInterest
{
  void *v2;
  unint64_t v3;

  -[CLSLocationOfInterestCache allLocationsOfInterest](self, "allLocationsOfInterest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)addLocationOfInterestTransition:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  void *v7;
  double v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableSet *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_allLocationsOfInterestTransitionIdentifiers;
  if ((-[NSMutableSet containsObject:](v6, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableSet addObject:](v6, "addObject:", v5);
    objc_msgSend(v4, "transitionInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "duration");
    if (v8 <= 31557600.0)
    {
      v29 = v6;
      v30 = v5;
      v28 = v7;
      v11 = v7;
      objc_msgSend(v11, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CLSCalendar validDateForDate:](CLSCalendar, "validDateForDate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = v11;
      objc_msgSend(v11, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[CLSCalendar validDateForDate:](CLSCalendar, "validDateForDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[CLSCalendar startOfDayForDate:](CLSCalendar, "startOfDayForDate:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "compare:", v15) == -1)
      {
        v31 = v15;
        do
        {
          +[CLSCalendar components:fromDate:](CLSCalendar, "components:fromDate:", 28, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%ld-%ld"), objc_msgSend(v19, "year"), objc_msgSend(v19, "month"), objc_msgSend(v19, "day"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v20);
          +[CLSCalendar dateByAddingDays:toDate:](CLSCalendar, "dateByAddingDays:toDate:", 1, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v31;
          v16 = v18;
        }
        while (objc_msgSend(v18, "compare:", v31) == -1);
      }
      else
      {
        v18 = v16;
      }

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v10 = v17;
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v33 != v23)
              objc_enumerationMutation(v10);
            v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_transitionsCache, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v26)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_transitionsCache, "setObject:forKeyedSubscript:", v26, v25);
            }
            objc_msgSend(v26, "addObject:", v4);

          }
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v22);
      }

      v6 = v29;
      v5 = v30;
      v7 = v28;
    }
    else
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loggingConnection");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v7;
        _os_log_error_impl(&dword_1CAB79000, v10, OS_LOG_TYPE_ERROR, "Duration for location of interest transition %@ is too long, aborting.", buf, 0xCu);
      }
    }

  }
}

- (id)locationsOfInterestTransitionInDateInterval:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  int v23;
  id obj;
  uint64_t v26;
  void *v28;
  uint64_t v29;
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
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar validDateForDate:](CLSCalendar, "validDateForDate:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar validDateForDate:](CLSCalendar, "validDateForDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)v7;
  +[CLSCalendar startOfDayForDate:](CLSCalendar, "startOfDayForDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "compare:", v9) == -1)
  {
    do
    {
      +[CLSCalendar components:fromDate:](CLSCalendar, "components:fromDate:", 28, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%ld-%ld"), objc_msgSend(v13, "year"), objc_msgSend(v13, "month"), objc_msgSend(v13, "day"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);
      +[CLSCalendar dateByAddingDays:toDate:](CLSCalendar, "dateByAddingDays:toDate:", 1, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v12;
    }
    while (objc_msgSend(v12, "compare:", v9) == -1);
  }
  else
  {
    v12 = v10;
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v11;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v29)
  {
    v26 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_transitionsCache, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v31 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_msgSend(v21, "transitionInterval");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "intersectsDateInterval:", v5);

              if (v23)
                objc_msgSend(v4, "addObject:", v21);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v18);
        }

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v29);
  }

  return v4;
}

- (unint64_t)numberOfLocationsOfInterestTransitions
{
  void *v2;
  unint64_t v3;

  -[CLSLocationOfInterestCache allLocationsOfInterestTransitionIdentifiers](self, "allLocationsOfInterestTransitionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSMutableDictionary)visitsCache
{
  return self->_visitsCache;
}

- (void)setVisitsCache:(id)a3
{
  objc_storeStrong((id *)&self->_visitsCache, a3);
}

- (NSMutableDictionary)transitionsCache
{
  return self->_transitionsCache;
}

- (void)setTransitionsCache:(id)a3
{
  objc_storeStrong((id *)&self->_transitionsCache, a3);
}

- (NSMutableSet)allLocationsOfInterest
{
  return self->_allLocationsOfInterest;
}

- (void)setAllLocationsOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_allLocationsOfInterest, a3);
}

- (NSMutableSet)allLocationsOfInterestTransitionIdentifiers
{
  return self->_allLocationsOfInterestTransitionIdentifiers;
}

- (void)setAllLocationsOfInterestTransitionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allLocationsOfInterestTransitionIdentifiers, a3);
}

- (NSMutableSet)homeLocations
{
  return self->_homeLocations;
}

- (void)setHomeLocations:(id)a3
{
  objc_storeStrong((id *)&self->_homeLocations, a3);
}

- (NSMutableSet)workLocations
{
  return self->_workLocations;
}

- (void)setWorkLocations:(id)a3
{
  objc_storeStrong((id *)&self->_workLocations, a3);
}

- (unint64_t)numberOfLocationsOfInterestVisits
{
  return self->_numberOfLocationsOfInterestVisits;
}

- (NSDate)earliestVisitStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (CLSLocationOfInterestVisit)lastLocationOfInterestVisit
{
  return (CLSLocationOfInterestVisit *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationOfInterestVisit, 0);
  objc_storeStrong((id *)&self->_earliestVisitStartDate, 0);
  objc_storeStrong((id *)&self->_workLocations, 0);
  objc_storeStrong((id *)&self->_homeLocations, 0);
  objc_storeStrong((id *)&self->_allLocationsOfInterestTransitionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allLocationsOfInterest, 0);
  objc_storeStrong((id *)&self->_transitionsCache, 0);
  objc_storeStrong((id *)&self->_visitsCache, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
}

@end
