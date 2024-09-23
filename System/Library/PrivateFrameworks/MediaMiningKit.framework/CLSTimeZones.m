@implementation CLSTimeZones

- (id)timeZoneWithLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CLSTimeZones timeZonesDB](self, "timeZonesDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSTimeZones closestZoneInfoWithLocation:source:](self, "closestZoneInfoWithLocation:source:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (-[CLSTimeZones timeZoneWithDictionary:](self, "timeZoneWithDictionary:", v6),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)timeZoneWithLocation:(id)a3 countryCode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  if (a4)
  {
    -[CLSTimeZones filteredTimeZonesWithCountyCode:](self, "filteredTimeZonesWithCountyCode:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSTimeZones closestZoneInfoWithLocation:source:](self, "closestZoneInfoWithLocation:source:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSTimeZones timeZoneWithDictionary:](self, "timeZoneWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[CLSTimeZones timeZoneWithLocation:](self, "timeZoneWithLocation:", v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

  }
  else
  {
    -[CLSTimeZones timeZoneWithLocation:](self, "timeZoneWithLocation:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)invalidateCaches
{
  NSArray *timeZonesDB;
  CLSTimeZones *obj;

  obj = self;
  objc_sync_enter(obj);
  timeZonesDB = obj->_timeZonesDB;
  obj->_timeZonesDB = 0;

  objc_sync_exit(obj);
}

- (NSArray)timeZonesDB
{
  CLSTimeZones *v2;
  NSArray *timeZonesDB;
  uint64_t v4;
  NSArray *v5;
  NSArray *v6;

  v2 = self;
  objc_sync_enter(v2);
  timeZonesDB = v2->_timeZonesDB;
  if (!timeZonesDB)
  {
    -[CLSTimeZones _importDataBaseFromFile:](v2, "_importDataBaseFromFile:", CFSTR("timezonesDB.json"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_timeZonesDB;
    v2->_timeZonesDB = (NSArray *)v4;

    timeZonesDB = v2->_timeZonesDB;
  }
  v6 = timeZonesDB;
  objc_sync_exit(v2);

  return v6;
}

- (id)_importDataBaseFromFile:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", v3, 0);
  v5 = objc_claimAutoreleasedReturnValue();

  v25 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  v30 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v30;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("latitude"), v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("longitude"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v16, v19);
        if (v20)
        {
          v21 = (void *)objc_msgSend(v13, "mutableCopy");
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("clLocation"));
          objc_msgSend(v7, "addObject:", v21);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)closestZoneInfoWithLocation:(id)a3 source:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    v11 = 1.79769313e308;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("clLocation"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "distanceFromLocation:", v14);
        if (v15 < v11)
        {
          v16 = v15;
          v17 = v13;

          v9 = v17;
          v11 = v16;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)filteredTimeZonesWithCountyCode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("country_code LIKE %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSTimeZones timeZonesDB](self, "timeZonesDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)timeZoneWithDictionary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("zone"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTimeZonesDB:(id)a3
{
  objc_storeStrong((id *)&self->_timeZonesDB, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZonesDB, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, &__block_literal_global_6253);
  return (id)sharedInstance_sharedInstance;
}

void __30__CLSTimeZones_sharedInstance__block_invoke()
{
  CLSTimeZones *v0;
  void *v1;

  v0 = objc_alloc_init(CLSTimeZones);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

@end
