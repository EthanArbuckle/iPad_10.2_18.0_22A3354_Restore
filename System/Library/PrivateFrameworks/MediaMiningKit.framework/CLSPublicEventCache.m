@implementation CLSPublicEventCache

+ (id)defaultCacheName
{
  return CFSTR("CLSPublicEventCache");
}

- (id)dataModelName
{
  return CFSTR("CLSPublicEventCacheModel");
}

- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  double v9;

  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CLSPublicEventCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke;
  v7[3] = &unk_1E84F9308;
  v9 = a3;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

- (id)predicateForTimeLocationTuple:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v20 = 0;
  v21 = 0;
  v18 = 0;
  v19 = 0;
  v3 = (objc_class *)MEMORY[0x1E0C9E368];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "coordinates");
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithCenter:radius:identifier:", v11, v7, v9, 20.0);

  CLSCalculateRangeCoordinateForRegion(v12, (double *)&v21, (double *)&v20, (double *)&v19, (double *)&v18);
  v13 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "predicateWithFormat:", CFSTR("startDate >= %@ && endDate <= %@ && %f <= latitude && latitude <= %f && %f <= longitude && longitude <= %f"), v14, v15, v21, v19, v20, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)insertBatchesOfPublicEventsByTimeLocationIdentifier:(id)a3 forTimeLocationTuples:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  CLSPublicEventCache *v21;
  _BYTE *v22;
  _BYTE buf[24];
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v6, "count");
  v10 = v9;
  if (v6 && v7 && v8 == v9)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v24 = 0;
    -[CLSDBCache managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __97__CLSPublicEventCache_insertBatchesOfPublicEventsByTimeLocationIdentifier_forTimeLocationTuples___block_invoke;
    v17[3] = &unk_1E84F9330;
    v18 = v7;
    v12 = v11;
    v19 = v12;
    v20 = v6;
    v21 = self;
    v22 = buf;
    objc_msgSend(v12, "performBlockAndWait:", v17);
    v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v8;
      _os_log_error_impl(&dword_1CAB79000, v15, OS_LOG_TYPE_ERROR, "Number of event batches (%lu) does not match number of time location tuples (%lu). Cannot insert batches.", buf, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (void)_updateManagedEvent:(id)a3 withEvent:(id)a4 inContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "setMuid:", objc_msgSend(v8, "muid"));
  objc_msgSend(v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", v10);

  objc_msgSend(v8, "localDateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalStartDate:", v12);

  v57 = v11;
  objc_msgSend(v11, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalEndDate:", v13);

  objc_msgSend(v8, "localStartTime");
  objc_msgSend(v7, "setLocalStartTime:");
  objc_msgSend(v8, "localEndTime");
  objc_msgSend(v7, "setLocalEndTime:");
  objc_msgSend(v8, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZoneOffset:", objc_msgSend(v14, "secondsFromGMT"));

  objc_msgSend(v7, "setExpectedAttendance:", objc_msgSend(v8, "expectedAttendance"));
  objc_msgSend(v7, "setBusinessItemMuid:", objc_msgSend(v8, "businessItemMuid"));
  objc_msgSend(v8, "businessItemCoordinates");
  objc_msgSend(v7, "setBusinessItemLatitude:");
  v59 = v8;
  objc_msgSend(v8, "businessItemCoordinates");
  objc_msgSend(v7, "setBusinessItemLongitude:", v15);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v58 = v7;
  objc_msgSend(v7, "categories");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v73 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v9, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    }
    while (v18);
  }

  objc_msgSend(v59, "categories");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v22);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v24 = v21;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v69 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        v30 = (void *)MEMORY[0x1E0C97B20];
        +[CLSManagedPublicEventCategory entityName](CLSManagedPublicEventCategory, "entityName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "insertNewObjectForEntityForName:inManagedObjectContext:", v31, v9);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "category");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setCategory:", v33);

        objc_msgSend(v29, "localizedName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setLocalizedName:", v34);

        objc_msgSend(v29, "localizedSubcategories");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "count"))
        {
          objc_msgSend(v35, "componentsJoinedByString:", CFSTR("_#_"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = 0;
        }
        objc_msgSend(v32, "setLocalizedSubcategories:", v36);

        objc_msgSend(v23, "addObject:", v32);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    }
    while (v26);
  }
  v56 = v24;

  objc_msgSend(v58, "setCategories:", v23);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v58, "performers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v65;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v65 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(v9, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    }
    while (v39);
  }

  objc_msgSend(v59, "performers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v43);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v45 = v42;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v61;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v61 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * m);
        v51 = (void *)MEMORY[0x1E0C97B20];
        +[CLSManagedPublicEventPerformer entityName](CLSManagedPublicEventPerformer, "entityName");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "insertNewObjectForEntityForName:inManagedObjectContext:", v52, v9);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v50, "localizedName");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setLocalizedName:", v54);

        objc_msgSend(v50, "iTunesIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setITunesIdentifier:", v55);

        objc_msgSend(v44, "addObject:", v53);
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    }
    while (v47);
  }

  objc_msgSend(v58, "setPerformers:", v44);
}

- (id)publicEventsForMuid:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  CLSPublicEventCache *v14;
  id v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__CLSPublicEventCache_publicEventsForMuid___block_invoke;
  v12[3] = &unk_1E84F9358;
  v16 = a3;
  v13 = v6;
  v14 = self;
  v7 = v5;
  v15 = v7;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v12);
  v9 = v15;
  v10 = v7;

  return v10;
}

- (id)publicEventsForTimeLocationTuple:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7034;
  v18 = __Block_byref_object_dispose__7035;
  v19 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__CLSPublicEventCache_publicEventsForTimeLocationTuple___block_invoke;
  v10[3] = &unk_1E84F9380;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)publicEventFromManagedObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  CLSPublicEventPerformer *v11;
  void *v12;
  void *v13;
  CLSPublicEventPerformer *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  CLSPublicEventCategory *v23;
  void *v24;
  CLSPublicEventCategory *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CLSPublicEvent *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  CLLocationDegrees v38;
  CLLocationDegrees v39;
  CLLocationCoordinate2D v40;
  void *v42;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "performers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v11 = [CLSPublicEventPerformer alloc];
        objc_msgSend(v10, "localizedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "iTunesIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CLSPublicEventPerformer initWithLocalizedName:iTunesIdentifier:](v11, "initWithLocalizedName:iTunesIdentifier:", v12, v13);

        objc_msgSend(v5, "addObject:", v14);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v7);
  }
  v42 = v5;

  v43 = v3;
  objc_msgSend(v3, "categories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v46 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        v23 = [CLSPublicEventCategory alloc];
        objc_msgSend(v22, "category");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[CLSPublicEventCategory initWithCategory:](v23, "initWithCategory:", v24);

        objc_msgSend(v22, "localizedName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSPublicEventCategory setLocalizedName:](v25, "setLocalizedName:", v26);

        objc_msgSend(v22, "localizedSubcategories");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          objc_msgSend(v27, "componentsSeparatedByString:", CFSTR("_#_"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = 0;
        }
        -[CLSPublicEventCategory setLocalizedSubcategories:](v25, "setLocalizedSubcategories:", v29);

        objc_msgSend(v16, "addObject:", v25);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v19);
  }

  v30 = objc_alloc_init(CLSPublicEvent);
  -[CLSPublicEvent setMuid:](v30, "setMuid:", objc_msgSend(v43, "muid"));
  objc_msgSend(v43, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSPublicEvent setName:](v30, "setName:", v31);

  v32 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v43, "localStartDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "localEndDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v32, "initWithStartDate:endDate:", v33, v34);
  -[CLSPublicEvent setLocalDateInterval:](v30, "setLocalDateInterval:", v35);

  objc_msgSend(v43, "localStartTime");
  -[CLSPublicEvent setLocalStartTime:](v30, "setLocalStartTime:");
  objc_msgSend(v43, "localEndTime");
  -[CLSPublicEvent setLocalEndTime:](v30, "setLocalEndTime:");
  objc_msgSend(v43, "timeZone");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSPublicEvent setTimeZone:](v30, "setTimeZone:", v36);

  -[CLSPublicEvent setCategories:](v30, "setCategories:", v16);
  -[CLSPublicEvent setPerformers:](v30, "setPerformers:", v42);
  -[CLSPublicEvent setExpectedAttendance:](v30, "setExpectedAttendance:", objc_msgSend(v43, "expectedAttendance"));
  -[CLSPublicEvent setBusinessItemMuid:](v30, "setBusinessItemMuid:", objc_msgSend(v43, "businessItemMuid"));
  objc_msgSend(v43, "businessItemLatitude");
  v38 = v37;
  objc_msgSend(v43, "businessItemLongitude");
  v40 = CLLocationCoordinate2DMake(v38, v39);
  -[CLSPublicEvent setBusinessItemCoordinates:](v30, "setBusinessItemCoordinates:", v40.latitude, v40.longitude);

  return v30;
}

- (BOOL)hasTimeLocationTuple:(id)a3
{
  return -[CLSPublicEventCache numberOftimeLocationTuplesForTimeLocationTuple:](self, "numberOftimeLocationTuplesForTimeLocationTuple:", a3) != 0;
}

- (unint64_t)numberOftimeLocationTuplesForTimeLocationTuple:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__CLSPublicEventCache_numberOftimeLocationTuplesForTimeLocationTuple___block_invoke;
  v10[3] = &unk_1E84F9380;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v13 = &v14;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __70__CLSPublicEventCache_numberOftimeLocationTuplesForTimeLocationTuple___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSManagedQueryLocation entityName](CLSManagedQueryLocation, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "predicateForTimeLocationTuple:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = *(void **)(a1 + 48);
  v9 = 0;
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v4, &v9);
  v8 = v9;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;

}

void __56__CLSPublicEventCache_publicEventsForTimeLocationTuple___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSManagedQueryLocation entityName](CLSManagedQueryLocation, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "predicateForTimeLocationTuple:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = *(void **)(a1 + 48);
  v35 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v35;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v24 = v8;
    v26 = v4;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v25 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          objc_msgSend(v17, "publicEvents");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v28;
            do
            {
              v22 = 0;
              do
              {
                if (*(_QWORD *)v28 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(*(id *)(a1 + 32), "publicEventFromManagedObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v23);

                ++v22;
              }
              while (v20 != v22);
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
            }
            while (v20);
          }

          ++v16;
        }
        while (v16 != v14);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v14);
    }

    v7 = v25;
    v4 = v26;
    v8 = v24;
  }

}

void __43__CLSPublicEventCache_publicEventsForMuid___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSManagedPublicEvent entityName](CLSManagedPublicEvent, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("muid == %lu"), *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = *(void **)(a1 + 32);
  v22 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 40), "publicEventFromManagedObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v11);
  }

  if (!objc_msgSend(v9, "count"))
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loggingConnection");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134217984;
      v24 = v17;
      _os_log_error_impl(&dword_1CAB79000, v16, OS_LOG_TYPE_ERROR, "Didn't find event for muid %lu", buf, 0xCu);
    }

  }
}

uint64_t __97__CLSPublicEventCache_insertBatchesOfPublicEventsByTimeLocationIdentifier_forTimeLocationTuples___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t result;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *context;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = *(id *)(a1 + 32);
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v42;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(obj);
        v36 = v5;
        v6 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1D1796094]();
        v7 = (void *)MEMORY[0x1E0C97B20];
        +[CLSManagedQueryLocation entityName](CLSManagedQueryLocation, "entityName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "insertNewObjectForEntityForName:inManagedObjectContext:", v8, *(_QWORD *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = v9;
        objc_msgSend(v9, "setUpdateTimestamp:", v4);
        v10 = *(void **)(a1 + 48);
        v33 = v6;
        objc_msgSend(v6, "timeLocationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v12, "count"));
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v38;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v38 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v18);
              v20 = (void *)MEMORY[0x1E0C97B20];
              +[CLSManagedPublicEvent entityName](CLSManagedPublicEvent, "entityName");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "insertNewObjectForEntityForName:inManagedObjectContext:", v21, *(_QWORD *)(a1 + 40));
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(*(id *)(a1 + 56), "_updateManagedEvent:withEvent:inContext:", v22, v19, *(_QWORD *)(a1 + 40));
              objc_msgSend(v13, "addObject:", v22);

              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v16);
        }

        objc_msgSend(v33, "coordinates");
        v24 = v23;
        v26 = v25;
        objc_msgSend(v33, "startDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setStartDate:", v27);

        objc_msgSend(v33, "endDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setEndDate:", v28);

        objc_msgSend(v34, "setLatitude:", v24);
        objc_msgSend(v34, "setLongitude:", v26);
        objc_msgSend(v34, "setPublicEvents:", v13);

        objc_autoreleasePoolPop(context);
        v5 = v36 + 1;
      }
      while (v36 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v32);
  }

  result = objc_msgSend(*(id *)(a1 + 56), "_save");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

void __67__CLSPublicEventCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSManagedQueryLocation entityName](CLSManagedQueryLocation, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("updateTimestamp <= %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", v7);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v4, &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v30;

  if (objc_msgSend(v9, "count"))
  {
    v21 = v7;
    v22 = v4;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __67__CLSPublicEventCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke_2;
    v29[3] = &unk_1E84F92E0;
    v29[4] = *(_QWORD *)(a1 + 32);
    v23 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D1796244](v29);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = v9;
    obj = v9;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1D1796094]();
          objc_msgSend(v17, "publicEvents");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v11, "unionSet:", v19);
          objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v17);
          if ((unint64_t)(v14 + i) >= 0x32)
            ((void (**)(_QWORD, _QWORD, void *))v23)[2](v23, *(_QWORD *)(a1 + 40), v11);

          objc_autoreleasePoolPop(v18);
        }
        v14 += v13;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v13);
    }

    ((void (**)(_QWORD, _QWORD, void *))v23)[2](v23, *(_QWORD *)(a1 + 40), v11);
    v7 = v21;
    v4 = v22;
    v9 = v20;
  }

}

void __67__CLSPublicEventCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "processPendingChanges");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "queryLocations", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
          objc_msgSend(v5, "deleteObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_save");

}

@end
