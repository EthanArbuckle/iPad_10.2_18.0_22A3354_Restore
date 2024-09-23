@implementation MNTrace

- (GEOComposedRoute)initialRoute
{
  MNTrace *v2;
  id v3;

  v2 = self;
  v3 = MNTrace.initialRoute.getter();

  return (GEOComposedRoute *)v3;
}

- (id)routeBeforeTimestamp:(double)a3
{
  MNTrace *v4;
  void *v5;

  v4 = self;
  v5 = (void *)MNTrace.route(beforeTimestamp:)(a3);

  return v5;
}

- (id)routesWithDirectionsResponseID:(id)a3 selectedRouteIndex:(int64_t *)a4
{
  id v6;
  MNTrace *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;

  v6 = a3;
  v7 = self;
  v8 = sub_1B0BCA9E4();
  v10 = v9;

  v11 = MNTrace.objcOnly_routesWithDirectionsResponseID(directionsResponseID:selectedRouteIndex:)(v8, v10, (unint64_t)a4);
  sub_1B0ADF064(v8, v10);

  if (v11)
  {
    sub_1B0ADE380(0, &qword_1EEEC8A78);
    v12 = (void *)sub_1B0BCAA50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (int64_t)locationIndexAfterTimestamp:(double)a3
{
  MNTrace *v4;
  Swift::Int value;
  Swift::Int_optional v7;

  v4 = self;
  v7 = MNTrace.locationIndex(afterTimestamp:)(a3);
  if (v7.is_nil)
    v7.value = sub_1B0BCA984();
  value = v7.value;

  return value;
}

+ (unint64_t)currentVersion
{
  return 61;
}

+ (NSString)mainSchema
{
  return (NSString *)(id)sub_1B0BCAA14();
}

+ (id)upgradeSchemaFromVersion:(unint64_t)a3 error:(id *)a4
{
  void *v4;

  sub_1B0AE094C(a3);
  v4 = (void *)sub_1B0BCAA14();
  swift_bridgeObjectRelease();
  return v4;
}

- (MNTrace)init
{
  MNTrace *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *writeQueue;
  dispatch_group_t v5;
  OS_dispatch_group *writeGroup;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MNTrace;
  v2 = -[MNTrace init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Maps.Trace", 0);
    writeQueue = v2->_writeQueue;
    v2->_writeQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_group_create();
    writeGroup = v2->_writeGroup;
    v2->_writeGroup = (OS_dispatch_group *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MNTrace closeTrace](self, "closeTrace");
  v3.receiver = self;
  v3.super_class = (Class)MNTrace;
  -[MNTrace dealloc](&v3, sel_dealloc);
}

- (BOOL)openTrace:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSString *v16;
  NSString *tracePath;
  int v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!self->_db)
  {
    v8 = objc_retainAutorelease(v6);
    v9 = sqlite3_open_v2((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &self->_db, 2, 0);
    if (!v9)
    {
      v16 = (NSString *)objc_msgSend(v8, "copy");
      tracePath = self->_tracePath;
      self->_tracePath = v16;

      v14 = 1;
      goto LABEL_9;
    }
    v10 = v9;
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 138543618;
      v19 = v8;
      v20 = 1024;
      v21 = v10;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Error opening trace for path: %{public}@, error code: %d", (uint8_t *)&v18, 0x12u);
    }

    -[MNTrace _handleOpenErrorWithPath:](self, "_handleOpenErrorWithPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a4)
      *a4 = objc_retainAutorelease(v12);

  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (BOOL)startWritingTraceToPath:(id)a3
{
  id v4;
  id v5;
  int v6;
  NSObject *v7;
  id v8;
  NSString *v9;
  NSString *tracePath;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_db)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("startWritingTraceToPath: called when sqlite database already exists"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "_db == NULL";
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v14, 0x16u);
    }

  }
  self->_db = 0;
  v5 = objc_retainAutorelease(v4);
  v6 = sqlite3_open_v2((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &self->_db, 6, 0);
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543618;
      v15 = (const char *)v5;
      v16 = 1024;
      LODWORD(v17) = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "Error opening trace for writing at path: %{public}@, error code: %d", (uint8_t *)&v14, 0x12u);
    }

  }
  else
  {
    LOBYTE(v14) = -1;
    v8 = objc_retainAutorelease(v5);
    setxattr((const char *)objc_msgSend(v8, "UTF8String"), "com.apple.runningboard.can-suspend-locked", &v14, 1uLL, 0, 0);
    v9 = (NSString *)objc_msgSend(v8, "copy");
    tracePath = self->_tracePath;
    self->_tracePath = v9;

  }
  return v6 == 0;
}

- (BOOL)closeTrace
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSMutableArray *preparedStatements;
  int v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_db)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = self->_preparedStatements;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "finalize", (_QWORD)v16);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v5);
    }

    preparedStatements = self->_preparedStatements;
    self->_preparedStatements = 0;

    v9 = sqlite3_close(self->_db);
    v10 = v9 == 0;
    if (!v9)
      goto LABEL_18;
    v11 = v9;
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v11 == 5)
    {
      if (v13)
      {
        *(_DWORD *)buf = 67109120;
        v21 = 5;
        v14 = "Error closing temp trace: %d sqlite3 is busy";
LABEL_16:
        _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, v14, buf, 8u);
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 67109120;
      v21 = v11;
      v14 = "Error closing temp trace: %d";
      goto LABEL_16;
    }

LABEL_18:
    self->_db = 0;
    return v10;
  }
  return 0;
}

- (id)dateFromTimestamp:(double)a3
{
  NSDate *recordingStartDate;
  void *v6;
  void *v7;
  NSDate *v8;
  NSDate *v9;

  recordingStartDate = self->_recordingStartDate;
  if (!recordingStartDate)
  {
    -[NSArray firstObject](self->_locations, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timestamp");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v9 = self->_recordingStartDate;
    self->_recordingStartDate = v8;

    recordingStartDate = self->_recordingStartDate;
  }
  return -[NSDate dateByAddingTimeInterval:](recordingStartDate, "dateByAddingTimeInterval:", a3);
}

- (int)mainTransportType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[MNTrace directions](self, "directions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "routeAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mainTransportType");

  }
  else
  {
    v6 = 4;
  }

  return v6;
}

- (NSArray)bookmarks
{
  NSObject *v3;
  NSArray *bookmarks;
  NSArray *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[MNTrace writeQueue](self, "writeQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);
  bookmarks = self->_bookmarks;
  if (!bookmarks)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__7;
    v12 = __Block_byref_object_dispose__7;
    v13 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __20__MNTrace_bookmarks__block_invoke;
    v7[3] = &unk_1E61D1B10;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v3, v7);
    objc_storeStrong((id *)&self->_bookmarks, (id)v9[5]);
    _Block_object_dispose(&v8, 8);

    bookmarks = self->_bookmarks;
  }
  v5 = bookmarks;

  return v5;
}

void __20__MNTrace_bookmarks__block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  if (sqlite3_prepare_v2((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "db"), "SELECT timestamp FROM bookmarks", 31, &ppStmt, 0))
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
      *(_DWORD *)buf = 136446210;
      v10 = v3;
      _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_ERROR, "Error preparing bookmarks statement: %{public}s", buf, 0xCu);
    }
  }
  else
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", sqlite3_data_count(ppStmt));
    while (sqlite3_step(ppStmt) == 100)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(ppStmt, 0));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v2, "addObject:", v4);

    }
    sqlite3_finalize(ppStmt);
    v5 = -[NSObject copy](v2, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (NSArray)bookmarkImages
{
  NSObject *v3;
  NSArray *bookmarkImages;
  NSArray *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[MNTrace writeQueue](self, "writeQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);
  bookmarkImages = self->_bookmarkImages;
  if (!bookmarkImages)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__7;
    v12 = __Block_byref_object_dispose__7;
    v13 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __25__MNTrace_bookmarkImages__block_invoke;
    v7[3] = &unk_1E61D1B10;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v3, v7);
    objc_storeStrong((id *)&self->_bookmarkImages, (id)v9[5]);
    _Block_object_dispose(&v8, 8);

    bookmarkImages = self->_bookmarkImages;
  }
  v5 = bookmarkImages;

  return v5;
}

void __25__MNTrace_bookmarkImages__block_invoke(uint64_t a1)
{
  void *v2;
  const void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  sqlite3_prepare_v2((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "db"), (const char *)objc_msgSend(CFSTR("SELECT screenshot_data FROM bookmarks"), "UTF8String"), objc_msgSend(CFSTR("SELECT screenshot_data FROM bookmarks"), "length"), &ppStmt, 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", sqlite3_data_count(ppStmt));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (sqlite3_step(ppStmt) == 100)
  {
    do
    {
      v3 = sqlite3_column_blob(ppStmt, 0);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v3, sqlite3_column_bytes(ppStmt, 0));
      objc_msgSend(v2, "addObject:", v4);
      v5 = sqlite3_step(ppStmt);

    }
    while (v5 == 100);
  }
  sqlite3_finalize(ppStmt);
  v6 = objc_msgSend(v2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)_handleOpenErrorWithPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "filePosixPermissions") & 0x100) != 0)
  {
    v9 = 0;
    v6 = 0;
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't open file because file does not have read permission set. Try running as root:\n> chmod u+r %@"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v6;
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      v12 = *MEMORY[0x1E0CB2D50];
      v13 = v6;
      v8 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
      v8 = 1;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MNTraceErrorDomain"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)prepareStatement:(id)a3 outError:(id *)a4
{
  void *v5;
  NSMutableArray *preparedStatements;
  NSMutableArray *v7;
  NSMutableArray *v8;

  +[MNTracePreparedStatement preparedStatementForTrace:statement:outError:](MNTracePreparedStatement, "preparedStatementForTrace:statement:outError:", self, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    preparedStatements = self->_preparedStatements;
    if (!preparedStatements)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_preparedStatements;
      self->_preparedStatements = v7;

      preparedStatements = self->_preparedStatements;
    }
    -[NSMutableArray addObject:](preparedStatements, "addObject:", v5);
  }
  return v5;
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (int64_t)traceType
{
  return self->_traceType;
}

- (void)setTraceType:(int64_t)a3
{
  self->_traceType = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)originalVersion
{
  return self->_originalVersion;
}

- (void)setOriginalVersion:(unint64_t)a3
{
  self->_originalVersion = a3;
}

- (NSDate)recordingStartDate
{
  return self->_recordingStartDate;
}

- (void)setRecordingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_recordingStartDate, a3);
}

- (NSDate)directionsStartDate
{
  return self->_directionsStartDate;
}

- (void)setDirectionsStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_directionsStartDate, a3);
}

- (NSDate)navigationStartDate
{
  return self->_navigationStartDate;
}

- (void)setNavigationStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_navigationStartDate, a3);
}

- (NSDate)navigationEndDate
{
  return self->_navigationEndDate;
}

- (void)setNavigationEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_navigationEndDate, a3);
}

- (BOOL)isSimulation
{
  return self->_isSimulation;
}

- (void)setIsSimulation:(BOOL)a3
{
  self->_isSimulation = a3;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (NSArray)directions
{
  return self->_directions;
}

- (void)setDirections:(id)a3
{
  objc_storeStrong((id *)&self->_directions, a3);
}

- (NSArray)etaUpdates
{
  return self->_etaUpdates;
}

- (void)setEtaUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_etaUpdates, a3);
}

- (NSArray)headingData
{
  return self->_headingData;
}

- (void)setHeadingData:(id)a3
{
  objc_storeStrong((id *)&self->_headingData, a3);
}

- (NSArray)motionData
{
  return self->_motionData;
}

- (void)setMotionData:(id)a3
{
  objc_storeStrong((id *)&self->_motionData, a3);
}

- (NSArray)vehicleHeadingData
{
  return self->_vehicleHeadingData;
}

- (void)setVehicleHeadingData:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleHeadingData, a3);
}

- (NSArray)vehicleSpeedData
{
  return self->_vehicleSpeedData;
}

- (void)setVehicleSpeedData:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleSpeedData, a3);
}

- (NSArray)evData
{
  return self->_evData;
}

- (void)setEvData:(id)a3
{
  objc_storeStrong((id *)&self->_evData, a3);
}

- (NSArray)navigationEvents
{
  return self->_navigationEvents;
}

- (void)setNavigationEvents:(id)a3
{
  objc_storeStrong((id *)&self->_navigationEvents, a3);
}

- (NSArray)annotatedUserBehavior
{
  return self->_annotatedUserBehavior;
}

- (void)setAnnotatedUserBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_annotatedUserBehavior, a3);
}

- (NSArray)annotatedUserEnvironments
{
  return self->_annotatedUserEnvironments;
}

- (void)setAnnotatedUserEnvironments:(id)a3
{
  objc_storeStrong((id *)&self->_annotatedUserEnvironments, a3);
}

- (NSArray)navigationUpdates
{
  return self->_navigationUpdates;
}

- (void)setNavigationUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_navigationUpdates, a3);
}

- (NSArray)networkEvents
{
  return self->_networkEvents;
}

- (void)setNetworkEvents:(id)a3
{
  objc_storeStrong((id *)&self->_networkEvents, a3);
}

- (NSArray)routeCreationActions
{
  return self->_routeCreationActions;
}

- (void)setRouteCreationActions:(id)a3
{
  objc_storeStrong((id *)&self->_routeCreationActions, a3);
}

- (void)setBookmarks:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarks, a3);
}

- (void)setBookmarkImages:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkImages, a3);
}

- (NSDictionary)miscInfo
{
  return self->_miscInfo;
}

- (void)setMiscInfo:(id)a3
{
  objc_storeStrong((id *)&self->_miscInfo, a3);
}

- (sqlite3)db
{
  return self->_db;
}

- (OS_dispatch_queue)writeQueue
{
  return self->_writeQueue;
}

- (OS_dispatch_group)writeGroup
{
  return self->_writeGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscInfo, 0);
  objc_storeStrong((id *)&self->_routeCreationActions, 0);
  objc_storeStrong((id *)&self->_networkEvents, 0);
  objc_storeStrong((id *)&self->_navigationUpdates, 0);
  objc_storeStrong((id *)&self->_navigationEvents, 0);
  objc_storeStrong((id *)&self->_evData, 0);
  objc_storeStrong((id *)&self->_navigationEndDate, 0);
  objc_storeStrong((id *)&self->_navigationStartDate, 0);
  objc_storeStrong((id *)&self->_directionsStartDate, 0);
  objc_storeStrong((id *)&self->_recordingStartDate, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_storeStrong((id *)&self->_annotatedUserEnvironments, 0);
  objc_storeStrong((id *)&self->_annotatedUserBehavior, 0);
  objc_storeStrong((id *)&self->_vehicleSpeedData, 0);
  objc_storeStrong((id *)&self->_vehicleHeadingData, 0);
  objc_storeStrong((id *)&self->_motionData, 0);
  objc_storeStrong((id *)&self->_headingData, 0);
  objc_storeStrong((id *)&self->_etaUpdates, 0);
  objc_storeStrong((id *)&self->_directions, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_bookmarkImages, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_writeGroup, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
}

- (id)serializableBookmarks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MNTraceBookmark *v14;
  void *v15;
  unint64_t v16;

  -[MNTrace bookmarks](self, "bookmarks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[MNTrace bookmarks](self, "bookmarks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[MNTrace bookmarks](self, "bookmarks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      do
      {
        -[MNTrace bookmarks](self, "bookmarks");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[MNTrace bookmarkImages](self, "bookmarkImages");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_alloc_init(MNTraceBookmark);
        objc_msgSend(v11, "doubleValue");
        -[MNTraceBookmark setTimestamp:](v14, "setTimestamp:");
        -[MNTraceBookmark setImageData:](v14, "setImageData:", v13);
        objc_msgSend(v6, "addObject:", v14);

        ++v9;
        -[MNTrace bookmarks](self, "bookmarks");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

      }
      while (v9 < v16);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
