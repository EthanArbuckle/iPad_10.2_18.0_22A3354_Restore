@implementation MapsSuggestionsUser

- (MapsSuggestionsUser)initWithMeCardReader:(id)a3 routine:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MapsSuggestionsUser *v10;
  MapsSuggestionsUser *v11;
  void *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *innerQueue;
  NSString *v15;
  NSString *name;
  MapsSuggestionsUser *v17;
  NSObject *v18;
  objc_super v20;
  _BYTE buf[18];
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 36;
      v22 = 2082;
      v23 = "-[MapsSuggestionsUser initWithMeCardReader:routine:]";
      v24 = 2082;
      v25 = "nil == (meCardReader)";
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a MeCardReader", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 37;
      v22 = 2082;
      v23 = "-[MapsSuggestionsUser initWithMeCardReader:routine:]";
      v24 = 2082;
      v25 = "nil == (routine)";
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Routine", buf, 0x26u);
    }
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsUser;
  v10 = -[MapsSuggestionsUser init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_meCardReader, a3);
    objc_storeStrong((id *)&v11->_routine, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue((dispatch_queue_t *)buf, CFSTR("MapsSuggestionsUserQueue"), v12);
    v13 = *(OS_dispatch_queue **)buf;
    *(_QWORD *)buf = 0;
    innerQueue = v11->_queue._innerQueue;
    v11->_queue._innerQueue = v13;

    v15 = *(NSString **)&buf[8];
    *(_QWORD *)&buf[8] = 0;
    name = v11->_queue._name;
    v11->_queue._name = v15;

  }
  self = v11;
  v17 = self;
LABEL_12:

  return v17;
}

- (char)meCardForProminentPlacesAroundCoordinate:(CLLocationCoordinate2D)a3 maxDistance:(double)a4 maxAge:(double)a5 minVisits:(int64_t)a6 handler:(id)a7
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v13;
  NSObject *v14;
  NSObject *v15;
  MapsSuggestionsMeCardReader *meCardReader;
  uint64_t v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  MapsSuggestionsRoutine *routine;
  NSObject *v22;
  int v23;
  int v24;
  NSObject *innerQueue;
  char v26;
  _QWORD block[4];
  id v29;
  _BYTE *v30;
  _QWORD *v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD *v34;
  CLLocationDegrees v35;
  CLLocationDegrees v36;
  double v37;
  _QWORD v38[4];
  NSObject *v39;
  _BYTE *v40;
  CLLocationDegrees v41;
  CLLocationDegrees v42;
  double v43;
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  CLLocationDegrees v47;
  __int16 v48;
  CLLocationDegrees v49;
  _BYTE v50[40];
  id v51;
  uint64_t v52;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v52 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  if (v13)
  {
    v14 = dispatch_group_create();
    *(_QWORD *)v50 = 0;
    *(_QWORD *)&v50[8] = v50;
    *(_QWORD *)&v50[16] = 0x3032000000;
    *(_QWORD *)&v50[24] = __Block_byref_object_copy__19;
    *(_QWORD *)&v50[32] = __Block_byref_object_dispose__19;
    v51 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = __Block_byref_object_copy__19;
    v44[4] = __Block_byref_object_dispose__19;
    v45 = 0;
    dispatch_group_enter(v14);
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v47 = latitude;
      v48 = 2048;
      v49 = longitude;
      _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_DEBUG, "Getting MeCard from Favorites for <%+.6f,%+.6f>", buf, 0x16u);
    }

    meCardReader = self->_meCardReader;
    v17 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke;
    v38[3] = &unk_1E4BD1020;
    v18 = v14;
    v41 = latitude;
    v42 = longitude;
    v39 = v18;
    v40 = v50;
    v43 = a4;
    v19 = -[MapsSuggestionsMeCardReader readMeCardWithHandler:](meCardReader, "readMeCardWithHandler:", v38);
    dispatch_group_enter(v18);
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v47 = latitude;
      v48 = 2048;
      v49 = longitude;
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_DEBUG, "Getting MeCard from Routine for <%+.6f,%+.6f>", buf, 0x16u);
    }

    routine = self->_routine;
    v32[0] = v17;
    v32[1] = 3221225472;
    v32[2] = __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke_107;
    v32[3] = &unk_1E4BD1020;
    v22 = v18;
    v35 = latitude;
    v36 = longitude;
    v33 = v22;
    v34 = v44;
    v37 = a4;
    v23 = -[MapsSuggestionsRoutine readMeCardWithMinVisits:maxAge:handler:](routine, "readMeCardWithMinVisits:maxAge:handler:", a6, v32, a5);
    v24 = v23;
    if (v19)
    {
      if (v23)
      {
LABEL_8:
        innerQueue = self->_queue._innerQueue;
        block[0] = v17;
        block[1] = 3221225472;
        block[2] = __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke_108;
        block[3] = &unk_1E4BD1048;
        v30 = v50;
        v31 = v44;
        v29 = v13;
        dispatch_group_notify(v22, innerQueue, block);

        _Block_object_dispose(v44, 8);
        _Block_object_dispose(v50, 8);

        v26 = 1;
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_group_leave(v22);
      if (v24)
        goto LABEL_8;
    }
    dispatch_group_leave(v22);
    goto LABEL_8;
  }
  GEOFindOrCreateLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v50 = 136446978;
    *(_QWORD *)&v50[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
    *(_WORD *)&v50[12] = 1024;
    *(_DWORD *)&v50[14] = 54;
    *(_WORD *)&v50[18] = 2082;
    *(_QWORD *)&v50[20] = "-[MapsSuggestionsUser meCardForProminentPlacesAroundCoordinate:maxDistance:maxAge:minVisits:handler:]";
    *(_WORD *)&v50[28] = 2082;
    *(_QWORD *)&v50[30] = "nil == (handler)";
    _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", v50, 0x26u);
  }
  v26 = 0;
LABEL_12:

  return v26;
}

void __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "Could not read MeCard from Favorites: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(void **)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v14 = 134218240;
      v15 = v9;
      v16 = 2048;
      v17 = v10;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Getting MeCard from Favorites for <%+.6f,%+.6f>", (uint8_t *)&v14, 0x16u);
    }

    MapsSuggestionsMeCardWithinDistance(v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }

  dispatch_group_leave(v7);
}

void __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (!v5 || v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, "Could not read MeCard from Routine: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(void **)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v14 = 134218240;
      v15 = v9;
      v16 = 2048;
      v17 = v10;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Getting MeCard from Routine for <%+.6f,%+.6f>", (uint8_t *)&v14, 0x16u);
    }

    MapsSuggestionsMeCardWithinDistance(v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }

  dispatch_group_leave(v7);
}

void __101__MapsSuggestionsUser_meCardForProminentPlacesAroundCoordinate_maxDistance_maxAge_minVisits_handler___block_invoke_108(_QWORD *a1)
{
  id v2;

  MapsSuggestionsMeCardUnion(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), *(void **)(*(_QWORD *)(a1[6] + 8) + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[4] + 16))();

}

- (char)hasVisitedMapItem:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  char v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      v16 = 1024;
      v17 = 116;
      v18 = 2082;
      v19 = "-[MapsSuggestionsUser hasVisitedMapItem:handler:]";
      v20 = 2082;
      v21 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", (uint8_t *)&v14, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      v16 = 1024;
      v17 = 117;
      v18 = 2082;
      v19 = "-[MapsSuggestionsUser hasVisitedMapItem:handler:]";
      v20 = 2082;
      v21 = "nil == (mapItem)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", (uint8_t *)&v14, 0x26u);
    }
LABEL_9:

    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "coordinate");
  CLLocationFromGEOLocationCoordinate2D(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MapsSuggestionsRoutine fetchLastVisitAtLocation:handler:](self->_routine, "fetchLastVisitAtLocation:handler:", v10, v7);

LABEL_10:
  return v11;
}

- (char)mostRecentVisitWithinDistance:(double)a3 ofMapItem:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  char v10;
  NSObject *v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      v16 = 1024;
      v17 = 130;
      v18 = 2082;
      v19 = "-[MapsSuggestionsUser mostRecentVisitWithinDistance:ofMapItem:handler:]";
      v20 = 2082;
      v21 = "nil == (handler)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_8:
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x26u);
    }
LABEL_9:

    v10 = 0;
    goto LABEL_10;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUser.mm";
      v16 = 1024;
      v17 = 131;
      v18 = 2082;
      v19 = "-[MapsSuggestionsUser mostRecentVisitWithinDistance:ofMapItem:handler:]";
      v20 = 2082;
      v21 = "nil == ((MapsSuggestionsMapItem *)mapItem)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v10 = -[MapsSuggestionsRoutine fetchMostRecentVisitWithinDistance:ofMapItem:handler:](self->_routine, "fetchMostRecentVisitWithinDistance:ofMapItem:handler:", v8, v9, a3);
LABEL_10:

  return v10;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routine, 0);
  objc_storeStrong((id *)&self->_meCardReader, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
