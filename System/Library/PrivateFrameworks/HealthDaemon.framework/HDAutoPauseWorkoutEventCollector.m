@implementation HDAutoPauseWorkoutEventCollector

- (HDAutoPauseWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4
{
  id v6;
  HDAutoPauseWorkoutEventCollector *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CMWorkoutManager *cmWorkoutManager;
  NSObject *v13;
  objc_super v15;
  _QWORD handler[4];
  id v17;
  id location;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDAutoPauseWorkoutEventCollector;
  v7 = -[HDWorkoutEventCollector initWithProfile:delegate:](&v15, sel_initWithProfile_delegate_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "workoutPluginExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coreMotionWorkoutInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cmWorkoutManager");
    v11 = objc_claimAutoreleasedReturnValue();
    cmWorkoutManager = v7->_cmWorkoutManager;
    v7->_cmWorkoutManager = (CMWorkoutManager *)v11;

    -[CMWorkoutManager setDelegate:](v7->_cmWorkoutManager, "setDelegate:", v7);
    if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
    {
      objc_initWeak(&location, v7);
      dispatch_get_global_queue(0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __75__HDAutoPauseWorkoutEventCollector__listenForCatFlexingFakingNotifications__block_invoke;
      handler[3] = &unk_1E6CE8390;
      objc_copyWeak(&v17, &location);
      notify_register_dispatch("HDWorkoutManagerTriggerCatFlexingEvent", &v7->_catFlexingNotifyToken, v13, handler);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

- (void)_deliverWorkoutEvent:(void *)a3 sessionId:(void *)a4 eventDate:
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  if (a1)
  {
    v7 = (objc_class *)MEMORY[0x1E0CB3588];
    v8 = a4;
    v9 = a3;
    v12 = (id)objc_msgSend([v7 alloc], "initWithStartDate:duration:", v8, 0.0);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB7048]), "initWithEventType:sessionId:dateInterval:metadata:", a2, v9, v12, 0);
    objc_msgSend(a1, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "receivedWorkoutEvent:", v10);

  }
}

- (void)stop
{
  int v3;
  int catFlexingNotifyToken;
  HDAutoPauseWorkoutEventCollector *v5;
  CMWorkoutManager *cmWorkoutManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDAutoPauseWorkoutEventCollector;
  -[HDWorkoutEventCollector stop](&v7, sel_stop);
  v3 = objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall");
  if (self)
  {
    if (v3)
    {
      catFlexingNotifyToken = self->_catFlexingNotifyToken;
      if (catFlexingNotifyToken != -1)
      {
        notify_cancel(catFlexingNotifyToken);
        self->_catFlexingNotifyToken = -1;
      }
    }
  }
  -[CMWorkoutManager delegate](self->_cmWorkoutManager, "delegate");
  v5 = (HDAutoPauseWorkoutEventCollector *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    -[CMWorkoutManager setDelegate:](self->_cmWorkoutManager, "setDelegate:", 0);
  cmWorkoutManager = self->_cmWorkoutManager;
  self->_cmWorkoutManager = 0;

}

- (void)workoutManager:(id)a3 didStartWorkout:(id)a4 atDate:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  HDAutoPauseWorkoutEventCollector *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = self;
    _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerDidStartWorkout event", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(v7, "sessionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 0, v10, v8);

}

- (void)workoutManager:(id)a3 didStopWorkout:(id)a4 atDate:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  HDAutoPauseWorkoutEventCollector *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = self;
    _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerDidStopWorkout event", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(v7, "sessionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 1, v10, v8);

}

- (void)workoutManager:(id)a3 willPauseWorkout:(id)a4 atDate:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  HDAutoPauseWorkoutEventCollector *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = self;
    _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerWillPauseWorkout event", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(v7, "sessionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 7, v10, v8);

}

- (void)workoutManager:(id)a3 willResumeWorkout:(id)a4 atDate:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  HDAutoPauseWorkoutEventCollector *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = self;
    _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerWillResumeWorkout event", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(v7, "sessionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 8, v10, v8);

}

- (void)workoutManager:(id)a3 didFailWorkout:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  HDAutoPauseWorkoutEventCollector *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412290;
    v15 = self;
    _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerDidFail event", (uint8_t *)&v14, 0xCu);
  }
  v10 = objc_alloc(MEMORY[0x1E0CB7048]);
  objc_msgSend(v8, "sessionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "initWithSessionId:error:", v11, v7);
  -[HDWorkoutEventCollector delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "receivedWorkoutEvent:", v12);

}

- (void)workoutManager:(id)a3 suggestedStopWorkout:(id)a4 atDate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  HDAutoPauseWorkoutEventCollector *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("HDEnableCatflexing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 || objc_msgSend(v10, "BOOLValue"))
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = self;
      _os_log_debug_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEBUG, "%@: Received catflexing event", (uint8_t *)&v14, 0xCu);
    }
    objc_msgSend(v7, "sessionId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 11, v13, v8);

  }
}

- (void)workoutManager:(id)a3 workoutLocationEventUpdate:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  HDAutoPauseWorkoutEventCollector *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%@:Received workout configuration update", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "locationType") == 1;
  v9 = objc_alloc(MEMORY[0x1E0CB7048]);
  objc_msgSend(v5, "sessionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v7, 0.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8, *MEMORY[0x1E0CB5558]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithWorkoutEventType:sessionUUID:dateInterval:metadata:error:", 12, v10, v11, v13, 0);

  -[HDWorkoutEventCollector delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "receivedWorkoutEvent:", v14);

}

- (void)workoutManager:(id)a3 didBeginWorkoutSessionWithWorkout:(id)a4 withOverview:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  HDAutoPauseWorkoutEventCollector *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidBeginWorkoutSession event", (uint8_t *)&v12, 0xCu);
  }
  objc_msgSend(v7, "overviewId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 0, v10, v11);
}

- (void)workoutManager:(id)a3 didEndWorkoutSessionWithWorkout:(id)a4 withOverview:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  HDAutoPauseWorkoutEventCollector *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidEndWorkoutSession event", (uint8_t *)&v12, 0xCu);
  }
  objc_msgSend(v7, "overviewId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 1, v10, v11);
}

- (void)workoutManager:(id)a3 didPauseWorkout:(id)a4 withOverview:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HDAutoPauseWorkoutEventCollector *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidPauseWorkout event", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overviewId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 2, v9, v8);
}

- (void)workoutManager:(id)a3 didResumeWorkout:(id)a4 withOverview:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HDAutoPauseWorkoutEventCollector *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidResumeWorkout event", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overviewId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 3, v9, v8);
}

- (void)workoutManager:(id)a3 didSetCurrentWorkoutType:(id)a4 withOverview:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  HDAutoPauseWorkoutEventCollector *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412290;
    v16 = self;
    _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidSetCurrentWorkoutType event", (uint8_t *)&v15, 0xCu);
  }
  v8 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v6, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithStartDate:duration:", v9, 0.0);

  v11 = objc_alloc(MEMORY[0x1E0CB7048]);
  objc_msgSend(v6, "sessionId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithWorkoutEventType:sessionUUID:dateInterval:metadata:error:", 13, v12, v10, 0, 0);
  -[HDWorkoutEventCollector delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "receivedWorkoutEvent:", v13);

}

- (void)workoutManager:(id)a3 detectedChangeInWorkoutType:(id)a4 withOverview:(id)a5
{
  id v6;
  NSObject **v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint8_t buf[4];
  HDAutoPauseWorkoutEventCollector *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = (NSObject **)MEMORY[0x1E0CB5380];
  v8 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v40 = self;
    _os_log_debug_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidDetectChangeInWorkoutType event", buf, 0xCu);
  }
  v9 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithStartDate:duration:", v10, 0.0);

  v12 = objc_alloc(MEMORY[0x1E0CB7048]);
  objc_msgSend(v6, "sessionId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithWorkoutEventType:sessionUUID:dateInterval:metadata:error:", 14, v13, v11, 0, 0);

  v15 = v6;
  if (self)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CB6E20]);
    v17 = objc_msgSend(v15, "type");
    v18 = v17;
    v19 = 52;
    switch(v17)
    {
      case 0:
      case 8:
      case 10:
      case 13:
      case 14:
      case 25:
      case 26:
      case 66:
        goto LABEL_5;
      case 1:
      case 15:
      case 16:
        break;
      case 2:
      case 17:
      case 18:
        v19 = 37;
        break;
      case 3:
      case 4:
      case 5:
        v19 = 13;
        break;
      case 6:
        v19 = 57;
        break;
      case 7:
        v19 = 77;
        break;
      case 9:
        v19 = 16;
        break;
      case 11:
        v19 = 44;
        break;
      case 12:
      case 35:
        v19 = 35;
        break;
      case 19:
        v19 = 46;
        break;
      case 20:
        v19 = 70;
        break;
      case 21:
        v19 = 71;
        break;
      case 22:
        v19 = 63;
        break;
      case 23:
        v19 = 61;
        break;
      case 24:
        v19 = 24;
        break;
      case 27:
        v19 = 21;
        break;
      case 28:
        v19 = 20;
        break;
      case 29:
        v19 = 80;
        break;
      case 30:
        v19 = 59;
        break;
      case 31:
        v19 = 72;
        break;
      case 32:
        v19 = 66;
        break;
      case 33:
        v19 = 83;
        break;
      case 34:
        v19 = 65;
        break;
      case 36:
        v19 = 60;
        break;
      case 37:
        v19 = 67;
        break;
      case 38:
        v19 = 31;
        break;
      case 39:
      case 40:
        v19 = 41;
        break;
      case 41:
        v19 = 3;
        break;
      case 42:
        v19 = 1;
        break;
      case 43:
        v19 = 75;
        break;
      case 44:
        v19 = 36;
        break;
      case 45:
        v19 = 27;
        break;
      case 46:
      case 47:
        v19 = 39;
        break;
      case 48:
      case 49:
        v19 = 25;
        break;
      case 50:
        v19 = 6;
        break;
      case 51:
        v19 = 48;
        break;
      case 52:
        v19 = 4;
        break;
      case 53:
        v19 = 34;
        break;
      case 54:
        v19 = 79;
        break;
      case 55:
        v19 = 51;
        break;
      case 56:
        v19 = 43;
        break;
      case 57:
        v19 = 23;
        break;
      case 58:
        v19 = 49;
        break;
      case 59:
        v19 = 42;
        break;
      case 60:
        v19 = 5;
        break;
      case 61:
        v19 = 10;
        break;
      case 62:
        v19 = 47;
        break;
      case 63:
        v19 = 64;
        break;
      case 64:
        v19 = 8;
        break;
      default:
        _HKInitializeLogging();
        v38 = *v7;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = v18;
          _os_log_fault_impl(&dword_1B7802000, v38, OS_LOG_TYPE_FAULT, "Unknown CMWorkoutType %d", buf, 8u);
        }
LABEL_5:
        v19 = 3000;
        break;
    }
    objc_msgSend(v16, "setActivityType:", v19);
    v20 = objc_msgSend(v15, "locationType");
    if (v20 > 4)
      v21 = 3;
    else
      v21 = qword_1B7F56248[v20];
    objc_msgSend(v16, "setLocationType:", v21);
    if (objc_msgSend(v15, "type") == 19)
    {
      v22 = v15;
      v23 = objc_msgSend(v22, "location");
      if (v23)
        v24 = 2 * (v23 == 1);
      else
        v24 = 1;
      objc_msgSend(v16, "setSwimmingLocationType:", v24);
      objc_msgSend(v16, "setLocationType:", 3);
      if (objc_msgSend(v16, "swimmingLocationType") == 2)
      {
        objc_msgSend(v16, "setLapLength:", 0);
      }
      else
      {
        v25 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "poolLength");
        objc_msgSend(v25, "quantityWithUnit:doubleValue:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setLapLength:", v27);

      }
    }
    objc_msgSend(v15, "startDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqualToDate:", v30);

    if ((v31 & 1) != 0)
    {
      v32 = 0;
    }
    else
    {
      objc_msgSend(v15, "endDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "sessionId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSuggestedActivityUUID:", v33);

    v34 = objc_alloc(MEMORY[0x1E0CB6DD8]);
    objc_msgSend(v15, "sessionId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v35, v16, v28, v32, MEMORY[0x1E0C9AA60], 0, 0.0, 0, 0);

  }
  else
  {
    v36 = 0;
  }

  -[HDWorkoutEventCollector delegate](self, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "receivedWorkoutEvent:forWorkoutActivity:", v14, v36);

}

void __75__HDAutoPauseWorkoutEventCollector__listenForCatFlexingFakingNotifications__block_invoke(uint64_t a1)
{
  os_log_t *v1;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v1 = (os_log_t *)MEMORY[0x1E0CB5380];
    v2 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "CatFlexing: Triggering cat flexing event", buf, 2u);
    }
    _HKInitializeLogging();
    v3 = *v1;
    if (os_log_type_enabled(*v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = 0x4014000000000000;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "CatFlexing: setting setSuggestedStopTimeout to %f seconds", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "sessionId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](WeakRetained, 11, v4, v5);

  }
}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
  CMWorkoutManager **p_cmWorkoutManager;
  id v6;

  p_cmWorkoutManager = &self->_cmWorkoutManager;
  objc_storeStrong((id *)&self->_cmWorkoutManager, a3);
  v6 = a3;
  -[CMWorkoutManager setDelegate:](*p_cmWorkoutManager, "setDelegate:", self);

}

- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = (objc_class *)MEMORY[0x1E0CB7048];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v7, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithStartDate:duration:", v11, 0.0);
  v14 = (id)objc_msgSend(v9, "initWithWorkoutEventType:sessionUUID:dateInterval:metadata:error:", 14, v8, v12, 0, 0);

  -[HDWorkoutEventCollector delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "receivedWorkoutEvent:forWorkoutActivity:", v14, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmWorkoutManager, 0);
}

@end
