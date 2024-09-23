@implementation MNTraceLoader

- (id)loadTraceWithPath:(id)a3 outError:(id *)a4
{
  return -[MNTraceLoader loadTraceWithPath:options:outError:](self, "loadTraceWithPath:options:outError:", a3, 15355, a4);
}

- (id)loadTraceWithPath:(id)a3 options:(int64_t)a4 outError:(id *)a5
{
  id v8;
  MNTrace *v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  const char *v13;
  MNTrace *v14;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MNTrace);
  if (-[MNTrace openTrace:outError:](v9, "openTrace:outError:", v8, a5))
  {
    objc_storeStrong((id *)&self->_trace, v9);
    -[MNTraceLoader _loadTraceVersion](self, "_loadTraceVersion");
    v10 = -[MNTrace version](self->_trace, "version");
    if (v10 <= +[MNTrace currentVersion](MNTrace, "currentVersion"))
    {
      if (!-[MNTraceLoader _updateTraceFromVersion:outError:](self, "_updateTraceFromVersion:outError:", -[MNTrace version](self->_trace, "version"), a5))
      {
        GEOFindOrCreateLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v8;
          _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_ERROR, "Failed to update trace to current version: %@", buf, 0xCu);
        }

        if (a5 && !*a5)
        {
          -[MNTraceLoader _errorWithCode:errorDescriptionFormat:](self, "_errorWithCode:errorDescriptionFormat:", 0, CFSTR("Unknown error."));
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *a5 = v18;

        }
        goto LABEL_9;
      }
    }
    else if (a5)
    {
      -[MNTraceLoader _errorWithCode:errorDescriptionFormat:](self, "_errorWithCode:errorDescriptionFormat:", 6, CFSTR("Attempting to open trace with version %d which is newer than this build's version of %d. Forward compatibility usually works, but is not guaranteed."), -[MNTrace version](self->_trace, "version"), +[MNTrace currentVersion](MNTrace, "currentVersion"));
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v11;

    }
    if ((a4 & 1) != 0 && !-[MNTraceLoader _loadInfoTable](self, "_loadInfoTable"))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v13 = "Failed to load info table for trace: %@";
      goto LABEL_7;
    }
    if ((a4 & 2) != 0 && !-[MNTraceLoader _loadLocationsTable:](self, "_loadLocationsTable:", (~(_DWORD)a4 & 6) == 0))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v13 = "Failed to load locations for trace: %@";
      goto LABEL_7;
    }
    if ((a4 & 8) != 0
      && !-[MNTraceLoader _loadDirectionsTableAllowDeprecatedProtocol:outError:](self, "_loadDirectionsTableAllowDeprecatedProtocol:outError:", (~a4 & 0xFFFFFFFF80000008) == 0, a5))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v13 = "Failed to load direction for trace: %@";
      goto LABEL_7;
    }
    if ((a4 & 0x10) != 0 && !-[MNTraceLoader _loadETAUpdatesTable](self, "_loadETAUpdatesTable"))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v13 = "Failed to load ETA updates for trace: %@";
      goto LABEL_7;
    }
    if ((a4 & 0x20) != 0 && !-[MNTraceLoader _loadCompassHeadingDataTable](self, "_loadCompassHeadingDataTable"))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v13 = "Failed to load compass heading data for trace: %@";
      goto LABEL_7;
    }
    if ((a4 & 0x40) != 0 && !-[MNTraceLoader _loadMotionDataTable](self, "_loadMotionDataTable"))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v13 = "Failed to load motion data for trace: %@";
      goto LABEL_7;
    }
    if ((a4 & 0x80) != 0 && !-[MNTraceLoader _loadVehicleDataTable](self, "_loadVehicleDataTable"))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v13 = "Failed to load vehicle data for trace: %@";
      goto LABEL_7;
    }
    if ((a4 & 0x100) != 0 && !-[MNTraceLoader _loadEVDataTable](self, "_loadEVDataTable"))
    {
      GEOFindOrCreateLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "Failed to load ev data for trace: %@", buf, 0xCu);
      }

    }
    if ((a4 & 0x200) != 0 && !-[MNTraceLoader _loadNavigationEventsTable](self, "_loadNavigationEventsTable"))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v13 = "Failed to load navigation events table for trace: %@";
      goto LABEL_7;
    }
    if ((a4 & 0x400) == 0)
      goto LABEL_37;
    if (!-[MNTraceLoader _loadAnnotatedUserBehaviorTable](self, "_loadAnnotatedUserBehaviorTable"))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v13 = "Failed to load annotated user behavior for trace: %@";
      goto LABEL_7;
    }
    if (!-[MNTraceLoader _loadAnnotatedUserEnvironmentTable](self, "_loadAnnotatedUserEnvironmentTable"))
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      v13 = "Failed to load annotated user environment for trace: %@";
    }
    else
    {
LABEL_37:
      if ((a4 & 0x800) != 0 && !-[MNTraceLoader _loadMiscInfo](self, "_loadMiscInfo"))
      {
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        v13 = "Failed to load misc info table for trace: %@";
      }
      else if ((a4 & 0x1000) != 0 && !-[MNTraceLoader _loadNavigationUpdatesTable](self, "_loadNavigationUpdatesTable"))
      {
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        v13 = "Failed to navigation updates table for trace: %@";
      }
      else if ((a4 & 0x2000) != 0 && !-[MNTraceLoader _loadNetworkEvents](self, "_loadNetworkEvents"))
      {
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        v13 = "Failed to load network event table for trace: %@";
      }
      else if ((a4 & 0x4000) != 0
             && !-[MNTraceLoader _loadRouteCreationActionsTable](self, "_loadRouteCreationActionsTable"))
      {
        MNGetMNTraceLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        v13 = "Failed to load route creation actions table for trace: %@";
      }
      else
      {
        if (-[MNTraceLoader loadExtraData](self, "loadExtraData"))
        {
          v14 = v9;
          goto LABEL_10;
        }
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        v13 = "Failed to load extra data for trace: %@";
      }
    }
LABEL_7:
    _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    goto LABEL_8;
  }
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v8;
    v13 = "Failed to open trace: %@";
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)_loadInfoTable
{
  MNTrace *trace;
  void *v4;
  id v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  id v15;

  trace = self->_trace;
  v15 = 0;
  +[MNTracePreparedStatement preparedStatementForTrace:statement:outError:](MNTracePreparedStatement, "preparedStatementForTrace:statement:outError:", trace, CFSTR("SELECT trace_type, recording_start_time, directions_start_time, navigation_start_time, navigation_end_time, simulation, original_version FROM info LIMIT 1"), &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (!v5 && objc_msgSend(v4, "stepRow"))
  {
    do
    {
      -[MNTrace setTraceType:](self->_trace, "setTraceType:", (int)objc_msgSend(v4, "columnInt:", 0));
      objc_msgSend(v4, "columnDouble:", 1);
      if (v6 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTrace setRecordingStartDate:](self->_trace, "setRecordingStartDate:", v7);

      }
      objc_msgSend(v4, "columnDouble:", 2);
      if (v8 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTrace setDirectionsStartDate:](self->_trace, "setDirectionsStartDate:", v9);

      }
      objc_msgSend(v4, "columnDouble:", 3);
      if (v10 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTrace setNavigationStartDate:](self->_trace, "setNavigationStartDate:", v11);

      }
      objc_msgSend(v4, "columnDouble:", 4);
      if (v12 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTrace setNavigationEndDate:](self->_trace, "setNavigationEndDate:", v13);

      }
      -[MNTrace setIsSimulation:](self->_trace, "setIsSimulation:", objc_msgSend(v4, "columnInt:", 5) != 0);
      -[MNTrace setOriginalVersion:](self->_trace, "setOriginalVersion:", (int)objc_msgSend(v4, "columnInt:", 6));
    }
    while ((objc_msgSend(v4, "stepRow") & 1) != 0);
  }

  return v5 == 0;
}

- (BOOL)_loadLocationsTable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const __CFString *v6;
  id v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, sqlite3_stmt *);
  void *v13;
  id v14;
  BOOL v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v12 = __37__MNTraceLoader__loadLocationsTable___block_invoke;
  v13 = &unk_1E61D81F8;
  v11 = 3221225472;
  if (v3)
    v6 = CFSTR("SELECT db_timestamp, cl_timestamp, latitude, longitude, raw_latitude, raw_longitude, horizontal_accuracy, vertical_accuracy, altitude, speed, speed_accuracy, course, raw_course, course_accuracy, type, reference_frame, raw_reference_frame, error_data, event_type, match_info_quality, match_info_latitude, match_info_longitude, match_info_course, match_info_form_of_way, match_info_road_class, match_info_shifted, match_type, corrected_latitude, corrected_longitude, corrected_course FROM locations");
  else
    v6 = CFSTR("SELECT db_timestamp, cl_timestamp, latitude, longitude, raw_latitude, raw_longitude, horizontal_accuracy, vertical_accuracy, altitude, speed, speed_accuracy, course, raw_course, course_accuracy, type, reference_frame, raw_reference_frame, error_data, event_type, match_info_quality, match_info_latitude, match_info_longitude, match_info_course, match_info_form_of_way, match_info_road_class, match_info_shifted, match_type FROM locations");
  v15 = v3;
  v14 = v5;
  v7 = v5;
  v8 = -[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", v6, &v10);
  -[MNTrace setLocations:](self->_trace, "setLocations:", v7, v10, v11, v12, v13);

  return v8;
}

void __37__MNTraceLoader__loadLocationsTable___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  MNTraceLocationRow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  int v12;
  const void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  MNLocationMatchInfo *v25;
  CLLocationCoordinate2D v26;
  MNLocationMatchInfo *v27;
  id v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  MNLocation *v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  int v57;
  unint64_t v58;
  int v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  uint64_t v67;

  v4 = objc_alloc_init(MNTraceLocationRow);
  -[MNTraceLocationRow setTimestamp:](v4, "setTimestamp:", sqlite3_column_double(a2, 0));
  v45 = sqlite3_column_double(a2, 1);
  v43 = sqlite3_column_double(a2, 2);
  v41 = sqlite3_column_double(a2, 3);
  v44 = sqlite3_column_double(a2, 4);
  v42 = sqlite3_column_double(a2, 5);
  v40 = sqlite3_column_double(a2, 6);
  v39 = sqlite3_column_double(a2, 7);
  v38 = sqlite3_column_double(a2, 8);
  v5 = sqlite3_column_double(a2, 9);
  v6 = sqlite3_column_double(a2, 10);
  v7 = sqlite3_column_double(a2, 11);
  v8 = sqlite3_column_double(a2, 12);
  v9 = sqlite3_column_double(a2, 13);
  v37 = sqlite3_column_int(a2, 14);
  if (*(_BYTE *)(a1 + 40))
  {
    v10 = sqlite3_column_double(a2, 28);
    -[MNTraceLocationRow setCorrectedCoordinate:](v4, "setCorrectedCoordinate:", v10, sqlite3_column_double(a2, 29));
    -[MNTraceLocationRow setCorrectedCourse:](v4, "setCorrectedCourse:", sqlite3_column_double(a2, 30));
  }
  v11 = sqlite3_column_int(a2, 15);
  v12 = sqlite3_column_int(a2, 16);
  v13 = sqlite3_column_blob(a2, 17);
  v14 = sqlite3_column_bytes(a2, 17);
  if (v14 >= 1)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v13, v14);
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceLocationRow setError:](v4, "setError:", v16);

  }
  -[MNTraceLocationRow setLocationEventType:](v4, "setLocationEventType:", sqlite3_column_int(a2, 18));
  v17 = sqlite3_column_int(a2, 19);
  if (v17)
  {
    v18 = v17;
    v19 = sqlite3_column_double(a2, 20);
    v20 = sqlite3_column_double(a2, 21);
    v21 = sqlite3_column_double(a2, 22);
    v22 = sqlite3_column_int(a2, 23);
    v23 = sqlite3_column_int(a2, 24);
    v24 = sqlite3_column_int(a2, 25);
    v25 = [MNLocationMatchInfo alloc];
    v26 = CLLocationCoordinate2DMake(v19, v20);
    v27 = -[MNLocationMatchInfo initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:](v25, "initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:", v18, v22, v23, v24 != 0, v26.latitude, v26.longitude, v21);
    -[MNTraceLocationRow setMatchInfo:](v4, "setMatchInfo:", v27);
  }
  else
  {
    v27 = 0;
  }
  -[MNTraceLocationRow setOriginalMatchType:](v4, "setOriginalMatchType:", sqlite3_column_int(a2, 27));
  if (v27)
  {
    v28 = objc_alloc(MEMORY[0x1E0C9E3E0]);
    v29 = -[MNLocationMatchInfo matchQuality](v27, "matchQuality");
    -[MNLocationMatchInfo matchCoordinate](v27, "matchCoordinate");
    v31 = v30;
    v33 = v32;
    -[MNLocationMatchInfo matchCourse](v27, "matchCourse");
    v35 = (void *)objc_msgSend(v28, "initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:", v29, -[MNLocationMatchInfo matchFormOfWay](v27, "matchFormOfWay"), -[MNLocationMatchInfo matchRoadClass](v27, "matchRoadClass"), -[MNLocationMatchInfo matchShifted](v27, "matchShifted"), 0, v31, v33, v34);
  }
  else
  {
    v35 = 0;
  }
  v46 = 0xFFFF;
  v47 = v43;
  v48 = v41;
  v49 = v40;
  v50 = v38;
  v51 = v39;
  v52 = v5;
  v53 = v6;
  v54 = v7;
  v55 = v9;
  v56 = v45;
  v57 = 0;
  v58 = 0xBFF0000000000000;
  v59 = v37;
  v60 = v44;
  v61 = v42;
  v62 = v8;
  v63 = 0;
  v64 = v11;
  v65 = v12;
  v67 = 0;
  v66 = 0;
  v36 = -[MNLocation initWithClientLocation:matchInfo:]([MNLocation alloc], "initWithClientLocation:matchInfo:", &v46, v35);
  -[MNTraceLocationRow setLocation:](v4, "setLocation:", v36);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (BOOL)_loadDirectionsTableAllowDeprecatedProtocol:(BOOL)a3 outError:(id *)a4
{
  void *v5;
  MNTrace *trace;
  void *v7;
  MNTraceDirectionsRow *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  BOOL v58;
  id v60;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  MNTraceLoader *v66;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  uint8_t v84[128];
  uint8_t buf[4];
  id v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = self;
  trace = self->_trace;
  v83 = 0;
  +[MNTracePreparedStatement preparedStatementForTrace:statement:outError:](MNTracePreparedStatement, "preparedStatementForTrace:statement:outError:", trace, CFSTR("SELECT request_timestamp, response_timestamp, request_data, response_data, response_error_data, waypoints_data, selected_route_index FROM directions"), &v83);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v83;
  if (!objc_msgSend(v7, "stepRow"))
  {
LABEL_51:
    -[MNTrace setDirections:](v66->_trace, "setDirections:", v5);
    v57 = v65;
    v58 = v65 == 0;
    goto LABEL_52;
  }
  v68 = v7;
  v62 = v5;
  while (1)
  {
    v8 = objc_alloc_init(MNTraceDirectionsRow);
    objc_msgSend(v7, "columnDouble:", 0);
    -[MNTraceDirectionsRow setRequestTimestamp:](v8, "setRequestTimestamp:");
    objc_msgSend(v7, "columnDouble:", 1);
    -[MNTraceDirectionsRow setResponseTimestamp:](v8, "setResponseTimestamp:");
    objc_msgSend(v7, "columnData:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27028]), "initWithData:", v9);
      -[MNTraceDirectionsRow setRequest:](v8, "setRequest:", v10);

    }
    objc_msgSend(v7, "columnData:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      break;
LABEL_26:
    objc_msgSend(v7, "columnData:", 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)MEMORY[0x1E0CB3710];
      v35 = (void *)MEMORY[0x1E0C99E60];
      v36 = objc_opt_class();
      objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = 0;
      objc_msgSend(v34, "unarchivedObjectOfClasses:fromData:error:", v37, v33, &v74);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v74;
      -[MNTraceDirectionsRow setError:](v8, "setError:", v38);

      if (v39)
      {
        GEOFindOrCreateLog();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v39;
          _os_log_impl(&dword_1B0AD7000, v40, OS_LOG_TYPE_ERROR, "Error decoding directions response error: %@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v7, "columnData:", 5);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41)
      goto LABEL_47;
    v42 = (void *)MEMORY[0x1E0CB3710];
    v43 = (void *)MEMORY[0x1E0C99E60];
    v44 = objc_opt_class();
    objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0;
    objc_msgSend(v42, "unarchivedObjectOfClasses:fromData:error:", v45, v41, &v73);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v73;
    -[MNTraceDirectionsRow setWaypoints:](v8, "setWaypoints:", v46);

    if (v47)
    {
      GEOFindOrCreateLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v86 = v47;
        _os_log_impl(&dword_1B0AD7000, v48, OS_LOG_TYPE_ERROR, "Error decoding waypoints: %@", buf, 0xCu);
      }
LABEL_45:

      goto LABEL_46;
    }
    if (-[MNTrace version](v66->_trace, "version") <= 0x39)
    {
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      -[MNTraceDirectionsRow waypoints](v8, "waypoints");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
      if (v49)
      {
        v50 = v49;
        v63 = v11;
        v64 = v9;
        v51 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v70 != v51)
              objc_enumerationMutation(v48);
            v53 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            objc_msgSend(v53, "waypoint");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setIsCurrentLocation:", objc_msgSend(v54, "isCurrentLocation"));

          }
          v50 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
        }
        while (v50);
        v5 = v62;
        v11 = v63;
        v7 = v68;
        v9 = v64;
      }
      goto LABEL_45;
    }
LABEL_46:

LABEL_47:
    v55 = objc_msgSend(v7, "columnInt:", 6);
    if (v55 < 0)
      v56 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v56 = v55;
    -[MNTraceDirectionsRow setSelectedRouteIndex:](v8, "setSelectedRouteIndex:", v56);
    objc_msgSend(v5, "addObject:", v8);

    if ((objc_msgSend(v7, "stepRow") & 1) == 0)
      goto LABEL_51;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27040]), "initWithData:", v11);
  -[MNTraceDirectionsRow setResponse:](v8, "setResponse:", v12);

  if (a3)
    goto LABEL_11;
  -[MNTraceDirectionsRow response](v8, "response");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "routes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "count"))
  {

    goto LABEL_11;
  }
  -[MNTraceDirectionsRow response](v8, "response");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "waypointRoutes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
LABEL_11:
    v18 = v11;
    v19 = v9;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    -[MNTraceDirectionsRow response](v8, "response");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "routes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v80 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * j), "setUnpackedLatLngVertices:", 0);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      }
      while (v23);
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    -[MNTraceDirectionsRow response](v8, "response");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "decoderData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "walkings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v76;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v76 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * k), "setUnpackedLatLngVertices:", 0);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
      }
      while (v30);
    }

    v7 = v68;
    v9 = v19;
    v11 = v18;
    goto LABEL_26;
  }
  if (a4)
  {
    -[MNTraceLoader _errorWithCode:errorDescriptionFormat:](v66, "_errorWithCode:errorDescriptionFormat:", 12, CFSTR("Navtrace is using a deprecated Routing protocol which is no longer supported. This trace will need to be manually re-generated."));
    v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v60;

  }
  v58 = 0;
  v57 = v65;
LABEL_52:

  return v58;
}

- (BOOL)_loadETAUpdatesTable
{
  void *v3;
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__MNTraceLoader__loadETAUpdatesTable__block_invoke;
  v7[3] = &unk_1E61D8220;
  v8 = v3;
  v4 = v3;
  v5 = -[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", CFSTR("SELECT request_timestamp, response_timestamp, request_data, response_data, response_error_data FROM eta_traffic_updates ORDER BY request_timestamp ASC"), v7);
  -[MNTrace setEtaUpdates:](self->_trace, "setEtaUpdates:", v4);

  return v5;
}

void __37__MNTraceLoader__loadETAUpdatesTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v4;
  int v5;
  void *v6;
  void *v7;
  const void *v8;
  int v9;
  void *v10;
  void *v11;
  const void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  MNTraceETAUpdateRow *v20;

  v20 = objc_alloc_init(MNTraceETAUpdateRow);
  -[MNTraceETAUpdateRow setRequestTimestamp:](v20, "setRequestTimestamp:", sqlite3_column_double(a2, 0));
  -[MNTraceETAUpdateRow setResponseTimestamp:](v20, "setResponseTimestamp:", sqlite3_column_double(a2, 1));
  v4 = sqlite3_column_blob(a2, 2);
  v5 = sqlite3_column_bytes(a2, 2);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v4, v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27060]), "initWithData:", v6);
    -[MNTraceETAUpdateRow setRequest:](v20, "setRequest:", v7);

  }
  v8 = sqlite3_column_blob(a2, 3);
  v9 = sqlite3_column_bytes(a2, 3);
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v8, v9);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27070]), "initWithData:", v10);
    -[MNTraceETAUpdateRow setResponse:](v20, "setResponse:", v11);

  }
  v12 = sqlite3_column_blob(a2, 4);
  v13 = sqlite3_column_bytes(a2, 4);
  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v12, v13);
    v15 = (void *)MEMORY[0x1E0CB3710];
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", v18, v14, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceETAUpdateRow setError:](v20, "setError:", v19);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);

}

- (BOOL)_loadCompassHeadingDataTable
{
  void *v3;
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MNTraceLoader__loadCompassHeadingDataTable__block_invoke;
  v7[3] = &unk_1E61D8220;
  v8 = v3;
  v4 = v3;
  v5 = -[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", CFSTR("SELECT relative_timestamp, true_heading, magnetic_heading, accuracy FROM compass_heading_data ORDER BY relative_timestamp ASC"), v7);
  -[MNTrace setHeadingData:](self->_trace, "setHeadingData:", v4);

  return v5;
}

void __45__MNTraceLoader__loadCompassHeadingDataTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  MNTraceHeadingDataRow *v4;

  v4 = objc_alloc_init(MNTraceHeadingDataRow);
  -[MNTraceHeadingDataRow setTimestamp:](v4, "setTimestamp:", sqlite3_column_double(a2, 0));
  -[MNTraceHeadingDataRow setTrueHeading:](v4, "setTrueHeading:", sqlite3_column_double(a2, 1));
  -[MNTraceHeadingDataRow setMagneticHeading:](v4, "setMagneticHeading:", sqlite3_column_double(a2, 2));
  -[MNTraceHeadingDataRow setHeadingAccuracy:](v4, "setHeadingAccuracy:", sqlite3_column_double(a2, 3));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (BOOL)_loadMotionDataTable
{
  void *v3;
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__MNTraceLoader__loadMotionDataTable__block_invoke;
  v7[3] = &unk_1E61D8220;
  v8 = v3;
  v4 = v3;
  v5 = -[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", CFSTR("SELECT relative_timestamp, type, exit_type, confidence FROM motion_data ORDER BY relative_timestamp ASC"), v7);
  -[MNTrace setMotionData:](self->_trace, "setMotionData:", v4);

  return v5;
}

void __37__MNTraceLoader__loadMotionDataTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  MNTraceMotionDataRow *v4;

  v4 = objc_alloc_init(MNTraceMotionDataRow);
  -[MNTraceMotionDataRow setTimestamp:](v4, "setTimestamp:", sqlite3_column_double(a2, 0));
  -[MNTraceMotionDataRow setMotionType:](v4, "setMotionType:", sqlite3_column_int(a2, 1));
  -[MNTraceMotionDataRow setExitType:](v4, "setExitType:", sqlite3_column_int(a2, 2));
  -[MNTraceMotionDataRow setConfidence:](v4, "setConfidence:", sqlite3_column_int(a2, 3));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (BOOL)_loadVehicleDataTable
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, sqlite3_stmt *);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__MNTraceLoader__loadVehicleDataTable__block_invoke;
  v14[3] = &unk_1E61D8220;
  v5 = v3;
  v15 = v5;
  if (-[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", CFSTR("SELECT relative_timestamp, heading FROM vehicle_heading_data ORDER BY relative_timestamp ASC"), v14))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = v4;
    v10 = 3221225472;
    v11 = __38__MNTraceLoader__loadVehicleDataTable__block_invoke_2;
    v12 = &unk_1E61D8220;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    v7 = -[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", CFSTR("SELECT relative_timestamp, speed FROM vehicle_speed_data ORDER BY relative_timestamp ASC"), &v9);
    -[MNTrace setVehicleHeadingData:](self->_trace, "setVehicleHeadingData:", v5, v9, v10, v11, v12);
    -[MNTrace setVehicleSpeedData:](self->_trace, "setVehicleSpeedData:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __38__MNTraceLoader__loadVehicleDataTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  MNTraceVehicleHeadingRow *v4;

  v4 = objc_alloc_init(MNTraceVehicleHeadingRow);
  -[MNTraceVehicleHeadingRow setTimestamp:](v4, "setTimestamp:", sqlite3_column_double(a2, 0));
  -[MNTraceVehicleHeadingRow setVehicleHeading:](v4, "setVehicleHeading:", sqlite3_column_double(a2, 1));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __38__MNTraceLoader__loadVehicleDataTable__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  MNTraceVehicleSpeedRow *v4;

  v4 = objc_alloc_init(MNTraceVehicleSpeedRow);
  -[MNTraceVehicleSpeedRow setTimestamp:](v4, "setTimestamp:", sqlite3_column_double(a2, 0));
  -[MNTraceVehicleSpeedRow setVehicleSpeed:](v4, "setVehicleSpeed:", sqlite3_column_double(a2, 1));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (BOOL)_loadEVDataTable
{
  MNTrace *trace;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  MNTraceEVDataRow *v48;
  uint64_t v50;
  id v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  BOOL v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74[2];

  trace = self->_trace;
  v74[0] = 0;
  +[MNTracePreparedStatement preparedStatementForTrace:statement:outError:](MNTracePreparedStatement, "preparedStatementForTrace:statement:outError:", trace, CFSTR("SELECT relative_timestamp, absolute_timestamp, identifier, current_range_m, max_range_m, battery_percentage, min_battery_capacity_kwh, current_battery_capacity_kwh, max_battery_capacity_kwh, consumption_arguments, charging_arguments, is_charging, active_connector, vehicle_state_origin, vehicle_data FROM ev_data ORDER BY relative_timestamp ASC"), v74);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v74[0];
  v4 = 0;
  v5 = 0;
  if (objc_msgSend(v3, "stepRow"))
  {
    v5 = 0;
    v4 = 0;
    do
    {
      objc_msgSend(v3, "columnDouble:", 0);
      v7 = v6;
      objc_msgSend(v3, "columnDouble:", 1);
      v9 = v8;
      objc_msgSend(v3, "columnString:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "columnDouble:", 3);
      v12 = v11;
      objc_msgSend(v3, "columnDouble:", 4);
      v14 = v13;
      objc_msgSend(v3, "columnDouble:", 5);
      v16 = v15;
      objc_msgSend(v3, "columnDouble:", 6);
      v18 = v17;
      objc_msgSend(v3, "columnDouble:", 7);
      v20 = v19;
      objc_msgSend(v3, "columnDouble:", 8);
      v22 = v21;
      objc_msgSend(v3, "columnString:", 9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "columnString:", 10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v3, "columnInt:", 11);
      v26 = objc_msgSend(v3, "columnInt:", 12);
      v27 = objc_msgSend(v3, "columnInt:", 13);
      if (v27)
      {
        v28 = v27;
        objc_msgSend(v3, "columnData:", 14);
        v29 = objc_claimAutoreleasedReturnValue();
        v71 = v5;
        if (v29)
        {
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v29, 0);
          v30 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v30;
        }
        v67 = (void *)v29;
        v72 = v24;
        v73 = v23;
        v31 = v26;
        v32 = v28;
        if (!v4)
        {
          v33 = v31;
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6BD0]), "initWithIdentifier:displayName:year:manufacturer:model:colorHex:licensePlate:lprVehicleType:lprPowerType:", v10, CFSTR("TraceVehicle"), 0, 0, 0, 0, 0, 0, 0);
          v4 = v34;
          if ((_DWORD)v32 == 2)
          {
            objc_msgSend(v34, "setSiriIntentsIdentifier:", v10);
          }
          else if ((_DWORD)v32 == 1)
          {
            objc_msgSend(v34, "setIapIdentifier:", v10);
          }
          v31 = v33;
        }
        v61 = v31;
        v70 = v4;
        v68 = v25 != 0;
        v62 = objc_alloc(MEMORY[0x1E0DC6BE0]);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
        v58 = v32;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(v35, "initWithDoubleValue:unit:", v66, v12);
        objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "measurementByConvertingToUnit:", v64);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)objc_msgSend(v36, "initWithDoubleValue:unit:", v57, v14);
        objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "measurementByConvertingToUnit:", v55);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_alloc(MEMORY[0x1E0CB3758]);
        v39 = v10;
        objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v38, "initWithDoubleValue:unit:", v53, v18);
        v41 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v41, "initWithDoubleValue:unit:", v42, v20);
        v44 = objc_alloc(MEMORY[0x1E0CB3758]);
        objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(v44, "initWithDoubleValue:unit:", v45, v22);
        LOBYTE(v50) = v68;
        v69 = v39;
        v63 = (void *)objc_msgSend(v62, "initWithIdentifier:dateOfUpdate:origin:batteryPercentage:currentEVRange:maxEVRange:minBatteryCapacity:currentBatteryCapacity:maxBatteryCapacity:consumptionArguments:chargingArguments:isCharging:activeConnector:", v39, v60, v58, v59, v54, v37, v40, v43, v46, v73, v72, v50, v61);

        v4 = v70;
        v47 = (void *)objc_msgSend(v70, "copy");
        objc_msgSend(v47, "_updateWithVehicleState:", v63);
        v48 = objc_alloc_init(MNTraceEVDataRow);
        -[MNTraceEVDataRow setTimestamp:](v48, "setTimestamp:", v7);
        -[MNTraceEVDataRow setVehicle:](v48, "setVehicle:", v47);
        v5 = v71;
        if (!v71)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v5, "addObject:", v48);

        v10 = v69;
        v24 = v72;
        v23 = v73;
      }

    }
    while ((objc_msgSend(v3, "stepRow") & 1) != 0);
  }
  -[MNTrace setEvData:](self->_trace, "setEvData:", v5);

  return 1;
}

- (BOOL)_loadNavigationEventsTable
{
  BOOL v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__MNTraceLoader__loadNavigationEventsTable__block_invoke;
  v5[3] = &unk_1E61D8248;
  v5[4] = &v6;
  v3 = -[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", CFSTR("SELECT relative_timestamp, absolute_timestamp, last_location_id, event_name, event_description, navigation_events.event_id FROM navigation_events INNER JOIN navigation_event_types ON navigation_events.event_id = navigation_event_types.event_id"), v5);
  -[MNTrace setNavigationEvents:](self->_trace, "setNavigationEvents:", v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__MNTraceLoader__loadNavigationEventsTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;
  double v5;
  int v6;
  const unsigned __int8 *v7;
  const unsigned __int8 *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MNTraceNavigationEventRow *v14;

  v4 = sqlite3_column_double(a2, 0);
  v5 = sqlite3_column_double(a2, 1);
  v6 = sqlite3_column_int(a2, 2);
  v7 = sqlite3_column_text(a2, 3);
  v8 = sqlite3_column_text(a2, 4);
  v9 = sqlite3_column_int(a2, 5);
  v14 = objc_alloc_init(MNTraceNavigationEventRow);
  -[MNTraceNavigationEventRow setRelativeTimestamp:](v14, "setRelativeTimestamp:", v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRow setDate:](v14, "setDate:", v10);

  if (v6 < 0)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = v6;
  -[MNTraceNavigationEventRow setLocationID:](v14, "setLocationID:", v11);
  if (!v7)
  {
    -[MNTraceNavigationEventRow setEventName:](v14, "setEventName:", 0);
    if (v8)
      goto LABEL_6;
LABEL_8:
    -[MNTraceNavigationEventRow setEventDescription:](v14, "setEventDescription:", 0);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRow setEventName:](v14, "setEventName:", v12);

  if (!v8)
    goto LABEL_8;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceNavigationEventRow setEventDescription:](v14, "setEventDescription:", v13);

LABEL_9:
  -[MNTraceNavigationEventRow setEventType:](v14, "setEventType:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v14);

}

- (BOOL)_loadAnnotatedUserBehaviorTable
{
  void *v3;
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MNTraceLoader__loadAnnotatedUserBehaviorTable__block_invoke;
  v7[3] = &unk_1E61D8220;
  v8 = v3;
  v4 = v3;
  v5 = -[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", CFSTR("SELECT timestamp, event FROM annotated_user_behavior ORDER BY timestamp ASC"), v7);
  -[MNTrace setAnnotatedUserBehavior:](self->_trace, "setAnnotatedUserBehavior:", v4);

  return v5;
}

void __48__MNTraceLoader__loadAnnotatedUserBehaviorTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  MNTraceAnnotatedUserBehaviorRow *v4;

  v4 = objc_alloc_init(MNTraceAnnotatedUserBehaviorRow);
  -[MNTraceAnnotatedUserBehaviorRow setTimestamp:](v4, "setTimestamp:", sqlite3_column_double(a2, 0));
  -[MNTraceAnnotatedUserBehaviorRow setEvent:](v4, "setEvent:", sqlite3_column_int(a2, 1));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (BOOL)_loadAnnotatedUserEnvironmentTable
{
  void *v3;
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MNTraceLoader__loadAnnotatedUserEnvironmentTable__block_invoke;
  v7[3] = &unk_1E61D8220;
  v8 = v3;
  v4 = v3;
  v5 = -[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", CFSTR("SELECT start_timestamp, end_timestamp, environment_type FROM annotated_user_environments ORDER BY start_timestamp ASC"), v7);
  -[MNTrace setAnnotatedUserEnvironments:](self->_trace, "setAnnotatedUserEnvironments:", v4);

  return v5;
}

void __51__MNTraceLoader__loadAnnotatedUserEnvironmentTable__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  MNTraceAnnotatedUserEnvironmentRow *v4;

  v4 = objc_alloc_init(MNTraceAnnotatedUserEnvironmentRow);
  -[MNTraceAnnotatedUserEnvironmentRow setStartTimestamp:](v4, "setStartTimestamp:", sqlite3_column_double(a2, 0));
  -[MNTraceAnnotatedUserEnvironmentRow setEndTimestamp:](v4, "setEndTimestamp:", sqlite3_column_double(a2, 1));
  -[MNTraceAnnotatedUserEnvironmentRow setEnvironmentType:](v4, "setEnvironmentType:", sqlite3_column_int(a2, 2));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (BOOL)_loadNavigationUpdatesTable
{
  void *v3;
  MNTrace *trace;
  void *v5;
  int v6;
  MNTraceNavigationUpdatesChangeRouteRow *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  trace = self->_trace;
  v32 = 0;
  +[MNTracePreparedStatement preparedStatementForTrace:statement:outError:](MNTracePreparedStatement, "preparedStatementForTrace:statement:outError:", trace, CFSTR("SELECT timestamp, type, parameters FROM navigation_updates"), &v32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v32;
  if (objc_msgSend(v5, "stepRow"))
  {
    while (1)
    {
      v6 = objc_msgSend(v5, "columnInt:", 1);
      if (v6 == 2)
        break;
      if (v6 == 1)
      {
        v7 = objc_alloc_init(MNTraceNavigationUpdatesChangeRouteRow);
        objc_msgSend(v5, "columnDouble:", 0);
        -[MNTraceNavigationUpdatesRow setTimestamp:](v7, "setTimestamp:");
        v8 = -[MNTrace originalVersion](self->_trace, "originalVersion");
        v9 = (void *)MEMORY[0x1E0C99E60];
        v10 = objc_opt_class();
        objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 <= 0x38)
        {
          objc_msgSend(v5, "columnObjectsOld:ofClasses:", 2, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNTraceNavigationUpdatesChangeRouteRow setDirectionsResponseID:](v7, "setDirectionsResponseID:", v13);

          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNTraceNavigationUpdatesChangeRouteRow setEtauResponseID:](v7, "setEtauResponseID:", v14);

          objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNTraceNavigationUpdatesChangeRouteRow setRouteIndex:](v7, "setRouteIndex:", objc_msgSend(v15, "unsignedIntValue"));

          v16 = v12;
          v17 = 3;
          goto LABEL_8;
        }
        objc_msgSend(v5, "columnObjects:ofClasses:", 2, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("directionsResponseID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTraceNavigationUpdatesChangeRouteRow setDirectionsResponseID:](v7, "setDirectionsResponseID:", v25);

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("etauResponseID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTraceNavigationUpdatesChangeRouteRow setEtauResponseID:](v7, "setEtauResponseID:", v26);

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("routeIndex"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTraceNavigationUpdatesChangeRouteRow setRouteIndex:](v7, "setRouteIndex:", objc_msgSend(v27, "unsignedIntValue"));
LABEL_11:

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("reason"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
LABEL_14:
      if ((objc_msgSend(v5, "stepRow") & 1) == 0)
        goto LABEL_15;
    }
    v7 = objc_alloc_init(MNTraceNavigationUpdatesDepartWaypointRow);
    objc_msgSend(v5, "columnDouble:", 0);
    -[MNTraceNavigationUpdatesRow setTimestamp:](v7, "setTimestamp:");
    v18 = -[MNTrace originalVersion](self->_trace, "originalVersion");
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 > 0x38)
    {
      objc_msgSend(v5, "columnObjects:ofClasses:", 2, v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("waypoint"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTraceNavigationUpdatesChangeRouteRow setWaypoint:](v7, "setWaypoint:", v28);

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("legIndex"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTraceNavigationUpdatesChangeRouteRow setLegIndex:](v7, "setLegIndex:", objc_msgSend(v27, "unsignedIntValue"));
      goto LABEL_11;
    }
    objc_msgSend(v5, "columnObjectsOld:ofClasses:", 2, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceNavigationUpdatesChangeRouteRow setWaypoint:](v7, "setWaypoint:", v22);

    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceNavigationUpdatesChangeRouteRow setLegIndex:](v7, "setLegIndex:", objc_msgSend(v23, "unsignedIntValue"));

    v16 = v12;
    v17 = 2;
LABEL_8:
    objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v29 = v24;
    -[MNTraceNavigationUpdatesChangeRouteRow setReason:](v7, "setReason:", objc_msgSend(v24, "unsignedIntValue"));

    if (v7)
    {
      objc_msgSend(v3, "addObject:", v7);

    }
    goto LABEL_14;
  }
LABEL_15:
  -[MNTrace setNavigationUpdates:](self->_trace, "setNavigationUpdates:", v3);

  return 1;
}

- (BOOL)_loadMiscInfo
{
  BOOL v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (!-[MNTraceLoader _tableExists:](self, "_tableExists:", CFSTR("misc_info")))
    return 1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__MNTraceLoader__loadMiscInfo__block_invoke;
  v5[3] = &unk_1E61D8248;
  v5[4] = &v6;
  v3 = -[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", CFSTR("SELECT key, value FROM misc_info"), v5);
  -[MNTrace setMiscInfo:](self->_trace, "setMiscInfo:", v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__MNTraceLoader__loadMiscInfo__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  MNTraceMiscInfo *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MNTraceMiscInfo);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(a2, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceMiscInfo setKey:](v4, "setKey:", v5);

  v6 = sqlite3_column_type(a2, 1);
  if (v6 == 1)
  {
    -[MNTraceMiscInfo setIntValue:](v4, "setIntValue:", sqlite3_column_int(a2, 1));
    goto LABEL_7;
  }
  v7 = v6;
  if (v6 == 2)
  {
    -[MNTraceMiscInfo setDoubleValue:](v4, "setDoubleValue:", sqlite3_column_double(a2, 1));
    goto LABEL_7;
  }
  if (v6 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(a2, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceMiscInfo setStringValue:](v4, "setStringValue:", v8);

LABEL_7:
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    -[MNTraceMiscInfo key](v4, "key");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v13);
    goto LABEL_10;
  }
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14[0] = 67109120;
    v14[1] = v7;
    _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "Error loading row from misc_info. Type %d is not supported.", (uint8_t *)v14, 8u);
  }
LABEL_10:

}

- (BOOL)_loadNetworkEvents
{
  MNTrace *trace;
  void *v4;
  id v5;
  void *v6;
  MNTraceNetworkEvent *v7;
  void *v8;
  void *v9;
  id v11;

  if (-[MNTraceLoader _tableExists:](self, "_tableExists:", CFSTR("network_events")))
  {
    trace = self->_trace;
    v11 = 0;
    +[MNTracePreparedStatement preparedStatementForTrace:statement:outError:](MNTracePreparedStatement, "preparedStatementForTrace:statement:outError:", trace, CFSTR("SELECT timestamp, wifi_on, cell_on, nlc_profile FROM network_events ORDER BY timestamp"), &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    v6 = 0;
    if (objc_msgSend(v4, "stepRow"))
    {
      v6 = 0;
      do
      {
        v7 = objc_alloc_init(MNTraceNetworkEvent);
        objc_msgSend(v4, "columnDouble:", 0);
        -[MNTraceNetworkEvent setTimestamp:](v7, "setTimestamp:");
        -[MNTraceNetworkEvent setWifiEnabled:](v7, "setWifiEnabled:", objc_msgSend(v4, "columnInt:", 1) != 0);
        -[MNTraceNetworkEvent setCellEnabled:](v7, "setCellEnabled:", objc_msgSend(v4, "columnInt:", 2) != 0);
        objc_msgSend(v4, "columnString:", 3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNTraceNetworkEvent setNlcEnabled:](v7, "setNlcEnabled:", objc_msgSend(v8, "length") != 0);
        if (objc_msgSend(v8, "length"))
          v9 = v8;
        else
          v9 = 0;
        -[MNTraceNetworkEvent setNlcProfile:](v7, "setNlcProfile:", v9);
        if (!v6)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v6, "addObject:", v7);

      }
      while ((objc_msgSend(v4, "stepRow") & 1) != 0);
    }
    -[MNTrace setNetworkEvents:](self->_trace, "setNetworkEvents:", v6);

  }
  return 1;
}

- (BOOL)_loadRouteCreationActionsTable
{
  MNTrace *trace;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  __objc2_class **v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  unint64_t v29;
  NSObject *v30;
  __objc2_class **v31;
  NSObject *v32;
  NSObject *v33;
  MNTraceLoader *v36;
  id v37;
  BOOL v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  trace = self->_trace;
  v43 = 0;
  +[MNTracePreparedStatement preparedStatementForTrace:statement:outError:](MNTracePreparedStatement, "preparedStatementForTrace:statement:outError:", trace, CFSTR("SELECT request_timestamp, response_timestamp, request_data, response_data, response_error_data, anchor_points_data, action FROM custom_route_creation_actions"), &v43);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v43;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  v8 = v7;
  if (v7)
  {
    v36 = self;
    v37 = v5;
    v38 = v8;
    v33 = 0;
    if (objc_msgSend(v4, "stepRow"))
    {
      v9 = off_1E61CF000;
      v10 = 0x1E0CB3000uLL;
      do
      {
        v11 = (void *)objc_opt_new();
        objc_msgSend(v4, "columnDouble:", 0);
        objc_msgSend(v11, "setRequestTimestamp:");
        objc_msgSend(v4, "columnDouble:", 1);
        objc_msgSend(v11, "setResponseTimestamp:");
        objc_msgSend(v4, "columnData:", 2);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27028]), "initWithData:", v12);
          objc_msgSend(v11, "setRequest:", v13);

        }
        v40 = (void *)v12;
        objc_msgSend(v4, "columnData:", 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27040]), "initWithData:", v14);
          objc_msgSend(v11, "setResponse:", v15);

        }
        objc_msgSend(v4, "columnData:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = *(void **)(v10 + 1808);
          v18 = (void *)MEMORY[0x1E0C99E60];
          v19 = objc_opt_class();
          objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          objc_msgSend(v17, "unarchivedObjectOfClasses:fromData:error:", v20, v16, &v42);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v42;

          objc_msgSend(v11, "setError:", v21);
          if (v22)
          {
            GEOFindOrCreateLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v22;
              _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_ERROR, "Error decoding directions response error: %@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(v4, "columnData:", 5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = *(void **)(v10 + 1808);
          v26 = objc_opt_class();
          v41 = 0;
          objc_msgSend(v25, "unarchivedArrayOfObjectsOfClass:fromData:error:", v26, v24, &v41);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v41;
          objc_msgSend(v11, "setAnchorPoints:", v27);
          if (v28)
          {
            v39 = v14;
            v29 = v10;
            v30 = v33;
            v31 = v9;
            GEOFindOrCreateLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v28;
              _os_log_impl(&dword_1B0AD7000, v32, OS_LOG_TYPE_ERROR, "Error decoding anchor points: %@", buf, 0xCu);
            }

            v9 = v31;
            v33 = v30;
            v10 = v29;
            v14 = v39;
          }

        }
        objc_msgSend(v11, "setAction:", (int)objc_msgSend(v4, "columnInt:", 6));
        if (!v33)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v33 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject addObject:](v33, "addObject:", v11);

      }
      while ((objc_msgSend(v4, "stepRow") & 1) != 0);
    }
    -[MNTrace setRouteCreationActions:](v36->_trace, "setRouteCreationActions:", v33);
    v8 = v38;
    v6 = v37;
  }
  else
  {
    MNGetMNTraceLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v6;
      _os_log_impl(&dword_1B0AD7000, v33, OS_LOG_TYPE_ERROR, "Error loading custom_route_creation_actions table with error: %@", buf, 0xCu);
    }
  }

  return v8;
}

- (BOOL)_loadTraceVersion
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__MNTraceLoader__loadTraceVersion__block_invoke;
  v3[3] = &unk_1E61D8220;
  v3[4] = self;
  return -[MNTraceLoader _executeQuery:rowHandler:](self, "_executeQuery:rowHandler:", CFSTR("SELECT version FROM info"), v3);
}

uint64_t __34__MNTraceLoader__loadTraceVersion__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setVersion:", sqlite3_column_int(a2, 0));
}

- (BOOL)_updateTraceFromVersion:(unint64_t)a3 outError:(id *)a4
{
  char v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  MNTrace *trace;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  id v23;
  char *errmsg;
  id v25;
  uint8_t buf[4];
  _DWORD v27[7];

  *(_QWORD *)&v27[5] = *MEMORY[0x1E0C80C00];
  if (+[MNTrace currentVersion](MNTrace, "currentVersion") != a3)
  {
    if (+[MNTrace currentVersion](MNTrace, "currentVersion") < a3)
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Trace was recorded with a newer build than the current build. Trace load failed because we can't downgrade.", buf, 2u);
      }

      if (!a4)
        return 0;
      -[MNTraceLoader _errorWithCode:errorDescriptionFormat:](self, "_errorWithCode:errorDescriptionFormat:", 6, CFSTR("Attempting to update a trace with a newer trace version: %d. Current trace version: %d"), a3, +[MNTrace currentVersion](MNTrace, "currentVersion"));
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = 0;
      *a4 = v9;
LABEL_30:

      return v7;
    }
    v25 = 0;
    +[MNTrace upgradeSchemaFromVersion:error:](MNTrace, "upgradeSchemaFromVersion:error:", a3, &v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v25;
    if (v11)
    {
      v9 = v11;
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v27 = v13;
        _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "Error trying to upgrade trace schema: %@", buf, 0xCu);

      }
      if (a4)
      {
        v9 = objc_retainAutorelease(v9);
        v7 = 0;
        *a4 = v9;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      if (!objc_msgSend(v10, "length")
        || (errmsg = 0,
            !sqlite3_exec(-[MNTrace db](self->_trace, "db"), (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), 0, 0, &errmsg)))
      {
        -[MNTrace setVersion:](self->_trace, "setVersion:", +[MNTrace currentVersion](MNTrace, "currentVersion"));
        trace = self->_trace;
        v23 = 0;
        +[MNTracePreparedStatement preparedStatementForTrace:statement:outError:](MNTracePreparedStatement, "preparedStatementForTrace:statement:outError:", trace, CFSTR("UPDATE info SET version = :version"), &v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v23;
        objc_msgSend(v18, "bindParameter:int:", CFSTR(":version"), +[MNTrace currentVersion](MNTrace, "currentVersion"));
        v7 = objc_msgSend(v18, "execute");
        if ((v7 & 1) != 0)
        {
          GEOFindOrCreateLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = +[MNTrace currentVersion](MNTrace, "currentVersion");
            *(_DWORD *)buf = 67109376;
            v27[0] = a3;
            LOWORD(v27[1]) = 1024;
            *(_DWORD *)((char *)&v27[1] + 2) = v20;
            _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_DEFAULT, "Successfully updated trace from version %d to %d", buf, 0xEu);
          }

        }
        else if (a4)
        {
          -[MNTraceLoader _errorWithCode:errorDescriptionFormat:](self, "_errorWithCode:errorDescriptionFormat:", 11, CFSTR("Unexpected error writing new trace version."));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = objc_retainAutorelease(v21);
          *a4 = v9;
        }

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error running migrator query for version %d. sqlite3 error description: \"%s\"), a3, errmsg);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v27 = v14;
        _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      -[MNTraceLoader _errorWithCode:errorDescriptionFormat:](self, "_errorWithCode:errorDescriptionFormat:", 11, CFSTR("%@"), v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v16;
      if (a4)
        *a4 = objc_retainAutorelease(v16);

    }
    v7 = 0;
    goto LABEL_29;
  }
  return 1;
}

- (BOOL)_executeQuery:(id)a3 rowHandler:(id)a4
{
  id v6;
  void (**v7)(id, sqlite3_stmt *);
  sqlite3 *v8;
  id v9;
  BOOL v10;
  int v11;
  int v12;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  v7 = (void (**)(id, sqlite3_stmt *))a4;
  if (v7
    && (ppStmt = 0,
        v8 = -[MNTrace db](self->_trace, "db"),
        v9 = objc_retainAutorelease(v6),
        !sqlite3_prepare_v2(v8, (const char *)objc_msgSend(v9, "UTF8String"), objc_msgSend(v9, "length"), &ppStmt, 0)))
  {
    v11 = sqlite3_step(ppStmt);
    if (v11 == 100)
    {
      do
      {
        v7[2](v7, ppStmt);
        v12 = sqlite3_step(ppStmt);
      }
      while (v12 == 100);
      v11 = v12;
    }
    sqlite3_finalize(ppStmt);
    v10 = v11 == 101;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_handleUpdateError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTrace tracePath](self->_trace, "tracePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "attributesOfItemAtPath:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "filePosixPermissions") & 0x80) != 0)
  {
    objc_msgSend(v6, "fileOwnerAccountName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("mobile"));

    if ((v10 & 1) != 0)
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "fileOwnerAccountName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Error updating trace because traces directory owner is '%@' instead of 'mobile'. Try running as root:\nchown mobile: %@"), v12, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 5;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't update trace to current version because traces directory does not have write permission set. Try running as root:\n> chmod u+w %@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 4;
  }
  -[MNTrace tracePath](self->_trace, "tracePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "filePosixPermissions") & 0x80) != 0)
  {
    objc_msgSend(v14, "fileOwnerAccountName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("mobile"));

    if ((v19 & 1) != 0)
      goto LABEL_11;
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "fileOwnerAccountName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTrace tracePath](self->_trace, "tracePath");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Can't open file because owner is '%@' instead of 'mobile'. Try running as root:\n> chown mobile: %@"), v16, v21);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = 3;
    v7 = (void *)v21;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[MNTrace tracePath](self->_trace, "tracePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Can't update trace to current version because file is readonly. Try running as root:\n> chmod u+w %@"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v8 = 2;
  }

  v7 = (void *)v17;
LABEL_11:
  if (v7)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
  -[MNTraceLoader _errorWithCode:errorDescriptionFormat:](self, "_errorWithCode:errorDescriptionFormat:", v8, CFSTR("%@"), v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)_tableExists:(id)a3
{
  id v4;
  BOOL v5;
  sqlite3_stmt *v6;
  id v7;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare_v2(-[MNTrace db](self->_trace, "db"), (const char *)objc_msgSend(CFSTR("SELECT count(*) FROM sqlite_master WHERE type='table' AND name=?"), "UTF8String"), objc_msgSend(CFSTR("SELECT count(*) FROM sqlite_master WHERE type='table' AND name=?"), "length"), &ppStmt, 0))
  {
    v5 = 0;
  }
  else
  {
    v6 = ppStmt;
    v7 = objc_retainAutorelease(v4);
    sqlite3_bind_text(v6, 1, (const char *)objc_msgSend(v7, "UTF8String"), objc_msgSend(v7, "length"), 0);
    v5 = (sqlite3_step(ppStmt) & 0xFFFFFFFE) == 0x64 && sqlite3_column_int(ppStmt, 0) > 0;
    sqlite3_finalize(ppStmt);
  }

  return v5;
}

- (id)_errorWithCode:(int64_t)a3 errorDescriptionFormat:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];
  uint64_t v13;

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, &v13);

  if (v7)
  {
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MNTraceErrorDomain"), a3, v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)loadExtraData
{
  return 1;
}

- (id)trace
{
  return self->_trace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trace, 0);
}

@end
