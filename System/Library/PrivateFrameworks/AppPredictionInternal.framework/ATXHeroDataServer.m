@implementation ATXHeroDataServer

- (ATXHeroDataServer)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXHeroDataServer *v6;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = -[ATXHeroDataServer initWithHeroClipManager:heroAppManager:tracker:](self, "initWithHeroClipManager:heroAppManager:tracker:", v3, v4, v5);

  return v6;
}

- (ATXHeroDataServer)initWithHeroClipManager:(id)a3 heroAppManager:(id)a4 tracker:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXHeroPoiManager *v11;
  void *v12;
  void *v13;
  ATXHeroDataServer *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(ATXHeroPoiManager);
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXHeroDataServer initWithHeroClipManager:heroAppManager:heroPoiManager:tracker:predictionsTracker:locationManager:](self, "initWithHeroClipManager:heroAppManager:heroPoiManager:tracker:predictionsTracker:locationManager:", v10, v9, v11, v8, v12, v13);

  return v14;
}

- (ATXHeroDataServer)initWithHeroClipManager:(id)a3 heroAppManager:(id)a4 heroPoiManager:(id)a5 tracker:(id)a6 predictionsTracker:(id)a7 locationManager:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ATXHeroDataServer *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  id v29;
  uint64_t v30;
  NSXPCListener *listener;
  id v33;
  id obj;
  id v35;
  id v36;
  objc_super v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  obj = a6;
  v18 = a6;
  v35 = a7;
  v19 = a7;
  v36 = a8;
  v37.receiver = self;
  v37.super_class = (Class)ATXHeroDataServer;
  v20 = -[ATXHeroDataServer init](&v37, sel_init);
  if (v20)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = a8;
    v21 = v19;
    v22 = v18;
    v23 = v17;
    v24 = v16;
    v25 = v15;
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("ATXHeroServerQueue", v26);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v27;

    v15 = v25;
    v16 = v24;
    v17 = v23;
    v18 = v22;
    v19 = v21;
    objc_storeStrong((id *)&v20->_heroClipManager, a3);
    objc_storeStrong((id *)&v20->_heroAppManager, a4);
    objc_storeStrong((id *)&v20->_heroPoiManager, a5);
    objc_storeStrong((id *)&v20->_tracker, obj);
    objc_storeStrong((id *)&v20->_predictionsTracker, v35);
    objc_storeStrong((id *)&v20->_locationManager, v33);
    v29 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v30 = objc_msgSend(v29, "initWithMachServiceName:", *MEMORY[0x1E0D2FC98]);
    listener = v20->_listener;
    v20->_listener = (NSXPCListener *)v30;

    -[NSXPCListener setDelegate:](v20->_listener, "setDelegate:", v20);
    -[NSXPCListener resume](v20->_listener, "resume");
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXHeroDataServer;
  -[ATXHeroDataServer dealloc](&v3, sel_dealloc);
}

- (void)donateHeroAppPredictions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *queue;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  __atxlog_handle_xpc();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  __atxlog_handle_xpc();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "donateHeroAppPredictions", " enableTelemetry=YES ", buf, 2u);
  }

  __atxlog_handle_hero();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 136315394;
    v21 = "-[ATXHeroDataServer donateHeroAppPredictions:completion:]";
    v22 = 2048;
    v23 = v13;
    _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%s Received %lu hero app predictions", buf, 0x16u);
  }

  queue = self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__ATXHeroDataServer_donateHeroAppPredictions_completion___block_invoke;
  v18[3] = &unk_1E82DACB0;
  v18[4] = self;
  v19 = v6;
  v15 = v6;
  dispatch_sync(queue, v18);
  if (v7)
    v7[2](v7, 0);
  __atxlog_handle_xpc();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v17, OS_SIGNPOST_INTERVAL_END, v9, "donateHeroAppPredictions", " enableTelemetry=YES ", buf, 2u);
  }

}

uint64_t __57__ATXHeroDataServer_donateHeroAppPredictions_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHeroAppManagerAndHeroClipManagerWithPredictions:", *(_QWORD *)(a1 + 40));
}

- (void)addConfirmForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v6 = (void (**)(id, _QWORD))a4;
  v7 = a3;
  __atxlog_handle_xpc();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  __atxlog_handle_xpc();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "addConfirmForAppClip", " enableTelemetry=YES ", buf, 2u);
  }

  -[ATXHeroClipManager feedback](self->_heroClipManager, "feedback");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1.0;
  objc_msgSend(v12, "addConfirmForAppClipWithHeroAppPrediction:weight:", v7, v13);

  if (v6)
    v6[2](v6, 0);
  __atxlog_handle_xpc();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v15, OS_SIGNPOST_INTERVAL_END, v9, "addConfirmForAppClip", " enableTelemetry=YES ", v16, 2u);
  }

}

- (void)addSoftRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v6 = (void (**)(id, _QWORD))a4;
  v7 = a3;
  __atxlog_handle_xpc();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  __atxlog_handle_xpc();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "addSoftRejectForAppClip", " enableTelemetry=YES ", buf, 2u);
  }

  -[ATXHeroClipManager feedback](self->_heroClipManager, "feedback");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1.0;
  objc_msgSend(v12, "addRejectForAppClipWithHeroAppPrediction:weight:", v7, v13);

  if (v6)
    v6[2](v6, 0);
  __atxlog_handle_xpc();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v15, OS_SIGNPOST_INTERVAL_END, v9, "addSoftRejectForAppClip", " enableTelemetry=YES ", v16, 2u);
  }

}

- (void)addHardRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v6 = (void (**)(id, _QWORD))a4;
  v7 = a3;
  __atxlog_handle_xpc();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  __atxlog_handle_xpc();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "addHardRejectForAppClip", " enableTelemetry=YES ", buf, 2u);
  }

  -[ATXHeroClipManager feedback](self->_heroClipManager, "feedback");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1.0;
  objc_msgSend(v12, "addRejectForAppClipWithHeroAppPrediction:weight:", v7, v13);

  if (v6)
    v6[2](v6, 0);
  __atxlog_handle_xpc();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v15, OS_SIGNPOST_INTERVAL_END, v9, "addHardRejectForAppClip", " enableTelemetry=YES ", v16, 2u);
  }

}

- (void)feedbackScoreForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, double);
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = (void (**)(id, _QWORD, double))a4;
  v7 = a3;
  __atxlog_handle_xpc();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  __atxlog_handle_xpc();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "feedbackScoreForAppClip", " enableTelemetry=YES ", buf, 2u);
  }

  -[ATXHeroClipManager feedback](self->_heroClipManager, "feedback");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "feedbackScoreForAppClipWithHeroAppPrediction:", v7);
  v14 = v13;

  if (v6)
    v6[2](v6, 0, v14);
  __atxlog_handle_xpc();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v16, OS_SIGNPOST_INTERVAL_END, v9, "feedbackScoreForAppClip", " enableTelemetry=YES ", v17, 2u);
  }

}

- (void)openAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  +[ATXHeroClipManager openAppClipWithHeroAppPrediction:completion:](ATXHeroClipManager, "openAppClipWithHeroAppPrediction:completion:", a3, a4);
}

- (void)getCurrentHeroPoiCategoryWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = (void (**)(id, void *, _QWORD))a3;
  __atxlog_handle_xpc();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  __atxlog_handle_xpc();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getCurrentPoiCategory", " enableTelemetry=YES ", buf, 2u);
  }

  -[ATXHeroPoiManager currentPoiCategory](self->_heroPoiManager, "currentPoiCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v9, 0);

  __atxlog_handle_xpc();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v11, OS_SIGNPOST_INTERVAL_END, v6, "getCurrentPoiCategory", " enableTelemetry=YES ", v12, 2u);
  }

}

- (id)processPredictions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  -[ATXLocationManagerProtocol getCurrentLocation](self->_locationManager, "getCurrentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ATXHeroDataServer _filterPredictions:currentLocation:](self, "_filterPredictions:currentLocation:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[ATXHeroDataServerHelper heroAppPredictionsSortedByDistance:currentLocation:](ATXHeroDataServerHelper, "heroAppPredictionsSortedByDistance:currentLocation:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXHeroDataServer _addBundleIdsToPredictions:](self, "_addBundleIdsToPredictions:", v7);
    v4 = v7;
    v8 = v4;
  }
  else
  {
    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXHeroDataServer processPredictions:].cold.1(v9);

    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)donatePredictions:(id)a3 shouldOnlyDonateHeroPoiPredictions:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v16;
  void *v17;
  ATXHeroDataServer *v18;
  __int16 v19;
  uint8_t v20[2];
  uint8_t v21[16];
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  -[ATXHeroDataServer _heroPoiPredictionsFromPredictions:](self, "_heroPoiPredictionsFromPredictions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[ATXHeroDataServer _heroAppPredictionsFromPredictions:](self, "_heroAppPredictionsFromPredictions:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHeroDataServer _heroClipPredictionsFromPredictions:](self, "_heroClipPredictionsFromPredictions:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "count");
    v12 = -[ATXHeroDataServer _didPredictionsChange:](self, "_didPredictionsChange:", v6);
    if (v12 || !v11)
    {
      -[ATXHeroDataServer _donateAppClipsToHeroClipManager:](self, "_donateAppClipsToHeroClipManager:", v10);
      if (objc_msgSend(v10, "count"))
      {
        v17 = (void *)MEMORY[0x1E0C9AA60];
        v18 = self;
      }
      else
      {
        v18 = self;
        v17 = v9;
      }
      -[ATXHeroDataServer _donateHeroAppsToHeroAppManager:](v18, "_donateHeroAppsToHeroAppManager:", v17);
      -[ATXHeroDataServer _setPredictionsInDefaults:](self, "_setPredictionsInDefaults:", v6);
      if (v11)
        -[ATXHeroDataServer _setExpiry](self, "_setExpiry");
      if (v12)
      {
        -[ATXHeroDataServer _donatePoiCategoriesToHeroPoiManager:](self, "_donatePoiCategoriesToHeroPoiManager:", v7);
LABEL_26:

        goto LABEL_27;
      }
      __atxlog_handle_hero();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        v14 = "Not sending POI categories to blending, since nil predictions were recently donated.";
        v15 = v20;
        goto LABEL_24;
      }
    }
    else
    {
      __atxlog_handle_hero();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 0;
        v14 = "Not sending predictions to blending, since same predictions were recently donated.";
        v15 = (uint8_t *)&v19;
LABEL_24:
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
      }
    }

    goto LABEL_26;
  }
  __atxlog_handle_hero();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "The user is in a location where we only donate POI category predictions.", buf, 2u);
  }

  if (-[ATXHeroDataServer _didPredictionsChange:](self, "_didPredictionsChange:", v7))
  {
    -[ATXHeroDataServer _setPredictionsInDefaults:](self, "_setPredictionsInDefaults:", v7);
    if (objc_msgSend(v7, "count"))
      -[ATXHeroDataServer _setExpiry](self, "_setExpiry");
    -[ATXHeroDataServer _donatePoiCategoriesToHeroPoiManager:](self, "_donatePoiCategoriesToHeroPoiManager:", v7);
  }
  else
  {
    __atxlog_handle_hero();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "The same POI category prediction already donated. Not donating another prediction of the same category", v21, 2u);
    }

  }
LABEL_27:

}

- (BOOL)heroAppAndClipPredictionsAreEligibleGivenIsMoving:(BOOL)a3 isNearKnownTypeLOI:(BOOL)a4 isNearFrequentLOI:(BOOL)a5
{
  return !a4 && !a5 && !a3;
}

- (BOOL)heroPoiPredictionsAreEligibleGivenIsMoving:(BOOL)a3 isNearKnownTypeLOIExcludingGym:(BOOL)a4 isNearFrequentLOI:(BOOL)a5
{
  return !a3 && !a4;
}

- (void)updateHeroAppManagerAndHeroClipManagerWithPredictions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  _BOOL8 v11;
  BOOL v12;
  BOOL v13;
  const __CFString *v14;
  NSObject *v15;
  int v16;
  int v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  _BYTE v35[24];
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[ATXLocationManagerProtocol locationOfInterestAtCurrentLocation](self->_locationManager, "locationOfInterestAtCurrentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_hero();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v35 = 136315394;
    *(_QWORD *)&v35[4] = "-[ATXHeroDataServer updateHeroAppManagerAndHeroClipManagerWithPredictions:]";
    *(_WORD *)&v35[12] = 2112;
    *(_QWORD *)&v35[14] = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%s Location of Interest: %@", v35, 0x16u);
  }

  if (!v5 || objc_msgSend(v5, "type") == -1)
  {
    v8 = 0;
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "type") != 3;
    v8 = 1;
  }
  v9 = -[ATXLocationManagerProtocol isNearFrequentLocationOfInterest](self->_locationManager, "isNearFrequentLocationOfInterest");
  v10 = +[ATXHeroDataServerHelper canPredictClipsGivenRecentMotion](ATXHeroDataServerHelper, "canPredictClipsGivenRecentMotion");
  v11 = !v10;
  v12 = -[ATXHeroDataServer heroAppAndClipPredictionsAreEligibleGivenIsMoving:isNearKnownTypeLOI:isNearFrequentLOI:](self, "heroAppAndClipPredictionsAreEligibleGivenIsMoving:isNearKnownTypeLOI:isNearFrequentLOI:", v11, v8, v9);
  v13 = -[ATXHeroDataServer heroPoiPredictionsAreEligibleGivenIsMoving:isNearKnownTypeLOIExcludingGym:isNearFrequentLOI:](self, "heroPoiPredictionsAreEligibleGivenIsMoving:isNearKnownTypeLOIExcludingGym:isNearFrequentLOI:", v11, v7, v9);
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    v14 = (const __CFString *)*MEMORY[0x1E0CF95E0];
    v35[0] = 0;
    if (CFPreferencesGetAppBooleanValue(v14, (CFStringRef)*MEMORY[0x1E0CF9510], v35))
    {
      __atxlog_handle_hero();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Defaults for OverrideHeroAppPredictionEligibility set to True: Overriding hero app and clip predictions location eligibility and setting to True", v35, 2u);
      }

      goto LABEL_14;
    }
  }
  if (v12)
  {
    if (v13)
    {
LABEL_14:
      v16 = 0;
      v17 = 1;
LABEL_38:
      v30 = v17 & v16;
      -[ATXHeroDataServer processPredictions:](self, "processPredictions:", v4, *(_OWORD *)v35, *(_QWORD *)&v35[16]);
      v31 = objc_claimAutoreleasedReturnValue();

      -[ATXHeroDataServer donatePredictions:shouldOnlyDonateHeroPoiPredictions:](self, "donatePredictions:shouldOnlyDonateHeroPoiPredictions:", v31, v30);
      v4 = (id)v31;
      goto LABEL_39;
    }
  }
  else
  {
    __atxlog_handle_hero();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = CFSTR("YES");
      if (v10)
        v20 = CFSTR("NO");
      else
        v20 = CFSTR("YES");
      if ((_DWORD)v8)
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      *(_DWORD *)v35 = 138412802;
      *(_QWORD *)&v35[4] = v20;
      *(_WORD *)&v35[12] = 2112;
      *(_QWORD *)&v35[14] = v21;
      if (!(_DWORD)v9)
        v19 = CFSTR("NO");
      *(_WORD *)&v35[22] = 2112;
      v36 = v19;
      _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "Clearing Hero App and Clip Predictions because the person is moving, or is near a known LOI, or is near a frequently visited LOI. isMoving: %@, isNearKnownTypeLOI: %@, isNearFrequentLOI: %@", v35, 0x20u);
    }

    v22 = (void *)objc_opt_new();
    -[ATXHeroDataServer _donateHeroAppsToHeroAppManager:](self, "_donateHeroAppsToHeroAppManager:", v22);

    v23 = (void *)objc_opt_new();
    -[ATXHeroDataServer _donateAppClipsToHeroClipManager:](self, "_donateAppClipsToHeroClipManager:", v23);

    if (v13)
    {
      v17 = 1;
      v16 = 1;
      goto LABEL_38;
    }
  }
  __atxlog_handle_hero();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = CFSTR("YES");
    if (v10)
      v26 = CFSTR("NO");
    else
      v26 = CFSTR("YES");
    if (!v7)
      v25 = CFSTR("NO");
    *(_DWORD *)v35 = 138412546;
    *(_QWORD *)&v35[4] = v26;
    *(_WORD *)&v35[12] = 2112;
    *(_QWORD *)&v35[14] = v25;
    _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "Clearing Hero POI Predictions because the person is moving, or is near a known LOI excluding gym. isMoving: %@, isNearKnownTypeLOIExcludingGym: %@", v35, 0x16u);
  }

  v27 = (void *)objc_opt_new();
  v28 = -[ATXHeroDataServer _didPredictionsChange:](self, "_didPredictionsChange:", v27);

  if (v28)
  {
    v29 = (void *)objc_opt_new();
    -[ATXHeroDataServer _donatePoiCategoriesToHeroPoiManager:](self, "_donatePoiCategoriesToHeroPoiManager:", v29);

  }
  if (v12)
  {
    v17 = 0;
    v16 = 0;
    goto LABEL_38;
  }
  v32 = (void *)objc_opt_new();
  v33 = -[ATXHeroDataServer _didPredictionsChange:](self, "_didPredictionsChange:", v32);

  if (v33)
  {
    v34 = (void *)objc_opt_new();
    -[ATXHeroDataServer _setPredictionsInDefaults:](self, "_setPredictionsInDefaults:", v34);

  }
LABEL_39:

}

- (void)_donateAppClipsToHeroClipManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __atxlog_handle_hero();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Sending app clip predictions to App Clips manager. Predictions: %@", (uint8_t *)&v7, 0xCu);

  }
  -[ATXHeroClipManager donateAppClipsWithHeroAppPredictions:](self->_heroClipManager, "donateAppClipsWithHeroAppPredictions:", v4);

}

- (void)_donateHeroAppsToHeroAppManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __atxlog_handle_hero();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Sending hero app predictions to Hero App Manager. Predictions: %@", (uint8_t *)&v7, 0xCu);

  }
  -[ATXHeroAppManager donateHeroAppPredictions:](self->_heroAppManager, "donateHeroAppPredictions:", v4);

}

- (void)_donatePoiCategoriesToHeroPoiManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __atxlog_handle_hero();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Sending hero poi predictions to Hero POI Manager. Predictions: %@", (uint8_t *)&v7, 0xCu);

  }
  -[ATXHeroPoiManager donateHeroPoiPredictions:](self->_heroPoiManager, "donateHeroPoiPredictions:", v4);

}

- (id)_filterPredictions:(id)a3 currentLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v7)
  {
    +[ATXHeroDataServerHelper inRadiusPredictionsFrom:currentLocation:](ATXHeroDataServerHelper, "inRadiusPredictionsFrom:currentLocation:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Left with %lu hero app predictions after removing out of radius predictions.", (uint8_t *)&v13, 0xCu);
    }

    v6 = v8;
    v10 = v6;
  }
  else
  {
    __atxlog_handle_hero();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Empty location received while applying radius filter. Clearing predictions.", (uint8_t *)&v13, 2u);
    }

    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (void)_addBundleIdsToPredictions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        +[ATXHeroDataServerHelper bundleIdForPrediction:](ATXHeroDataServerHelper, "bundleIdForPrediction:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBundleId:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)_heroAppPredictionsFromPredictions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = *MEMORY[0x1E0D2FC90];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "bundleId", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v10);

        if ((v14 & 1) == 0)
          objc_msgSend(v5, "addObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_heroClipPredictionsFromPredictions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = *MEMORY[0x1E0D2FC90];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "bundleId", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v10) & 1) != 0)
        {
          objc_msgSend(v12, "urlHash");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v5, "addObject:", v12);
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_heroPoiPredictionsFromPredictions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "poiCategory", (_QWORD)v17);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "poiCategory");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", &stru_1E82FDC98);

          if ((v15 & 1) == 0)
            objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_didPredictionsChange:(id)a3
{
  ATXHeroDataServer *v3;
  NSObject *queue;
  id v5;

  v3 = self;
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(v3) = -[ATXHeroPredictionsTracker didPredictionsChange:](v3->_predictionsTracker, "didPredictionsChange:", v5);

  return (char)v3;
}

- (void)_setPredictionsInDefaults:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[ATXHeroPredictionsTracker setPredictionsInDefaults:](self->_predictionsTracker, "setPredictionsInDefaults:", v5);

}

- (void)_setExpiry
{
  NSObject *v3;
  void *v4;
  xpc_object_t v5;
  const char *v6;
  double v7;
  _QWORD handler[5];
  uint8_t buf[16];

  __atxlog_handle_hero();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Setting hero expiry", buf, 2u);
  }

  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = (const char *)*MEMORY[0x1E0C80760];
  objc_msgSend(v4, "heroAppPredictionExpirationInterval");
  xpc_dictionary_set_int64(v5, v6, (uint64_t)v7);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80790], 60);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __31__ATXHeroDataServer__setExpiry__block_invoke;
  handler[3] = &unk_1E82DC950;
  handler[4] = self;
  xpc_activity_register("com.apple.duetexpertd.expire-hero", v5, handler);

}

void __31__ATXHeroDataServer__setExpiry__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  if (xpc_activity_get_state(activity) == 2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__ATXHeroDataServer__setExpiry__block_invoke_2;
    block[3] = &unk_1E82DAC38;
    block[4] = v3;
    dispatch_sync(v4, block);
  }
}

void __31__ATXHeroDataServer__setExpiry__block_invoke_2(uint64_t a1)
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
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  __atxlog_handle_hero();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Expiring hero apps since time interval has passed", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "_donateHeroAppsToHeroAppManager:", v4);

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "_donateAppClipsToHeroClipManager:", v6);

  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_opt_new();
  LODWORD(v7) = objc_msgSend(v7, "_didPredictionsChange:", v8);

  if ((_DWORD)v7)
  {
    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_opt_new();
    objc_msgSend(v9, "_setPredictionsInDefaults:", v10);

    v11 = *(void **)(a1 + 32);
    v12 = objc_opt_new();
    objc_msgSend(v11, "_donatePoiCategoriesToHeroPoiManager:", v12);
  }
  else
  {
    __atxlog_handle_hero();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "Not sending POI categories to blending, since nil predictions were recently donated.", v13, 2u);
    }
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;

  v5 = a4;
  v6 = *MEMORY[0x1E0D2FC98];
  objc_msgSend(v5, "valueForEntitlement:", *MEMORY[0x1E0D2FC98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
  {
    ATXHeroDataXPCInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_168);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_35_2);
    objc_msgSend(v5, "resume");
    v9 = 1;
  }
  else
  {
    __atxlog_handle_hero();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, v6, v10);

    v9 = 0;
  }

  return v9;
}

void __56__ATXHeroDataServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_hero();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "Unexpected interruption on App Prediction ATXServer XPC interface", v1, 2u);
  }

}

void __56__ATXHeroDataServer_listener_shouldAcceptNewConnection___block_invoke_34()
{
  NSObject *v0;
  uint8_t v1[16];

  __atxlog_handle_hero();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "Connection invalidated on App Prediction ATXServer XPC interface. Client went away.", v1, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_predictionsTracker, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_heroPoiManager, 0);
  objc_storeStrong((id *)&self->_heroAppManager, 0);
  objc_storeStrong((id *)&self->_heroClipManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)processPredictions:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Could not get location. Clearing predictions.", v1, 2u);
}

@end
