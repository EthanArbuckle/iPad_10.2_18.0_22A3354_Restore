@implementation MNNavigationTraceManager

- (void)dealloc
{
  objc_super v3;

  -[MNTracePlayer unregisterObserver:](self->_tracePlayer, "unregisterObserver:", self);
  if (self->_initialNetworkState)
    +[MNTraceNetworkConditionHelper setCurrentState:](MNTraceNetworkConditionHelper, "setCurrentState:");
  v3.receiver = self;
  v3.super_class = (Class)MNNavigationTraceManager;
  -[MNNavigationTraceManager dealloc](&v3, sel_dealloc);
}

- (void)openForPlaybackWithTracePath:(id)a3
{
  id v4;
  MNTraceNetworkEvent *v5;
  MNTraceNetworkEvent *initialNetworkState;
  MNTracePlayer *v7;
  MNTracePlayer *tracePlayer;
  MNTracePlaybackDetails *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id WeakRetained;
  id v25;

  v4 = a3;
  +[MNTraceNetworkConditionHelper getCurrentState](MNTraceNetworkConditionHelper, "getCurrentState");
  v5 = (MNTraceNetworkEvent *)objc_claimAutoreleasedReturnValue();
  initialNetworkState = self->_initialNetworkState;
  self->_initialNetworkState = v5;

  v7 = -[MNTracePlayer initWithPath:]([MNTracePlayer alloc], "initWithPath:", v4);
  tracePlayer = self->_tracePlayer;
  self->_tracePlayer = v7;

  GEOConfigGetDouble();
  -[MNTracePlayer setSpeedMultiplier:](self->_tracePlayer, "setSpeedMultiplier:");
  -[MNTracePlayer setShouldUpdateRouteWhenJumping:](self->_tracePlayer, "setShouldUpdateRouteWhenJumping:", GEOConfigGetBOOL());
  -[MNTracePlayer setShouldPlayETARequests:](self->_tracePlayer, "setShouldPlayETARequests:", GEOConfigGetBOOL());
  -[MNTracePlayer setShouldPlayNetworkEvents:](self->_tracePlayer, "setShouldPlayNetworkEvents:", GEOConfigGetBOOL());
  -[MNTracePlayer registerObserver:](self->_tracePlayer, "registerObserver:", self);
  -[MNTracePlayer trace](self->_tracePlayer, "trace");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MNTracePlaybackDetails);
  -[MNTracePlaybackDetails setEventType:](v9, "setEventType:", 1);
  -[MNTracePlaybackDetails setTracePath:](v9, "setTracePath:", v4);

  -[MNTracePlayer duration](self->_tracePlayer, "duration");
  -[MNTracePlaybackDetails setTraceDuration:](v9, "setTraceDuration:");
  objc_msgSend(v25, "serializableBookmarks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTracePlaybackDetails setBookmarks:](v9, "setBookmarks:", v10);

  objc_msgSend(v25, "locations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v25, "miscInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pedestrian_trace_path"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "miscInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("pedestrian_trace_relative_timestamp"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && v16)
    {
      objc_msgSend(v14, "stringValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTracePlaybackDetails setPedestrianTracePath:](v9, "setPedestrianTracePath:", v17);

      objc_msgSend(v25, "locations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "doubleValue");
      v21 = v20;
      objc_msgSend(v19, "timestamp");
      -[MNTracePlaybackDetails setPedestrianTraceStartRelativeTimestamp:](v9, "setPedestrianTraceStartRelativeTimestamp:", v21 - v22);

    }
  }
  +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setProvider:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  objc_msgSend(WeakRetained, "navigationTraceManager:didUpdateTracePlaybackDetails:", self, v9);

}

- (void)openForRecordingWithTraceRecordingData:(id)a3 traceName:(id)a4 selectedRouteIndex:(unint64_t)a5 isReconnecting:(BOOL)a6 isSimulation:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MNTraceRecorder *v24;
  MNTraceRecorder *traceRecorder;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  MNTraceRecorder *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  MNTraceRecorder *v43;
  void *v44;
  void *v45;
  MNTraceRecorder *v46;
  void *v47;
  void *v48;
  MNTracePlaybackDetails *v49;
  id WeakRetained;
  uint64_t v51;
  void *v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v7 = a7;
  v63 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = v13;
  if (self->_traceRecorder)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trace recording already in progress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v54 = "-[MNNavigationTraceManager openForRecordingWithTraceRecordingData:traceName:selectedRouteIndex:isReconnectin"
            "g:isSimulation:]";
      v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNNavigationTraceManager.m";
      v57 = 1024;
      v58 = 124;
      v59 = 2080;
      v60 = "NO";
      v61 = 2112;
      v62 = v15;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
  else
  {
    if (v13)
    {
      v17 = v13;
    }
    else
    {
      objc_msgSend(v12, "waypoints");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationTraceManager _defaultTraceNameForDestination:isSimulation:](self, "_defaultTraceNameForDestination:isSimulation:", v19, v7);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[MNFilePaths navTraceExtension](MNFilePaths, "navTraceExtension", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MNFilePaths navTracesDirectoryPath](MNFilePaths, "navTracesDirectoryPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MNFilePaths tracePathForTraceName:extension:directoryPath:](MNFilePaths, "tracePathForTraceName:extension:directoryPath:", v17, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a6)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "fileExistsAtPath:", v22))
        objc_msgSend(v23, "removeItemAtPath:error:", v22, 0);

    }
    -[MNNavigationTraceManager _createSymlinkForTracePath:](self, "_createSymlinkForTracePath:", v22);
    self->_isSimulation = v7;
    v24 = objc_alloc_init(MNTraceRecorder);
    traceRecorder = self->_traceRecorder;
    self->_traceRecorder = v24;

    objc_msgSend(v12, "initialDirectionsRequestTimestamp");
    if (v26 > 0.0)
    {
      v27 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v12, "initialDirectionsRequestTimestamp");
      objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTraceRecorder setRecordingStartDate:](self->_traceRecorder, "setRecordingStartDate:", v28);

    }
    v52 = v17;
    -[MNTraceRecorder startWritingTraceToPath:traceType:withErrorHandler:](self->_traceRecorder, "startWritingTraceToPath:traceType:withErrorHandler:", v22, 0, 0);
    -[MNTraceRecorder setIsSimulation:](self->_traceRecorder, "setIsSimulation:", v7);
    if (!a6)
    {
      -[MNNavigationTraceManager _recordEnvironmentInfo:](self, "_recordEnvironmentInfo:", self->_traceRecorder);
      -[MNNavigationTraceManager _recordStylesheet:](self, "_recordStylesheet:", self->_traceRecorder);
      -[MNTraceRecorder recordingStartDate](self->_traceRecorder, "recordingStartDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceReferenceDate");
      v31 = v30;

      objc_msgSend(v12, "initialDirectionsRequestTimestamp");
      v32 = 0.0;
      v33 = 0.0;
      if (v34 > 0.0)
      {
        objc_msgSend(v12, "initialDirectionsRequestTimestamp");
        v33 = v35 - v31;
      }
      objc_msgSend(v12, "initialDirectionsResponseTimestamp");
      if (v36 > 0.0)
      {
        objc_msgSend(v12, "initialDirectionsResponseTimestamp");
        v32 = v37 - v31;
      }
      v38 = self->_traceRecorder;
      objc_msgSend(v12, "initialDirectionsRequest");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "initialDirectionsResponse");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "initialDirectionsRequestError");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "waypoints");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTraceRecorder recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:](v38, "recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:", v39, v40, v41, v42, v51, v33, v32);

      v43 = self->_traceRecorder;
      objc_msgSend(v12, "initialDirectionsResponse");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "directionsResponseID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNTraceRecorder recordRouteChangeWithIndex:directionsResponseID:etauResponseID:rerouteReason:](v43, "recordRouteChangeWithIndex:directionsResponseID:etauResponseID:rerouteReason:", v51, v45, 0, 0);

    }
    v46 = self->_traceRecorder;
    +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setLocationRecorder:", v46);

    +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setTraceRecorder:", self->_traceRecorder);

    v49 = objc_alloc_init(MNTracePlaybackDetails);
    -[MNTracePlaybackDetails setEventType:](v49, "setEventType:", 7);
    -[MNTracePlaybackDetails setTracePath:](v49, "setTracePath:", v22);
    WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
    objc_msgSend(WeakRetained, "navigationTraceManager:didUpdateTracePlaybackDetails:", self, v49);

  }
}

- (void)openForSimulationWithRoute:(id)a3 traceRecordingData:(id)a4 traceNameOverride:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  MNTraceRecorder *v20;
  MNTraceRecorder *traceRecorder;
  void *v22;
  double v23;
  double v24;
  MNTraceRecorder *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  MNTraceRecorder *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  MNSimulatedLocationGenerator *v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v45;
  MNTraceRecorder *v46;
  MNTracePlayer *v47;
  MNTracePlayer *tracePlayer;
  MNTracePlaybackDetails *v49;
  void *v50;
  void *v51;
  id WeakRetained;
  void *v53;
  void *v54;
  __CFString *v55;
  __CFString *v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v11 = v10;
  if (self->_traceRecorder)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trace recording already in progress."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v58 = "-[MNNavigationTraceManager openForSimulationWithRoute:traceRecordingData:traceNameOverride:]";
      v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNNavigationTraceManager.m";
      v61 = 1024;
      v62 = 185;
      v63 = 2080;
      v64 = "NO";
      v65 = 2112;
      v66 = v12;
LABEL_7:
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (self->_tracePlayer)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trace playback already in progress."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v58 = "-[MNNavigationTraceManager openForSimulationWithRoute:traceRecordingData:traceNameOverride:]";
      v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNNavigationTraceManager.m";
      v61 = 1024;
      v62 = 190;
      v63 = 2080;
      v64 = "NO";
      v65 = 2112;
      v66 = v12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  v14 = CFSTR("LatestSimulation");
  v56 = v10;
  if (v10)
    v14 = v10;
  v15 = v14;
  +[MNFilePaths navTraceExtension](MNFilePaths, "navTraceExtension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MNFilePaths navTracesDirectoryPath](MNFilePaths, "navTracesDirectoryPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v15;
  +[MNFilePaths tracePathForTraceName:extension:directoryPath:](MNFilePaths, "tracePathForTraceName:extension:directoryPath:", v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "fileExistsAtPath:", v18))
    objc_msgSend(v19, "removeItemAtPath:error:", v18, 0);
  -[MNNavigationTraceManager _createSymlinkForTracePath:](self, "_createSymlinkForTracePath:", v18, v19);
  self->_isSimulation = 1;
  v20 = objc_alloc_init(MNTraceRecorder);
  traceRecorder = self->_traceRecorder;
  self->_traceRecorder = v20;

  v54 = (void *)v18;
  -[MNTraceRecorder startWritingTraceToPath:traceType:withErrorHandler:](self->_traceRecorder, "startWritingTraceToPath:traceType:withErrorHandler:", v18, 0, 0);
  -[MNTraceRecorder setIsSimulation:](self->_traceRecorder, "setIsSimulation:", 1);
  -[MNTraceRecorder resetLocationsForSimulation](self->_traceRecorder, "resetLocationsForSimulation");
  -[MNNavigationTraceManager _recordEnvironmentInfo:](self, "_recordEnvironmentInfo:", self->_traceRecorder);
  -[MNNavigationTraceManager _recordStylesheet:](self, "_recordStylesheet:", self->_traceRecorder);
  -[MNTraceRecorder recordingStartDate](self->_traceRecorder, "recordingStartDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceReferenceDate");
  v24 = v23;

  v25 = self->_traceRecorder;
  objc_msgSend(v9, "initialDirectionsRequest");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "initialDirectionsResponse");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "initialDirectionsRequestError");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "waypoints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "route");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "indexInResponse");
  objc_msgSend(v9, "initialDirectionsRequestTimestamp");
  v33 = v32 - v24;
  objc_msgSend(v9, "initialDirectionsResponseTimestamp");
  -[MNTraceRecorder recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:](v25, "recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:", v26, v27, v28, v29, v31, v33, v34 - v24);

  v35 = self->_traceRecorder;
  objc_msgSend(v8, "route");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "indexInResponse");
  objc_msgSend(v9, "initialDirectionsResponse");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "directionsResponseID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceRecorder recordRouteChangeWithIndex:directionsResponseID:etauResponseID:rerouteReason:](v35, "recordRouteChangeWithIndex:directionsResponseID:etauResponseID:rerouteReason:", v37, v39, 0, 0);

  -[MNTraceRecorder beginTransaction](self->_traceRecorder, "beginTransaction");
  v40 = (void *)objc_opt_new();
  objc_msgSend(v40, "setSimulationType:", 1);
  objc_msgSend(v40, "setInitialRoute:", v8);
  v41 = -[MNSimulatedLocationGenerator initWithSimulationParameters:]([MNSimulatedLocationGenerator alloc], "initWithSimulationParameters:", v40);
  -[MNSimulatedLocationGenerator nextSimulatedLocationWithElapsedTime:](v41, "nextSimulatedLocationWithElapsedTime:", 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTraceRecorder timeSinceRecordingBegan](self->_traceRecorder, "timeSinceRecordingBegan");
  if (v42)
  {
    v44 = v43;
    do
    {
      -[MNTraceRecorder recordLocation:rawLocation:timestamp:](self->_traceRecorder, "recordLocation:rawLocation:timestamp:", v42, v42, v44);
      v44 = v44 + 1.0;
      -[MNSimulatedLocationGenerator nextSimulatedLocationWithElapsedTime:](v41, "nextSimulatedLocationWithElapsedTime:", 1.0);
      v45 = objc_claimAutoreleasedReturnValue();

      v42 = (void *)v45;
    }
    while (v45);
  }

  -[MNTraceRecorder endTransaction](self->_traceRecorder, "endTransaction");
  -[MNTraceRecorder saveTraceSynchronously](self->_traceRecorder, "saveTraceSynchronously");
  v46 = self->_traceRecorder;
  self->_traceRecorder = 0;

  v47 = -[MNTracePlayer initWithPath:]([MNTracePlayer alloc], "initWithPath:", v54);
  tracePlayer = self->_tracePlayer;
  self->_tracePlayer = v47;

  GEOConfigGetDouble();
  -[MNTracePlayer setSpeedMultiplier:](self->_tracePlayer, "setSpeedMultiplier:");
  -[MNTracePlayer setShouldPlayETARequests:](self->_tracePlayer, "setShouldPlayETARequests:", GEOConfigGetBOOL());
  -[MNTracePlayer setShouldUpdateRouteWhenJumping:](self->_tracePlayer, "setShouldUpdateRouteWhenJumping:", 0);
  -[MNTracePlayer registerObserver:](self->_tracePlayer, "registerObserver:", self);
  v49 = objc_alloc_init(MNTracePlaybackDetails);
  -[MNTracePlaybackDetails setEventType:](v49, "setEventType:", 1);
  -[MNTracePlaybackDetails setTracePath:](v49, "setTracePath:", v54);
  -[MNTracePlayer duration](self->_tracePlayer, "duration");
  -[MNTracePlaybackDetails setTraceDuration:](v49, "setTraceDuration:");
  -[MNTracePlayer trace](self->_tracePlayer, "trace");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "serializableBookmarks");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNTracePlaybackDetails setBookmarks:](v49, "setBookmarks:", v51);

  WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  objc_msgSend(WeakRetained, "navigationTraceManager:didUpdateTracePlaybackDetails:", self, v49);

  v11 = v56;
LABEL_9:

}

- (void)saveRoutePlanningTrace:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  MNTraceRecorder *v17;
  MNTraceRecorder *traceRecorder;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  MNTraceRecorder *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  if (GEOConfigGetBOOL())
  {
    objc_msgSend(v37, "waypoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNNavigationTraceManager _defaultTraceNameForDestination:isSimulation:](self, "_defaultTraceNameForDestination:isSimulation:", v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    +[MNFilePaths routePlanningTraceExtension](MNFilePaths, "routePlanningTraceExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MNFilePaths routePlanningTracesDirectoryPath](MNFilePaths, "routePlanningTracesDirectoryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v6;
    +[MNFilePaths tracePathForTraceName:extension:directoryPath:](MNFilePaths, "tracePathForTraceName:extension:directoryPath:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    if (objc_msgSend(v11, "fileExistsAtPath:", v10))
    {
      v13 = 2;
      v12 = v10;
      do
      {
        objc_msgSend(v10, "stringByDeletingPathExtension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(" %u"), v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[MNFilePaths routePlanningTraceExtension](MNFilePaths, "routePlanningTraceExtension");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingPathExtension:", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (v13 + 1);
      }
      while ((objc_msgSend(v11, "fileExistsAtPath:", v12) & 1) != 0);
    }
    v17 = objc_alloc_init(MNTraceRecorder);
    traceRecorder = self->_traceRecorder;
    self->_traceRecorder = v17;

    -[MNTraceRecorder startWritingTraceToPath:traceType:withErrorHandler:](self->_traceRecorder, "startWritingTraceToPath:traceType:withErrorHandler:", v12, 1, 0);
    objc_msgSend(v37, "initialUserLocation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "timestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceRecorder setRecordingStartDate:](self->_traceRecorder, "setRecordingStartDate:", v19);

    -[MNTraceRecorder recordingStartDate](self->_traceRecorder, "recordingStartDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = v21;

    objc_msgSend(v37, "initialDirectionsRequestTimestamp");
    v23 = 0.0;
    v24 = 0.0;
    if (v25 > 0.0)
    {
      objc_msgSend(v37, "initialDirectionsRequestTimestamp");
      v24 = v26 - v22;
    }
    objc_msgSend(v37, "initialDirectionsResponseTimestamp");
    if (v27 > 0.0)
    {
      objc_msgSend(v37, "initialDirectionsResponseTimestamp");
      v23 = v28 - v22;
    }
    v29 = self->_traceRecorder;
    objc_msgSend(v37, "initialDirectionsRequest");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "initialDirectionsResponse");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "initialDirectionsRequestError");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "waypoints");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "initialDirectionsResponse");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceRecorder recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:](v29, "recordDirectionsRequest:response:error:waypoints:selectedRouteIndex:requestTimestamp:responseTimestamp:", v30, v31, v32, v33, objc_msgSend(v34, "selectedRouteIndex"), v24, v23);

    -[MNTraceRecorder recordLocation:timestamp:](self->_traceRecorder, "recordLocation:timestamp:", v35, 0.0);
    -[MNNavigationTraceManager close](self, "close");

  }
}

- (void)close
{
  void *v3;
  MNTraceRecorder *traceRecorder;
  void *v5;
  MNTraceRecorder *v6;
  id v7;
  void *v8;
  MNTraceRecorder *v9;
  void *v10;
  MNTracePlayer *tracePlayer;
  MNTraceNetworkEvent *initialNetworkState;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  MNNavigationTraceManager *v17;
  id v18;

  +[MNLocationManager sharedLocationManager](MNLocationManager, "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  traceRecorder = self->_traceRecorder;
  if (traceRecorder)
  {
    -[MNTraceRecorder tracePath](traceRecorder, "tracePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_traceRecorder;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __33__MNNavigationTraceManager_close__block_invoke;
    v16 = &unk_1E61D1D10;
    v17 = self;
    v18 = v5;
    v7 = v5;
    -[MNTraceRecorder saveTraceWithCompletionHandler:](v6, "saveTraceWithCompletionHandler:", &v13);
    objc_msgSend(v3, "setLocationRecorder:", 0, v13, v14, v15, v16, v17);
    +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTraceRecorder:", 0);

    v9 = self->_traceRecorder;
    self->_traceRecorder = 0;

  }
  else if (self->_tracePlayer)
  {
    +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProvider:", 0);

    -[MNTracePlayer stop](self->_tracePlayer, "stop");
    -[MNTracePlayer unregisterObserver:](self->_tracePlayer, "unregisterObserver:", self);
    tracePlayer = self->_tracePlayer;
    self->_tracePlayer = 0;

    if (self->_initialNetworkState)
    {
      +[MNTraceNetworkConditionHelper setCurrentState:](MNTraceNetworkConditionHelper, "setCurrentState:");
      initialNetworkState = self->_initialNetworkState;
      self->_initialNetworkState = 0;

    }
  }

}

void __33__MNNavigationTraceManager_close__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  _DWORD v13[7];

  *(_QWORD *)&v13[5] = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) && GEOConfigGetBOOL())
    objc_msgSend(*(id *)(a1 + 32), "_copyTraceToCrashReporterDirectory:", *(_QWORD *)(a1 + 40));
  v11 = 66053;
  v2 = fsctl((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"), 0xC0084A44uLL, &v11, 0);
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 67109378;
      v13[0] = v2;
      LOWORD(v13[1]) = 2114;
      *(_QWORD *)((char *)&v13[1] + 2) = v5;
      v6 = "Error: Failed to mark nav trace as purgeable: %i -- %{public}@";
      v7 = v4;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 18;
LABEL_9:
      _os_log_impl(&dword_1B0AD7000, v7, v8, v6, buf, v9);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v13 = v10;
    v6 = "Successfully marked nav trace as purgeable: %{public}@";
    v7 = v4;
    v8 = OS_LOG_TYPE_DEFAULT;
    v9 = 12;
    goto LABEL_9;
  }

}

- (BOOL)_isNavigating
{
  return (self->_navigationType & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (unint64_t)_startIndexForNavigation
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[MNTracePlayer trace](self->_tracePlayer, "trace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (id)_defaultTraceNameForDestination:(id)a3 isSimulation:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;

  v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E0CB3578];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v8);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "navDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    v12 = CFSTR("Unknown");
  if (v4)
    v13 = CFSTR("%@_%@_(Simulation)");
  else
    v13 = CFSTR("%@_%@");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)hardwareModel
{
  NSString *hardwareModel;
  NSString *v4;
  NSString *v5;

  hardwareModel = self->_hardwareModel;
  if (!hardwareModel)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_hardwareModel;
    self->_hardwareModel = v4;

    hardwareModel = self->_hardwareModel;
  }
  return hardwareModel;
}

- (void)_recordEnvironmentInfo:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0D27368];
  v5 = a3;
  objc_msgSend(v4, "sharedPlatform");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  GEOConfigGetString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeTileGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "releaseInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "productName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordEnvironmentInfo:value:", CFSTR("ProductName"), v10);

  objc_msgSend(v14, "buildVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordEnvironmentInfo:value:", CFSTR("BuildVersion"), v11);

  objc_msgSend(v14, "hardwareIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordEnvironmentInfo:value:", CFSTR("HardwareIdentifier"), v12);

  -[MNNavigationTraceManager hardwareModel](self, "hardwareModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordEnvironmentInfo:value:", CFSTR("HardwareModel"), v13);

  objc_msgSend(v5, "recordEnvironmentInfo:value:", CFSTR("EnvironmentName"), v6);
  objc_msgSend(v5, "recordEnvironmentInfo:value:", CFSTR("EnvironmentReleaseName"), v9);

}

- (void)_recordStylesheet:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GEOResourcesPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("scene"))
          && objc_msgSend(v10, "hasSuffix:", CFSTR(".styl")))
        {
          objc_msgSend(v4, "stringByAppendingPathComponent:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "contentsAtPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "recordStylesheet:data:", v10, v12);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)_createSymlinkForTracePath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (GEOConfigGetBOOL())
  {
    +[MNFilePaths navTracesDirectoryPath](MNFilePaths, "navTracesDirectoryPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("LatestTrace.navtrace"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributesOfItemAtPath:error:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B18]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0CB2B30];

    if (v7 == v8)
      objc_msgSend(v5, "removeItemAtPath:error:", v4, 0);
    objc_msgSend(v5, "createSymbolicLinkAtPath:withDestinationPath:error:", v4, v9, 0);

  }
}

- (void)_copyTraceToCrashReporterDirectory:(id)a3
{
  NSObject *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  NSObject *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) != 0)
  {
    v14 = 0;
    v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Maps/NavTraces"), 1, 0, &v14);
    v6 = v14;
    if ((v5 & 1) != 0)
    {
      -[NSObject lastPathComponent](v3, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Maps/NavTraces"), "stringByAppendingPathComponent:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "fileExistsAtPath:", v8))
      {
        v13 = v6;
        objc_msgSend(v4, "removeItemAtPath:error:", v8, &v13);
        v9 = v13;

        v6 = v9;
      }
      if (v6
        || (v12 = 0,
            objc_msgSend(v4, "copyItemAtPath:toPath:error:", v3, v8, &v12),
            (v6 = v12) != 0))
      {
        GEOFindOrCreateLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v6;
          _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Error copying trace to CrashReporter directory: %@", buf, 0xCu);
        }

      }
      else
      {
        GEOFindOrCreateLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v16 = v3;
          v17 = 2112;
          v18 = v8;
          _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEFAULT, "%@ successfully copied to %@", buf, 0x16u);
        }
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v6;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Error creating NavTraces directory in CrashReporter: %@", buf, 0xCu);
      }

      v8 = CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Maps/NavTraces");
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "Error copying trace to CrashReporter directory because origin trace does not exist: %@", buf, 0xCu);
    }
  }

}

- (void)tracePlayerDidPause:(id)a3
{
  id WeakRetained;
  MNTracePlaybackDetails *v5;

  v5 = objc_alloc_init(MNTracePlaybackDetails);
  -[MNTracePlaybackDetails setEventType:](v5, "setEventType:", 3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  objc_msgSend(WeakRetained, "navigationTraceManager:didUpdateTracePlaybackDetails:", self, v5);

}

- (void)tracePlayerDidResume:(id)a3
{
  id WeakRetained;
  MNTracePlaybackDetails *v5;

  v5 = objc_alloc_init(MNTracePlaybackDetails);
  -[MNTracePlaybackDetails setEventType:](v5, "setEventType:", 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  objc_msgSend(WeakRetained, "navigationTraceManager:didUpdateTracePlaybackDetails:", self, v5);

}

- (void)tracePlayer:(id)a3 didSeekToTime:(double)a4 fromTime:(double)a5 location:(id)a6
{
  id WeakRetained;
  MNTracePlaybackDetails *v9;

  v9 = objc_alloc_init(MNTracePlaybackDetails);
  -[MNTracePlaybackDetails setEventType:](v9, "setEventType:", 5);
  -[MNTracePlaybackDetails setCurrentPosition:](v9, "setCurrentPosition:", a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  objc_msgSend(WeakRetained, "navigationTraceManager:didUpdateTracePlaybackDetails:", self, v9);

}

- (void)tracePlayer:(id)a3 didPlayAtTime:(double)a4
{
  id WeakRetained;
  MNTracePlaybackDetails *v7;

  v7 = objc_alloc_init(MNTracePlaybackDetails);
  -[MNTracePlaybackDetails setEventType:](v7, "setEventType:", 4);
  -[MNTracePlaybackDetails setCurrentPosition:](v7, "setCurrentPosition:", a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
  objc_msgSend(WeakRetained, "navigationTraceManager:didUpdateTracePlaybackDetails:", self, v7);

}

- (void)tracePlayer:(id)a3 didUpdateLocation:(id)a4
{
  MNLocationProviderDelegate **p_locationProviderDelegate;
  id v6;
  id WeakRetained;

  p_locationProviderDelegate = &self->_locationProviderDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_locationProviderDelegate);
  objc_msgSend(WeakRetained, "locationProvider:didUpdateLocation:", self, v6);

}

- (void)tracePlayer:(id)a3 didReceiveLocationError:(id)a4
{
  MNLocationProviderDelegate **p_locationProviderDelegate;
  id v6;
  id WeakRetained;

  p_locationProviderDelegate = &self->_locationProviderDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_locationProviderDelegate);
  objc_msgSend(WeakRetained, "locationProvider:didReceiveError:", self, v6);

}

- (void)tracePlayerDidPauseLocationUpdates:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_locationProviderDelegate);
  objc_msgSend(WeakRetained, "locationProviderDidPauseLocationUpdates:", self);

}

- (void)tracePlayerDidResumeLocationUpdates:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_locationProviderDelegate);
  objc_msgSend(WeakRetained, "locationProviderDidResumeLocationUpdates:", self);

}

- (void)tracePlayer:(id)a3 didUpdateHeading:(id)a4
{
  MNLocationProviderDelegate **p_locationProviderDelegate;
  id v6;
  id WeakRetained;

  p_locationProviderDelegate = &self->_locationProviderDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_locationProviderDelegate);
  objc_msgSend(WeakRetained, "locationProvider:didUpdateHeading:", self, v6);

}

- (void)tracePlayer:(id)a3 didUpdateMotion:(unint64_t)a4 exitType:(unint64_t)a5 confidence:(unint64_t)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_motionContextProviderDelegate);
  objc_msgSend(WeakRetained, "motionContextProvider:didUpdateMotion:exitType:confidence:", self, a4, a5, a6);

}

- (void)tracePlayer:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5
{
  MNLocationProviderDelegate **p_locationProviderDelegate;
  id v8;
  id WeakRetained;

  p_locationProviderDelegate = &self->_locationProviderDelegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_locationProviderDelegate);
  objc_msgSend(WeakRetained, "locationProvider:didUpdateVehicleHeading:timestamp:", self, v8, a4);

}

- (void)tracePlayer:(id)a3 didUpdateVehicleSpeed:(double)a4 timestamp:(id)a5
{
  MNLocationProviderDelegate **p_locationProviderDelegate;
  id v8;
  id WeakRetained;

  p_locationProviderDelegate = &self->_locationProviderDelegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_locationProviderDelegate);
  objc_msgSend(WeakRetained, "locationProvider:didUpdateVehicleSpeed:timestamp:", self, v8, a4);

}

- (void)tracePlayer:(id)a3 didUpdateEVData:(id)a4
{
  MNVirtualGarageProviderDelegate **p_virtualGarageProviderDelegate;
  id v6;
  id WeakRetained;

  p_virtualGarageProviderDelegate = &self->_virtualGarageProviderDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_virtualGarageProviderDelegate);
  objc_msgSend(WeakRetained, "virtualGarageProvider:didUpdateSelectedVehicle:", self, v6);

}

- (void)tracePlayer:(id)a3 didRecieveNetworkEvent:(id)a4
{
  +[MNTraceNetworkConditionHelper setCurrentState:](MNTraceNetworkConditionHelper, "setCurrentState:", a4);
}

- (void)startUpdatingLocation
{
  if ((self->_navigationType & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[MNTracePlayer startAtLocationIndex:](self->_tracePlayer, "startAtLocationIndex:", -[MNNavigationTraceManager _startIndexForNavigation](self, "_startIndexForNavigation"));
  }
  else
  {
    -[MNTracePlayer start](self->_tracePlayer, "start");
    -[MNTracePlayer pause](self->_tracePlayer, "pause");
  }
}

- (void)stopUpdatingLocation
{
  -[MNTracePlayer stop](self->_tracePlayer, "stop");
}

- (NSBundle)effectiveBundle
{
  return 0;
}

- (NSString)effectiveBundleIdentifier
{
  return 0;
}

- (BOOL)isAuthorized
{
  return 1;
}

- (int)headingOrientation
{
  return 0;
}

- (double)expectedGpsUpdateInterval
{
  return 1.0;
}

- (BOOL)coarseModeEnabled
{
  return 0;
}

- (BOOL)isTracePlayer
{
  return 1;
}

- (unint64_t)traceVersion
{
  void *v2;
  unint64_t v3;

  -[MNTracePlayer trace](self->_tracePlayer, "trace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "originalVersion");

  return v3;
}

- (double)timeScale
{
  double result;

  -[MNTracePlayer speedMultiplier](self->_tracePlayer, "speedMultiplier");
  return result;
}

- (void)updatedVehicleStateWithHandler:(id)a3
{
  id v4;
  MNTraceEVDataRow *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    if (self->_tracePlayer)
    {
      v5 = objc_alloc_init(MNTraceEVDataRow);
      -[MNTracePlayer position](self->_tracePlayer, "position");
      -[MNTraceEVDataRow setTimestamp:](v5, "setTimestamp:");
      -[MNTracePlayer trace](self->_tracePlayer, "trace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "evData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v7, "count"), 1024, &__block_literal_global_12);
      if (v8 >= objc_msgSend(v7, "count"))
      {
        (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
      }
      else
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "vehicle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v10, 0);
        WeakRetained = objc_loadWeakRetained((id *)&self->_virtualGarageProviderDelegate);
        objc_msgSend(WeakRetained, "virtualGarageProvider:didUpdateSelectedVehicle:", self, v10);

      }
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
    v4 = v12;
  }

}

uint64_t __59__MNNavigationTraceManager_updatedVehicleStateWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (unint64_t)vehiclesCount
{
  return 1;
}

- (BOOL)assumesFullCharge
{
  return 0;
}

- (MNLocationProviderDelegate)delegate
{
  return (MNLocationProviderDelegate *)objc_loadWeakRetained((id *)&self->_locationProviderDelegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_locationProviderDelegate, a3);
}

- (GEOMotionContextProviderDelegate)motionDelegate
{
  return (GEOMotionContextProviderDelegate *)objc_loadWeakRetained((id *)&self->_motionContextProviderDelegate);
}

- (void)setMotionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_motionContextProviderDelegate, a3);
}

- (MNVirtualGarageProviderDelegate)virtualGarageDelegate
{
  return (MNVirtualGarageProviderDelegate *)objc_loadWeakRetained((id *)&self->_virtualGarageProviderDelegate);
}

- (void)setVirtualGarageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_virtualGarageProviderDelegate, a3);
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (MNNavigationTraceManagerDelegate)traceManagerDelegate
{
  return (MNNavigationTraceManagerDelegate *)objc_loadWeakRetained((id *)&self->_traceManagerDelegate);
}

- (void)setTraceManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_traceManagerDelegate, a3);
}

- (MNTracePlayer)tracePlayer
{
  return self->_tracePlayer;
}

- (MNTraceRecorder)traceRecorder
{
  return self->_traceRecorder;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (void)setNavigationType:(int64_t)a3
{
  self->_navigationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_destroyWeak((id *)&self->_virtualGarageProviderDelegate);
  objc_destroyWeak((id *)&self->_motionContextProviderDelegate);
  objc_destroyWeak((id *)&self->_locationProviderDelegate);
  objc_destroyWeak((id *)&self->_traceManagerDelegate);
  objc_storeStrong((id *)&self->_initialNetworkState, 0);
  objc_storeStrong((id *)&self->_traceRecorder, 0);
  objc_storeStrong((id *)&self->_tracePlayer, 0);
}

+ (void)clearOldTraces
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = geo_get_global_queue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MNNavigationTraceManager_CleanTracesDirectory__clearOldTraces__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(global_queue, block);

}

void __64__MNNavigationTraceManager_CleanTracesDirectory__clearOldTraces__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
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
  void *v19;
  uint8_t v20[16];

  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_INFO, "Cleaning traces directory.", v20, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, -1, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  +[MNFilePaths navTracesDirectoryPath](MNFilePaths, "navTracesDirectoryPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_clearOldTracesInDirectory:matchingExpression:beforeDate:", v7, CFSTR("*-journal"), v5);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 32);
  +[MNFilePaths routePlanningTracesDirectoryPath](MNFilePaths, "routePlanningTracesDirectoryPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_clearOldTracesInDirectory:matchingExpression:beforeDate:", v12, CFSTR("*"), v10);

  v13 = *(void **)(a1 + 32);
  +[MNFilePaths routeCreationTracesDirectoryPath](MNFilePaths, "routeCreationTracesDirectoryPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_clearOldTracesInDirectory:matchingExpression:beforeDate:", v14, CFSTR("*"), v10);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingUnit:value:toDate:options:", 8, -3, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(void **)(a1 + 32);
  +[MNFilePaths navTracesDirectoryPath](MNFilePaths, "navTracesDirectoryPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_clearOldTracesInDirectory:matchingExpression:beforeDate:", v19, CFSTR("*"), v17);

}

+ (void)_clearOldTracesInDirectory:(id)a3 matchingExpression:(id)a4 beforeDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  uint32_t v30;
  void *v31;
  void *v32;
  id obj;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v34 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v7;
  objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self like %@"), v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v12)
  {
    v13 = v12;
    v38 = *(_QWORD *)v42;
    v37 = *MEMORY[0x1E0CB2B18];
    v36 = (void *)*MEMORY[0x1E0CB2B20];
    v35 = *MEMORY[0x1E0CB2A38];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v42 != v38)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v39, "stringByAppendingPathComponent:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attributesOfItemAtPath:error:", v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v37);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 != v36)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", v35);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19
            || (objc_msgSend(v19, "earlierDate:", v34),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                v22 = objc_msgSend(v21, "isEqualToDate:", v20),
                v21,
                v22))
          {
            v40 = 0;
            v23 = objc_msgSend(v9, "removeItemAtPath:error:", v16, &v40);
            v24 = v40;
            GEOFindOrCreateLog();
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v23)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v15;
                v27 = v26;
                v28 = OS_LOG_TYPE_DEFAULT;
                v29 = "Removed trace \"%@\" because it is too old.";
                v30 = 12;
                goto LABEL_14;
              }
            }
            else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v46 = v15;
              v47 = 2112;
              v48 = v24;
              v27 = v26;
              v28 = OS_LOG_TYPE_ERROR;
              v29 = "Error removing trace \"%@\": %@";
              v30 = 22;
LABEL_14:
              _os_log_impl(&dword_1B0AD7000, v27, v28, v29, buf, v30);
            }

          }
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v13);
  }

}

@end
