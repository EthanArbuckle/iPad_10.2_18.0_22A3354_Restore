@implementation GEOPOIEvent

+ (BOOL)isUpdateRequiredForInvalidationData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeTileGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "versionManifest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "serviceVersions", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
          if (v11)
            v12 = *(unsigned int *)(v11 + 24);
          else
            v12 = 0;
          -[GEOServiceVersion versionDomains]((id *)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v3, "isInvalidatedByServiceVersion:domains:", v12, v13);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_16;
          }
          ++v10;
        }
        while (v8 != v10);
        v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v8 = v15;
      }
      while (v15);
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (BOOL)isUpdateRequiredForInvalidationToken:(id)a3 error:(id *)a4
{
  id v6;
  GEOPOIEventInvalidationData *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  id v15;

  if (a3)
  {
    v6 = a3;
    v7 = -[GEOPOIEventInvalidationData initWithData:]([GEOPOIEventInvalidationData alloc], "initWithData:", v6);

    if (v7 && v7->_cacheInvalidationData)
    {
      v8 = (void *)MEMORY[0x1E0CB3710];
      v9 = objc_opt_class();
      -[GEOPOIEventInvalidationData cacheInvalidationData]((id *)&v7->super.super.isa);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v8, "unarchivedObjectOfClass:fromData:error:", v9, v10, &v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;

      if (!v12 && v11)
      {
        v13 = objc_msgSend(a1, "isUpdateRequiredForInvalidationData:", v11);

LABEL_12:
        return v13;
      }

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -12, CFSTR("Invalid token data"));
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_12;
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)geoPOIEventCommonInit
{
  self->_centerCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid_2;
  self->_expectedAttendance = 0x7FFFFFFFFFFFFFFFLL;
}

- (GEOPOIEvent)init
{
  GEOPOIEvent *result;

  result = (GEOPOIEvent *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOPOIEvent)initWithMapItemIdentifier:(id)a3
{
  id v5;
  GEOPOIEvent *v6;
  GEOPOIEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPOIEvent;
  v6 = -[GEOPOIEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[GEOPOIEvent geoPOIEventCommonInit](v6, "geoPOIEventCommonInit");
    objc_storeStrong((id *)&v7->_identifier, a3);
  }

  return v7;
}

- (GEOPOIEvent)initWithPlace:(id)a3
{
  id v4;
  GEOPOIEvent *v5;
  void *v6;
  _BOOL4 v7;
  GEOPOIEvent *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPOIEvent;
  v5 = -[GEOPOIEvent init](&v10, sel_init);
  if (v5
    && (!objc_msgSend(v4, "hasStatus")
     || objc_msgSend(v4, "status")
     || (-[GEOPOIEvent geoPOIEventCommonInit](v5, "geoPOIEventCommonInit"),
         objc_msgSend(v4, "components"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = -[GEOPOIEvent configureWithComponents:](v5, "configureWithComponents:", v6),
         v6,
         !v7)))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (BOOL)configureWithComponents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v11 && (*(_WORD *)(v11 + 100) & 0x80) != 0)
        {
          v12 = *(_DWORD *)(v11 + 88);
          if (v12 == 2)
          {
            v7 = -[GEOPOIEvent configureWithPlaceInfoComponent:](self, "configureWithPlaceInfoComponent:");
          }
          else if (v12 == 58)
          {
            v8 = -[GEOPOIEvent configureWithPOIComponent:](self, "configureWithPOIComponent:");
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  return v8 && v7;
}

- (BOOL)configureWithPOIComponent:(id)a3
{
  id *v4;
  id *v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  uint64_t i;
  id *v11;
  id *v12;
  void *v13;
  GEOMapItemIdentifier *v14;
  void *v15;
  GEOMapItemIdentifier *v16;
  GEOMapItemIdentifier *identifier;
  void *v18;
  NSString *v19;
  NSString *localizedName;
  int64_t v21;
  void *v22;
  NSArray *v23;
  NSArray *categories;
  void *v25;
  NSArray *v26;
  NSArray *relatedPOIIdentifiers;
  void *v28;
  NSDateInterval *v29;
  NSDateInterval *dateInterval;
  id v31;
  id *v32;
  void *v33;
  NSTimeZone *v34;
  NSTimeZone *timeZone;
  void *v36;
  NSArray *v37;
  NSArray *hours;
  void *v39;
  NSArray *v40;
  NSArray *performers;
  void *v42;
  uint64_t v43;
  GEOCacheInvalidationData *v44;
  unint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  GEOCacheInvalidationData *v50;
  GEOCacheInvalidationData *invalidationData;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = v4;
  if (v4 && (*((_WORD *)v4 + 50) & 0x20) != 0 && !*((_DWORD *)v4 + 20))
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[GEOPDComponent values](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v6)
    {
      v9 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v53 != v9)
            objc_enumerationMutation(v8);
          -[GEOPDComponentValue poiEvent](*(id **)(*((_QWORD *)&v52 + 1) + 8 * i));
          v11 = (id *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = v11;
            -[GEOPDPoiEvent eventId](v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            LOBYTE(v6) = v13 != 0;
            if (v13)
            {
              v14 = [GEOMapItemIdentifier alloc];
              -[GEOPDPoiEvent eventId](v12);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v14, "initWithMapsIdentifier:", v15, (_QWORD)v52);
              identifier = self->_identifier;
              self->_identifier = v16;

              -[GEOPDPoiEvent name](v12);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "stringValue");
              v19 = (NSString *)objc_claimAutoreleasedReturnValue();
              localizedName = self->_localizedName;
              self->_localizedName = v19;

              if (((_WORD)v12[12] & 1) != 0)
                v21 = *((int *)v12 + 23);
              else
                v21 = 0x7FFFFFFFFFFFFFFFLL;
              self->_expectedAttendance = v21;
              -[GEOPDPoiEvent eventCategorys](v12);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[GEOPOIEventCategory poiEventCategoriesForEventCategories:](GEOPOIEventCategory, "poiEventCategoriesForEventCategories:", v22);
              v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
              categories = self->_categories;
              self->_categories = v23;

              -[GEOPDPoiEvent poiIds](v12);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:](GEOMapItemIdentifier, "mapItemIdentifiersFromMapsIdentifiers:", v25);
              v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
              relatedPOIIdentifiers = self->_relatedPOIIdentifiers;
              self->_relatedPOIIdentifiers = v26;

              -[GEOPDPoiEvent eventDateTimes](v12);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOPOIEvent dateIntervalFromDateTimeRanges:](self, "dateIntervalFromDateTimeRanges:", v28);
              v29 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
              dateInterval = self->_dateInterval;
              self->_dateInterval = v29;

              v31 = objc_alloc(MEMORY[0x1E0C99E80]);
              -[GEOPDPoiEvent timezone](v12);
              v32 = (id *)objc_claimAutoreleasedReturnValue();
              -[GEOTimezone identifier](v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = (NSTimeZone *)objc_msgSend(v31, "initWithName:", v33);
              timeZone = self->_timeZone;
              self->_timeZone = v34;

              -[GEOPDPoiEvent eventDateTimes](v12);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              +[GEOPOIEventHours eventHoursForDateTimeRanges:](GEOPOIEventHours, "eventHoursForDateTimeRanges:", v36);
              v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
              hours = self->_hours;
              self->_hours = v37;

              -[GEOPDPoiEvent performers](v12);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              +[GEOPOIEventPerformer poiEventPerformersForPerformers:](GEOPOIEventPerformer, "poiEventPerformersForPerformers:", v39);
              v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
              performers = self->_performers;
              self->_performers = v40;

              if ((*((_WORD *)v5 + 50) & 0x200) != 0)
              {
                -[GEOPDComponent versionDomains](v5);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "count");

                if (v43)
                {
                  v44 = [GEOCacheInvalidationData alloc];
                  objc_msgSend(v5, "timestampFirstSeen");
                  v46 = *(double *)&v45;
                  LODWORD(v45) = *((_DWORD *)v5 + 21);
                  v47 = (double)v45;
                  v48 = *((unsigned int *)v5 + 24);
                  -[GEOPDComponent versionDomains](v5);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = -[GEOCacheInvalidationData initWithTimestamp:ttl:version:domains:](v44, "initWithTimestamp:ttl:version:domains:", v48, v49, v46, v47);
                  invalidationData = self->_invalidationData;
                  self->_invalidationData = v50;

                }
              }
            }

            goto LABEL_23;
          }
        }
        v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_23:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)dateIntervalFromDateTimeRanges:(id)a3
{
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    v5 = 0;
    goto LABEL_20;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v5)
  {
LABEL_19:

    goto LABEL_20;
  }
  v14 = v3;
  v6 = 0;
  v7 = -1;
  v8 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v4);
      v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
      if (v10 && (~*(unsigned __int8 *)(v10 + 56) & 3) == 0)
      {
        if (*(_QWORD *)(v10 + 48) < v7)
          v7 = *(_QWORD *)(v10 + 48);
        v11 = *(_QWORD *)(v10 + 40);
        if (v6 <= v11)
          v6 = v11;
      }
    }
    v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v5);

  if (v7 <= v6)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)v7);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)v6);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v4, v12);

    v3 = v14;
    goto LABEL_19;
  }
  v5 = 0;
  v3 = v14;
LABEL_20:

  return v5;
}

- (BOOL)configureWithPlaceInfoComponent:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && (*((_WORD *)v4 + 50) & 0x20) != 0 && !*((_DWORD *)v4 + 20))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[GEOPDComponent values]((id *)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          -[GEOPDComponentValue placeInfo](*(id **)(*((_QWORD *)&v18 + 1) + 8 * i));
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            -[GEOPDPlaceInfo _readCenter](v13);
            if (*(_QWORD *)(v14 + 40))
            {
              -[GEOPDPlaceInfo center]((id *)v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "coordinate", (_QWORD)v18);
              self->_centerCoordinate.latitude = v16;
              self->_centerCoordinate.longitude = v17;

              v6 = 1;
              goto LABEL_17;
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_17:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOPOIEvent)initWithCoder:(id)a3
{
  id v4;
  GEOPOIEvent *v5;
  uint64_t v6;
  GEOCacheInvalidationData *invalidationData;
  uint64_t v8;
  GEOMapItemIdentifier *identifier;
  uint64_t v10;
  NSString *localizedName;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *categories;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *relatedPOIIdentifiers;
  uint64_t v25;
  NSDateInterval *dateInterval;
  uint64_t v27;
  NSTimeZone *timeZone;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *hours;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSArray *performers;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)GEOPOIEvent;
  v5 = -[GEOPOIEvent init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPOIEventInvalidationDataKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    invalidationData = v5->_invalidationData;
    v5->_invalidationData = (GEOCacheInvalidationData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPOIEventIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (GEOMapItemIdentifier *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPOIEventLocalizedNameKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GEOPOIEventCenterCoordinateLatitudeKey"));
    v13 = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GEOPOIEventCenterCoordinateLongitudeKey"));
    v5->_centerCoordinate.latitude = v13;
    v5->_centerCoordinate.longitude = v14;
    v5->_expectedAttendance = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GEOPOIEventExpectedAttendanceKey"));
    v15 = objc_alloc(MEMORY[0x1E0C99E60]);
    v16 = objc_opt_class();
    v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("GEOPOIEventCategoriesKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    categories = v5->_categories;
    v5->_categories = (NSArray *)v18;

    v20 = objc_alloc(MEMORY[0x1E0C99E60]);
    v21 = objc_opt_class();
    v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("GEOPOIEventRelatedPOIsKey"));
    v23 = objc_claimAutoreleasedReturnValue();
    relatedPOIIdentifiers = v5->_relatedPOIIdentifiers;
    v5->_relatedPOIIdentifiers = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPOIEventDateIntervalKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPOIEventTimeZoneKey"));
    v27 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v27;

    v29 = objc_alloc(MEMORY[0x1E0C99E60]);
    v30 = objc_opt_class();
    v31 = (void *)objc_msgSend(v29, "initWithObjects:", v30, objc_opt_class(), 0);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("GEOPOIEventHoursKey"));
    v32 = objc_claimAutoreleasedReturnValue();
    hours = v5->_hours;
    v5->_hours = (NSArray *)v32;

    v34 = objc_alloc(MEMORY[0x1E0C99E60]);
    v35 = objc_opt_class();
    v36 = (void *)objc_msgSend(v34, "initWithObjects:", v35, objc_opt_class(), 0);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("GEOPOIEventPerformersKey"));
    v37 = objc_claimAutoreleasedReturnValue();
    performers = v5->_performers;
    v5->_performers = (NSArray *)v37;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOCacheInvalidationData *invalidationData;
  id v5;

  invalidationData = self->_invalidationData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", invalidationData, CFSTR("GEOPOIEventInvalidationDataKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("GEOPOIEventIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedName, CFSTR("GEOPOIEventLocalizedNameKey"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("GEOPOIEventCenterCoordinateLatitudeKey"), self->_centerCoordinate.latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("GEOPOIEventCenterCoordinateLongitudeKey"), self->_centerCoordinate.longitude);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_expectedAttendance, CFSTR("GEOPOIEventExpectedAttendanceKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categories, CFSTR("GEOPOIEventCategoriesKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relatedPOIIdentifiers, CFSTR("GEOPOIEventRelatedPOIsKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("GEOPOIEventDateIntervalKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("GEOPOIEventTimeZoneKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hours, CFSTR("GEOPOIEventHoursKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_performers, CFSTR("GEOPOIEventPerformersKey"));

}

- (BOOL)isUpdateRequired
{
  return +[GEOPOIEvent isUpdateRequiredForInvalidationData:](GEOPOIEvent, "isUpdateRequiredForInvalidationData:", self->_invalidationData);
}

- (id)invalidationToken
{
  GEOPOIEventInvalidationData *v3;
  GEOCacheInvalidationData *invalidationData;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidationData)
    return 0;
  v3 = objc_alloc_init(GEOPOIEventInvalidationData);
  invalidationData = self->_invalidationData;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", invalidationData, 1, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  -[GEOPOIEventInvalidationData setCacheInvalidationData:]((uint64_t)v3, v5);

  if (v6)
  {
    if (qword_1ECDBC5C8 != -1)
      dispatch_once(&qword_1ECDBC5C8, &__block_literal_global_146);
    v7 = _MergedGlobals_284;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_284, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v12 = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Failed to serialize invalidation data: %{private}@", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    -[GEOPOIEventInvalidationData data](v3, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (GEOCacheInvalidationData)invalidationData
{
  return self->_invalidationData;
}

- (void)setInvalidationData:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationData, a3);
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_centerCoordinate.latitude;
  longitude = self->_centerCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCenterCoordinate:(id)a3
{
  self->_centerCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (int64_t)expectedAttendance
{
  return self->_expectedAttendance;
}

- (void)setExpectedAttendance:(int64_t)a3
{
  self->_expectedAttendance = a3;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (NSArray)relatedPOIIdentifiers
{
  return self->_relatedPOIIdentifiers;
}

- (void)setRelatedPOIIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_relatedPOIIdentifiers, a3);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSArray)hours
{
  return self->_hours;
}

- (void)setHours:(id)a3
{
  objc_storeStrong((id *)&self->_hours, a3);
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)setPerformers:(id)a3
{
  objc_storeStrong((id *)&self->_performers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_relatedPOIIdentifiers, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_invalidationData, 0);
}

@end
