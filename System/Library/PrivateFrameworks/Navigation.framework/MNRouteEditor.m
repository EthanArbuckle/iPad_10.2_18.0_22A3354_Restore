@implementation MNRouteEditor

- (MNRouteEditor)init
{
  MNRouteEditor *v2;
  id v3;
  void *global_queue;
  uint64_t v5;
  GEOMapFeatureAccess *mapFeatureAccess;
  double v7;
  MNRouteEditor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MNRouteEditor;
  v2 = -[MNRouteEditor init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D27198]);
    global_queue = (void *)geo_get_global_queue();
    v5 = objc_msgSend(v3, "initWithQueue:", global_queue);
    mapFeatureAccess = v2->_mapFeatureAccess;
    v2->_mapFeatureAccess = (GEOMapFeatureAccess *)v5;

    -[GEOMapFeatureAccess setAllowNetworkTileLoad:](v2->_mapFeatureAccess, "setAllowNetworkTileLoad:", 1);
    -[GEOMapFeatureAccess setVisitDoubleTravelDirectionRoadsTwice:](v2->_mapFeatureAccess, "setVisitDoubleTravelDirectionRoadsTwice:", 0);
    -[GEOMapFeatureAccess setAllowStaleData:](v2->_mapFeatureAccess, "setAllowStaleData:", 1);
    GEOConfigGetDouble();
    v2->_maxDistanceFromRoads = v7;
    v8 = v2;
  }

  return v2;
}

- (MNRouteEditor)initWithTraceRecordingEnabled:(BOOL)a3
{
  MNRouteEditor *v4;
  MNRouteEditor *v5;
  uint64_t v6;
  NSDate *sessionStartDate;
  MNRouteEditor *v8;

  v4 = -[MNRouteEditor init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_isTraceRecordingEnabled = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = objc_claimAutoreleasedReturnValue();
    sessionStartDate = v5->_sessionStartDate;
    v5->_sessionStartDate = (NSDate *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[MNRouteEditor endSession](self, "endSession");
  v3.receiver = self;
  v3.super_class = (Class)MNRouteEditor;
  -[MNRouteEditor dealloc](&v3, sel_dealloc);
}

- (void)endSession
{
  MNTraceRecorder *traceRecorder;

  -[MNTraceRecorder saveTraceWithCompletionHandler:](self->_traceRecorder, "saveTraceWithCompletionHandler:", 0);
  traceRecorder = self->_traceRecorder;
  self->_traceRecorder = 0;

}

- (MNTraceRecorder)_traceRecorder
{
  MNTraceRecorder *traceRecorder;
  MNTraceRecorder *v4;
  MNTraceRecorder *v5;
  MNTraceRecorder *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (self->_isTraceRecordingEnabled)
  {
    traceRecorder = self->_traceRecorder;
    if (traceRecorder)
    {
      v4 = traceRecorder;
    }
    else
    {
      v5 = (MNTraceRecorder *)objc_opt_new();
      v6 = self->_traceRecorder;
      self->_traceRecorder = v5;

      -[MNTraceRecorder setRecordingStartDate:](self->_traceRecorder, "setRecordingStartDate:", self->_sessionStartDate);
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
      objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTimeZone:", v8);

      -[MNTraceRecorder recordingStartDate](self->_traceRecorder, "recordingStartDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringFromDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RouteCreation_%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[MNFilePaths customRouteCreationTraceExtension](MNFilePaths, "customRouteCreationTraceExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[MNFilePaths routeCreationTracesDirectoryPath](MNFilePaths, "routeCreationTracesDirectoryPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MNFilePaths tracePathForTraceName:extension:directoryPath:](MNFilePaths, "tracePathForTraceName:extension:directoryPath:", v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[MNTraceRecorder startWritingTraceToPath:traceType:withErrorHandler:](self->_traceRecorder, "startWritingTraceToPath:traceType:withErrorHandler:", v14, 2, 0);
      v4 = self->_traceRecorder;

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)validateAnchorPoint:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  MNSequence *v8;
  void *global_queue;
  MNSequence *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = [MNSequence alloc];
    global_queue = (void *)geo_get_global_queue();
    v10 = -[MNSequence initWithQueue:](v8, "initWithQueue:", global_queue);

    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke;
    v17[3] = &unk_1E61D16B8;
    v17[4] = self;
    v12 = v6;
    v18 = v12;
    -[MNSequence addStep:](v10, "addStep:", v17);
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_2;
    v15[3] = &unk_1E61D16B8;
    v15[4] = self;
    v16 = v12;
    -[MNSequence addStep:](v10, "addStep:", v15);
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_3;
    v13[3] = &unk_1E61D1708;
    v14 = v7;
    -[MNSequence setSequenceFinalizeHandler:](v10, "setSequenceFinalizeHandler:", v13);
    -[MNSequence start](v10, "start");

  }
}

uint64_t __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_validateCountrySupportedForAnchorPoint:finishedHandler:", *(_QWORD *)(a1 + 40), a3);
}

uint64_t __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_validateRoadProximityForAnchorPoint:finishedHandler:", *(_QWORD *)(a1 + 40), a3);
}

void __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_4;
  v6[3] = &unk_1E61D16E0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __45__MNRouteEditor_validateAnchorPoint_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_validateCountrySupportedForAnchorPoint:(id)a3 finishedHandler:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D27168];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "locationCoordinate");
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_msgSend(v8, "initWithGEOCoordinate:", v10, v12);
  v14 = (void *)MEMORY[0x1E0D27048];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__MNRouteEditor__validateCountrySupportedForAnchorPoint_finishedHandler___block_invoke;
  v16[3] = &unk_1E61D1730;
  v17 = v5;
  v15 = v5;
  objc_msgSend(v14, "customRouteCreationSupportedForLocation:queue:handler:", v13, MEMORY[0x1E0C80D38], v16);

}

void __73__MNRouteEditor__validateCountrySupportedForAnchorPoint_finishedHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  if ((a2 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v11 = CFSTR("MNRouteEditorErrorUnsupportedCountriesKey");
    v8 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_navigation_errorWithCode:userInfo:", 9, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setError:", v10);

    if (!v5)
  }
  objc_msgSend(v6, "error");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_validateRoadProximityForAnchorPoint:(id)a3 finishedHandler:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  GEOMapFeatureAccess *mapFeatureAccess;
  double maxDistanceFromRoads;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  _QWORD v22[4];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "coordinate");
  v9 = v8;
  v11 = v10;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  mapFeatureAccess = self->_mapFeatureAccess;
  maxDistanceFromRoads = self->_maxDistanceFromRoads;
  v20 = v22;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__MNRouteEditor__validateRoadProximityForAnchorPoint_finishedHandler___block_invoke;
  v21[3] = &unk_1E61D1758;
  v21[4] = v22;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__MNRouteEditor__validateRoadProximityForAnchorPoint_finishedHandler___block_invoke_2;
  v17[3] = &unk_1E61D1780;
  v14 = v6;
  v18 = v14;
  v15 = v7;
  v19 = v15;
  v16 = (id)-[GEOMapFeatureAccess findRoadsNear:radius:handler:completionHandler:](mapFeatureAccess, "findRoadsNear:radius:handler:completionHandler:", v21, v17, v9, v11, maxDistanceFromRoads);

  _Block_object_dispose(v22, 8);
}

uint64_t __70__MNRouteEditor__validateRoadProximityForAnchorPoint_finishedHandler___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __70__MNRouteEditor__validateRoadProximityForAnchorPoint_finishedHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:debugDescription:", 8, CFSTR("Too far from roads."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setError:", v3);

    MNGetMNRouteEditorLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[4];
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "No nearby road found for anchor point: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(v2, "error");

  (*(void (**)(void))(a1[5] + 16))();
}

- (id)requestRouteGeometry:(id)a3 finishedHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  MNSequence *v20;
  void *global_queue;
  MNSequence *v22;
  uint64_t v23;
  id *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  MNRouteEditor *v43;
  id v44;
  _QWORD v45[4];
  _QWORD v46[2];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t buf[4];
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: finishedHandler != ((void *)0)", buf, 2u);
    }
    goto LABEL_18;
  }
  MNGetMNRouteEditorLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "anchorPoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109120;
    v52 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "Requesting route geometry with %d anchor points.", buf, 8u);

  }
  objc_msgSend(v6, "anchorPoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:debugDescription:underlyingError:", 2, CFSTR("MNRouteEditorRequest needs at least two anchor points."), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v7 + 2))(v7, 0, v12, 0);

LABEL_18:
    v33 = 0;
    goto LABEL_19;
  }
  if ((objc_msgSend(v6, "action") == 1001 || objc_msgSend(v6, "action") == 1002)
    && (objc_msgSend(v6, "undoRedoRouteData"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v6, "anchorPoints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MNRouteEditor _checkAnchorPointCount:action:finishedHandler:](self, "_checkAnchorPointCount:action:finishedHandler:", objc_msgSend(v15, "count"), objc_msgSend(v6, "action"), v7);

    if (!v16)
      goto LABEL_18;
    v14 = 0;
  }
  v17 = (void *)objc_opt_new();
  -[MNRouteEditor _traceRecorder](self, "_traceRecorder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [MNSequence alloc];
  global_queue = (void *)geo_get_global_queue();
  v22 = -[MNSequence initWithQueue:](v20, "initWithQueue:", global_queue);

  v23 = MEMORY[0x1E0C809B0];
  if (v14)
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke;
    v48[3] = &unk_1E61D16B8;
    v24 = &v49;
    v49 = v17;
    v50 = v6;
    -[MNSequence addStep:](v22, "addStep:", v48);
    v25 = v50;
  }
  else
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_2;
    v45[3] = &unk_1E61D17A8;
    v24 = (id *)v46;
    v26 = v17;
    v46[0] = v26;
    v46[1] = self;
    v27 = v6;
    v47 = v27;
    -[MNSequence addStep:](v22, "addStep:", v45);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_3;
    v41[3] = &unk_1E61D17D0;
    v28 = v26;
    v23 = MEMORY[0x1E0C809B0];
    v42 = v28;
    v43 = self;
    v44 = v27;
    -[MNSequence addStep:](v22, "addStep:", v41);

    v25 = v47;
  }

  v35[0] = v23;
  v35[1] = 3221225472;
  v35[2] = __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_4;
  v35[3] = &unk_1E61D1820;
  v29 = v17;
  v36 = v29;
  v37 = v18;
  v38 = v6;
  v39 = v19;
  v40 = v7;
  v30 = v19;
  v31 = v18;
  -[MNSequence setSequenceFinalizeHandler:](v22, "setSequenceFinalizeHandler:", v35);
  -[MNSequence start](v22, "start");
  v32 = v40;
  v33 = v29;

LABEL_19:
  return v33;
}

void __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *, uint64_t);

  v9 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v4 = (void *)objc_opt_new();
    v5 = objc_alloc(MEMORY[0x1E0D274B8]);
    objc_msgSend(*(id *)(a1 + 40), "undoRedoRouteData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithPersistentData:", v6);

    objc_msgSend(v7, "buildRoute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRoute:", v8);

    v9[2](v9, v4, 1);
  }

}

void __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_validateAnchorPoints:finishedHandler:", *(_QWORD *)(a1 + 48), v4);

}

void __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_requestRouteGeometry:finishedHandler:", *(_QWORD *)(a1 + 48), v4);

}

void __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(v3, "route");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "directionsError");
    v6 = objc_claimAutoreleasedReturnValue();
    MNGetMNRouteEditorLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v4 || v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v5;
        v36 = 2112;
        v37 = v6;
        v9 = "Error getting route with anchors: %@\nDirections error: %@";
        v10 = v8;
        v11 = OS_LOG_TYPE_ERROR;
        v12 = 22;
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Successfully got route with anchors.";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 2;
LABEL_8:
      _os_log_impl(&dword_1B0AD7000, v10, v11, v9, buf, v12);
    }

    v25 = *(void **)(a1 + 40);
    v13 = objc_msgSend(*(id *)(a1 + 48), "action");
    objc_msgSend(v3, "directionsRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "routeInitializerData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "directionsResponse");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "anchorPoints");
    v27 = (void *)v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "anchorPoints");
    v28 = v3;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v4;
    v19 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recordRouteCreationAction:request:response:error:anchorPoints:requestDate:responseDate:", v13, v14, v16, v5, v18, v19, v20);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_116;
    block[3] = &unk_1E61D17F8;
    v21 = *(id *)(a1 + 64);
    v30 = v26;
    v31 = v5;
    v32 = v27;
    v33 = v21;
    v22 = v27;
    v23 = v5;
    v24 = v26;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v3 = v28;
  }

}

uint64_t __54__MNRouteEditor_requestRouteGeometry_finishedHandler___block_invoke_116(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (BOOL)_checkAnchorPointCount:(unint64_t)a3 action:(unint64_t)a4 finishedHandler:(id)a5
{
  void (**v7)(id, _QWORD, void *, void *);
  uint64_t UInteger;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v7 = (void (**)(id, _QWORD, void *, void *))a5;
  UInteger = GEOConfigGetUInteger();
  v9 = 2 * UInteger - 1;
  if (a4 != 102)
    v9 = UInteger;
  if (a4 == 103)
    v10 = UInteger + 1;
  else
    v10 = v9;
  if (v10 < a3)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27020]), "initWithSingleProblemType:", 21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "_geo_errorWithDirectionsError:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12, v11);

  }
  return v10 >= a3;
}

- (void)_validateAnchorPoints:(id)a3 finishedHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  void *v15;
  id obj;
  _QWORD block[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  v28 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_msgSend(v6, "newAnchorPoints");
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  v15 = v7;
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        dispatch_group_enter(v8);
        v20[0] = v10;
        v20[1] = 3221225472;
        v20[2] = __55__MNRouteEditor__validateAnchorPoints_finishedHandler___block_invoke;
        v20[3] = &unk_1E61D1848;
        v22 = v27;
        v21 = v8;
        -[MNRouteEditor validateAnchorPoint:handler:](self, "validateAnchorPoint:handler:", v13, v20);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v9);
  }

  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __55__MNRouteEditor__validateAnchorPoints_finishedHandler___block_invoke_2;
  block[3] = &unk_1E61D1870;
  v19 = v27;
  v18 = v15;
  v14 = v15;
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v27, 8);
}

void __55__MNRouteEditor__validateAnchorPoints_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    a2 = v6;
  objc_storeStrong(v5, a2);
  v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __55__MNRouteEditor__validateAnchorPoints_finishedHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "setError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  (*(void (**)(_QWORD, id, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == 0);

}

- (void)_requestRouteGeometry:(id)a3 finishedHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "routeAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setRequestType:", 2);
  objc_msgSend(v5, "anchorPoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnchorPoints:", v9);

  objc_msgSend(v8, "setTransportType:", objc_msgSend(v7, "mainTransportType"));
  objc_msgSend(v8, "setMaxRouteCount:", 1);
  objc_msgSend(v8, "setRouteAttributes:", v7);
  objc_msgSend(v5, "currentRoute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentRoute:", v10);

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  v11 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__MNRouteEditor__requestRouteGeometry_finishedHandler___block_invoke;
  v18[3] = &unk_1E61D1898;
  v18[4] = v19;
  objc_msgSend(v8, "setRequestCallback:", v18);
  objc_msgSend(MEMORY[0x1E0D27048], "sharedService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __55__MNRouteEditor__requestRouteGeometry_finishedHandler___block_invoke_2;
  v15[3] = &unk_1E61D18C0;
  v17 = v19;
  v13 = v6;
  v16 = v13;
  objc_msgSend(v12, "requestRoutes:handler:", v8, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDirectionsServiceRequest:", v14);

  _Block_object_dispose(v19, 8);
}

void __55__MNRouteEditor__requestRouteGeometry_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __55__MNRouteEditor__requestRouteGeometry_finishedHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v11 = (id)objc_opt_new();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setRoute:", v10);
  objc_msgSend(v11, "setDirectionsRequest:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v11, "setError:", v8);

  objc_msgSend(v11, "setDirectionsError:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)convertToNavigableRoute:(id)a3 finishedHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *global_queue;
  MNSequence *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  int v28;
  void (*v29)(uint64_t, uint64_t, void *);
  uint64_t *v30;
  void *v31;
  unint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  int v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, void *);
  void *v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_28:
      v13 = 0;
      goto LABEL_26;
    }
LABEL_35:
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: finishedHandler != ((void *)0)", buf, 2u);
    goto LABEL_28;
  }
  objc_msgSend(v6, "currentRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    MNGetMNRouteEditorLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueRouteID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v10;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "Converting route to navigable route. RouteID: %@", buf, 0xCu);

    }
    if (objc_msgSend(v8, "isNavigable"))
    {
      MNGetMNRouteEditorLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Passed in route is already navigable.", buf, 2u);
      }

      (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v8, 0, 0);
      goto LABEL_10;
    }
    objc_msgSend(v6, "routeAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportsDirections");

    if ((v15 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [request.routeAttributes supportsDirections]", buf, 2u);
      }
      v44 = (void *)MEMORY[0x1E0D274A8];
      objc_msgSend(v6, "routeAttributes");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "defaultRouteAttributesForTransportType:", objc_msgSend(v45, "mainTransportType"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRouteAttributes:", v46);

    }
    v16 = (void *)MEMORY[0x1E0D274A8];
    objc_msgSend(v6, "routeAttributes");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "defaultRouteAttributesForTransportType:", objc_msgSend((id)v17, "mainTransportType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRouteAttributes:", v18);

    objc_msgSend(v6, "routeAttributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v19, "supportsDirections");

    if ((v17 & 1) != 0)
    {
      v20 = (void *)objc_opt_new();
      global_queue = (void *)geo_get_global_queue();
      v22 = -[MNSequence initWithQueue:]([MNSequence alloc], "initWithQueue:", global_queue);
      objc_msgSend(v6, "waypoints");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      v25 = MEMORY[0x1E0C809B0];
      if (v24 == 2)
      {
        MNGetMNRouteEditorLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "waypoints");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count");
          *(_DWORD *)buf = 67109120;
          LODWORD(v62) = v28;
          _os_log_impl(&dword_1B0AD7000, v26, OS_LOG_TYPE_DEFAULT, "Converting to navigable route using %d waypoints.", buf, 8u);

        }
        v60 = v25;
        v29 = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke;
        v30 = &v60;
      }
      else
      {
        objc_msgSend(v8, "anchorPoints");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");

        MNGetMNRouteEditorLog();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if (v32 < 2)
        {
          if (v34)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B0AD7000, v33, OS_LOG_TYPE_DEFAULT, "Converting to navigable route with no provided waypoints or anchor points. Creating waypoints from route geometry.", buf, 2u);
          }

          v58 = v25;
          v29 = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_128;
          v30 = &v58;
        }
        else
        {
          if (v34)
          {
            objc_msgSend(v8, "anchorPoints");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "count");
            *(_DWORD *)buf = 67109120;
            LODWORD(v62) = v36;
            _os_log_impl(&dword_1B0AD7000, v33, OS_LOG_TYPE_DEFAULT, "Converting to navigable route using %d anchor points.", buf, 8u);

          }
          v59 = v25;
          v29 = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_127;
          v30 = &v59;
        }
      }
      v30[1] = 3221225472;
      v30[2] = (uint64_t)v29;
      v30[3] = (uint64_t)&unk_1E61D1910;
      v37 = v20;
      v30[4] = (uint64_t)v37;
      v30[7] = (uint64_t)a1;
      v30[5] = (uint64_t)v8;
      v38 = v6;
      v30[6] = (uint64_t)v38;
      -[MNSequence addStep:](v22, "addStep:", v30);

      v53[0] = v25;
      v53[1] = 3221225472;
      v53[2] = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_2_129;
      v53[3] = &unk_1E61D1938;
      v39 = v37;
      v54 = v39;
      v57 = a1;
      v55 = v38;
      v40 = v7;
      v56 = v40;
      -[MNSequence addStep:](v22, "addStep:", v53);
      v47 = v25;
      v48 = 3221225472;
      v49 = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_3;
      v50 = &unk_1E61D1960;
      v41 = v39;
      v51 = v41;
      v52 = v40;
      -[MNSequence addStep:](v22, "addStep:", &v47);
      -[MNSequence start](v22, "start", v47, v48, v49, v50);
      v42 = v52;
      v13 = v41;

      goto LABEL_25;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [request.routeAttributes supportsDirections]", buf, 2u);
    }
    __break(1u);
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:debugDescription:underlyingError:", 2, CFSTR("MNRouteEditorRequest.currentRoute is missing."), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *, _QWORD))v7 + 2))(v7, 0, v12, 0);

LABEL_10:
  v13 = 0;
LABEL_25:

LABEL_26:
  return v13;
}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v5 = *(void **)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "traits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_2;
    v8[3] = &unk_1E61D18E8;
    v9 = *(id *)(a1 + 48);
    v10 = v4;
    objc_msgSend(v5, "_addressForRoute:traits:handler:", v6, v7, v8);

  }
}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "waypoints");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "waypoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MNRouteEditor _handleWaypointStepFinishedWithOrigin:destination:address:error:finishedHandler:](MNRouteEditor, "_handleWaypointStepFinishedWithOrigin:destination:address:error:finishedHandler:", v8, v10, v7, v6, *(_QWORD *)(a1 + 40));

}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_127(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v4 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "anchorPoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_convertAnchorPointsToWaypoints:routeEditorRequest:finishedHandler:", v5, *(_QWORD *)(a1 + 48), v6);

  }
}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_128(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 56), "_fetchWaypointsFromRouteGeometry:routeEditorRequest:finishedHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);

}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_2_129(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(v9, "waypoints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stepError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "_requestFinalizedRouteWithWaypoints:address:routeEditorRequest:finishedHandler:", v6, v7, *(_QWORD *)(a1 + 40), v5);
    }

  }
}

void __57__MNRouteEditor_convertToNavigableRoute_finishedHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(v6, "finalizedRoute");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stepError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "directionsError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

+ (void)_waypointForAnchorPoint:(id)a3 traits:(id)a4 clientAttributes:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  id *v26;
  id v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v12)
    goto LABEL_24;
  objc_msgSend(v9, "geoLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapItemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isValid");

  objc_msgSend(MEMORY[0x1E0D272C0], "sharedNoCreate");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(MEMORY[0x1E0D272C0], "sharedNoCreate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "state");
    if (v19 >= 2)
    {
      if (v19 == 2)
      {

        objc_msgSend(v9, "mapItemIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v17, "isValidForOfflineUse");
LABEL_10:

        goto LABEL_11;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = v19;
        _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Requesting route geometry with %d anchor points.", buf, 8u);
      }
    }

    goto LABEL_10;
  }
LABEL_11:
  if ((objc_msgSend(v9, "isCoordinate") & 1) != 0 || !v15)
  {
    v28 = objc_msgSend(v9, "isCurrentLocation");
    MNGetMNRouteEditorLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (v30)
      {
        objc_msgSend(v9, "loggingDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = v31;
        _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_DEFAULT, "Creating waypoint from current location for anchor point %@.", buf, 0xCu);

      }
      v32 = (void *)MEMORY[0x1E0D26FF8];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_134;
      v40[3] = &unk_1E61D1988;
      v25 = &v41;
      v41 = v9;
      v26 = &v42;
      v42 = v12;
      v33 = (id)objc_msgSend(v32, "composedWaypointForCurrentLocation:traits:completionHandler:networkActivityHandler:", v13, v10, v40, 0);
    }
    else
    {
      if (v30)
      {
        objc_msgSend(v9, "loggingDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = v34;
        _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_DEFAULT, "Creating waypoint from location for anchor point %@.", buf, 0xCu);

      }
      v35 = (void *)MEMORY[0x1E0D26FF8];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_135;
      v37[3] = &unk_1E61D1988;
      v25 = &v38;
      v38 = v9;
      v26 = &v39;
      v39 = v12;
      v36 = (id)objc_msgSend(v35, "composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:", v13, 0, v10, v37, 0);
    }
  }
  else
  {
    MNGetMNRouteEditorLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "loggingDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v49 = v22;
      _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_DEFAULT, "Creating waypoint from identifier for anchor point %@.", buf, 0xCu);

    }
    v23 = (void *)MEMORY[0x1E0D26FF8];
    objc_msgSend(v9, "mapItemIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke;
    v43[3] = &unk_1E61D19B0;
    v25 = &v44;
    v44 = v9;
    v26 = &v47;
    v47 = v12;
    v45 = v13;
    v46 = v10;
    v27 = (id)objc_msgSend(v23, "composedWaypointForIdentifier:traits:clientAttributes:completionHandler:networkActivityHandler:", v24, v46, v11, v43, 0);

  }
LABEL_24:

}

void __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    MNGetMNRouteEditorLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "loggingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "mapItemIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Error creating waypoint from identifier for anchor point %@. Falling back to location waypoint.\n\tIdentifier: %@\n\tError: %@", buf, 0x20u);

    }
    v13 = (void *)MEMORY[0x1E0D26FF8];
    v15 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_132;
    v17[3] = &unk_1E61D1988;
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 56);
    v16 = (id)objc_msgSend(v13, "composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:", v15, 0, v14, v17, 0);

  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "geoMapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "refineWithMapItem:", v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    MNGetMNRouteEditorLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "loggingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "mapItemIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Error creating waypoint from location for anchor point %@.\n\tIdentifier: %@\n\tError: %@", (uint8_t *)&v13, 0x20u);

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "styleAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyleAttributes:", v8);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

void __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    MNGetMNRouteEditorLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "loggingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "mapItemIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Error creating waypoint from current location for anchor point %@.\n\tIdentifier: %@\n\tError: %@", (uint8_t *)&v13, 0x20u);

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "styleAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyleAttributes:", v8);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

void __73__MNRouteEditor__waypointForAnchorPoint_traits_clientAttributes_handler___block_invoke_135(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    MNGetMNRouteEditorLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "loggingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "mapItemIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Error creating waypoint from location for anchor point %@.\n\tIdentifier: %@\n\tError: %@", (uint8_t *)&v13, 0x20u);

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "styleAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyleAttributes:", v8);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

+ (void)_addressForRoute:(id)a3 traits:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  void (**v27)(_QWORD, _QWORD, _QWORD);
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint8_t buf[4];
  unsigned int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: handler != nil", buf, 2u);
    }
    __break(1u);
  }
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  objc_msgSend(MEMORY[0x1E0D272C0], "sharedNoCreate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_12;
  v12 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0D272C0], "sharedNoCreate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "state");
  if (v14 < 2)
  {
LABEL_11:

LABEL_12:
    objc_msgSend(v7, "distance");
    objc_msgSend(v7, "pointAtRouteCoordinate:", objc_msgSend(v7, "routeCoordinateForDistanceAfterStart:", v17 * 0.5));
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ticketForReverseGeocodeCoordinate:shiftLocationsIfNeeded:traits:", 0, v8, v19, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __49__MNRouteEditor__addressForRoute_traits_handler___block_invoke;
    v26[3] = &unk_1E61D19D8;
    v28 = v19;
    v29 = v21;
    v30 = v19;
    v31 = v21;
    v32 = v23;
    v27 = v10;
    objc_msgSend(v25, "submitWithHandler:networkActivity:", v26, 0);

    goto LABEL_13;
  }
  if (v14 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v34 = v14;
      _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Requesting route geometry with %d anchor points.", buf, 8u);
    }
    goto LABEL_11;
  }

  MNGetMNRouteEditorLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_DEFAULT, "Skipping address lookup.", buf, 2u);
  }

  v10[2](v10, 0, 0);
LABEL_13:

}

void __49__MNRouteEditor__addressForRoute_traits_handler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 || !v6)
  {
    MNGetMNRouteEditorLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = a1[5];
      v10 = a1[8];
      v13 = 134218498;
      v14 = v9;
      v15 = 2048;
      v16 = v10;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Error resolving address for point: %f, %f\n%@", (uint8_t *)&v13, 0x20u);
    }

  }
  v11 = a1[4];
  objc_msgSend(v7, "addressObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v5);

}

+ (void)_fetchWaypointsFromRouteGeometry:(id)a3 routeEditorRequest:(id)a4 finishedHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *global_queue;
  id v31;
  void *v32;
  _QWORD block[4];
  id v34;
  uint8_t *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD v39[4];
  NSObject *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v43[4];
  id v44;
  NSObject *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD v48[4];
  id v49;
  NSObject *v50;
  uint8_t *v51;
  _QWORD *v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  uint8_t buf[8];
  uint8_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v32 = v10;
    v11 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    v60 = buf;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy_;
    v63 = __Block_byref_object_dispose_;
    v64 = 0;
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x3032000000;
    v57[3] = __Block_byref_object_copy_;
    v57[4] = __Block_byref_object_dispose_;
    v58 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = __Block_byref_object_copy_;
    v55[4] = __Block_byref_object_dispose_;
    v56 = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = __Block_byref_object_copy_;
    v53[4] = __Block_byref_object_dispose_;
    v54 = 0;
    dispatch_group_enter(v11);
    v12 = objc_alloc(MEMORY[0x1E0D27168]);
    objc_msgSend(v8, "pointAt:", 0);
    v13 = (void *)objc_msgSend(v12, "initWithGEOCoordinate:");
    v14 = (void *)MEMORY[0x1E0D26FF8];
    objc_msgSend(v9, "traits");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke;
    v48[3] = &unk_1E61D1A00;
    v51 = buf;
    v17 = v13;
    v49 = v17;
    v52 = v53;
    v18 = v11;
    v50 = v18;
    v19 = (id)objc_msgSend(v14, "composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:", v17, 0, v15, v48, 0);

    dispatch_group_enter(v18);
    v20 = objc_alloc(MEMORY[0x1E0D27168]);
    objc_msgSend(v8, "pointAt:", objc_msgSend(v8, "pointCount") - 1);
    v21 = (void *)objc_msgSend(v20, "initWithGEOCoordinate:");
    v22 = (void *)MEMORY[0x1E0D26FF8];
    objc_msgSend(v9, "traits");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v16;
    v43[1] = 3221225472;
    v43[2] = __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_137;
    v43[3] = &unk_1E61D1A00;
    v46 = v57;
    v24 = v21;
    v44 = v24;
    v47 = v53;
    v25 = v18;
    v45 = v25;
    v26 = (id)objc_msgSend(v22, "composedWaypointForLocation:mapItem:traits:completionHandler:networkActivityHandler:", v24, 0, v23, v43, 0);

    dispatch_group_enter(v25);
    objc_msgSend(v9, "currentRoute");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traits");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v16;
    v39[1] = 3221225472;
    v39[2] = __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_138;
    v39[3] = &unk_1E61D1A28;
    v41 = v55;
    v42 = v53;
    v29 = v25;
    v40 = v29;
    objc_msgSend(a1, "_addressForRoute:traits:handler:", v27, v28, v39);

    global_queue = geo_get_global_queue();
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_139;
    block[3] = &unk_1E61D1A50;
    v36 = v57;
    v37 = v55;
    v38 = v53;
    v35 = buf;
    v34 = v32;
    v31 = v32;
    dispatch_group_notify(v29, global_queue, block);

    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v55, 8);

    _Block_object_dispose(v57, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B0AD7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: finishedHandler != nil", buf, 2u);
    }
    __break(1u);
  }
}

void __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  MNGetMNRouteEditorLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got waypoint for origin.", (uint8_t *)&v20, 2u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    MNGetMNRouteEditorLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "latLng");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lat");
      v12 = v11;
      objc_msgSend(*(id *)(a1 + 32), "latLng");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lng");
      v20 = 134284035;
      v21 = v12;
      v22 = 2049;
      v23 = v14;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Error resolving origin for location: %{private}f, %{private}f\n%{public}@", (uint8_t *)&v20, 0x20u);

    }
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18 = *(void **)(v15 + 40);
  v16 = (id *)(v15 + 40);
  v17 = v18;
  if (v18)
    v19 = v17;
  else
    v19 = v7;
  objc_storeStrong(v16, v19);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_137(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  MNGetMNRouteEditorLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got waypoint for destination.", (uint8_t *)&v20, 2u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    MNGetMNRouteEditorLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "latLng");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lat");
      v12 = v11;
      objc_msgSend(*(id *)(a1 + 32), "latLng");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lng");
      v20 = 134284035;
      v21 = v12;
      v22 = 2049;
      v23 = v14;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Error resolving destination for location: %{private}f, %{private}f\n%{public}@", (uint8_t *)&v20, 0x20u);

    }
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18 = *(void **)(v15 + 40);
  v16 = (id *)(v15 + 40);
  v17 = v18;
  if (v18)
    v19 = v17;
  else
    v19 = v7;
  objc_storeStrong(v16, v19);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void **v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    MNGetMNRouteEditorLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got address.", (uint8_t *)&v16, 2u);
    }

    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v5;
LABEL_10:
    v14 = v10;
    v15 = *v9;
    *v9 = v14;

    goto LABEL_11;
  }
  if (v6)
  {
    MNGetMNRouteEditorLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Error resolving address for anchor points: %@", (uint8_t *)&v16, 0xCu);
    }

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    v9 = (void **)(v12 + 40);
    v10 = v13;
    if (!v13)
      v10 = v7;
    goto LABEL_10;
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __85__MNRouteEditor__fetchWaypointsFromRouteGeometry_routeEditorRequest_finishedHandler___block_invoke_139(_QWORD *a1)
{
  return +[MNRouteEditor _handleWaypointStepFinishedWithOrigin:destination:address:error:finishedHandler:](MNRouteEditor, "_handleWaypointStepFinishedWithOrigin:destination:address:error:finishedHandler:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), a1[4]);
}

+ (void)_convertAnchorPointsToWaypoints:(id)a3 routeEditorRequest:(id)a4 finishedHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *global_queue;
  id v28;
  NSObject *v29;
  const char *v30;
  _QWORD v31[4];
  id v32;
  uint8_t *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[4];
  id v42;
  NSObject *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD v46[4];
  id v47;
  NSObject *v48;
  uint8_t *v49;
  _QWORD *v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[5];
  id v56;
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = v10;
    if ((unint64_t)objc_msgSend(v8, "count") > 1)
    {
      v12 = dispatch_group_create();
      *(_QWORD *)buf = 0;
      v58 = buf;
      v59 = 0x3032000000;
      v60 = __Block_byref_object_copy_;
      v61 = __Block_byref_object_dispose_;
      v62 = 0;
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x3032000000;
      v55[3] = __Block_byref_object_copy_;
      v55[4] = __Block_byref_object_dispose_;
      v56 = 0;
      v53[0] = 0;
      v53[1] = v53;
      v53[2] = 0x3032000000;
      v53[3] = __Block_byref_object_copy_;
      v53[4] = __Block_byref_object_dispose_;
      v54 = 0;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x3032000000;
      v51[3] = __Block_byref_object_copy_;
      v51[4] = __Block_byref_object_dispose_;
      v52 = 0;
      dispatch_group_enter(v12);
      objc_msgSend(v8, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "traits");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke;
      v46[3] = &unk_1E61D1A00;
      v49 = buf;
      v17 = v8;
      v47 = v17;
      v50 = v51;
      v18 = v12;
      v48 = v18;
      objc_msgSend(a1, "_waypointForAnchorPoint:traits:clientAttributes:handler:", v13, v14, v15, v46);

      dispatch_group_enter(v18);
      objc_msgSend(v17, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "traits");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v16;
      v41[1] = 3221225472;
      v41[2] = __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_140;
      v41[3] = &unk_1E61D1A00;
      v44 = v55;
      v22 = v17;
      v42 = v22;
      v45 = v51;
      v23 = v18;
      v43 = v23;
      objc_msgSend(a1, "_waypointForAnchorPoint:traits:clientAttributes:handler:", v19, v20, v21, v41);

      dispatch_group_enter(v23);
      objc_msgSend(v9, "currentRoute");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "traits");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v16;
      v37[1] = 3221225472;
      v37[2] = __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_141;
      v37[3] = &unk_1E61D1A28;
      v39 = v53;
      v40 = v51;
      v26 = v23;
      v38 = v26;
      objc_msgSend(a1, "_addressForRoute:traits:handler:", v24, v25, v37);

      global_queue = geo_get_global_queue();
      v31[0] = v16;
      v31[1] = 3221225472;
      v31[2] = __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_142;
      v31[3] = &unk_1E61D1A50;
      v34 = v55;
      v35 = v53;
      v36 = v51;
      v32 = v11;
      v33 = buf;
      v28 = v11;
      dispatch_group_notify(v26, global_queue, v31);

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(v53, 8);

      _Block_object_dispose(v55, 8);
      _Block_object_dispose(buf, 8);

      return;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v29 = MEMORY[0x1E0C81028];
      v30 = "Assertion failed: anchorPoints.count >= 2";
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v29 = MEMORY[0x1E0C81028];
    v30 = "Assertion failed: finishedHandler != nil";
LABEL_8:
    _os_log_fault_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_FAULT, v30, buf, 2u);
  }
  __break(1u);
}

void __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  MNGetMNRouteEditorLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got waypoint for origin.", (uint8_t *)&v16, 2u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    MNGetMNRouteEditorLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Error resolving origin for anchor point: %@\n%@", (uint8_t *)&v16, 0x16u);

    }
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v11 + 40);
  v12 = (id *)(v11 + 40);
  v13 = v14;
  if (v14)
    v15 = v13;
  else
    v15 = v7;
  objc_storeStrong(v12, v15);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  MNGetMNRouteEditorLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got waypoint for destination.", (uint8_t *)&v16, 2u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    MNGetMNRouteEditorLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Error resolving destination for anchor point: %@\n%@", (uint8_t *)&v16, 0x16u);

    }
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v11 + 40);
  v12 = (id *)(v11 + 40);
  v13 = v14;
  if (v14)
    v15 = v13;
  else
    v15 = v7;
  objc_storeStrong(v12, v15);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void **v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    MNGetMNRouteEditorLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Got address.", (uint8_t *)&v16, 2u);
    }

    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v5;
LABEL_10:
    v14 = v10;
    v15 = *v9;
    *v9 = v14;

    goto LABEL_11;
  }
  if (v6)
  {
    MNGetMNRouteEditorLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Error resolving address for anchor points: %@", (uint8_t *)&v16, 0xCu);
    }

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    v9 = (void **)(v12 + 40);
    v10 = v13;
    if (!v13)
      v10 = v7;
    goto LABEL_10;
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __84__MNRouteEditor__convertAnchorPointsToWaypoints_routeEditorRequest_finishedHandler___block_invoke_142(_QWORD *a1)
{
  return +[MNRouteEditor _handleWaypointStepFinishedWithOrigin:destination:address:error:finishedHandler:](MNRouteEditor, "_handleWaypointStepFinishedWithOrigin:destination:address:error:finishedHandler:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), a1[4]);
}

+ (void)_handleWaypointStepFinishedWithOrigin:(id)a3 destination:(id)a4 address:(id)a5 error:(id)a6 finishedHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *, uint64_t);
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, void *, uint64_t))a7;
  v16 = (void *)objc_opt_new();
  MNGetMNRouteEditorLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v11 && v12)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Successfully got waypoints.", (uint8_t *)&v22, 2u);
    }

    v24[0] = v11;
    v24[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWaypoints:", v19);

    if (v13)
    {
      MNGetMNRouteEditorLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Successfully got address.", (uint8_t *)&v22, 2u);
      }

      objc_msgSend(v16, "setAddress:", v13);
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412290;
      v23 = v14;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "convertToNavigableRoute: Error getting origin or destination: %@", (uint8_t *)&v22, 0xCu);
    }

    if (!v14)
    {
      MNGetMNRouteEditorLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_FAULT, "Unable to resolve waypoints and no error was found.", (uint8_t *)&v22, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:", 3);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "setStepError:", v14);
  }
  v15[2](v15, v16, 1);

}

+ (void)_requestFinalizedRouteWithWaypoints:(id)a3 address:(id)a4 routeEditorRequest:(id)a5 finishedHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  const char *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v24 = MEMORY[0x1E0C81028];
    v25 = "Assertion failed: finishedHandler != nil";
LABEL_16:
    _os_log_fault_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_FAULT, v25, buf, 2u);
    goto LABEL_17;
  }
  v13 = v12;
  if (objc_msgSend(v9, "count") != 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v24 = MEMORY[0x1E0C81028];
    v25 = "Assertion failed: waypoints.count == 2";
    goto LABEL_16;
  }
  objc_msgSend(v11, "currentRoute");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "routeAttributes");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v24 = MEMORY[0x1E0C81028];
    v25 = "Assertion failed: routeGeometry != nil";
    goto LABEL_16;
  }
  v16 = (void *)v15;
  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v24 = MEMORY[0x1E0C81028];
      v25 = "Assertion failed: routeAttributes != nil";
      goto LABEL_16;
    }
LABEL_17:
    __break(1u);
    return;
  }
  v17 = objc_alloc_init(MEMORY[0x1E0D27050]);
  objc_msgSend(v17, "setRequestType:", 3);
  objc_msgSend(v17, "setWaypoints:", v9);
  objc_msgSend(v17, "setTransportType:", objc_msgSend(v14, "transportType"));
  objc_msgSend(v17, "setMaxRouteCount:", 1);
  objc_msgSend(v17, "setRouteAttributes:", v16);
  objc_msgSend(v11, "commonOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCommonOptions:", v18);

  objc_msgSend(v17, "setCurrentRoute:", v14);
  objc_msgSend(v11, "traits");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTraits:", v19);

  MNGetMNRouteEditorLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Getting finalized route.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D27048], "sharedService");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __96__MNRouteEditor__requestFinalizedRouteWithWaypoints_address_routeEditorRequest_finishedHandler___block_invoke;
  v26[3] = &unk_1E61D1A78;
  v27 = v13;
  v22 = v13;
  v23 = (id)objc_msgSend(v21, "requestRoutes:handler:", v17, v26);

}

void __96__MNRouteEditor__requestFinalizedRouteWithWaypoints_address_routeEditorRequest_finishedHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a2, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  if (!v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:debugDescription:underlyingError:", 2, CFSTR("MNRouteEditorRequest got an unknown error when trying to convert to navigable route."), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_11;
    }
    goto LABEL_8;
  }
  MNGetMNRouteEditorLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "convertToNavigableRoute: Successfuly got route.", (uint8_t *)&v13, 2u);
  }

  objc_msgSend(v10, "setFinalizedRoute:", v9);
  if (v7)
  {
LABEL_8:
    MNGetMNRouteEditorLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "convertToNavigableRoute: Error getting finalized route: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v10, "setStepError:", v7);
  }
LABEL_11:
  objc_msgSend(v10, "setDirectionsError:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_traceRecorder, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
}

@end
