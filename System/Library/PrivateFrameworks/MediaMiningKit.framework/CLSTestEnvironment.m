@implementation CLSTestEnvironment

+ (void)test_routineAddLocationOfInterest:(id)a3 toServiceManager:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "routineService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cacheLocationOfInterest:", v5);

  objc_msgSend(v6, "setRoutineIsAvailable:", 1);
}

+ (id)test_cacheBusinessItem:(id)a3 poiCache:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertBatchesOfBusinessItems:forRegions:", v8, v10);

  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v16 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateBusinessItems:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "firstObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v5;
  }

  return v14;
}

+ (id)test_placemarkWithData:(id)a3
{
  id v3;
  CLSLitePlacemark *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  v4 = objc_alloc_init(CLSLitePlacemark);
  objc_msgSend(v3, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setRegion:](v4, "setRegion:", v5);

  objc_msgSend(v3, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setLocation:](v4, "setLocation:", v6);

  objc_msgSend(v3, "thoroughfare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setThoroughfare:](v4, "setThoroughfare:", v7);

  objc_msgSend(v3, "subThoroughfare");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setSubThoroughfare:](v4, "setSubThoroughfare:", v8);

  objc_msgSend(v3, "locality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setLocality:](v4, "setLocality:", v9);

  objc_msgSend(v3, "subLocality");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setSubLocality:](v4, "setSubLocality:", v10);

  objc_msgSend(v3, "administrativeArea");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setAdministrativeArea:](v4, "setAdministrativeArea:", v11);

  objc_msgSend(v3, "subAdministrativeArea");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setSubAdministrativeArea:](v4, "setSubAdministrativeArea:", v12);

  objc_msgSend(v3, "ISOcountryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setISOcountryCode:](v4, "setISOcountryCode:", v13);

  objc_msgSend(v3, "inlandWater");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setInlandWater:](v4, "setInlandWater:", v14);

  objc_msgSend(v3, "ocean");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setOcean:](v4, "setOcean:", v15);

  objc_msgSend(v3, "areasOfInterest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setAreasOfInterest:](v4, "setAreasOfInterest:", v16);

  objc_msgSend(v3, "administrativeAreaCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSLitePlacemark setAdministrativeAreaCode:](v4, "setAdministrativeAreaCode:", v17);

  -[CLSLitePlacemark setIsIsland:](v4, "setIsIsland:", objc_msgSend(v3, "isIsland"));
  objc_msgSend(v3, "popularityScoresOrderedByAOI");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLSLitePlacemark setPopularityScoresOrderedByAOI:](v4, "setPopularityScoresOrderedByAOI:", v18);
  return v4;
}

+ (id)test_locationOfInterestAndVisitFromDictionary:(id)a3 poiCache:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CLSBusinessItem *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  CLSLocationOfInterest *v31;
  void *v32;
  CLSLocationOfInterest *v33;
  CLSLocationOfInterestVisit *v34;
  void *v35;
  CLSLocationOfInterestVisit *v36;
  void *v38;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("latitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v7;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("longitude"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v12 = CFSTR("unknown");
  if (v11)
    v12 = v11;
  v13 = v12;

  v14 = rand();
  v15 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v7, "doubleValue");
  v17 = v16;
  objc_msgSend(v8, "doubleValue");
  v19 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:", v17, v18);
  v20 = objc_alloc_init(CLSBusinessItem);
  -[CLSBusinessItem setMuid:](v20, "setMuid:", v14);
  -[CLSBusinessItem setName:](v20, "setName:", v13);

  v21 = objc_alloc(MEMORY[0x1E0C9E368]);
  objc_msgSend(v19, "coordinate");
  v23 = v22;
  v25 = v24;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v21, "initWithCenter:radius:identifier:", v27, v23, v25, 5.0);
  -[CLSBusinessItem setRegion:](v20, "setRegion:", v28);

  v29 = +[CLSTestEnvironment test_cacheBusinessItem:poiCache:](CLSTestEnvironment, "test_cacheBusinessItem:poiCache:", v20, v5);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v10);
  v31 = [CLSLocationOfInterest alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[CLSLocationOfInterest initWithIdentifier:locationOfInterestType:location:placemarkRegion:businessItemMuid:radius:](v31, "initWithIdentifier:locationOfInterestType:location:placemarkRegion:businessItemMuid:radius:", v32, -1, v19, 0, v14, 200.0);

  v34 = [CLSLocationOfInterestVisit alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[CLSLocationOfInterestVisit initWithIdentifier:visitInterval:confidence:](v34, "initWithIdentifier:visitInterval:confidence:", v35, v30, 1.0);

  -[CLSLocationOfInterest addVisit:](v33, "addVisit:", v36);
  return v33;
}

+ (id)test_publicEventManagerWithQueryRadius:(double)a3 invalidateCache:(BOOL)a4
{
  _BOOL4 v4;
  CLSPublicEventManager *v6;
  void *v7;
  void *v8;
  void *v9;
  CLSPublicEventManager *v10;

  v4 = a4;
  v6 = [CLSPublicEventManager alloc];
  v7 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CLSPublicEventManager initWithURL:](v6, "initWithURL:", v9);

  -[CLSPublicEventManager setQueryRadius:](v10, "setQueryRadius:", a3);
  if (v4)
  {
    -[CLSPublicEventManager invalidateDiskCaches](v10, "invalidateDiskCaches");
    -[CLSPublicEventManager invalidateMemoryCaches](v10, "invalidateMemoryCaches");
  }
  return v10;
}

+ (void)test_setMePersonIdentity:(id)a3 onServiceManager:(id)a4
{
  objc_msgSend(a4, "setMePerson:", a3);
}

@end
