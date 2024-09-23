@implementation ATXHeroPoiManager

- (id)poiCategoryStream
{
  ATXHeroPoiManager *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BMStream *poiCategoryStream;
  BMStream *v8;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_poiCategoryStream && (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked") & 1) == 0)
  {
    BiomeLibrary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PointOfInterest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "Category");
    v6 = objc_claimAutoreleasedReturnValue();
    poiCategoryStream = v2->_poiCategoryStream;
    v2->_poiCategoryStream = (BMStream *)v6;

  }
  v8 = v2->_poiCategoryStream;
  objc_sync_exit(v2);

  return v8;
}

- (void)donateHeroPoiPredictions:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_hero();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134217984;
    v25 = COERCE_DOUBLE(-[NSObject count](v4, "count"));
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Received %lu Hero POI predictions.", (uint8_t *)&v24, 0xCu);
  }

  v6 = (void *)objc_opt_new();
  if (-[NSObject count](v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getCurrentPreciseLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_hero();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "timeIntervalSinceNow");
      v24 = 134217984;
      v25 = -v11;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Took %f seconds to fetch precise location", (uint8_t *)&v24, 0xCu);
    }

    if (v9)
    {
      +[ATXHeroDataServerHelper inRadiusPredictionsFrom:currentLocation:](ATXHeroDataServerHelper, "inRadiusPredictionsFrom:currentLocation:", v4, v9);
      v12 = objc_claimAutoreleasedReturnValue();

      __atxlog_handle_hero();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v13 = -[NSObject count](v12, "count");
        v24 = 134217984;
        v25 = *(double *)&v13;
        _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Left with %lu hero poi predictions after removing predictions based on gps location.", (uint8_t *)&v24, 0xCu);
      }
    }
    else
    {
      __atxlog_handle_hero();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXHeroPoiManager donateHeroPoiPredictions:].cold.2(v14, v15, v16);

      v12 = objc_opt_new();
    }

    v4 = v12;
  }
  if (-[NSObject count](v4, "count"))
  {
    if (-[NSObject count](v4, "count"))
    {
      v17 = 0;
      do
      {
        -[NSObject objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "poiCategory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "length"))
        {
          -[ATXHeroPoiManager donatePoiCategoryToBiome:rank:date:](self, "donatePoiCategoryToBiome:rank:date:", v19, v17, v6);
        }
        else
        {
          __atxlog_handle_hero();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[ATXHeroPoiManager donateHeroPoiPredictions:].cold.1((uint8_t *)&v24, (_BYTE *)&v24 + 1, v20);

        }
        ++v17;
      }
      while (v17 < -[NSObject count](v4, "count"));
    }
  }
  else
  {
    __atxlog_handle_hero();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "Hero POI predictions count is zero. Donating ATXDefaultHeroPOICategory to Biome", (uint8_t *)&v24, 2u);
    }

    +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultHeroPOICategory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHeroPoiManager donatePoiCategoryToBiome:rank:date:](self, "donatePoiCategoryToBiome:rank:date:", v23, 0, v6);

  }
}

- (void)donatePoiCategoryToBiome:(id)a3 rank:(unint64_t)a4 date:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0D02090];
  v9 = a5;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithPoiCategory:rank:timestamp:", v10, v12, v9);

  __atxlog_handle_hero();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v13;
    _os_log_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_DEFAULT, "Sending event to Biome: %@.", (uint8_t *)&v17, 0xCu);
  }

  -[ATXHeroPoiManager poiCategoryStream](self, "poiCategoryStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendEvent:", v13);

}

- (void)logCompletion:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (objc_msgSend(v3, "state"))
  {
    __atxlog_handle_hero();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ATXHeroPoiManager logCompletion:].cold.1(v3, v4);

  }
}

- (id)mostRecentHighestRankedPoiCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v3 = a3;
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultHeroPOICategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v3, "count");
  if (v11 >= 1)
  {
    v12 = v11 + 1;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndex:", v12 - 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "eventBody");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v17 = v16;

      if (v17 < v8)
        break;
      objc_msgSend(v13, "eventBody");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "rank");

      if (!v19)
      {
        objc_msgSend(v13, "eventBody");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "poiCategory");
        v21 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v21;
        break;
      }

      if ((unint64_t)--v12 <= 1)
        goto LABEL_9;
    }

  }
LABEL_9:

  return v10;
}

- (id)cachedPoiCategory
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
  objc_msgSend(v3, "objectForKey:", CFSTR("currentPoiCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultHeroPOICategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)currentPoiCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ATXHeroPoiManager poiCategoryStreamPublisher](self, "poiCategoryStreamPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeroPoiManager poiCategoryEventsWithStreamPublisher:](self, "poiCategoryEventsWithStreamPublisher:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeroPoiManager cachedPoiCategory](self, "cachedPoiCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[ATXHeroPoiManager mostRecentHighestRankedPoiCategory:](self, "mostRecentHighestRankedPoiCategory:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v8 = (void *)objc_msgSend(v7, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("currentPoiCategory"));
    v9 = v6;

  }
  else
  {
    __atxlog_handle_hero();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218242;
      v13 = 14400;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "No new POI category received from poiCategory stream since the last saved bookmark within the past %lu seconds, returning cached POI category: %@", (uint8_t *)&v12, 0x16u);
    }

    v9 = v5;
  }

  return v9;
}

- (id)poiCategoryStreamPublisher
{
  CFAbsoluteTime v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = CFAbsoluteTimeGetCurrent() + -14400.0;
  -[ATXHeroPoiManager poiCategoryStream](self, "poiCategoryStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "atx_publisherFromStartTime:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)poiCategoryPublisherBookmark
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(MEMORY[0x1E0CF94D8], "bookmarksPathFile:", CFSTR("poiCategoryPublisherBookmarkURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initFileURLWithPath:", v3);

  v5 = (void *)MEMORY[0x1E0CF94A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bookmarkFromURLPath:maxFileSize:versionNumber:", v4, 1000000, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CF94A0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithURLPath:versionNumber:bookmark:metadata:", v4, v9, 0, 0);

  }
  return v7;
}

- (id)poiCategoryEventsWithStreamPublisher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__85;
  v23 = __Block_byref_object_dispose__85;
  -[ATXHeroPoiManager poiCategoryPublisherBookmark](self, "poiCategoryPublisherBookmark");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend((id)v20[5], "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__ATXHeroPoiManager_poiCategoryEventsWithStreamPublisher___block_invoke;
  v18[3] = &unk_1E82E7A70;
  v18[4] = self;
  v18[5] = &v19;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__ATXHeroPoiManager_poiCategoryEventsWithStreamPublisher___block_invoke_2;
  v16[3] = &unk_1E82DB0C8;
  v7 = v5;
  v17 = v7;
  v8 = (id)objc_msgSend(v4, "sinkWithBookmark:completion:receiveInput:", v6, v18, v16);

  v9 = (void *)v20[5];
  v15 = 0;
  objc_msgSend(v9, "saveBookmarkWithError:", &v15);
  v10 = v15;
  if (v10)
  {
    __atxlog_handle_hero();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXHeroPoiManager poiCategoryEventsWithStreamPublisher:].cold.1((uint64_t)v10, v11, v12);

  }
  v13 = v7;

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __58__ATXHeroPoiManager_poiCategoryEventsWithStreamPublisher___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "logCompletion:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setBookmark:", v6);

}

uint64_t __58__ATXHeroPoiManager_poiCategoryEventsWithStreamPublisher___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiCategoryStream, 0);
}

- (void)donateHeroPoiPredictions:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_9(&dword_1C9A3B000, a3, (uint64_t)a3, "NIL POI category received in Hero POI Manager", a1);
}

- (void)donateHeroPoiPredictions:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_9(&dword_1C9A3B000, a1, a3, "Could not get precise location. Clearing predictions.", v3);
}

- (void)logCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "Error in receiving events from POI category stream: %@", (uint8_t *)&v5);

}

- (void)poiCategoryEventsWithStreamPublisher:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "Unable to save POI category bookmark due to : %@", (uint8_t *)&v3);
}

@end
