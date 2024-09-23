@implementation MapsSuggestionsRealInsights

- (id)initFromResourceDepot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MapsSuggestionsRealInsights *v9;
  void *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *innerQueue;
  NSString *v13;
  NSString *name;
  OS_dispatch_source *closeTimer;
  NSXPCConnection *connection;
  uint64_t v17;
  MapsSuggestionsPortrait *portrait;
  MapsSuggestionsRealInsights *v19;
  NSObject *v20;
  objc_super v22;
  _BYTE buf[18];
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 73;
      v24 = 2082;
      v25 = "-[MapsSuggestionsRealInsights initFromResourceDepot:]";
      v26 = 2082;
      v27 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", buf, 0x26u);
    }
    goto LABEL_19;
  }
  objc_msgSend(v4, "oneRoutine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 74;
      v24 = 2082;
      v25 = "-[MapsSuggestionsRealInsights initFromResourceDepot:]";
      v26 = 2082;
      v27 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Routine!", buf, 0x26u);
    }
    goto LABEL_19;
  }
  objc_msgSend(v5, "oneNetworkRequester");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 75;
      v24 = 2082;
      v25 = "-[MapsSuggestionsRealInsights initFromResourceDepot:]";
      v26 = 2082;
      v27 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Network!", buf, 0x26u);
    }
    goto LABEL_19;
  }
  objc_msgSend(v5, "onePortrait");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 77;
      v24 = 2082;
      v25 = "-[MapsSuggestionsRealInsights initFromResourceDepot:]";
      v26 = 2082;
      v27 = "nil == (resourceDepot.onePortrait)";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Portrait!", buf, 0x26u);
    }
LABEL_19:

    v19 = 0;
    goto LABEL_20;
  }
  v22.receiver = self;
  v22.super_class = (Class)MapsSuggestionsRealInsights;
  v9 = -[MapsSuggestionsRealInsights init](&v22, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MSg::Queue::Queue((dispatch_queue_t *)buf, CFSTR("MapsSuggestionsInsightsQueue"), v10);
    v11 = *(OS_dispatch_queue **)buf;
    *(_QWORD *)buf = 0;
    innerQueue = v9->_queue._innerQueue;
    v9->_queue._innerQueue = v11;

    v13 = *(NSString **)&buf[8];
    *(_QWORD *)&buf[8] = 0;
    name = v9->_queue._name;
    v9->_queue._name = v13;

    closeTimer = v9->_closeTimer;
    v9->_closeTimer = 0;

    connection = v9->_connection;
    v9->_connection = 0;

    objc_msgSend(v5, "onePortrait");
    v17 = objc_claimAutoreleasedReturnValue();
    portrait = v9->_portrait;
    v9->_portrait = (MapsSuggestionsPortrait *)v17;

  }
  self = v9;
  v19 = self;
LABEL_20:

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[MapsSuggestionsRealInsights _unscheduleCloseConnection]((uint64_t)self);
  -[MapsSuggestionsRealInsights _closeConnection](self);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsRealInsights;
  -[MapsSuggestionsRealInsights dealloc](&v3, sel_dealloc);
}

- (void)_unscheduleCloseConnection
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (a1)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "_unscheduleCloseConnection", v5, 2u);
    }

    v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
      v4 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

    }
  }
}

- (void)_closeConnection
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "uniqueName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v3;
      v13 = 2080;
      v14 = "_closeConnection";
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v11, 0x16u);

    }
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_closeConnection", ", (uint8_t *)&v11, 2u);
    }

    v5 = (void *)a1[3];
    if (v5)
    {
      v6 = v5;
      v7 = (void *)a1[3];
      a1[3] = 0;

      objc_msgSend(v6, "setInterruptionHandler:", 0);
      objc_msgSend(v6, "setInvalidationHandler:", 0);
      objc_msgSend(v6, "invalidate");

    }
    -[MapsSuggestionsRealInsights _unscheduleCloseConnection]((uint64_t)a1);
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "uniqueName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2080;
      v14 = "_closeConnection";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v11, 0x16u);

    }
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_closeConnection", ", (uint8_t *)&v11, 2u);
    }

  }
}

- (id)confidenceScoresForMapItems:(id)a3
{
  return 0;
}

- (id)confidenceScoresForContacts:(id)a3 addresses:(id)a4
{
  return 0;
}

- (double)isTouristHere
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  MapsSuggestionsSignalPackEvaluator *v8;
  double v9;
  NSObject *v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D272A8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabledForSubTestWithName:", CFSTR("MSGPPTTest_Insights_ACRanking_Tourist"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("MSGPPTTest_Insights_ACRanking_TouristBEGIN"), 0);

  }
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136315138;
      v19 = "-[MapsSuggestionsRealInsights isTouristHere]";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v18, 0xCu);
    }

  }
  -[MapsSuggestionsRealInsights signalPackForHere](self, "signalPackForHere");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[MapsSuggestionsSignalPackEvaluator initWithSignalPack:]([MapsSuggestionsSignalPackEvaluator alloc], "initWithSignalPack:", v7);
    if (-[MapsSuggestionsSignalPackEvaluator hasTouristInfo](v8, "hasTouristInfo"))
    {
      if (-[MapsSuggestionsSignalPackEvaluator isTouristHere](v8, "isTouristHere"))
        v9 = MapsSuggestionsConfidenceDefinitelyTrue();
      else
        v9 = MapsSuggestionsConfidenceDefinitelyFalse();
      v11 = v9;
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v18 = 134217984;
          v19 = *(const char **)&v11;
          _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "isTouristHere: %f", (uint8_t *)&v18, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0D272A8], "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEnabledForSubTestWithName:", CFSTR("MSGPPTTest_Insights_ACRanking_Tourist"));

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "postNotificationName:object:", CFSTR("MSGPPTTest_Insights_ACRanking_TouristEND"), 0);

      }
    }
    else
    {
      GEOFindOrCreateLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Couldn't get TouristInfo from Evaluator. Cannot predict confidence", (uint8_t *)&v18, 2u);
      }

      v11 = MapsSuggestionsConfidenceDontKnow();
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict confidence", (uint8_t *)&v18, 2u);
    }

    v11 = MapsSuggestionsConfidenceDontKnow();
  }

  return v11;
}

- (BOOL)isTransitUserHere
{
  NSObject *v3;
  void *v4;
  MapsSuggestionsSignalPackEvaluator *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[MapsSuggestionsRealInsights isTransitUserHere]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  -[MapsSuggestionsRealInsights signalPackForHere](self, "signalPackForHere");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[MapsSuggestionsSignalPackEvaluator initWithSignalPack:]([MapsSuggestionsSignalPackEvaluator alloc], "initWithSignalPack:", v4);
    -[MapsSuggestionsSignalPackEvaluator isTransitUserHereConfidence](v5, "isTransitUserHereConfidence");
    v7 = v6;
    v8 = MapsSuggestionsConfidenceDontKnow();
    v9 = v7 > v8;
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = CFSTR("NO");
      if (v7 > v8)
        v11 = CFSTR("YES");
      v13 = 134218242;
      v14 = *(const char **)&v7;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "isTransitUserHere: %f = %@", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A427D000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict isTransitUserHere, so we say NO", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)isTransitUser
{
  NSObject *v3;
  void *v4;
  MapsSuggestionsSignalPackEvaluator *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[MapsSuggestionsRealInsights isTransitUser]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  -[MapsSuggestionsRealInsights signalPackForHere](self, "signalPackForHere");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[MapsSuggestionsSignalPackEvaluator initWithSignalPack:]([MapsSuggestionsSignalPackEvaluator alloc], "initWithSignalPack:", v4);
    -[MapsSuggestionsSignalPackEvaluator isTransitUserConfidence](v5, "isTransitUserConfidence");
    v7 = v6;
    v8 = MapsSuggestionsConfidenceDontKnow();
    v9 = v7 > v8;
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = CFSTR("NO");
      if (v7 > v8)
        v11 = CFSTR("YES");
      v13 = 134218242;
      v14 = *(const char **)&v7;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "isTransitUserHere: %f = %@", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A427D000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict isTransitUser, so we say NO", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)userHasAnExpressPaymentCard
{
  NSObject *v3;
  void *v4;
  MapsSuggestionsSignalPackEvaluator *v5;
  double v6;
  NSObject *v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[MapsSuggestionsRealInsights userHasAnExpressPaymentCard]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  -[MapsSuggestionsRealInsights signalPackForHere](self, "signalPackForHere");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[MapsSuggestionsSignalPackEvaluator initWithSignalPack:]([MapsSuggestionsSignalPackEvaluator alloc], "initWithSignalPack:", v4);
    v6 = MapsSuggestionsConfidenceDontKnow();
    if (-[MapsSuggestionsSignalPackEvaluator hasSignalForExpressPaymentCard](v5, "hasSignalForExpressPaymentCard"))
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "hasSignalForExpressPaymentCard", (uint8_t *)&v13, 2u);
      }

      v6 = (double)-[MapsSuggestionsSignalPackEvaluator userHasAnExpressPaymentCard](v5, "userHasAnExpressPaymentCard");
    }
    v8 = MapsSuggestionsConfidenceDontKnow();
    v9 = v6 > v8;
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = CFSTR("NO");
      if (v6 > v8)
        v11 = CFSTR("YES");
      v13 = 134218242;
      v14 = *(const char **)&v6;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "userHasAnExpressPaymentCard: %f = %@", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A427D000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict if userHasAnExpressPaymentCard, so we say NO", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)userHasAPaymentCard
{
  NSObject *v3;
  void *v4;
  MapsSuggestionsSignalPackEvaluator *v5;
  double v6;
  NSObject *v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[MapsSuggestionsRealInsights userHasAPaymentCard]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  -[MapsSuggestionsRealInsights signalPackForHere](self, "signalPackForHere");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[MapsSuggestionsSignalPackEvaluator initWithSignalPack:]([MapsSuggestionsSignalPackEvaluator alloc], "initWithSignalPack:", v4);
    v6 = MapsSuggestionsConfidenceDontKnow();
    if (-[MapsSuggestionsSignalPackEvaluator hasSignalForPaymentCard](v5, "hasSignalForPaymentCard"))
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "hasSignalForPaymentCard", (uint8_t *)&v13, 2u);
      }

      v6 = (double)-[MapsSuggestionsSignalPackEvaluator userHasAPaymentCard](v5, "userHasAPaymentCard");
    }
    v8 = MapsSuggestionsConfidenceDontKnow();
    v9 = v6 > v8;
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = CFSTR("NO");
      if (v6 > v8)
        v11 = CFSTR("YES");
      v13 = 134218242;
      v14 = *(const char **)&v6;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "userHasAPaymentCard: %f = %@", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A427D000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict if userHasAPaymentCard, so we say NO", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)userHasATransitCard
{
  NSObject *v3;
  void *v4;
  MapsSuggestionsSignalPackEvaluator *v5;
  double v6;
  NSObject *v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[MapsSuggestionsRealInsights userHasATransitCard]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  -[MapsSuggestionsRealInsights signalPackForHere](self, "signalPackForHere");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[MapsSuggestionsSignalPackEvaluator initWithSignalPack:]([MapsSuggestionsSignalPackEvaluator alloc], "initWithSignalPack:", v4);
    v6 = MapsSuggestionsConfidenceDontKnow();
    if (-[MapsSuggestionsSignalPackEvaluator hasSignalForHasATransitCard](v5, "hasSignalForHasATransitCard"))
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "userHasATransitCard", (uint8_t *)&v13, 2u);
      }

      v6 = (double)-[MapsSuggestionsSignalPackEvaluator userHasATransitCard](v5, "userHasATransitCard");
    }
    v8 = MapsSuggestionsConfidenceDontKnow();
    v9 = v6 > v8;
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = CFSTR("NO");
      if (v6 > v8)
        v11 = CFSTR("YES");
      v13 = 134218242;
      v14 = *(const char **)&v6;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "userHasATransitCard: %f = %@", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A427D000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict if userHasATransitCard, so we say NO", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (char)signalPackForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  double longitude;
  double latitude;
  id v9;
  id v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *innerQueue;
  id v19;
  id v20;
  char v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  _BYTE v32[14];
  __int16 v33;
  const char *v34;
  uint64_t v35;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      v31 = 1024;
      *(_DWORD *)v32 = 256;
      *(_WORD *)&v32[4] = 2082;
      *(_QWORD *)&v32[6] = "-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:handler:]";
      v33 = 2082;
      v34 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler block", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      v31 = 1024;
      *(_DWORD *)v32 = 257;
      *(_WORD *)&v32[4] = 2082;
      *(_QWORD *)&v32[6] = "-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:handler:]";
      v33 = 2082;
      v34 = "nil == (mapItem)";
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
    }
LABEL_15:

    v21 = 0;
    goto LABEL_16;
  }
  GEOFindOrCreateLog();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsRealInsights uniqueName](self, "uniqueName");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v12;
    v31 = 2080;
    *(_QWORD *)v32 = "signalPackForDestinationMapItem";
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationMapItem", ", buf, 2u);
  }

  GEOFindOrCreateLog();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = objc_msgSend(v9, "_muid");
    *(_DWORD *)buf = 134217984;
    v30 = (const char *)v15;
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Getting SignalPack for MapItem with MUID %llu", buf, 0xCu);
  }

  objc_msgSend(v9, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSDataFromCLLocationCoordinate(latitude, longitude);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __88__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate_handler___block_invoke;
  v24[3] = &unk_1E4BCE7F8;
  objc_copyWeak(&v28, (id *)buf);
  v25 = v16;
  v26 = v17;
  v27 = v10;
  innerQueue = self->_queue._innerQueue;
  v19 = v17;
  v20 = v16;
  dispatch_async(innerQueue, v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
  v21 = 1;
LABEL_16:

  return v21;
}

void __88__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate_handler___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRealInsights _openConnectionIfNecessary]((uint64_t)WeakRetained);
    objc_msgSend(v4[3], "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate_handler___block_invoke_68;
    v9[3] = &unk_1E4BCF8F8;
    objc_copyWeak(&v11, v2);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "signalPackForDestinationMapItemData:originCoordinateData:handler:", v6, v7, v9);

    -[MapsSuggestionsRealInsights _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "MapsSuggestionsRealInsights.mm";
      v14 = 1026;
      v15 = 267;
      v16 = 2082;
      v17 = "-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

- (void)_openConnectionIfNecessary
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(_QWORD *)(a1 + 24))
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v3;
      v23 = 2080;
      v24 = "openingConnectionForRealInsights";
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "openingConnectionForRealInsights", ", buf, 2u);
    }

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.maps.destinationd.signalPipeline"), 0);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7336C8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE71FC40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_signalPackUpdated_, 0, 0);

    objc_msgSend(v5, "setExportedInterface:", v7);
    objc_msgSend(v5, "setExportedObject:", a1);
    objc_initWeak(&location, (id)a1);
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke;
    v18[3] = &unk_1E4BCDDF8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v5, "setInvalidationHandler:", v18);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_134;
    v16[3] = &unk_1E4BCDDF8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v5, "setInterruptionHandler:", v16);
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_136;
    v14[3] = &unk_1E4BCF948;
    objc_copyWeak(&v15, &location);
    v10 = (id)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v14);
    objc_storeStrong((id *)(a1 + 24), v5);
    objc_msgSend(v5, "resume");
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)a1, "uniqueName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2080;
      v24 = "openingConnectionForRealInsights";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "openingConnectionForRealInsights", ", buf, 2u);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

void __88__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate_handler___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  int v16;
  char *v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446722;
      v17 = "MapsSuggestionsRealInsights.mm";
      v18 = 1026;
      *(_DWORD *)v19 = 270;
      v19[2] = 2082;
      *(_QWORD *)&v19[3] = "-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v16, 0x1Cu);
    }
    v8 = v11;
    goto LABEL_11;
  }
  if (v5 && !v6)
  {
    +[MapsSuggestionsSignalPack signalPackFromData:](MapsSuggestionsSignalPack, "signalPackFromData:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v10;
      v18 = 2080;
      *(_QWORD *)v19 = "signalPackForDestinationMapItem";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v16, 0x16u);

    }
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationMapItem", ", (uint8_t *)&v16, 2u);
    }
LABEL_11:

    goto LABEL_19;
  }
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Failed with error: %@", (uint8_t *)&v16, 0xCu);
  }

  GEOFindOrCreateLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "uniqueName");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v14;
    v18 = 2080;
    *(_QWORD *)v19 = "signalPackForDestinationMapItem";
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v16, 0x16u);

  }
  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationMapItem", ", (uint8_t *)&v16, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_19:

}

- (void)_scheduleCloseConnection
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_source_t v5;
  dispatch_queue_t v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  id v15;
  id location;

  dispatch_assert_queue_V2(a1[1]);
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "_scheduleCloseConnection", (uint8_t *)v14, 2u);
  }

  dispatch_assert_queue_V2(a1[1]);
  if (!a1[4])
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "Re-initializing the _closeTimer", (uint8_t *)v14, 2u);
    }

    objc_initWeak(&location, a1);
    v4 = a1[1];
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
    v6 = a1[4];
    a1[4] = v5;

    dispatch_source_set_timer(a1[4], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v7 = a1[4];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__MapsSuggestionsRealInsights__initCloseTimerIfNecessary__block_invoke;
    v14[3] = &unk_1E4BCDDF8;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v7, v14);
    dispatch_resume(a1[4]);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  GEOConfigGetDouble();
  v9 = v8;
  GEOConfigGetDouble();
  v11 = v10;
  v12 = a1[4];
  v13 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v11 * 1000000000.0));
}

- (char)signalPackForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  double longitude;
  double latitude;
  id v9;
  id v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  NSObject *innerQueue;
  id v18;
  char v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  _BYTE v30[14];
  __int16 v31;
  const char *v32;
  uint64_t v33;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      v29 = 1024;
      *(_DWORD *)v30 = 291;
      *(_WORD *)&v30[4] = 2082;
      *(_QWORD *)&v30[6] = "-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:handler:]";
      v31 = 2082;
      v32 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler block", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (!v9)
  {
    GEOFindOrCreateLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      v29 = 1024;
      *(_DWORD *)v30 = 292;
      *(_WORD *)&v30[4] = 2082;
      *(_QWORD *)&v30[6] = "-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:handler:]";
      v31 = 2082;
      v32 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }
LABEL_15:

    v19 = 0;
    goto LABEL_16;
  }
  GEOFindOrCreateLog();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[MapsSuggestionsRealInsights uniqueName](self, "uniqueName");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v12;
    v29 = 2080;
    *(_QWORD *)v30 = "signalPackForDestinationEntry";
    _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  GEOFindOrCreateLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationEntry", ", buf, 2u);
  }

  GEOFindOrCreateLog();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "uniqueIdentifier");
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v15;
    _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Getting SignalPack for Entry %@", buf, 0xCu);

  }
  NSDataFromCLLocationCoordinate(latitude, longitude);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate_handler___block_invoke;
  v22[3] = &unk_1E4BCE7F8;
  objc_copyWeak(&v26, (id *)buf);
  v23 = v9;
  v24 = v16;
  v25 = v10;
  innerQueue = self->_queue._innerQueue;
  v18 = v16;
  dispatch_async(innerQueue, v22);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
  v19 = 1;
LABEL_16:

  return v19;
}

void __86__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate_handler___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRealInsights _openConnectionIfNecessary]((uint64_t)WeakRetained);
    objc_msgSend(v4[3], "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate_handler___block_invoke_74;
    v9[3] = &unk_1E4BCF8F8;
    objc_copyWeak(&v11, v2);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "signalPackForDestinationEntryData:originCoordinateData:handler:", v6, v7, v9);

    -[MapsSuggestionsRealInsights _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "MapsSuggestionsRealInsights.mm";
      v14 = 1026;
      v15 = 301;
      v16 = 2082;
      v17 = "-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __86__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate_handler___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  int v16;
  char *v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446722;
      v17 = "MapsSuggestionsRealInsights.mm";
      v18 = 1026;
      *(_DWORD *)v19 = 304;
      v19[2] = 2082;
      *(_QWORD *)&v19[3] = "-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v16, 0x1Cu);
    }
    v8 = v11;
    goto LABEL_11;
  }
  if (v5 && !v6)
  {
    +[MapsSuggestionsSignalPack signalPackFromData:](MapsSuggestionsSignalPack, "signalPackFromData:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v10;
      v18 = 2080;
      *(_QWORD *)v19 = "signalPackForDestinationEntry";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v16, 0x16u);

    }
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationEntry", ", (uint8_t *)&v16, 2u);
    }
LABEL_11:

    goto LABEL_19;
  }
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Failed with error: %@", (uint8_t *)&v16, 0xCu);
  }

  GEOFindOrCreateLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "uniqueName");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v14;
    v18 = 2080;
    *(_QWORD *)v19 = "signalPackForDestinationEntry";
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v16, 0x16u);

  }
  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationEntry", ", (uint8_t *)&v16, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_19:

}

- (char)signalPackForHereWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  _BYTE v18[14];
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSuggestionsRealInsights uniqueName](self, "uniqueName");
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2080;
      *(_QWORD *)v18 = "signalPackForHereWithHandler";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "signalPackForHereWithHandler", ", buf, 2u);
    }

    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "Getting SignalPack for here", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__MapsSuggestionsRealInsights_signalPackForHereWithHandler___block_invoke;
    v12[3] = &unk_1E4BCE550;
    objc_copyWeak(&v14, (id *)buf);
    v13 = v4;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
    v9 = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      v17 = 1024;
      *(_DWORD *)v18 = 323;
      *(_WORD *)&v18[4] = 2082;
      *(_QWORD *)&v18[6] = "-[MapsSuggestionsRealInsights signalPackForHereWithHandler:]";
      v19 = 2082;
      v20 = "nil == (handler)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler block", buf, 0x26u);
    }

    v9 = 0;
  }

  return v9;
}

void __60__MapsSuggestionsRealInsights_signalPackForHereWithHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRealInsights _openConnectionIfNecessary]((uint64_t)WeakRetained);
    objc_msgSend(v4[3], "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__MapsSuggestionsRealInsights_signalPackForHereWithHandler___block_invoke_76;
    v7[3] = &unk_1E4BCF8F8;
    objc_copyWeak(&v9, v2);
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v5, "signalPackForLocation:handler:", 0, v7);

    -[MapsSuggestionsRealInsights _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v9);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "MapsSuggestionsRealInsights.mm";
      v12 = 1026;
      v13 = 331;
      v14 = 2082;
      v15 = "-[MapsSuggestionsRealInsights signalPackForHereWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __60__MapsSuggestionsRealInsights_signalPackForHereWithHandler___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  int v16;
  char *v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 136446722;
      v17 = "MapsSuggestionsRealInsights.mm";
      v18 = 1026;
      *(_DWORD *)v19 = 334;
      v19[2] = 2082;
      *(_QWORD *)&v19[3] = "-[MapsSuggestionsRealInsights signalPackForHereWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v16, 0x1Cu);
    }
    v8 = v11;
    goto LABEL_11;
  }
  if (v5 && !v6)
  {
    +[MapsSuggestionsSignalPack signalPackFromData:](MapsSuggestionsSignalPack, "signalPackFromData:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(WeakRetained, "uniqueName");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v10;
      v18 = 2080;
      *(_QWORD *)v19 = "signalPackForHereWithHandler";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v16, 0x16u);

    }
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A427D000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForHereWithHandler", ", (uint8_t *)&v16, 2u);
    }
LABEL_11:

    goto LABEL_19;
  }
  GEOFindOrCreateLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Failed with error: %@", (uint8_t *)&v16, 0xCu);
  }

  GEOFindOrCreateLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "uniqueName");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v14;
    v18 = 2080;
    *(_QWORD *)v19 = "signalPackForHereWithHandler";
    _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v16, 0x16u);

  }
  GEOFindOrCreateLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A427D000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForHereWithHandler", ", (uint8_t *)&v16, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_19:

}

- (id)signalPackForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  double v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  _QWORD v18[4];
  NSObject *v19;
  _BYTE *v20;
  _BYTE buf[40];
  id v22;
  uint64_t v23;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__7;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__7;
    v22 = 0;
    v8 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate___block_invoke;
    v18[3] = &unk_1E4BCF920;
    v20 = buf;
    v9 = v8;
    v19 = v9;
    if (-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:handler:](self, "signalPackForDestinationMapItem:originCoordinate:handler:", v7, v18, latitude, longitude))
    {
      GEOConfigGetDouble();
      v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      if (dispatch_semaphore_wait(v9, v11))
      {
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Timeout on signalPackForDestinationMapItem:", v17, 2u);
        }

      }
      v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
    }
    else
    {
      GEOFindOrCreateLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "No callback on signalPackForDestinationMapItem:", v17, 2u);
      }

      v13 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 358;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (mapItem)";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
    }

    v13 = 0;
  }

  return v13;
}

void __80__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Error on signalPackForDestinationMapItem: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  v8 = objc_msgSend(v5, "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)signalPackForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  double v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  _QWORD v18[4];
  NSObject *v19;
  _BYTE *v20;
  _BYTE buf[40];
  id v22;
  uint64_t v23;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__7;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__7;
    v22 = 0;
    v8 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate___block_invoke;
    v18[3] = &unk_1E4BCF920;
    v20 = buf;
    v9 = v8;
    v19 = v9;
    if (-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:handler:](self, "signalPackForDestinationEntry:originCoordinate:handler:", v7, v18, latitude, longitude))
    {
      GEOConfigGetDouble();
      v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      if (dispatch_semaphore_wait(v9, v11))
      {
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Timeout on signalPackForDestinationEntry:", v17, 2u);
        }

      }
      v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
    }
    else
    {
      GEOFindOrCreateLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1A427D000, v15, OS_LOG_TYPE_ERROR, "No callback on signalPackForDestinationEntry:", v17, 2u);
      }

      v13 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 387;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }

    v13 = 0;
  }

  return v13;
}

void __78__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Error on signalPackForDestinationEntry: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  v8 = objc_msgSend(v5, "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)signalPackForHere
{
  std::chrono::steady_clock::time_point v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  std::chrono::steady_clock::time_point v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  v4 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__MapsSuggestionsRealInsights_signalPackForHere__block_invoke;
  v14[3] = &unk_1E4BCF920;
  v16 = &v17;
  v5 = v4;
  v15 = v5;
  if (-[MapsSuggestionsRealInsights signalPackForHereWithHandler:](self, "signalPackForHereWithHandler:", v14))
  {
    GEOConfigGetDouble();
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    if (dispatch_semaphore_wait(v5, v7))
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "Timeout on signalPackForHere", buf, 2u);
      }

    }
    v9.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v24 = (v9.__d_.__rep_ - v3.__d_.__rep_) / 1000;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "signalPackForHere took %lu usec", buf, 0xCu);
    }

    v11 = (id)v18[5];
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "No callback on signalPackForHere", buf, 2u);
    }

    v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __48__MapsSuggestionsRealInsights_signalPackForHere__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Error on signalPackForHere, error:%@", (uint8_t *)&v11, 0xCu);
    }

  }
  v8 = objc_msgSend(v5, "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)userHasAnUpcomingTrip
{
  NSObject *v3;
  void *v4;
  MapsSuggestionsSignalPackEvaluator *v5;
  double v6;
  NSObject *v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[MapsSuggestionsRealInsights userHasAnUpcomingTrip]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  -[MapsSuggestionsRealInsights signalPackForHere](self, "signalPackForHere");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[MapsSuggestionsSignalPackEvaluator initWithSignalPack:]([MapsSuggestionsSignalPackEvaluator alloc], "initWithSignalPack:", v4);
    v6 = MapsSuggestionsConfidenceDontKnow();
    if (-[MapsSuggestionsSignalPackEvaluator hasSignalForUpcomingTrip](v5, "hasSignalForUpcomingTrip"))
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "MSg has a signal for upcoming trip.", (uint8_t *)&v13, 2u);
      }

      v6 = (double)-[MapsSuggestionsSignalPackEvaluator userHasAnUpcomingTrip](v5, "userHasAnUpcomingTrip");
    }
    v8 = MapsSuggestionsConfidenceDontKnow();
    v9 = v6 > v8;
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = CFSTR("NO");
      if (v6 > v8)
        v11 = CFSTR("YES");
      v13 = 134218242;
      v14 = *(const char **)&v6;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "userHasAnUpcomingTrip: %f = %@", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A427D000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict if userHasAnUpcomingTrip, so we say NO", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)userIsCurrentlyInATrip
{
  NSObject *v3;
  void *v4;
  MapsSuggestionsSignalPackEvaluator *v5;
  double v6;
  NSObject *v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[MapsSuggestionsRealInsights userIsCurrentlyInATrip]";
    _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  -[MapsSuggestionsRealInsights signalPackForHere](self, "signalPackForHere");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[MapsSuggestionsSignalPackEvaluator initWithSignalPack:]([MapsSuggestionsSignalPackEvaluator alloc], "initWithSignalPack:", v4);
    v6 = MapsSuggestionsConfidenceDontKnow();
    if (-[MapsSuggestionsSignalPackEvaluator hasSignalForIsCurrentlyInATrip](v5, "hasSignalForIsCurrentlyInATrip"))
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "MSg has a signal for a current trip.", (uint8_t *)&v13, 2u);
      }

      v6 = (double)-[MapsSuggestionsSignalPackEvaluator userIsCurrentlyInATrip](v5, "userIsCurrentlyInATrip");
    }
    v8 = MapsSuggestionsConfidenceDontKnow();
    v9 = v6 > v8;
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = CFSTR("NO");
      if (v6 > v8)
        v11 = CFSTR("YES");
      v13 = 134218242;
      v14 = *(const char **)&v6;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "userIsCurrenltyInATrip: %f = %@", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A427D000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict if userIsCurrentlyInATrip, so we say NO", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (char)currentTripWithHandler:(id)a3
{
  return -[MapsSuggestionsPortrait currentTripsWithHandler:](self->_portrait, "currentTripsWithHandler:", a3);
}

- (char)futureTripsWithHandler:(id)a3
{
  return -[MapsSuggestionsPortrait futureTripsWithHandler:](self->_portrait, "futureTripsWithHandler:", a3);
}

- (void)signalPackUpdated:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  _WORD v11[17];

  *(_QWORD *)&v11[13] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MapsSuggestionsRealInsights insightUpdatesDelegate](self, "insightUpdatesDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsRealInsights.mm";
      v10 = 1026;
      *(_DWORD *)v11 = 512;
      v11[2] = 2082;
      *(_QWORD *)&v11[3] = "-[MapsSuggestionsRealInsights signalPackUpdated:]";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
    v6 = (char *)v7;
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    MapsSuggestionsSignalPackFromData(v4);
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insightsUpdated:", v6);
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      *(_QWORD *)v11 = v5;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Received a SignalPack update %@ and delivered to %@", (uint8_t *)&v8, 0x16u);
    }
LABEL_8:

  }
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke(uint64_t a1)
{
  id *v1;
  dispatch_queue_t *WeakRetained;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[4];
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_133;
    block[3] = &unk_1E4BCDDF8;
    objc_copyWeak(&v5, v1);
    dispatch_async(WeakRetained[1], block);
    objc_destroyWeak(&v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v7 = "MapsSuggestionsRealInsights.mm";
      v8 = 1026;
      v9 = 549;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_133(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  char *v3;
  void *v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = (char *)WeakRetained[3];
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "XPC connection {%@} became invalid", (uint8_t *)&v6, 0xCu);
    }

    v4 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    -[MapsSuggestionsRealInsights _unscheduleCloseConnection]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsRealInsights.mm";
      v8 = 1026;
      v9 = 551;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_134(uint64_t a1)
{
  id *v1;
  dispatch_queue_t *WeakRetained;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[4];
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_135;
    block[3] = &unk_1E4BCDDF8;
    objc_copyWeak(&v5, v1);
    dispatch_async(WeakRetained[1], block);
    objc_destroyWeak(&v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v7 = "MapsSuggestionsRealInsights.mm";
      v8 = 1026;
      v9 = 559;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_135(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  char *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = (char *)WeakRetained[3];
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1A427D000, v2, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got interrupted", (uint8_t *)&v5, 0xCu);
    }

    -[MapsSuggestionsRealInsights _closeConnection](WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsRealInsights.mm";
      v7 = 1026;
      v8 = 561;
      v9 = 2082;
      v10 = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_136(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  dispatch_queue_t *WeakRetained;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_137;
    v7[3] = &unk_1E4BCE618;
    objc_copyWeak(&v9, v4);
    v8 = v3;
    dispatch_async(WeakRetained[1], v7);

    objc_destroyWeak(&v9);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "MapsSuggestionsRealInsights.mm";
      v12 = 1026;
      v13 = 568;
      v14 = 2082;
      v15 = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

  }
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_137(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  char *v8;
  __int16 v9;
  _WORD v10[17];

  *(_QWORD *)&v10[13] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = (char *)WeakRetained[3];
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      *(_QWORD *)v10 = v5;
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got error: %@", (uint8_t *)&v7, 0x16u);
    }

    -[MapsSuggestionsRealInsights _closeConnection](WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446722;
      v8 = "MapsSuggestionsRealInsights.mm";
      v9 = 1026;
      *(_DWORD *)v10 = 570;
      v10[2] = 2082;
      *(_QWORD *)&v10[3] = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

void __57__MapsSuggestionsRealInsights__initCloseTimerIfNecessary__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRealInsights _closeConnection](WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsRealInsights.mm";
      v6 = 1026;
      v7 = 623;
      v8 = 2082;
      v9 = "-[MapsSuggestionsRealInsights _initCloseTimerIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (MapsSuggestionsInsightsUpdates)insightUpdatesDelegate
{
  return (MapsSuggestionsInsightsUpdates *)objc_loadWeakRetained((id *)&self->_insightUpdatesDelegate);
}

- (void)setInsightUpdatesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_insightUpdatesDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_insightUpdatesDelegate);
  objc_storeStrong((id *)&self->_portrait, 0);
  objc_storeStrong((id *)&self->_closeTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
