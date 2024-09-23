@implementation ICNAEventReporter

- (ICNAEventReporter)initWithSubTrackerName:(id)a3
{
  id v4;
  ICNAEventReporter *v5;
  ICNASubTracker *v6;
  ICNASubTracker *subTracker;
  NSMutableSet *v8;
  NSMutableSet *timedDataTrackingSet;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICNAEventReporter;
  v5 = -[ICNAOptedInObject init](&v13, sel_init);
  if (v5)
  {
    v6 = -[ICNASubTracker initWithName:]([ICNASubTracker alloc], "initWithName:", v4);
    subTracker = v5->_subTracker;
    v5->_subTracker = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    timedDataTrackingSet = v5->_timedDataTrackingSet;
    v5->_timedDataTrackingSet = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNAController sharedController](ICNAController, "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel_flushAllTimedData_, CFSTR("ICNASessionFlushTimedDataNotification"), v11);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICNAEventReporter;
  -[ICNAEventReporter dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInlineDrawingInformation, 0);
  objc_storeStrong((id *)&self->_timedDataTrackingSet, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_subTrackerName, 0);
  objc_storeStrong((id *)&self->_subTracker, 0);
}

- (ICNAEventReporter)initWithSubTrackerName:(id)a3 windowScene:(id)a4
{
  id v7;
  id v8;
  ICNAEventReporter *v9;
  ICNAEventReporter *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ICNASubTracker *v15;
  ICNASubTracker *subTracker;
  NSMutableSet *v17;
  NSMutableSet *timedDataTrackingSet;
  void *v19;
  void *v20;
  ICNAEventReporter *v21;
  NSObject *v22;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)ICNAEventReporter;
    v9 = -[ICNAOptedInObject init](&v24, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_windowScene, v8);
      objc_storeStrong((id *)&v10->_subTrackerName, a3);
      objc_msgSend(v8, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "persistentIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[ICNAController sharedController](ICNAController, "sharedController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "aaTrackerForWindowSceneIdentifier:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = -[ICNASubTracker initWithName:parentAATracker:]([ICNASubTracker alloc], "initWithName:parentAATracker:", v7, v14);
        subTracker = v10->_subTracker;
        v10->_subTracker = v15;

      }
      v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      timedDataTrackingSet = v10->_timedDataTrackingSet;
      v10->_timedDataTrackingSet = v17;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel_flushAllTimedData_, CFSTR("ICNASessionFlushTimedDataNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:selector:name:object:", v10, sel_aaSessionDidEnd_, CFSTR("ICNASessionDidEndNotification"), 0);

    }
    self = v10;
    v21 = self;
  }
  else
  {
    v22 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ICNAEventReporter initWithSubTrackerName:windowScene:].cold.1();

    v21 = 0;
  }

  return v21;
}

- (ICNAEventReporter)initWithSubTrackerName:(id)a3 window:(id)a4
{
  id v6;
  void *v7;
  ICNAEventReporter *v8;
  NSObject *v9;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(a4, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ICNAEventReporter initWithSubTrackerName:windowScene:](self, "initWithSubTrackerName:windowScene:", v6, v7);

    v8 = self;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICNAEventReporter initWithSubTrackerName:window:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (ICNAEventReporter)initWithSubTrackerName:(id)a3 view:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  ICNAEventReporter *v9;
  NSObject *v10;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(a4, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ICNAEventReporter initWithSubTrackerName:windowScene:](self, "initWithSubTrackerName:windowScene:", v6, v8);

    v9 = self;
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICNAEventReporter initWithSubTrackerName:view:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (ICNASubTracker)subTracker
{
  ICNASubTracker *subTracker;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICNASubTracker *v9;
  ICNASubTracker *v10;

  subTracker = self->_subTracker;
  if (!subTracker)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[ICNAController sharedController](ICNAController, "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aaTrackerForWindowSceneIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[ICNASubTracker initWithName:parentAATracker:]([ICNASubTracker alloc], "initWithName:parentAATracker:", self->_subTrackerName, v8);
      v10 = self->_subTracker;
      self->_subTracker = v9;

    }
    subTracker = self->_subTracker;
  }
  return subTracker;
}

- (void)setSubTracker:(id)a3
{
  ICNASubTracker *v5;
  void *v6;
  void *v7;
  ICNASubTracker *v8;

  v5 = (ICNASubTracker *)a3;
  if (self->_subTracker != v5)
  {
    v8 = v5;
    NSStringFromSelector(sel_subTracker);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAEventReporter willChangeValueForKey:](self, "willChangeValueForKey:", v6);

    objc_storeStrong((id *)&self->_subTracker, a3);
    NSStringFromSelector(sel_subTracker);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAEventReporter didChangeValueForKey:](self, "didChangeValueForKey:", v7);

    v5 = v8;
  }

}

- (void)startTimedEventOfType:(Class)a3
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ICNAEventReporter_startTimedEventOfType___block_invoke;
  v7[3] = &unk_1E771C900;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  objc_msgSend(v5, "trackTimedEventType:subTracker:synchronousTaskBeforeStarting:", a3, v6, v7);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __43__ICNAEventReporter_startTimedEventOfType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    NSStringFromClass(*(Class *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "timedDataTrackingSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v2);

  }
}

- (void)submitTimedEventOfTypeIfPossible:(Class)a3
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, self);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ICNAEventReporter_submitTimedEventOfTypeIfPossible___block_invoke;
  v7[3] = &unk_1E771C928;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  objc_msgSend(v5, "submitEventOfType:subTracker:synchronousTaskBeforeSubmitting:", a3, v6, v7);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

uint64_t __54__ICNAEventReporter_submitTimedEventOfTypeIfPossible___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    NSStringFromClass(*(Class *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "timedDataTrackingSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v3);

    objc_msgSend(WeakRetained, "timedDataTrackingSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v3);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)flushAllTimedData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter windowScene](self, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistentIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isEqual:", v12);

    if ((v13 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }

  if (!v10)
  {
LABEL_5:
    objc_initWeak(&location, self);
    +[ICNAController sharedController](ICNAController, "sharedController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__ICNAEventReporter_flushAllTimedData___block_invoke;
    v15[3] = &unk_1E771C188;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v14, "performOnInstrumentationQueueWaitUntilDone:block:", 0, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
LABEL_6:

}

void __39__ICNAEventReporter_flushAllTimedData___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  Class v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(WeakRetained, "timedDataTrackingSet", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(NSString **)(*((_QWORD *)&v13 + 1) + 8 * v7);
          +[ICNAController sharedController](ICNAController, "sharedController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = NSClassFromString(v8);
          objc_msgSend(v2, "subTracker");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_immediatelySubmitEventOfType:subTracker:", v10, v11);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

    objc_msgSend(v2, "timedDataTrackingSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

  }
}

- (void)aaSessionDidEnd:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICNAEventReporterLostSessionNotification"), self);

}

- (void)submitAppSessionResignEvent
{
  uint64_t v3;
  void *v4;
  id v5;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitEventOfType:subTracker:", v3, v4);

}

- (void)submitAppSessionResumeEvent
{
  uint64_t v3;
  void *v4;
  id v5;

  -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitEventOfType:subTracker:", v3, v4);

}

- (void)startOnboardingScreenViewEventDurationTracking
{
  ICASOnboardingUserAction *v3;
  ICASOnboardingScreenData *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  ICASOnboardingScreenType *v10;

  v10 = -[ICASOnboardingScreenType initWithOnboardingScreenType:]([ICASOnboardingScreenType alloc], "initWithOnboardingScreenType:", 0);
  v3 = -[ICASOnboardingUserAction initWithOnboardingUserAction:]([ICASOnboardingUserAction alloc], "initWithOnboardingUserAction:", 0);
  v4 = -[ICASOnboardingScreenData initWithOnboardingScreenType:onboardingUserAction:]([ICASOnboardingScreenData alloc], "initWithOnboardingScreenType:onboardingUserAction:", v10, v3);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushDataObject:unique:onlyOnce:subTracker:", v4, 1, 0, v6);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackTimedEventType:subTracker:", v8, v9);

}

- (void)submitOnboardingScreenViewEventWithType:(int64_t)a3
{
  ICASOnboardingScreenType *v4;
  ICASOnboardingScreenData *v5;
  ICASOnboardingUserAction *v6;
  ICASOnboardingScreenData *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = -[ICASOnboardingScreenType initWithOnboardingScreenType:]([ICASOnboardingScreenType alloc], "initWithOnboardingScreenType:", a3);
  v5 = [ICASOnboardingScreenData alloc];
  v6 = -[ICASOnboardingUserAction initWithOnboardingUserAction:]([ICASOnboardingUserAction alloc], "initWithOnboardingUserAction:", 1);
  v7 = -[ICASOnboardingScreenData initWithOnboardingScreenType:onboardingUserAction:](v5, "initWithOnboardingScreenType:onboardingUserAction:", v4, v6);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitEventOfType:pushThenPopDataObjects:subTracker:", v9, v10, v11);

}

- (void)submitNoteCreateEventForModernNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderDataForModernFolder:](self, "folderDataForModernFolder:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteCreateDataFromAppSuiteDefaults](self, "noteCreateDataFromAppSuiteDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[ICNAController sharedController](ICNAController, "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAEventReporter subTracker](self, "subTracker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushDataObject:unique:onlyOnce:subTracker:", v10, 0, 1, v12);

  }
  +[ICNAController sharedController](ICNAController, "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v17[0] = v5;
  v17[1] = v7;
  v17[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitEventOfType:pushThenPopDataObjects:subTracker:", v14, v15, v16);

}

- (void)submitNoteCreateEventForModernNote:(id)a3 createApproach:(int64_t)a4
{
  id v6;
  void *v7;
  ICASNoteCreateData *v8;
  ICASNoteCreateApproach *v9;
  ICASNoteCreateData *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [ICASNoteCreateData alloc];
  v9 = -[ICASNoteCreateApproach initWithNoteCreateApproach:]([ICASNoteCreateApproach alloc], "initWithNoteCreateApproach:", a4);
  v10 = -[ICASNoteCreateData initWithNoteCreateApproach:](v8, "initWithNoteCreateApproach:", v9);

  objc_msgSend(v6, "folder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderDataForModernFolder:](self, "folderDataForModernFolder:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  v19[0] = v7;
  v19[1] = v10;
  v19[2] = v12;
  v19[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "submitEventOfType:pushThenPopDataObjects:subTracker:", v16, v17, v18);

}

- (void)submitNoteCreateEventForHTMLNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter noteDataForHTMLNote:](self, "noteDataForHTMLNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderDataForHTMLFolder:](self, "folderDataForHTMLFolder:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForHTMLAccount:](self, "accountDataForHTMLAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteCreateDataFromAppSuiteDefaults](self, "noteCreateDataFromAppSuiteDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[ICNAController sharedController](ICNAController, "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAEventReporter subTracker](self, "subTracker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushDataObject:unique:onlyOnce:subTracker:", v10, 0, 1, v12);

  }
  +[ICNAController sharedController](ICNAController, "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v17[0] = v5;
  v17[1] = v7;
  v17[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitEventOfType:pushThenPopDataObjects:subTracker:", v14, v15, v16);

}

- (void)submitNoteCreateEventForHTMLNote:(id)a3 createApproach:(int64_t)a4
{
  id v6;
  void *v7;
  ICASNoteCreateData *v8;
  ICASNoteCreateApproach *v9;
  ICASNoteCreateData *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICNAEventReporter noteDataForHTMLNote:](self, "noteDataForHTMLNote:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [ICASNoteCreateData alloc];
  v9 = -[ICASNoteCreateApproach initWithNoteCreateApproach:]([ICASNoteCreateApproach alloc], "initWithNoteCreateApproach:", a4);
  v10 = -[ICASNoteCreateData initWithNoteCreateApproach:](v8, "initWithNoteCreateApproach:", v9);

  objc_msgSend(v6, "folder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderDataForHTMLFolder:](self, "folderDataForHTMLFolder:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForHTMLAccount:](self, "accountDataForHTMLAccount:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  v19[0] = v7;
  v19[1] = v10;
  v19[2] = v12;
  v19[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "submitEventOfType:pushThenPopDataObjects:subTracker:", v16, v17, v18);

}

- (void)submitNoteCreateEventForSearchIndexableNote:(id)a3 createApproach:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_opt_class();
  ICDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  ICProtocolCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICNAEventReporter submitNoteCreateEventForModernNote:createApproach:](self, "submitNoteCreateEventForModernNote:createApproach:", v8, a4);
  }
  else if (v7)
  {
    -[ICNAEventReporter submitNoteCreateEventForHTMLNote:createApproach:](self, "submitNoteCreateEventForHTMLNote:createApproach:", v7, a4);
  }

}

- (void)submitNoteDeleteEventForModernNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v13, v5, v6, v8, 0);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitEventOfType:pushThenPopDataObjects:subTracker:", v11, v9, v12);

}

- (void)submitNoteDeleteEventForHTMLNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  -[ICNAEventReporter noteDataForHTMLNote:](self, "noteDataForHTMLNote:", v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForHTMLNote:](self, "noteContentDataForHTMLNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForHTMLNote](self, "noteAccessDataForHTMLNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForHTMLAccount:](self, "accountDataForHTMLAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v13, v5, v6, v8, 0);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitEventOfType:pushThenPopDataObjects:subTracker:", v11, v9, v12);

}

- (void)submitNoteSharrowEventForModernNote:(id)a3 activityType:(id)a4 collaborationSelected:(BOOL)a5 countOfCollaboratorsAdded:(int64_t)a6 countOfCollaboratorsRemoved:(int64_t)a7 startInvitedCount:(int64_t)a8 startAcceptedCount:(int64_t)a9 endInvitedCount:(int64_t)a10 endAcceptedCount:(int64_t)a11
{
  _BOOL4 v14;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  ICASSharrowContextData *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  ICASCollaboratorData *v25;
  void *v26;
  void *v27;
  ICASStartCollaborationCollaboratorData *v28;
  void *v29;
  void *v30;
  ICASEndCollaborationCollaboratorData *v31;
  void *v32;
  void *v33;
  ICASEndCollaborationCollaboratorData *v34;
  ICASSharrowContextData *v35;
  void *v36;
  ICASContextPathData *v37;
  ICASContextPath *v38;
  ICASContextPathData *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  ICASCollaboratorData *v43;
  ICASShareFlowData *v44;
  ICASStartCollaborationCollaboratorData *v45;
  ICASShareFlowType *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v14 = a5;
  v52 = a4;
  v17 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v17);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "folder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderDataForModernFolder:](self, "folderDataForModernFolder:", v19);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v20);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v17);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "filteredActivityType:", v52);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ICASSharrowContextData initWithSharrowSelectedItem:]([ICASSharrowContextData alloc], "initWithSharrowSelectedItem:", v47);
  if ((objc_msgSend(v52, "isEqualToString:", CFSTR("com.apple.notes.sharing.initiate")) & 1) != 0)
  {
    v22 = 0;
  }
  else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("com.apple.notes.sharing.cancel")) & 1) != 0)
  {
    v22 = 3;
  }
  else
  {
    v23 = objc_msgSend((id)objc_opt_class(), "activityTypeHasUnknownShareFlow:", v52);
    v24 = 1;
    if (v14)
      v24 = 2;
    if (v23)
      v22 = 3;
    else
      v22 = v24;
  }
  v46 = -[ICASShareFlowType initWithShareFlowType:]([ICASShareFlowType alloc], "initWithShareFlowType:", v22);
  v44 = -[ICASShareFlowData initWithShareFlowType:]([ICASShareFlowData alloc], "initWithShareFlowType:", v46);
  v25 = [ICASCollaboratorData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a6));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a7));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[ICASCollaboratorData initWithCountOfCollaboratorAdded:countOfCollaboratorRemoved:](v25, "initWithCountOfCollaboratorAdded:countOfCollaboratorRemoved:", v26, v27);

  v28 = [ICASStartCollaborationCollaboratorData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a8));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a9));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[ICASStartCollaborationCollaboratorData initWithStartInvitedCount:startAcceptedCount:](v28, "initWithStartInvitedCount:startAcceptedCount:", v29, v30);

  v31 = [ICASEndCollaborationCollaboratorData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a10));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a11));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[ICASEndCollaborationCollaboratorData initWithEndInvitedCount:endAcceptedCount:](v31, "initWithEndInvitedCount:endAcceptedCount:", v32, v33);

  v35 = v21;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v50, v18, v51, v21, v49, v48, v44, v43, v45, v34, 0);
  v37 = [ICASContextPathData alloc];
  v38 = -[ICASContextPath initWithContextPath:]([ICASContextPath alloc], "initWithContextPath:", 1);
  v39 = -[ICASContextPathData initWithContextPath:](v37, "initWithContextPath:", v38);

  objc_msgSend(v36, "addObject:", v39);
  v40 = objc_opt_class();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "submitEventOfType:pushThenPopDataObjects:subTracker:", v40, v36, v42);

}

- (void)submitNoteSharrowEventForHTMLNote:(id)a3 activityType:(id)a4 contextPath:(int64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  ICASSharrowContextData *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  ICASShareFlowType *v16;
  ICASShareFlowData *v17;
  ICASCollaboratorData *v18;
  ICASStartCollaborationCollaboratorData *v19;
  ICASEndCollaborationCollaboratorData *v20;
  void *v21;
  void *v22;
  ICASContextPathData *v23;
  ICASContextPath *v24;
  ICASContextPathData *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  ICASSharrowContextData *v36;
  id v37;

  v37 = a4;
  v7 = a3;
  -[ICNAEventReporter noteDataForHTMLNote:](self, "noteDataForHTMLNote:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForHTMLNote:](self, "noteContentDataForHTMLNote:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter folderDataForHTMLFolder:](self, "folderDataForHTMLFolder:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = [ICASSharrowContextData alloc];
  objc_msgSend((id)objc_opt_class(), "filteredActivityType:", v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[ICASSharrowContextData initWithSharrowSelectedItem:](v12, "initWithSharrowSelectedItem:", v13);

  v32 = v10;
  objc_msgSend(v10, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForHTMLAccount:](self, "accountDataForHTMLAccount:", v14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteAccessDataForHTMLNote](self, "noteAccessDataForHTMLNote");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.notes.sharing.initiate")) & 1) != 0)
  {
    v15 = 0;
  }
  else if (objc_msgSend((id)objc_opt_class(), "activityTypeHasUnknownShareFlow:", v37))
  {
    v15 = 3;
  }
  else
  {
    v15 = 1;
  }
  v16 = -[ICASShareFlowType initWithShareFlowType:]([ICASShareFlowType alloc], "initWithShareFlowType:", v15);
  v17 = -[ICASShareFlowData initWithShareFlowType:]([ICASShareFlowData alloc], "initWithShareFlowType:", v16);
  v18 = -[ICASCollaboratorData initWithCountOfCollaboratorAdded:countOfCollaboratorRemoved:]([ICASCollaboratorData alloc], "initWithCountOfCollaboratorAdded:countOfCollaboratorRemoved:", &unk_1E774D208, &unk_1E774D208);
  v19 = -[ICASStartCollaborationCollaboratorData initWithStartInvitedCount:startAcceptedCount:]([ICASStartCollaborationCollaboratorData alloc], "initWithStartInvitedCount:startAcceptedCount:", &unk_1E774D208, &unk_1E774D208);
  v20 = -[ICASEndCollaborationCollaboratorData initWithEndInvitedCount:endAcceptedCount:]([ICASEndCollaborationCollaboratorData alloc], "initWithEndInvitedCount:endAcceptedCount:", &unk_1E774D208, &unk_1E774D208);
  v31 = (void *)v11;
  v33 = (void *)v9;
  v29 = v9;
  v21 = (void *)v8;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v8, v29, v11, v36, v35, v34, v17, v18, v19, v20, 0);
  if (a5)
  {
    v23 = [ICASContextPathData alloc];
    v24 = -[ICASContextPath initWithContextPath:]([ICASContextPath alloc], "initWithContextPath:", a5);
    v25 = -[ICASContextPathData initWithContextPath:](v23, "initWithContextPath:", v24);

    objc_msgSend(v22, "addObject:", v25);
  }
  v26 = objc_opt_class();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "submitEventOfType:pushThenPopDataObjects:subTracker:", v26, v22, v28);

}

- (void)pushContextPathDataWithContextPathEnum:(int64_t)a3
{
  ICASContextPathData *v5;
  ICASContextPath *v6;
  ICASContextPathData *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = [ICASContextPathData alloc];
  v6 = -[ICASContextPath initWithContextPath:]([ICASContextPath alloc], "initWithContextPath:", a3);
  v7 = -[ICASContextPathData initWithContextPath:](v5, "initWithContextPath:", v6);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushDataObjects:unique:onlyOnce:subTracker:", v9, 0, 0, v10);

}

- (void)popContextPathData
{
  uint64_t v3;
  void *v4;
  id v5;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popDataObjectWithType:subTracker:", v3, v4);

}

- (void)submitCollaborationActionEventForCloudSyncingObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5 inviteStep:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ICASCollaborationItemData *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  ICASEndCollaborationCollaboratorData *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  ICASStartCollaborationCollaboratorData *v32;
  ICASEndCollaborationCollaboratorData *v33;
  ICASCollaborationItemType *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;

  v7 = a5;
  v38 = a4;
  v10 = a3;
  objc_opt_class();
  ICDynamicCast();
  v11 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v12 = objc_claimAutoreleasedReturnValue();

  if (v11 | v12)
  {
    v36 = objc_opt_class();
    if (v11)
    {
      objc_msgSend((id)v11, "account");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = 1;
    }
    else
    {
      objc_msgSend((id)v12, "account");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = 2;
    }
    v37 = (void *)v13;
    -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v34 = -[ICASCollaborationItemType initWithCollaborationItemType:]([ICASCollaborationItemType alloc], "initWithCollaborationItemType:", v14);
    v16 = -[ICASCollaborationItemData initWithCollaborationItemType:]([ICASCollaborationItemData alloc], "initWithCollaborationItemType:", v34);
    -[ICNAEventReporter collaborationActionDataIsInviting:inviteStep:](self, "collaborationActionDataIsInviting:inviteStep:", v7, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v15;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v15, v16, v17, 0);
    if (v11)
    {
      -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ic_addNonNilObject:", v19);
      -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ic_addNonNilObject:", v20);

    }
    +[ICNAController sharedController](ICNAController, "sharedController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v38, "ic_isOwnedByCurrentUser");
    if (v38 && !v22)
      goto LABEL_14;
    v23 = objc_msgSend(v38, "ic_nonOwnerInvitedParticipantsCount");
    v24 = objc_msgSend(v38, "ic_nonOwnerAcceptedParticipantsCount");
    if (a6 == 3)
    {
      v33 = [ICASEndCollaborationCollaboratorData alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v23));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v24));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[ICASEndCollaborationCollaboratorData initWithEndInvitedCount:endAcceptedCount:](v33, "initWithEndInvitedCount:endAcceptedCount:", v29, v30);

      objc_msgSend(v18, "addObject:", v27);
    }
    else
    {
      if (a6 != 1)
      {
LABEL_14:
        -[ICNAEventReporter subTracker](self, "subTracker");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "submitEventOfType:pushThenPopDataObjects:subTracker:", v36, v18, v31);

        goto LABEL_15;
      }
      v32 = [ICASStartCollaborationCollaboratorData alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v23));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[ICASStartCollaborationCollaboratorData initWithStartInvitedCount:startAcceptedCount:](v32, "initWithStartInvitedCount:startAcceptedCount:", v25, v26);

      -[ICNAEventReporter subTracker](self, "subTracker");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pushDataObject:unique:onlyOnce:subTracker:", v27, 1, 0, v28);

    }
    goto LABEL_14;
  }
LABEL_15:

}

- (void)submitCollabNotificationEventWithAction:(int64_t)a3
{
  ICASCollabNotificationAction *v4;
  ICASCollabNotificationData *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = -[ICASCollabNotificationAction initWithCollabNotificationAction:]([ICASCollabNotificationAction alloc], "initWithCollabNotificationAction:", a3);
  v5 = -[ICASCollabNotificationData initWithCollabNotificationAction:]([ICASCollabNotificationData alloc], "initWithCollabNotificationAction:", v4);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitEventOfType:pushThenPopDataObjects:subTracker:", v7, v8, v9);

}

- (void)submitEverNoteImportEventWithCount:(unint64_t)a3 isSuccessful:(BOOL)a4 intoAccount:(id)a5
{
  _BOOL4 v5;
  id v8;
  ICASImportFileType *v9;
  ICASImportItemData *v10;
  void *v11;
  ICASImportItemData *v12;
  ICASImportData *v13;
  void *v14;
  ICASImportData *v15;
  void *v16;
  id v17;
  ICASResultType *v18;
  uint64_t v19;
  ICASResultType *v20;
  ICASResultData *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  ICNAEventReporter *v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[3];
  _QWORD v41[2];

  v5 = a4;
  v41[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = -[ICASImportFileType initWithImportFileType:]([ICASImportFileType alloc], "initWithImportFileType:", 5);
  v10 = [ICASImportItemData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICASImportItemData initWithImportFileType:importItemCount:](v10, "initWithImportFileType:importItemCount:", v9, v11);

  v13 = [ICASImportData alloc];
  v41[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICASImportData initWithImportSummary:](v13, "initWithImportSummary:", v14);

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3;
  v38 = __Block_byref_object_dispose__3;
  v39 = 0;
  objc_msgSend(v8, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __81__ICNAEventReporter_submitEverNoteImportEventWithCount_isSuccessful_intoAccount___block_invoke;
  v30 = &unk_1E771C950;
  v33 = &v34;
  v31 = self;
  v17 = v8;
  v32 = v17;
  objc_msgSend(v16, "performBlockAndWait:", &v27);

  v18 = [ICASResultType alloc];
  if (v5)
    v19 = 1;
  else
    v19 = 2;
  v20 = -[ICASResultType initWithResultType:](v18, "initWithResultType:", v19, v27, v28, v29, v30, v31);
  v21 = -[ICASResultData initWithResultType:]([ICASResultData alloc], "initWithResultType:", v20);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_class();
  v24 = v35[5];
  v40[0] = v15;
  v40[1] = v24;
  v40[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "submitEventOfType:pushThenPopDataObjects:subTracker:", v23, v25, v26);

  _Block_object_dispose(&v34, 8);
}

void __81__ICNAEventReporter_submitEverNoteImportEventWithCount_isSuccessful_intoAccount___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accountDataForModernAccount:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)noteViewEventDataObjectsForModernNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  objc_msgSend(v4, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderDataForModernFolder:](self, "folderDataForModernFolder:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  objc_msgSend(v4, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)noteViewEventDataObjectsForHTMLNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter noteDataForHTMLNote:](self, "noteDataForHTMLNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  -[ICNAEventReporter noteContentDataForHTMLNote:](self, "noteContentDataForHTMLNote:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  -[ICNAEventReporter noteCollapsibleSectionDataForHTMLNote:](self, "noteCollapsibleSectionDataForHTMLNote:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  -[ICNAEventReporter noteAccessDataForHTMLNote](self, "noteAccessDataForHTMLNote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  objc_msgSend(v4, "folder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderDataForHTMLFolder:](self, "folderDataForHTMLFolder:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v10;
  objc_msgSend(v4, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForHTMLAccount:](self, "accountDataForHTMLAccount:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)startNoteViewEventDurationTrackingForModernNote:(id)a3 reportCoreAnalytics:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
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
  _QWORD v18[6];

  v4 = a4;
  v18[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderDataForModernFolder:](self, "folderDataForModernFolder:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = v8;
  v18[2] = v9;
  v18[3] = v11;
  v18[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushDataObjects:unique:onlyOnce:subTracker:", v15, 1, 0, v16);

  if (v4)
  {
    +[ICNACoreAnalyticsReporter sharedReporter](ICNACoreAnalyticsReporter, "sharedReporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fireNoteViewEventWithNote:noteData:noteContentData:", v6, v7, v8);

  }
}

- (void)submitNoteViewEventForModernNote:(id)a3 referringNote:(id)a4 collapsibleSectionAffordanceExposures:(int64_t)a5 collapsibleSectionAffordanceUsages:(int64_t)a6
{
  void *v10;
  void *v11;
  ICASCollapsibleSectionData *v12;
  void *v13;
  void *v14;
  ICASCollapsibleSectionData *v15;
  void *v16;
  void *v17;
  void *v18;
  ICASViewRefData *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  -[ICNAEventReporter noteViewEventDataObjectsForModernNote:](self, "noteViewEventDataObjectsForModernNote:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = [ICASCollapsibleSectionData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICASCollapsibleSectionData initWithSectionAffordanceExposures:sectionAffordanceUsages:](v12, "initWithSectionAffordanceExposures:sectionAffordanceUsages:", v13, v14);

  objc_msgSend(v11, "addObject:", v15);
  if (v22)
  {
    +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "saltedID:forClass:", v17, objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[ICASViewRefData initWithLinkedNoteId:]([ICASViewRefData alloc], "initWithLinkedNoteId:", v18);
    objc_msgSend(v11, "addObject:", v19);

  }
  +[ICNAController sharedController](ICNAController, "sharedController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pushDataObjects:unique:onlyOnce:subTracker:", v11, 1, 1, v21);

  -[ICNAEventReporter submitTimedEventOfTypeIfPossible:](self, "submitTimedEventOfTypeIfPossible:", objc_opt_class());
}

- (void)startNoteViewEventDurationTrackingForHTMLNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
  -[ICNAEventReporter noteViewEventDataObjectsForHTMLNote:](self, "noteViewEventDataObjectsForHTMLNote:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushDataObjects:unique:onlyOnce:subTracker:", v7, 1, 0, v6);

}

- (void)submitNoteViewEventForHTMLNote:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[ICNAEventReporter noteViewEventDataObjectsForHTMLNote:](self, "noteViewEventDataObjectsForHTMLNote:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushDataObjects:unique:onlyOnce:subTracker:", v6, 1, 1, v5);

  -[ICNAEventReporter submitTimedEventOfTypeIfPossible:](self, "submitTimedEventOfTypeIfPossible:", objc_opt_class());
}

- (void)pushSearchDataWithSearchSessionID:(id)a3
{
  id v4;
  ICASSearchData *v5;
  void *v6;
  void *v7;
  void *v8;
  ICASSearchData *v9;

  v4 = a3;
  v5 = [ICASSearchData alloc];
  v6 = (void *)objc_msgSend(v4, "copy");

  v9 = -[ICASSearchData initWithSearchSessionID:](v5, "initWithSearchSessionID:", v6);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushDataObject:unique:onlyOnce:subTracker:", v9, 1, 0, v8);

}

- (void)popSearchData
{
  uint64_t v3;
  void *v4;
  id v5;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popDataObjectWithType:subTracker:", v3, v4);

}

- (void)submitTableCreateEventForAttachment:(id)a3 inNote:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICASStartTableData *v13;
  ICASEndTableData *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tableModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v10, "rowCount")));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v10, "columnCount")));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICASStartTableData initWithStartingRowCount:startingColumnCount:]([ICASStartTableData alloc], "initWithStartingRowCount:startingColumnCount:", v11, v12);
  v14 = -[ICASEndTableData initWithEndingRowCount:endingColumnCount:]([ICASEndTableData alloc], "initWithEndingRowCount:endingColumnCount:", v11, v12);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  v22[0] = v19;
  v22[1] = v21;
  v22[2] = v20;
  v22[3] = v13;
  v22[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "submitEventOfType:pushThenPopDataObjects:subTracker:", v16, v17, v18);

}

- (void)pushStartTableDataWithStartColumns:(unint64_t)a3 startRows:(unint64_t)a4
{
  ICASStartTableData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICASStartTableData *v12;

  v7 = [ICASStartTableData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICASStartTableData initWithStartingRowCount:startingColumnCount:](v7, "initWithStartingRowCount:startingColumnCount:", v8, v9);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushDataObject:unique:onlyOnce:subTracker:", v12, 1, 1, v11);

}

- (void)submitTableEditEventForNote:(id)a3 endColumns:(unint64_t)a4 endRows:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICASEndTableData *v13;
  void *v14;
  void *v15;
  ICASEndTableData *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [ICASEndTableData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a5));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a4));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICASEndTableData initWithEndingRowCount:endingColumnCount:](v13, "initWithEndingRowCount:endingColumnCount:", v14, v15);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  v21[0] = v9;
  v21[1] = v10;
  v21[2] = v12;
  v21[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "submitEventOfType:pushThenPopDataObjects:subTracker:", v18, v19, v20);

}

- (void)submitTableRemoveEventForAttachment:(id)a3 inNote:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICASStartTableData *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tableModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v11, "rowCount")));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v11, "columnCount")));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICASStartTableData initWithStartingRowCount:startingColumnCount:]([ICASStartTableData alloc], "initWithStartingRowCount:startingColumnCount:", v18, v12);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  v21[0] = v8;
  v21[1] = v20;
  v21[2] = v19;
  v21[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submitEventOfType:pushThenPopDataObjects:subTracker:", v15, v16, v17);

}

- (void)submitNotePinEventForModernNote:(id)a3 contextPath:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICASContextPathData *v12;
  ICASContextPath *v13;
  ICASContextPathData *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v6, v8, v9, v10, 0);
  if (a4)
  {
    v12 = [ICASContextPathData alloc];
    v13 = -[ICASContextPath initWithContextPath:]([ICASContextPath alloc], "initWithContextPath:", a4);
    v14 = -[ICASContextPathData initWithContextPath:](v12, "initWithContextPath:", v13);

    objc_msgSend(v11, "addObject:", v14);
  }
  objc_msgSend(v18, "isPinned");
  v15 = objc_opt_class();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "submitEventOfType:pushThenPopDataObjects:subTracker:", v15, v11, v17);

}

- (void)submitFolderCreateEventForModernFolder:(id)a3
{
  -[ICNAEventReporter submitFolderCreateEventForModernFolder:creationApproach:filterSelection:](self, "submitFolderCreateEventForModernFolder:creationApproach:filterSelection:", a3, 0, 0);
}

- (void)submitFolderCreateEventForModernFolder:(id)a3 creationApproach:(int64_t)a4 filterSelection:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ICASFolderCreationApproach *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  ICASSmartFolderCreationData *v21;
  void *v22;
  ICASFilterCondition *v23;
  ICASSmartFolderCreationData *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a5;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a3;
  objc_msgSend(v8, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderDataForModernFolder:](self, "folderDataForModernFolder:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);
  objc_msgSend(v9, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addObject:", v13);
  LODWORD(v12) = objc_msgSend(v9, "isSmartFolder");

  if ((_DWORD)v12)
  {
    v14 = -[ICASFolderCreationApproach initWithFolderCreationApproach:]([ICASFolderCreationApproach alloc], "initWithFolderCreationApproach:", a4);
    objc_opt_class();
    objc_msgSend(v29, "filterTypeSelectionForFilterType:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v29, "filterTypeSelections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ic_compactMap:", &__block_literal_global_4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v29, "joinOperator");
      if (v19 == 1)
        v20 = 2;
      else
        v20 = v19 == 0;
    }
    else
    {
      v20 = 0;
      v18 = (void *)MEMORY[0x1E0C9AA60];
    }
    v21 = [ICASSmartFolderCreationData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v16, "selectedTagCount")));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[ICASFilterCondition initWithFilterCondition:]([ICASFilterCondition alloc], "initWithFilterCondition:", v20);
    v24 = -[ICASSmartFolderCreationData initWithFolderCreationApproach:countOfTags:filterCondition:enabledFiltersArray:](v21, "initWithFolderCreationApproach:countOfTags:filterCondition:enabledFiltersArray:", v14, v22, v23, v18);

    objc_msgSend(v10, "addObject:", v24);
  }
  +[ICNAController sharedController](ICNAController, "sharedController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_class();
  v27 = (void *)objc_msgSend(v10, "copy");
  -[ICNAEventReporter subTracker](self, "subTracker");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "submitEventOfType:pushThenPopDataObjects:subTracker:", v26, v27, v28);

}

ICASEnabledFiltersArrayData *__93__ICNAEventReporter_submitFolderCreateEventForModernFolder_creationApproach_filterSelection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ICASEnabledFiltersArrayData *v3;
  void *v4;
  void *v5;
  ICASEnabledFiltersArrayData *v6;

  v2 = a2;
  v3 = [ICASEnabledFiltersArrayData alloc];
  objc_msgSend(v2, "filterType");
  NSStringFromICFilterType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawFilterValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ICASEnabledFiltersArrayData initWithFilterType:filterValue:](v3, "initWithFilterType:filterValue:", v4, v5);
  return v6;
}

- (id)folderViewEventDataObjectsForNoteContainer:(id)a3 isInGridMode:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  ICNAEventReporter *v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__ICNAEventReporter_folderViewEventDataObjectsForNoteContainer_isInGridMode___block_invoke;
  v12[3] = &unk_1E771C9B8;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v16 = a4;
  v15 = &v17;
  objc_msgSend(v7, "performBlockAndWait:", v12);

  v9 = (void *)v18[5];
  if (!v9)
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __77__ICNAEventReporter_folderViewEventDataObjectsForNoteContainer_isInGridMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  ICDynamicCast();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "noteContainerAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v5, "folderDataForModernFolder:", v2);
  else
    objc_msgSend(v5, "folderDataForModernAccountProxy:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "folderContentDataForNoteContainer:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "noteContainerAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountDataForModernAccount:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "layoutDataForIsInGridMode:isTimelineView:", *(unsigned __int8 *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "isShowingDateHeaders"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = v7;
  v15[2] = v10;
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (id)folderViewEventDataObjectsForVirtualFolder:(id)a3 isInGridMode:(BOOL)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  ICNAEventReporter *v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__ICNAEventReporter_folderViewEventDataObjectsForVirtualFolder_isInGridMode_context___block_invoke;
  v15[3] = &unk_1E771C9E0;
  v10 = v8;
  v16 = v10;
  v11 = v9;
  v18 = self;
  v19 = &v21;
  v17 = v11;
  v20 = a4;
  objc_msgSend(v11, "performBlockAndWait:", v15);
  v12 = (void *)v22[5];
  if (!v12)
    v12 = (void *)MEMORY[0x1E0C9AA60];
  v13 = v12;

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __85__ICNAEventReporter_folderViewEventDataObjectsForVirtualFolder_isInGridMode_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  ICASAccountData *v6;
  ICASAccountType *v7;
  ICASAccountData *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accountObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "accountObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectWithID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  v6 = [ICASAccountData alloc];
  v7 = -[ICASAccountType initWithAccountType:]([ICASAccountType alloc], "initWithAccountType:", 0);
  v8 = -[ICASAccountData initWithAccountType:accountID:](v6, "initWithAccountType:accountID:", v7, &stru_1E771FED0);

  objc_msgSend(*(id *)(a1 + 48), "folderDataForVirtualFolder:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(*(id *)(a1 + 48), "folderContentDataForVirtualFolder:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "accountDataForModernAccount:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v8;
  }
  v16[2] = v11;
  objc_msgSend(*(id *)(a1 + 48), "layoutDataForIsInGridMode:isTimelineView:", *(unsigned __int8 *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "isShowingDateHeaders"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  if (v5)
}

- (id)folderViewEventDataObjectsForNoteCollection:(id)a3 isInGridMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v4 = a4;
  v15[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  ICProtocolCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderDataForHTMLCollection:](self, "folderDataForHTMLCollection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter folderContentDataForNoteCollection:](self, "folderContentDataForNoteCollection:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v7, "account");
  else
    ICCheckedProtocolCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForHTMLAccount:](self, "accountDataForHTMLAccount:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter layoutDataForIsInGridMode:isTimelineView:](self, "layoutDataForIsInGridMode:isTimelineView:", v4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = v9;
  v15[2] = v11;
  v15[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)startFolderViewEventDurationTrackingForNoteContainer:(id)a3 isInGridMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
  -[ICNAEventReporter folderViewEventDataObjectsForNoteContainer:isInGridMode:](self, "folderViewEventDataObjectsForNoteContainer:isInGridMode:", v6, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushDataObjects:unique:onlyOnce:subTracker:", v9, 1, 0, v8);

}

- (void)submitFolderViewEventForNoteContainer:(id)a3 isInGridMode:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  -[ICNAEventReporter folderViewEventDataObjectsForNoteContainer:isInGridMode:](self, "folderViewEventDataObjectsForNoteContainer:isInGridMode:", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushDataObjects:unique:onlyOnce:subTracker:", v7, 1, 1, v6);

  -[ICNAEventReporter submitTimedEventOfTypeIfPossible:](self, "submitTimedEventOfTypeIfPossible:", objc_opt_class());
}

- (void)startFolderViewEventDurationTrackingForVirtualFolder:(id)a3 isInGridMode:(BOOL)a4 context:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
  -[ICNAEventReporter folderViewEventDataObjectsForVirtualFolder:isInGridMode:context:](self, "folderViewEventDataObjectsForVirtualFolder:isInGridMode:context:", v9, v5, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushDataObjects:unique:onlyOnce:subTracker:", v12, 1, 0, v11);

}

- (void)submitFolderViewEventForVirtualFolder:(id)a3 isInGridMode:(BOOL)a4 context:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  -[ICNAEventReporter folderViewEventDataObjectsForVirtualFolder:isInGridMode:context:](self, "folderViewEventDataObjectsForVirtualFolder:isInGridMode:context:", a3, a4, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushDataObjects:unique:onlyOnce:subTracker:", v8, 1, 1, v7);

  -[ICNAEventReporter submitTimedEventOfTypeIfPossible:](self, "submitTimedEventOfTypeIfPossible:", objc_opt_class());
}

- (void)startFolderViewEventDurationTrackingForNoteCollection:(id)a3 isInGridMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
  -[ICNAEventReporter folderViewEventDataObjectsForNoteCollection:isInGridMode:](self, "folderViewEventDataObjectsForNoteCollection:isInGridMode:", v6, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushDataObjects:unique:onlyOnce:subTracker:", v9, 1, 0, v8);

}

- (void)submitFolderViewEventForNoteCollection:(id)a3 isInGridMode:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  -[ICNAEventReporter folderViewEventDataObjectsForNoteCollection:isInGridMode:](self, "folderViewEventDataObjectsForNoteCollection:isInGridMode:", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushDataObjects:unique:onlyOnce:subTracker:", v7, 1, 1, v6);

  -[ICNAEventReporter submitTimedEventOfTypeIfPossible:](self, "submitTimedEventOfTypeIfPossible:", objc_opt_class());
}

- (void)startFolderListViewEventDurationTracking
{
  -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
}

- (void)submitFolderListViewEvent
{
  -[ICNAEventReporter submitTimedEventOfTypeIfPossible:](self, "submitTimedEventOfTypeIfPossible:", objc_opt_class());
}

- (void)submitFolderDeleteEventForModernFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter folderDataForModernFolder:](self, "folderDataForModernFolder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter folderContentDataForNoteContainer:](self, "folderContentDataForNoteContainer:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v13[0] = v5;
  v13[1] = v8;
  v13[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitEventOfType:pushThenPopDataObjects:subTracker:", v10, v11, v12);

}

- (void)pushInlineDrawingDataForDrawing:(id)a3 drawingID:(id)a4 tool:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ICInlineDrawingAnalyticsInformation *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  -[ICNAEventReporter pendingInlineDrawingInformation](self, "pendingInlineDrawingInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAEventReporter setPendingInlineDrawingInformation:](self, "setPendingInlineDrawingInformation:", v10);

  }
  -[ICNAEventReporter pendingInlineDrawingInformation](self, "pendingInlineDrawingInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (ICInlineDrawingAnalyticsInformation *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v12 = objc_alloc_init(ICInlineDrawingAnalyticsInformation);
    v13 = -[ICNAEventReporter pencilStrokeCountForDrawing:](self, "pencilStrokeCountForDrawing:", v17);
    objc_msgSend(v17, "strokes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count") - v13;

    -[ICInlineDrawingAnalyticsInformation setStartFingerStrokeCount:](v12, "setStartFingerStrokeCount:", v15);
    -[ICInlineDrawingAnalyticsInformation setStartPencilStrokeCount:](v12, "setStartPencilStrokeCount:", v13);
    -[ICInlineDrawingAnalyticsInformation setEndFingerStrokeCount:](v12, "setEndFingerStrokeCount:", v15);
    -[ICInlineDrawingAnalyticsInformation setEndPencilStrokeCount:](v12, "setEndPencilStrokeCount:", v13);
    -[ICNAEventReporter pendingInlineDrawingInformation](self, "pendingInlineDrawingInformation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v12, v8);

  }
  if (a5 == 1)
    -[ICInlineDrawingAnalyticsInformation setEndPencilStrokeCount:](v12, "setEndPencilStrokeCount:", -[ICInlineDrawingAnalyticsInformation endPencilStrokeCount](v12, "endPencilStrokeCount") + 1);
  else
    -[ICInlineDrawingAnalyticsInformation setEndFingerStrokeCount:](v12, "setEndFingerStrokeCount:", -[ICInlineDrawingAnalyticsInformation endFingerStrokeCount](v12, "endFingerStrokeCount") + 1);
  -[ICInlineDrawingAnalyticsInformation setLastUsedTool:](v12, "setLastUsedTool:", a5);

}

- (void)submitPendingInlineDrawingDataForNote:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  ICASDrawingData *v19;
  ICASDrawingActionType *v20;
  ICASDrawingTool *v21;
  ICASStartDrawingStrokeData *v22;
  void *v23;
  void *v24;
  ICASEndDrawingStrokeData *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  _BOOL8 v36;
  void *v37;
  _BOOL8 v38;
  void *v39;
  ICNAEventReporter *v40;
  id v41;
  id obj;
  void *v43;
  void *v44;
  ICASEndDrawingStrokeData *v45;
  void *v46;
  ICASStartDrawingStrokeData *v47;
  void *v48;
  ICASDrawingData *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[7];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  if (v41)
  {
    -[ICNAEventReporter pendingInlineDrawingInformation](self, "pendingInlineDrawingInformation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[ICNAEventReporter pendingInlineDrawingInformation](self, "pendingInlineDrawingInformation");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v51)
      {
        v6 = 0x1E0D63000uLL;
        v7 = 0x1E0D63000uLL;
        v50 = *(_QWORD *)v53;
        v40 = self;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v53 != v50)
              objc_enumerationMutation(obj);
            v9 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v8);
            v10 = *(void **)(v6 + 2544);
            objc_msgSend(*(id *)(v7 + 3016), "sharedContext", v40);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "managedObjectContext");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "attachmentWithIdentifier:context:", v9, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13 && (objc_msgSend(v13, "markedForDeletion") & 1) == 0)
            {
              -[ICNAEventReporter pendingInlineDrawingInformation](self, "pendingInlineDrawingInformation");
              v46 = v13;
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", v9);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v16 = objc_msgSend(v15, "startPencilStrokeCount");
              if (v16 + objc_msgSend(v15, "startFingerStrokeCount"))
                v17 = 2;
              else
                v17 = 1;
              +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "saltedID:forClass:", v9, objc_opt_class());
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = [ICASDrawingData alloc];
              v20 = -[ICASDrawingActionType initWithDrawingActionType:]([ICASDrawingActionType alloc], "initWithDrawingActionType:", v17);
              v21 = -[ICASDrawingTool initWithDrawingTool:]([ICASDrawingTool alloc], "initWithDrawingTool:", objc_msgSend(v15, "lastUsedTool"));
              v49 = -[ICASDrawingData initWithDrawingActionType:drawingTool:drawingID:](v19, "initWithDrawingActionType:drawingTool:drawingID:", v20, v21, v48);

              v22 = [ICASStartDrawingStrokeData alloc];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v15, "startPencilStrokeCount")));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v15, "startFingerStrokeCount")));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = -[ICASStartDrawingStrokeData initWithStartPencilStrokeCount:startFingerStrokeCount:](v22, "initWithStartPencilStrokeCount:startFingerStrokeCount:", v23, v24);

              v25 = [ICASEndDrawingStrokeData alloc];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v15, "endPencilStrokeCount")));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v15, "endFingerStrokeCount")));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = -[ICASEndDrawingStrokeData initWithEndPencilStrokeCount:endFingerStrokeCount:](v25, "initWithEndPencilStrokeCount:endFingerStrokeCount:", v26, v27);

              -[ICNAEventReporter noteDataForModernNote:](v40, "noteDataForModernNote:", v41);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICNAEventReporter noteContentDataForModernNote:](v40, "noteContentDataForModernNote:", v41);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICNAEventReporter noteAccessDataForModernNote:](v40, "noteAccessDataForModernNote:", v41);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "account");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICNAEventReporter accountDataForModernAccount:](v40, "accountDataForModernAccount:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              +[ICNAController sharedController](ICNAController, "sharedController");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_opt_class();
              v56[0] = v43;
              v56[1] = v44;
              v56[2] = v28;
              v56[3] = v30;
              v56[4] = v49;
              v56[5] = v47;
              v56[6] = v45;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 7);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICNAEventReporter subTracker](v40, "subTracker");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "submitEventOfType:pushThenPopDataObjects:subTracker:", v32, v33, v34);

              self = v40;
              v35 = objc_msgSend(v15, "endPencilStrokeCount");
              v36 = v35 > objc_msgSend(v15, "startPencilStrokeCount");
              +[ICNACoreAnalyticsReporter sharedReporter](ICNACoreAnalyticsReporter, "sharedReporter");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v36;
              v6 = 0x1E0D63000;
              objc_msgSend(v37, "fireUpdateHandWritingContentEventWithNoteData:pencilIsUsed:", v43, v38);

              v7 = 0x1E0D63000;
              v13 = v46;

            }
            ++v8;
          }
          while (v51 != v8);
          v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        }
        while (v51);
      }

      -[ICNAEventReporter pendingInlineDrawingInformation](self, "pendingInlineDrawingInformation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "removeAllObjects");

    }
  }

}

- (void)submitInlineDrawingDataForDrawingDeletion:(id)a3 drawingID:(id)a4 forNote:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ICASDrawingData *v12;
  ICASDrawingActionType *v13;
  ICASDrawingTool *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  ICASStartDrawingStrokeData *v18;
  void *v19;
  void *v20;
  ICASEndDrawingStrokeData *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  ICASStartDrawingStrokeData *v35;
  ICASDrawingData *v36;
  void *v37;
  _QWORD v38[8];

  v38[7] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saltedID:forClass:", v9, objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [ICASDrawingData alloc];
  v13 = -[ICASDrawingActionType initWithDrawingActionType:]([ICASDrawingActionType alloc], "initWithDrawingActionType:", 3);
  v14 = -[ICASDrawingTool initWithDrawingTool:]([ICASDrawingTool alloc], "initWithDrawingTool:", 0);
  v36 = -[ICASDrawingData initWithDrawingActionType:drawingTool:drawingID:](v12, "initWithDrawingActionType:drawingTool:drawingID:", v13, v14, v37);

  v15 = -[ICNAEventReporter pencilStrokeCountForDrawing:](self, "pencilStrokeCountForDrawing:", v10);
  objc_msgSend(v10, "strokes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "count") - v15;
  v18 = [ICASStartDrawingStrokeData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v15));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v17));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[ICASStartDrawingStrokeData initWithStartPencilStrokeCount:startFingerStrokeCount:](v18, "initWithStartPencilStrokeCount:startFingerStrokeCount:", v19, v20);

  v21 = [ICASEndDrawingStrokeData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v15));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v17));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ICASEndDrawingStrokeData initWithEndPencilStrokeCount:endFingerStrokeCount:](v21, "initWithEndPencilStrokeCount:endFingerStrokeCount:", v22, v23);

  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_opt_class();
  v38[0] = v34;
  v38[1] = v25;
  v38[2] = v26;
  v38[3] = v28;
  v38[4] = v36;
  v38[5] = v35;
  v38[6] = v24;
  v31 = (void *)v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "submitEventOfType:pushThenPopDataObjects:subTracker:", v30, v32, v33);

}

- (void)submitFullscreenDrawingToInlineDrawingEventForNote:(id)a3 drawing:(id)a4 drawingID:(id)a5 method:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  ICASDrawingData *v14;
  ICASDrawingActionType *v15;
  ICASDrawingTool *v16;
  ICASDrawingData *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  ICASStartDrawingStrokeData *v21;
  void *v22;
  void *v23;
  ICASStartDrawingStrokeData *v24;
  ICASDrawingConversionData *v25;
  ICASConversionMethod *v26;
  ICASDrawingConversionData *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[7];

  v37[6] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "saltedID:forClass:", v10, objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [ICASDrawingData alloc];
  v15 = -[ICASDrawingActionType initWithDrawingActionType:]([ICASDrawingActionType alloc], "initWithDrawingActionType:", 1);
  v16 = -[ICASDrawingTool initWithDrawingTool:]([ICASDrawingTool alloc], "initWithDrawingTool:", 0);
  v17 = -[ICASDrawingData initWithDrawingActionType:drawingTool:drawingID:](v14, "initWithDrawingActionType:drawingTool:drawingID:", v15, v16, v36);

  v18 = -[ICNAEventReporter pencilStrokeCountForDrawing:](self, "pencilStrokeCountForDrawing:", v11);
  objc_msgSend(v11, "strokes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "count") - v18;
  v21 = [ICASStartDrawingStrokeData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v18));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v20));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ICASStartDrawingStrokeData initWithStartPencilStrokeCount:startFingerStrokeCount:](v21, "initWithStartPencilStrokeCount:startFingerStrokeCount:", v22, v23);

  v25 = [ICASDrawingConversionData alloc];
  v26 = -[ICASConversionMethod initWithConversionMethod:]([ICASConversionMethod alloc], "initWithConversionMethod:", a6);
  v27 = -[ICASDrawingConversionData initWithConversionMethod:](v25, "initWithConversionMethod:", v26);

  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "account");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_opt_class();
  v37[0] = v28;
  v37[1] = v29;
  v37[2] = v31;
  v37[3] = v17;
  v37[4] = v24;
  v37[5] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "submitEventOfType:pushThenPopDataObjects:subTracker:", v33, v34, v35);

}

- (void)submitPaletteEngagementEventForNote:(id)a3 startPosition:(int64_t)a4 endPosition:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICASPaletteEngagementData *v13;
  ICASPaletteEngagementType *v14;
  ICASPaletteEngagementData *v15;
  ICASPalettePositionData *v16;
  ICASPalettePosition *v17;
  ICASPalettePosition *v18;
  ICASPalettePositionData *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [ICASPaletteEngagementData alloc];
  v14 = -[ICASPaletteEngagementType initWithPaletteEngagementType:]([ICASPaletteEngagementType alloc], "initWithPaletteEngagementType:", 1);
  v15 = -[ICASPaletteEngagementData initWithPaletteEngagementType:](v13, "initWithPaletteEngagementType:", v14);

  v16 = [ICASPalettePositionData alloc];
  v17 = -[ICASPalettePosition initWithPalettePosition:]([ICASPalettePosition alloc], "initWithPalettePosition:", a4);
  v18 = -[ICASPalettePosition initWithPalettePosition:]([ICASPalettePosition alloc], "initWithPalettePosition:", a5);
  v19 = -[ICASPalettePositionData initWithPaletteStartPosition:paletteEndPosition:](v16, "initWithPaletteStartPosition:paletteEndPosition:", v17, v18);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  v24[0] = v9;
  v24[1] = v10;
  v24[2] = v12;
  v24[3] = v15;
  v24[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "submitEventOfType:pushThenPopDataObjects:subTracker:", v21, v22, v23);

}

- (void)submitAttachmentAddEventForAttachment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  ICASAttachmentItemTypeData *v9;
  ICASAttachmentItemTypeData *v10;
  ICASAttachmentData *v11;
  void *v12;
  ICASAttachmentData *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  id v29;
  id location;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[4];
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__3;
  v59 = __Block_byref_object_dispose__3;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__3;
  v53 = __Block_byref_object_dispose__3;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  v47 = __Block_byref_object_dispose__3;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __59__ICNAEventReporter_submitAttachmentAddEventForAttachment___block_invoke;
  v22 = &unk_1E771CA08;
  v24 = &v55;
  v6 = v4;
  v23 = v6;
  v25 = &v49;
  v26 = &v43;
  objc_copyWeak(&v29, &location);
  v27 = &v37;
  v28 = &v31;
  objc_msgSend(v5, "performBlockAndWait:", &v19);

  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager", v19, v20, v21, v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saltedID:forClass:", v56[5], objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [ICASAttachmentItemTypeData alloc];
  v10 = -[ICASAttachmentItemTypeData initWithAttachmentID:attachmentUTI:](v9, "initWithAttachmentID:attachmentUTI:", v8, v50[5]);
  v11 = [ICASAttachmentData alloc];
  v62[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICASAttachmentData initWithAttachmentSummary:](v11, "initWithAttachmentSummary:", v12);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  v16 = v38[5];
  v61[0] = v44[5];
  v61[1] = v16;
  v61[2] = v32[5];
  v61[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submitEventOfType:pushThenPopDataObjects:subTracker:", v15, v17, v18);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

}

void __59__ICNAEventReporter_submitAttachmentAddEventForAttachment___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  +[ICNAEventReporter analyticsTypeUTIAttachment:](ICNAEventReporter, "analyticsTypeUTIAttachment:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "noteDataForModernNote:", v21);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v12, "noteContentDataForModernNote:", v21);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v21, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountDataForModernAccount:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

}

- (void)pushStartDocScanPageCountData:(unint64_t)a3
{
  ICASStartDocScanPageData *v5;
  void *v6;
  void *v7;
  void *v8;
  ICASStartDocScanPageData *v9;

  v5 = [ICASStartDocScanPageData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICASStartDocScanPageData initWithStartPageCount:](v5, "initWithStartPageCount:", v6);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushDataObject:unique:onlyOnce:subTracker:", v9, 1, 0, v8);

}

- (void)pushDocScanDataWithID:(id)a3 actionType:(int64_t)a4 stage:(int64_t)a5
{
  id v8;
  ICASDocScanStage *v9;
  void *v10;
  void *v11;
  ICASDocScanData *v12;
  void *v13;
  void *v14;
  ICASDocScanActionType *v15;

  v8 = a3;
  v15 = -[ICASDocScanActionType initWithDocScanActionType:]([ICASDocScanActionType alloc], "initWithDocScanActionType:", a4);
  v9 = -[ICASDocScanStage initWithDocScanStage:]([ICASDocScanStage alloc], "initWithDocScanStage:", a5);
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saltedID:forClass:", v8, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ICASDocScanData initWithDocScanID:docScanActionType:docScanStage:]([ICASDocScanData alloc], "initWithDocScanID:docScanActionType:docScanStage:", v11, v15, v9);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushDataObject:unique:onlyOnce:subTracker:", v12, 0, 1, v14);

}

- (void)submitDocScanEventForNote:(id)a3 pageCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  ICASEndDocScanPageData *v10;
  void *v11;
  ICASEndDocScanPageData *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [ICASEndDocScanPageData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICASEndDocScanPageData initWithEndPageCount:](v10, "initWithEndPageCount:", v11);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v17[0] = v7;
  v17[1] = v9;
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitEventOfType:pushThenPopDataObjects:subTracker:", v14, v15, v16);

}

- (void)submitPasswordProtectEventForModernNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter passwordDataForModernNote:](self, "passwordDataForModernNote:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v15[0] = v5;
  v15[1] = v7;
  v15[2] = v8;
  v15[3] = v9;
  v15[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitEventOfType:pushThenPopDataObjects:subTracker:", v12, v13, v14);

}

- (void)submitChangePasswordEventForModernAccount:(id)a3 isReset:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submitEventOfType:pushThenPopDataObjects:subTracker:", v6, v8, v9);

}

- (void)submitPasswordFailEventForModernNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter passwordDataForModernNote:](self, "passwordDataForModernNote:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v14[0] = v5;
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitEventOfType:pushThenPopDataObjects:subTracker:", v11, v12, v13);

}

- (void)submitPasswordSuccessEventForModernNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter passwordDataForModernNote:](self, "passwordDataForModernNote:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v15[0] = v5;
  v15[1] = v7;
  v15[2] = v8;
  v15[3] = v9;
  v15[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitEventOfType:pushThenPopDataObjects:subTracker:", v12, v13, v14);

}

- (void)submitBiometricsFailEventForModernNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter bioAuthDataForModernNote:](self, "bioAuthDataForModernNote:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v14[0] = v5;
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitEventOfType:pushThenPopDataObjects:subTracker:", v11, v12, v13);

}

- (void)submitChangePasswordModeEventForAccount:(id)a3 contextPath:(int64_t)a4 fromMode:(signed __int16)a5 toMode:(signed __int16)a6
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[ICNAEventReporter passwordModeDataForContextPath:fromMode:toMode:](self, "passwordModeDataForContextPath:fromMode:toMode:", a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitEventOfType:pushThenPopDataObjects:subTracker:", v9, v10, v11);

}

- (void)submitFastSyncSessionStartForNote:(id)a3 sessionID:(id)a4 participantVersions:(id)a5 numUniqueAccounts:(id)a6 numUniqueDevices:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  ICASFastSyncData *v19;
  ICASFastSyncParticipantData *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "saltedID:forClass:", v15, objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[ICASFastSyncData initWithFastSyncSessionId:participantVersions:]([ICASFastSyncData alloc], "initWithFastSyncSessionId:participantVersions:", v18, v14);
  v20 = -[ICASFastSyncParticipantData initWithCountOfUniqueAccounts:countOfUniqueDevices:]([ICASFastSyncParticipantData alloc], "initWithCountOfUniqueAccounts:countOfUniqueDevices:", v13, v12);

  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  v28[0] = v19;
  v28[1] = v20;
  v28[2] = v21;
  v28[3] = v22;
  v28[4] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "submitEventOfType:pushThenPopDataObjects:subTracker:", v25, v26, v27);

}

- (void)submitFastSyncSessionEndForNote:(id)a3 sessionID:(id)a4 participantVersions:(id)a5 numUniqueAccounts:(id)a6 numUniqueDevices:(id)a7 errorCode:(id)a8 numIgnoredMessages:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  ICASFastSyncData *v23;
  ICASFastSyncParticipantData *v24;
  ICASFastSyncErrorData *v25;
  void *v26;
  void *v27;
  ICASFastSyncErrorData *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[7];

  v40[6] = *MEMORY[0x1E0C80C00];
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "saltedID:forClass:", v20, objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "ic_map:", &__block_literal_global_392);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[ICASFastSyncData initWithFastSyncSessionId:participantVersions:]([ICASFastSyncData alloc], "initWithFastSyncSessionId:participantVersions:", v39, v38);
  v24 = -[ICASFastSyncParticipantData initWithCountOfUniqueAccounts:countOfUniqueDevices:]([ICASFastSyncParticipantData alloc], "initWithCountOfUniqueAccounts:countOfUniqueDevices:", v18, v17);

  v25 = [ICASFastSyncErrorData alloc];
  if (v16)
    v26 = v16;
  else
    v26 = &unk_1E774D208;
  if (v15)
    v27 = v15;
  else
    v27 = &unk_1E774D208;
  v28 = -[ICASFastSyncErrorData initWithErrorCode:countOfIgnoredMessages:](v25, "initWithErrorCode:countOfIgnoredMessages:", v26, v27, self);

  objc_msgSend(v37, "noteAccessDataForModernNote:", v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "noteContentDataForModernNote:", v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "noteDataForModernNote:", v21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_opt_class();
  v40[0] = v23;
  v40[1] = v24;
  v40[2] = v28;
  v40[3] = v29;
  v40[4] = v30;
  v40[5] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "subTracker");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "submitEventOfType:pushThenPopDataObjects:subTracker:", v33, v34, v35);

}

uint64_t __147__ICNAEventReporter_submitFastSyncSessionEndForNote_sessionID_participantVersions_numUniqueAccounts_numUniqueDevices_errorCode_numIgnoredMessages___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

- (void)submitNoteEditEventForModernNote:(id)a3 fromQuickNote:(BOOL)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  if (a4)
    v5 = 2;
  else
    v5 = 1;
  v6 = a3;
  -[ICNAEventReporter noteEditDataForContextType:](self, "noteEditDataForContextType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v17[0] = v8;
  v17[1] = v10;
  v17[2] = v11;
  v17[3] = v7;
  v17[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitEventOfType:pushThenPopDataObjects:subTracker:", v14, v15, v16);

}

- (void)submitNoteEditEventForHTMLNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter noteEditDataForContextType:](self, "noteEditDataForContextType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForHTMLNote](self, "noteAccessDataForHTMLNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForHTMLAccount:](self, "accountDataForHTMLAccount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteContentDataForHTMLNote:](self, "noteContentDataForHTMLNote:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteDataForHTMLNote:](self, "noteDataForHTMLNote:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v15[0] = v6;
  v15[1] = v8;
  v15[2] = v9;
  v15[3] = v5;
  v15[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitEventOfType:pushThenPopDataObjects:subTracker:", v12, v13, v14);

}

- (void)submitChecklistUsageEventForModernNote:(id)a3 countOfCheckedItems:(int64_t)a4 countOfTotalItems:(int64_t)a5 checklistActionType:(int64_t)a6
{
  id v10;
  ICASChecklistItemsData *v11;
  void *v12;
  void *v13;
  ICASChecklistItemsData *v14;
  ICASChecklistAction *v15;
  uint64_t v16;
  ICASMoveCheckedItemsToBottomSwitchSetting *v17;
  ICASChecklistUsageData *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = [ICASChecklistItemsData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a5));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ICASChecklistItemsData initWithCountOfCheckedItems:countOfTotalItems:](v11, "initWithCountOfCheckedItems:countOfTotalItems:", v12, v13);

  v15 = -[ICASChecklistAction initWithChecklistAction:]([ICASChecklistAction alloc], "initWithChecklistAction:", a6);
  if (objc_msgSend(MEMORY[0x1E0D64DB0], "checklistAutoSortEnabled"))
    v16 = 1;
  else
    v16 = 2;
  v17 = -[ICASMoveCheckedItemsToBottomSwitchSetting initWithMoveCheckedItemsToBottomSwitchSetting:]([ICASMoveCheckedItemsToBottomSwitchSetting alloc], "initWithMoveCheckedItemsToBottomSwitchSetting:", v16);
  v18 = -[ICASChecklistUsageData initWithChecklistAction:moveCheckedItemsToBottomSwitchSetting:]([ICASChecklistUsageData alloc], "initWithChecklistAction:moveCheckedItemsToBottomSwitchSetting:", v15, v17);
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  v24[0] = v14;
  v24[1] = v18;
  v24[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "submitEventOfType:pushThenPopDataObjects:subTracker:", v21, v22, v23);

}

- (void)submitStyleFormatEventForHTMLNote:(id)a3 styleTypeValue:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICNAEventReporter noteAccessDataForHTMLNote](self, "noteAccessDataForHTMLNote");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForHTMLAccount:](self, "accountDataForHTMLAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteDataForHTMLNote:](self, "noteDataForHTMLNote:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter styleDataForStyleTypeValue:](self, "styleDataForStyleTypeValue:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v16[0] = v7;
  v16[1] = v9;
  v16[2] = v10;
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitEventOfType:pushThenPopDataObjects:subTracker:", v13, v14, v15);

}

- (void)submitStyleFormatEventForModernNote:(id)a3 styleTypeValue:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter styleDataForStyleTypeValue:](self, "styleDataForStyleTypeValue:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v16[0] = v7;
  v16[1] = v9;
  v16[2] = v10;
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitEventOfType:pushThenPopDataObjects:subTracker:", v13, v14, v15);

}

- (void)submitNoteEditorCallOutBarButtonSelectionEventForModernNote:(id)a3 buttonTypeValue:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForModernAccount:](self, "accountDataForModernAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteEditorCallOutBarDataForButtonTypeValue:](self, "noteEditorCallOutBarDataForButtonTypeValue:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v16[0] = v7;
  v16[1] = v9;
  v16[2] = v10;
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitEventOfType:pushThenPopDataObjects:subTracker:", v13, v14, v15);

}

- (void)submitNoteEditorCallOutBarButtonSelectionEventForHTMLNote:(id)a3 buttonTypeValue:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICNAEventReporter noteAccessDataForHTMLNote](self, "noteAccessDataForHTMLNote");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter accountDataForHTMLAccount:](self, "accountDataForHTMLAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter noteEditorCallOutBarDataForButtonTypeValue:](self, "noteEditorCallOutBarDataForButtonTypeValue:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForHTMLNote:](self, "noteContentDataForHTMLNote:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v16[0] = v7;
  v16[1] = v9;
  v16[2] = v10;
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitEventOfType:pushThenPopDataObjects:subTracker:", v13, v14, v15);

}

- (void)submitMoveCheckedItemsToBottomSwitchEventWithNewState:(BOOL)a3 isInApp:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  ICASSwitchSelectionType *v7;
  ICASSwitchSelectionData *v8;
  uint64_t v9;
  ICASSwitchSelectionContext *v10;
  ICASSwitchSelectionContextData *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  if (a3)
    v6 = 1;
  else
    v6 = 2;
  v7 = -[ICASSwitchSelectionType initWithSwitchSelectionType:]([ICASSwitchSelectionType alloc], "initWithSwitchSelectionType:", v6);
  v8 = -[ICASSwitchSelectionData initWithSwitchSelectionType:]([ICASSwitchSelectionData alloc], "initWithSwitchSelectionType:", v7);
  if (v4)
    v9 = 1;
  else
    v9 = 2;
  v10 = -[ICASSwitchSelectionContext initWithSwitchSelectionContext:]([ICASSwitchSelectionContext alloc], "initWithSwitchSelectionContext:", v9);
  v11 = -[ICASSwitchSelectionContextData initWithSwitchSelectionContext:]([ICASSwitchSelectionContextData alloc], "initWithSwitchSelectionContext:", v10);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v16[0] = v8;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitEventOfType:pushThenPopDataObjects:subTracker:", v13, v14, v15);

}

- (void)submitAttachmentBrowserTapEvent
{
  uint64_t v3;
  void *v4;
  id v5;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitEventOfType:pushThenPopDataObjects:subTracker:", v3, MEMORY[0x1E0C9AA60], v4);

}

- (void)submitAttachmentBrowserActionEventForType:(int64_t)a3
{
  ICASActionType *v4;
  ICASAttachmentActionData *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = -[ICASActionType initWithActionType:]([ICASActionType alloc], "initWithActionType:", a3);
  v5 = -[ICASAttachmentActionData initWithActionType:]([ICASAttachmentActionData alloc], "initWithActionType:", v4);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitEventOfType:pushThenPopDataObjects:subTracker:", v7, v8, v9);

}

- (void)submitSearchAttemptEvent
{
  uint64_t v3;
  void *v4;
  id v5;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitEventOfType:subTracker:", v3, v4);

}

- (void)startFindInNoteEvent
{
  -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
}

- (void)submitFindInNoteEventWasSearchQueryEntered:(BOOL)a3 modernNote:(id)a4
{
  _BOOL8 v4;
  id v6;
  ICASFindInNoteData *v7;
  void *v8;
  ICASFindInNoteData *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  ICNAEventReporter *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _QWORD v60[7];

  v4 = a3;
  v60[6] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = [ICASFindInNoteData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICASFindInNoteData initWithWasSearchQueryEntered:](v7, "initWithWasSearchQueryEntered:", v8);

  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__3;
  v52 = __Block_byref_object_dispose__3;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3;
  v40 = __Block_byref_object_dispose__3;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  v35 = 0;
  objc_msgSend(v6, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __75__ICNAEventReporter_submitFindInNoteEventWasSearchQueryEntered_modernNote___block_invoke;
  v22 = &unk_1E771CA70;
  v25 = &v54;
  v23 = self;
  v11 = v6;
  v24 = v11;
  v26 = &v48;
  v27 = &v42;
  v28 = &v36;
  v29 = &v30;
  objc_msgSend(v10, "performBlockAndWait:", &v19);

  +[ICNAController sharedController](ICNAController, "sharedController", v19, v20, v21, v22, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v14 = v55[5];
  v60[0] = v9;
  v60[1] = v14;
  v15 = v43[5];
  v60[2] = v49[5];
  v60[3] = v15;
  v16 = v31[5];
  v60[4] = v37[5];
  v60[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitEventOfType:pushThenPopDataObjects:subTracker:", v13, v17, v18);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

void __75__ICNAEventReporter_submitFindInNoteEventWasSearchQueryEntered_modernNote___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "noteAccessDataForModernNote:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "noteContentDataForModernNote:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "noteDataForModernNote:", *(_QWORD *)(a1 + 40));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "folder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "folderDataForModernFolder:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountDataForModernAccount:", v20);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

}

- (void)submitFindInNoteEventWasSearchQueryEntered:(BOOL)a3 htmlNote:(id)a4
{
  _BOOL8 v4;
  id v6;
  ICASFindInNoteData *v7;
  void *v8;
  ICASFindInNoteData *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[7];

  v4 = a3;
  v49[6] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = [ICASFindInNoteData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICASFindInNoteData initWithWasSearchQueryEntered:](v7, "initWithWasSearchQueryEntered:", v8);

  -[ICNAEventReporter noteAccessDataForHTMLNote](self, "noteAccessDataForHTMLNote");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  v47 = __Block_byref_object_dispose__3;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  objc_msgSend(v6, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__ICNAEventReporter_submitFindInNoteEventWasSearchQueryEntered_htmlNote___block_invoke;
  v19[3] = &unk_1E771CA98;
  v21 = &v43;
  v19[4] = self;
  v12 = v6;
  v20 = v12;
  v22 = &v37;
  v23 = &v31;
  v24 = &v25;
  objc_msgSend(v11, "performBlockAndWait:", v19);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v49[0] = v9;
  v49[1] = v10;
  v15 = v38[5];
  v49[2] = v44[5];
  v49[3] = v15;
  v16 = v26[5];
  v49[4] = v32[5];
  v49[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitEventOfType:pushThenPopDataObjects:subTracker:", v14, v17, v18);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

}

void __73__ICNAEventReporter_submitFindInNoteEventWasSearchQueryEntered_htmlNote___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "noteContentDataForHTMLNote:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "noteDataForHTMLNote:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "folder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "folderDataForHTMLFolder:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "account");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountDataForHTMLAccount:", v17);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (void)submitSearchInitiateEventWithSearchSessionID:(id)a3 searchSuggestionType:(unint64_t)a4
{
  id v6;
  ICASSearchData *v7;
  void *v8;
  ICASSearchData *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ICASSearchData **v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  ICASSearchData *v19;
  ICASSearchData *v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [ICASSearchData alloc];
  v8 = (void *)objc_msgSend(v6, "copy");

  v9 = -[ICASSearchData initWithSearchSessionID:](v7, "initWithSearchSessionID:", v8);
  -[ICNAEventReporter searchSuggestionDataWithSearchSuggestionType:](self, "searchSuggestionDataWithSearchSuggestionType:", a4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v20 = v9;
    v21 = v10;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = &v20;
    v14 = 2;
  }
  else
  {
    v19 = v9;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = &v19;
    v14 = 1;
  }
  objc_msgSend(v12, "arrayWithObjects:count:", v13, v14, v19, v20, v21, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "submitEventOfType:pushThenPopDataObjects:subTracker:", v17, v15, v18);

}

- (void)submitSearchResultSelectEventWithSearchResult:(id)a3 searchSessionID:(id)a4 gmRank:(unint64_t)a5
{
  id v8;
  id v9;
  ICASSearchResultCountData *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[ICASSearchResultCountData initWithTopHitCount:notesCount:attachmentsCount:]([ICASSearchResultCountData alloc], "initWithTopHitCount:notesCount:attachmentsCount:", &unk_1E774D208, &unk_1E774D208, &unk_1E774D208);
  -[ICNAEventReporter reallySubmitSearchResultSelectEventWithSearchResult:searchSessionID:gmRank:queryLength:searchResultCountData:searchSuggestionData:](self, "reallySubmitSearchResultSelectEventWithSearchResult:searchSessionID:gmRank:queryLength:searchResultCountData:searchSuggestionData:", v9, v8, a5, 0, v10, 0);

}

- (void)submitSearchResultSelectEventWithSearchResult:(id)a3 searchSessionID:(id)a4 queryLength:(unint64_t)a5 topHitResultCount:(unint64_t)a6 noteResultCount:(unint64_t)a7 attachmentResultCount:(unint64_t)a8 gmRank:(unint64_t)a9
{
  id v15;
  ICASSearchResultCountData *v16;
  void *v17;
  void *v18;
  void *v19;
  ICASSearchResultCountData *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v15 = a4;
  v16 = [ICASSearchResultCountData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a6));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a7));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a8));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ICASSearchResultCountData initWithTopHitCount:notesCount:attachmentsCount:](v16, "initWithTopHitCount:notesCount:attachmentsCount:", v17, v18, v19);

  objc_msgSend(v25, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "searchSuggestionType");

  if (v22)
  {
    objc_msgSend(v25, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAEventReporter searchSuggestionDataWithSearchSuggestionType:](self, "searchSuggestionDataWithSearchSuggestionType:", objc_msgSend(v23, "searchSuggestionType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  -[ICNAEventReporter reallySubmitSearchResultSelectEventWithSearchResult:searchSessionID:gmRank:queryLength:searchResultCountData:searchSuggestionData:](self, "reallySubmitSearchResultSelectEventWithSearchResult:searchSessionID:gmRank:queryLength:searchResultCountData:searchSuggestionData:", v25, v15, a9, a5, v20, v24);

}

- (void)reallySubmitSearchResultSelectEventWithSearchResult:(id)a3 searchSessionID:(id)a4 gmRank:(unint64_t)a5 queryLength:(unint64_t)a6 searchResultCountData:(id)a7 searchSuggestionData:(id)a8
{
  id v14;
  id v15;
  ICASSearchData *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ICASSearchSelectionData *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  ICASSearchSelectionData *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  ICASSelectedResultType *v42;
  ICASSearchData *v43;
  id v44;
  id v45;
  ICNAEventReporter *v46;
  ICASGmRankingStrategyType *v47;
  void *v48;
  _QWORD v49[4];

  v49[3] = *MEMORY[0x1E0C80C00];
  v45 = a7;
  v44 = a8;
  v14 = a4;
  v15 = a3;
  v16 = [ICASSearchData alloc];
  v17 = (void *)objc_msgSend(v14, "copy");

  v43 = -[ICASSearchData initWithSearchSessionID:](v16, "initWithSearchSessionID:", v17);
  v46 = self;
  -[ICNAEventReporter selectedResultAccountTypeForSearchResult:](self, "selectedResultAccountTypeForSearchResult:", v15);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "object");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "searchResultType");

  if (v19)
    v20 = 2 * (v19 == 1);
  else
    v20 = 1;
  v42 = -[ICASSelectedResultType initWithSelectedResultType:]([ICASSelectedResultType alloc], "initWithSelectedResultType:", v20);
  v47 = -[ICASGmRankingStrategyType initWithGmRankingStrategyType:]([ICASGmRankingStrategyType alloc], "initWithGmRankingStrategyType:", 2);
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "object");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "saltedID:forClass:", v23, objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [ICASSearchSelectionData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a5));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a6));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v15, "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "foundAttachmentObjectID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithInt:", v30 != 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v15, "configuration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "isTopHit"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[ICASSearchSelectionData initWithSelectedResultID:selectedResultAccountType:selectedResultType:gmRankingStrategyType:gmRank:searchRankingExperimentSummary:gmRankIOS13:charLengthOfQueryString:isNoteFoundByAttachment:isTopHit:](v25, "initWithSelectedResultID:selectedResultAccountType:selectedResultType:gmRankingStrategyType:gmRank:searchRankingExperimentSummary:gmRankIOS13:charLengthOfQueryString:isNoteFoundByAttachment:isTopHit:", v24, v48, v42, v47, v26, 0, 0, v27, v31, v34);

  v49[0] = v43;
  v49[1] = v35;
  v49[2] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v44)
  {
    objc_msgSend(v36, "arrayByAddingObject:", v44);
    v38 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v38;
  }
  +[ICNAController sharedController](ICNAController, "sharedController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_opt_class();
  -[ICNAEventReporter subTracker](v46, "subTracker");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "submitEventOfType:pushThenPopDataObjects:subTracker:", v40, v37, v41);

}

- (void)submitSearchResultExposureSummaryEventWithSearchResultExposureData:(id)a3 searchSessionID:(id)a4
{
  id v6;
  id v7;
  ICASSearchData *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[ICASSearchData initWithSearchSessionID:]([ICASSearchData alloc], "initWithSearchSessionID:", v6);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v13[0] = v8;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter subTracker](self, "subTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitEventOfType:pushThenPopDataObjects:subTracker:", v10, v11, v12);

}

- (id)tipImpressionEventDataObjectsForFeature:(id)a3 andModernNote:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  v9 = [v7 alloc];
  -[ICNAEventReporter tipDataForFeature:](self, "tipDataForFeature:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, 0);
  if (v6)
  {
    -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v11, "copy");

  return v13;
}

- (void)startTipImpressionEventDurationTrackingForFeature:(id)a3 andModernNote:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
  -[ICNAEventReporter tipImpressionEventDataObjectsForFeature:andModernNote:](self, "tipImpressionEventDataObjectsForFeature:andModernNote:", v7, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushDataObjects:unique:onlyOnce:subTracker:", v10, 1, 0, v9);

}

- (void)submitTipImpressionEventForFeature:(id)a3 andModernNote:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  -[ICNAEventReporter tipImpressionEventDataObjectsForFeature:andModernNote:](self, "tipImpressionEventDataObjectsForFeature:andModernNote:", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushDataObjects:unique:onlyOnce:subTracker:", v7, 1, 1, v6);

  -[ICNAEventReporter submitTimedEventOfTypeIfPossible:](self, "submitTimedEventOfTypeIfPossible:", objc_opt_class());
}

- (id)tipLearnMoreClickEventDataObjectsForFeature:(id)a3 learnMoreTipName:(id)a4
{
  id v5;
  id v6;
  ICASTipLearnMoreData *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = -[ICASTipLearnMoreData initWithLearnMoreTipName:tipFeature:]([ICASTipLearnMoreData alloc], "initWithLearnMoreTipName:tipFeature:", v5, v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (void)submitTipLearnMoreClickEventForFeature:(id)a3 learnMoreTipName:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[ICNAEventReporter tipLearnMoreClickEventDataObjectsForFeature:learnMoreTipName:](self, "tipLearnMoreClickEventDataObjectsForFeature:learnMoreTipName:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitEventOfType:pushThenPopDataObjects:subTracker:", v6, v8, v7);

}

- (void)submitSnapshotRegisterEventIsSuccessful:(BOOL)a3
{
  _BOOL4 v3;
  ICASResultType *v5;
  uint64_t v6;
  ICASResultType *v7;
  ICASResultData *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = [ICASResultType alloc];
  if (v3)
    v6 = 1;
  else
    v6 = 2;
  v7 = -[ICASResultType initWithResultType:](v5, "initWithResultType:", v6);
  v8 = -[ICASResultData initWithResultType:]([ICASResultData alloc], "initWithResultType:", v7);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitEventOfType:pushThenPopDataObjects:subTracker:", v10, v11, v12);

}

- (void)submitSnapshotTriggeredEvent
{
  uint64_t v3;
  void *v4;
  id v5;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitEventOfType:subTracker:", v3, v4);

}

- (void)submitSnapshotCompletionEventIsSuccessful:(BOOL)a3
{
  _BOOL4 v3;
  ICASResultType *v5;
  uint64_t v6;
  ICASResultType *v7;
  ICASResultData *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = [ICASResultType alloc];
  if (v3)
    v6 = 1;
  else
    v6 = 2;
  v7 = -[ICASResultType initWithResultType:](v5, "initWithResultType:", v6);
  v8 = -[ICASResultData initWithResultType:]([ICASResultData alloc], "initWithResultType:", v7);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitEventOfType:pushThenPopDataObjects:subTracker:", v10, v11, v12);

}

- (void)submitNoteActionMenuEventForNoteEditorWithUsageType:(int64_t)a3 activityType:(id)a4
{
  id v6;
  ICASActionMenuUsageType *v7;
  ICASActionMenuContextType *v8;
  ICASActionMenuData *v9;
  void *v10;
  ICASActionMenuData *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[ICASActionMenuUsageType initWithActionMenuUsageType:]([ICASActionMenuUsageType alloc], "initWithActionMenuUsageType:", a3);
  v8 = -[ICASActionMenuContextType initWithActionMenuContextType:]([ICASActionMenuContextType alloc], "initWithActionMenuContextType:", 1);
  v9 = [ICASActionMenuData alloc];
  objc_msgSend((id)objc_opt_class(), "filteredActivityType:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ICASActionMenuData initWithActionMenuUsageType:actionMenuContextType:actionMenuSelection:](v9, "initWithActionMenuUsageType:actionMenuContextType:actionMenuSelection:", v7, v8, v10);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitEventOfType:pushThenPopDataObjects:subTracker:", v13, v14, v15);

}

- (void)submitNoteActionMenuEventForNoteBrowserWithUsageType:(int64_t)a3 layout:(int64_t)a4 activityType:(id)a5 isTimelineView:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  ICASActionMenuUsageType *v11;
  ICASActionMenuContextType *v12;
  ICASActionMenuData *v13;
  void *v14;
  ICASActionMenuData *v15;
  ICASLayoutData *v16;
  ICASLayoutType *v17;
  void *v18;
  ICASLayoutData *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[3];

  v6 = a6;
  v24[2] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = -[ICASActionMenuUsageType initWithActionMenuUsageType:]([ICASActionMenuUsageType alloc], "initWithActionMenuUsageType:", a3);
  v12 = -[ICASActionMenuContextType initWithActionMenuContextType:]([ICASActionMenuContextType alloc], "initWithActionMenuContextType:", 2);
  v13 = [ICASActionMenuData alloc];
  objc_msgSend((id)objc_opt_class(), "filteredActivityType:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[ICASActionMenuData initWithActionMenuUsageType:actionMenuContextType:actionMenuSelection:](v13, "initWithActionMenuUsageType:actionMenuContextType:actionMenuSelection:", v11, v12, v14);
  v16 = [ICASLayoutData alloc];
  v17 = -[ICASLayoutType initWithLayoutType:]([ICASLayoutType alloc], "initWithLayoutType:", a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ICASLayoutData initWithLayoutType:isTimelineView:](v16, "initWithLayoutType:isTimelineView:", v17, v18);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  v24[0] = v15;
  v24[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "submitEventOfType:pushThenPopDataObjects:subTracker:", v21, v22, v23);

}

- (void)submitTagBrowserSelectionEventWithSelectedTagCount:(unint64_t)a3 isAllTagsSelected:(BOOL)a4
{
  _BOOL8 v4;
  ICASTagBrowserSelectionData *v7;
  void *v8;
  void *v9;
  ICASTagBrowserSelectionData *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = [ICASTagBrowserSelectionData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICASTagBrowserSelectionData initWithCountOfSelectedTags:isAllTagsSelected:](v7, "initWithCountOfSelectedTags:isAllTagsSelected:", v8, v9);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitEventOfType:pushThenPopDataObjects:subTracker:", v12, v13, v14);

}

- (void)submitMentionAddEventForNote:(id)a3 mentionID:(id)a4 participantID:(id)a5 viaAutoComplete:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  ICNAEventReporter *v21;
  BOOL v22;

  v10 = a4;
  v11 = a5;
  objc_msgSend(a3, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__ICNAEventReporter_submitMentionAddEventForNote_mentionID_participantID_viaAutoComplete___block_invoke;
  v17[3] = &unk_1E771CAC0;
  v18 = v12;
  v19 = v11;
  v22 = a6;
  v20 = v10;
  v21 = self;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  objc_msgSend(v13, "performBackgroundTask:", v17);

}

void __90__ICNAEventReporter_submitMentionAddEventForNote_mentionID_participantID_viaAutoComplete___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  ICASMentionAddApproach *v15;
  uint64_t v16;
  ICASMentionAddApproach *v17;
  ICASMentionAddData *v18;
  void *v19;
  ICASMentionAddData *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D63BB8], "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v3, "inlineAttachments", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v10, "isMentionAttachment"))
          {
            v11 = *(void **)(a1 + 40);
            objc_msgSend(v10, "tokenContentIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
            {
              objc_msgSend(v10, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 48));

              if (!v14)
              {
                v7 = 1;
                goto LABEL_14;
              }
            }
            else
            {

            }
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }
LABEL_14:

    v15 = [ICASMentionAddApproach alloc];
    if (*(_BYTE *)(a1 + 64))
      v16 = 2;
    else
      v16 = 1;
    v17 = -[ICASMentionAddApproach initWithMentionAddApproach:](v15, "initWithMentionAddApproach:", v16);
    v18 = [ICASMentionAddData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ICASMentionAddData initWithIsExistingMention:mentionAddApproach:](v18, "initWithIsExistingMention:mentionAddApproach:", v19, v17);

    objc_msgSend(*(id *)(a1 + 56), "noteDataForModernNote:", v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNAController sharedController](ICNAController, "sharedController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    v30[0] = v21;
    v30[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "subTracker");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "submitEventOfType:pushThenPopDataObjects:subTracker:", v23, v24, v25);

  }
}

- (void)submitMentionDeleteEvent:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitEventOfType:pushThenPopDataObjects:subTracker:", v6, v7, v8);

}

- (void)submitCollabSummaryEventForObject:(id)a3 withUpdates:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  ICASStreamUpdateData *v7;
  void *v8;
  ICASStreamUpdateData *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v4 = a4;
  v14[2] = *MEMORY[0x1E0C80C00];
  -[ICNAEventReporter objectDataForCloudSyncingObject:](self, "objectDataForCloudSyncingObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [ICASStreamUpdateData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICASStreamUpdateData initWithHasUpdates:](v7, "initWithHasUpdates:", v8);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v14[0] = v6;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitEventOfType:pushThenPopDataObjects:subTracker:", v11, v12, v13);

}

- (void)submitCollabActivityBrowseEventForObject:(id)a3 contextPath:(int64_t)a4 clickContext:(int64_t)a5 mode:(int64_t)a6 isCurrentUserMentioned:(BOOL)a7 hasRecentUpdates:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  void *v14;
  ICASCollabActivityData *v15;
  ICASCollabActivityContextPath *v16;
  ICASClickContext *v17;
  ICASMode *v18;
  void *v19;
  void *v20;
  ICASCollabActivityData *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[3];

  v8 = a8;
  v9 = a7;
  v26[2] = *MEMORY[0x1E0C80C00];
  -[ICNAEventReporter objectDataForCloudSyncingObject:](self, "objectDataForCloudSyncingObject:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [ICASCollabActivityData alloc];
  v16 = -[ICASCollabActivityContextPath initWithCollabActivityContextPath:]([ICASCollabActivityContextPath alloc], "initWithCollabActivityContextPath:", a4);
  v17 = -[ICASClickContext initWithClickContext:]([ICASClickContext alloc], "initWithClickContext:", a5);
  v18 = -[ICASMode initWithMode:]([ICASMode alloc], "initWithMode:", a6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ICASCollabActivityData initWithCollabActivityContextPath:clickContext:mode:isUserMentioned:hasRecentUpdates:](v15, "initWithCollabActivityContextPath:clickContext:mode:isUserMentioned:hasRecentUpdates:", v16, v17, v18, v19, v20);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_class();
  v26[0] = v14;
  v26[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "submitEventOfType:pushThenPopDataObjects:subTracker:", v23, v24, v25);

}

- (void)startAttributionSideBarViewEventForNote:(id)a3
{
  id v4;
  ICASCollabActivityContextPath *v5;
  ICASEditorCallOutData *v6;
  ICASStartState *v7;
  ICASEndState *v8;
  ICASEditorCallOutData *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  ICNAEventReporter *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[ICASCollabActivityContextPath initWithCollabActivityContextPath:]([ICASCollabActivityContextPath alloc], "initWithCollabActivityContextPath:", 0);
    v6 = [ICASEditorCallOutData alloc];
    v7 = -[ICASStartState initWithStartState:]([ICASStartState alloc], "initWithStartState:", 0);
    v8 = -[ICASEndState initWithEndState:]([ICASEndState alloc], "initWithEndState:", 0);
    v9 = -[ICASEditorCallOutData initWithCollabActivityContextPath:startState:endState:](v6, "initWithCollabActivityContextPath:startState:endState:", v5, v7, v8);

    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__3;
    v27 = __Block_byref_object_dispose__3;
    v28 = 0;
    objc_msgSend(v4, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __61__ICNAEventReporter_startAttributionSideBarViewEventForNote___block_invoke;
    v19 = &unk_1E771C950;
    v22 = &v23;
    v20 = self;
    v21 = v4;
    objc_msgSend(v10, "performBlockAndWait:", &v16);

    if (v24[5])
    {
      +[ICNAController sharedController](ICNAController, "sharedController", v16, v17, v18, v19, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v24[5];
      v29[0] = v9;
      v29[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNAEventReporter subTracker](self, "subTracker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pushDataObjects:unique:onlyOnce:subTracker:", v13, 1, 0, v14);

      -[ICNAEventReporter startTimedEventOfType:](self, "startTimedEventOfType:", objc_opt_class());
    }
    else
    {
      v15 = os_log_create("com.apple.notes", "Analytics");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ICNAEventReporter startAttributionSideBarViewEventForNote:].cold.2();

    }
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    v5 = (ICASCollabActivityContextPath *)os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
      -[ICNAEventReporter startAttributionSideBarViewEventForNote:].cold.1();
  }

}

void __61__ICNAEventReporter_startAttributionSideBarViewEventForNote___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "noteDataForModernNote:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)submitAttributionSideBarViewEventForNote:(id)a3 contextPath:(int64_t)a4 startState:(int64_t)a5 endState:(int64_t)a6
{
  id v10;
  ICASCollabActivityContextPath *v11;
  ICASEditorCallOutData *v12;
  ICASStartState *v13;
  ICASEndState *v14;
  ICASEditorCallOutData *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  ICNAEventReporter *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v10)
  {
    v11 = -[ICASCollabActivityContextPath initWithCollabActivityContextPath:]([ICASCollabActivityContextPath alloc], "initWithCollabActivityContextPath:", a4);
    v12 = [ICASEditorCallOutData alloc];
    v13 = -[ICASStartState initWithStartState:]([ICASStartState alloc], "initWithStartState:", a5);
    v14 = -[ICASEndState initWithEndState:]([ICASEndState alloc], "initWithEndState:", a6);
    v15 = -[ICASEditorCallOutData initWithCollabActivityContextPath:startState:endState:](v12, "initWithCollabActivityContextPath:startState:endState:", v11, v13, v14);

    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    v34 = 0;
    objc_msgSend(v10, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __94__ICNAEventReporter_submitAttributionSideBarViewEventForNote_contextPath_startState_endState___block_invoke;
    v25 = &unk_1E771C950;
    v28 = &v29;
    v26 = self;
    v27 = v10;
    objc_msgSend(v16, "performBlockAndWait:", &v22);

    if (v15)
    {
      if (v30[5])
      {
        +[ICNAController sharedController](ICNAController, "sharedController", v22, v23, v24, v25, v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v30[5];
        v35[0] = v15;
        v35[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNAEventReporter subTracker](self, "subTracker");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "pushDataObjects:unique:onlyOnce:subTracker:", v19, 1, 0, v20);

        -[ICNAEventReporter submitTimedEventOfTypeIfPossible:](self, "submitTimedEventOfTypeIfPossible:", objc_opt_class());
LABEL_12:

        _Block_object_dispose(&v29, 8);
        goto LABEL_13;
      }
      v21 = os_log_create("com.apple.notes", "Analytics");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[ICNAEventReporter submitAttributionSideBarViewEventForNote:contextPath:startState:endState:].cold.3();
    }
    else
    {
      v21 = os_log_create("com.apple.notes", "Analytics");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[ICNAEventReporter submitAttributionSideBarViewEventForNote:contextPath:startState:endState:].cold.2();
    }

    goto LABEL_12;
  }
  v11 = (ICASCollabActivityContextPath *)os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    -[ICNAEventReporter submitAttributionSideBarViewEventForNote:contextPath:startState:endState:].cold.1();
LABEL_13:

}

void __94__ICNAEventReporter_submitAttributionSideBarViewEventForNote_contextPath_startState_endState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "noteDataForModernNote:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)startActivityStreamSummaryEventForObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICASStartCollaborationCollaboratorData *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v5, "serverShareCheckingParent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v6, "ic_nonOwnerInvitedParticipantsCount")));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "serverShareCheckingParent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v8, "ic_nonOwnerAcceptedParticipantsCount")));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ICASStartCollaborationCollaboratorData initWithStartInvitedCount:startAcceptedCount:]([ICASStartCollaborationCollaboratorData alloc], "initWithStartInvitedCount:startAcceptedCount:", v13, v9);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushDataObject:unique:onlyOnce:subTracker:", v10, 1, 0, v12);

}

- (void)submitActivityStreamSummaryEventForObject:(id)a3 halfHeightViewDuration:(double)a4 fullHeightViewDuration:(double)a5 sideBarViewDuration:(double)a6 minimizedViewDuration:(double)a7
{
  id v12;
  void *v13;
  id v14;
  ICASActivityStreamDurationSummaryData *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ICASActivityStreamDurationSummaryData *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  ICNAEventReporter *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v12 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__3;
  v48 = __Block_byref_object_dispose__3;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = 0;
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __151__ICNAEventReporter_submitActivityStreamSummaryEventForObject_halfHeightViewDuration_fullHeightViewDuration_sideBarViewDuration_minimizedViewDuration___block_invoke;
  v33 = &unk_1E771CAE8;
  v14 = v12;
  v36 = &v44;
  v37 = &v38;
  v34 = v14;
  v35 = self;
  objc_msgSend(v13, "performBlockAndWait:", &v30);

  v15 = [ICASActivityStreamDurationSummaryData alloc];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  ICNARoundTo2SigFigs(a4 * 1000.0);
  objc_msgSend(v16, "numberWithDouble:", v30, v31, v32, v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB37E8];
  ICNARoundTo2SigFigs(a5 * 1000.0);
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB37E8];
  ICNARoundTo2SigFigs(a6 * 1000.0);
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CB37E8];
  ICNARoundTo2SigFigs(a7 * 1000.0);
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ICASActivityStreamDurationSummaryData initWithHalfHeightViewDuration:fullHeightViewDuration:sideBarViewDuration:minimizedViewDuration:](v15, "initWithHalfHeightViewDuration:fullHeightViewDuration:sideBarViewDuration:minimizedViewDuration:", v17, v19, v21, v23);

  objc_msgSend(MEMORY[0x1E0C99DE8], "ic_arrayFromNonNilObject:", v45[5]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ic_addNonNilObject:", v39[5]);
  objc_msgSend(v25, "ic_addNonNilObject:", v24);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_class();
  v28 = (void *)objc_msgSend(v25, "copy");
  -[ICNAEventReporter subTracker](self, "subTracker");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "submitEventOfType:pushThenPopDataObjects:subTracker:", v27, v28, v29);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

}

void __151__ICNAEventReporter_submitActivityStreamSummaryEventForObject_halfHeightViewDuration_fullHeightViewDuration_sideBarViewDuration_minimizedViewDuration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ICASEndCollaborationCollaboratorData *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverShareCheckingParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v3, "ic_nonOwnerInvitedParticipantsCount")));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "serverShareCheckingParent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v5, "ic_nonOwnerAcceptedParticipantsCount")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ICASEndCollaborationCollaboratorData initWithEndInvitedCount:endAcceptedCount:]([ICASEndCollaborationCollaboratorData alloc], "initWithEndInvitedCount:endAcceptedCount:", v13, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(a1 + 40), "objectDataForCloudSyncingObject:", *(_QWORD *)(a1 + 32));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (void)submitHashtagAddEventForNote:(id)a3 tokenContentIdentifier:(id)a4 viaAutoComplete:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  ICNAEventReporter *v16;
  BOOL v17;

  v8 = a4;
  objc_msgSend(a3, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__ICNAEventReporter_submitHashtagAddEventForNote_tokenContentIdentifier_viaAutoComplete___block_invoke;
  v13[3] = &unk_1E771CB10;
  v14 = v9;
  v15 = v8;
  v17 = a5;
  v16 = self;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "performBackgroundTask:", v13);

}

void __89__ICNAEventReporter_submitHashtagAddEventForNote_tokenContentIdentifier_viaAutoComplete___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  ICASTagAddApproach *v13;
  uint64_t v14;
  ICASTagAddApproach *v15;
  uint64_t v16;
  ICASTagAddData *v17;
  void *v18;
  void *v19;
  ICASTagAddData *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D63BB8], "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v3, "inlineAttachments", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v10, "isHashtagAttachment"))
          {
            objc_msgSend(v10, "tokenContentIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40));

            if ((v12 & 1) != 0)
            {
              v7 = 1;
              goto LABEL_13;
            }
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

    v13 = [ICASTagAddApproach alloc];
    if (*(_BYTE *)(a1 + 56))
      v14 = 1;
    else
      v14 = 2;
    v15 = -[ICASTagAddApproach initWithTagAddApproach:](v13, "initWithTagAddApproach:", v14);
    v16 = objc_msgSend(MEMORY[0x1E0D63B28], "shouldAutoConvertToTag");
    v17 = [ICASTagAddData alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ICASTagAddData initWithIsExistingTag:tagAddApproach:isAutoConversionEnabled:](v17, "initWithIsExistingTag:tagAddApproach:isAutoConversionEnabled:", v18, v15, v19);

    objc_msgSend(*(id *)(a1 + 48), "noteDataForModernNote:", v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNAController sharedController](ICNAController, "sharedController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    v30[0] = v20;
    v30[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "subTracker");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "submitEventOfType:pushThenPopDataObjects:subTracker:", v23, v24, v25);

  }
}

- (void)submitHashtagDeleteEvent:(id)a3 approachEnum:(int64_t)a4
{
  void *v6;
  ICASTagDeleteApproach *v7;
  ICASTagDeleteData *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICASTagDeleteApproach initWithTagDeleteApproach:]([ICASTagDeleteApproach alloc], "initWithTagDeleteApproach:", a4);
  v8 = -[ICASTagDeleteData initWithTagDeleteApproach:]([ICASTagDeleteData alloc], "initWithTagDeleteApproach:", v7);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v13[0] = v6;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitEventOfType:pushThenPopDataObjects:subTracker:", v10, v11, v12);

}

- (void)submitHashtagRenameEvent:(id)a3 approachEnum:(int64_t)a4
{
  void *v6;
  ICASTagRenameApproach *v7;
  ICASTagRenameData *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICASTagRenameApproach initWithTagRenameApproach:]([ICASTagRenameApproach alloc], "initWithTagRenameApproach:", a4);
  v8 = -[ICASTagRenameData initWithTagRenameApproach:]([ICASTagRenameData alloc], "initWithTagRenameApproach:", v7);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v13[0] = v6;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitEventOfType:pushThenPopDataObjects:subTracker:", v10, v11, v12);

}

- (void)submitAppReviewPromptRequestEvent
{
  uint64_t v3;
  void *v4;
  id v5;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitEventOfType:subTracker:", v3, v4);

}

- (void)submitNotesToPagesEventWithContextPath:(int64_t)a3
{
  ICASNotesToPagesContextPath *v4;
  ICASNotesToPagesContextPathData *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = -[ICASNotesToPagesContextPath initWithNotesToPagesContextPath:]([ICASNotesToPagesContextPath alloc], "initWithNotesToPagesContextPath:", a3);
  v5 = -[ICASNotesToPagesContextPathData initWithNotesToPagesContextPath:]([ICASNotesToPagesContextPathData alloc], "initWithNotesToPagesContextPath:", v4);
  +[ICNAController sharedController](ICNAController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitEventOfType:pushThenPopDataObjects:subTracker:", v7, v8, v9);

}

- (int64_t)addApproachEnumForAddApproach:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 0;
  else
    return qword_1BDD4D218[a3 - 1];
}

- (int64_t)linkContentTypeEnumForURL:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D639E0], "isShowNoteURL:", v3) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D639E0], "isShowHTMLNoteURL:", v3) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D639E0], "isShowLegacyNoteURL:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(MEMORY[0x1E0D639E0], "isShowFolderURL:", v3) & 1) != 0
         || (objc_msgSend(MEMORY[0x1E0D639E0], "isShowHTMLFolderURL:", v3) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "ic_isWebURL") & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    v4 = 4 * (v3 != 0);
  }

  return v4;
}

- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 contentType:(int64_t)a5 isTokenized:(BOOL)a6
{
  -[ICNAEventReporter submitAddLinkEvent:addApproach:contentType:isTokenized:noteData:noteContentData:noteAccessData:](self, "submitAddLinkEvent:addApproach:contentType:isTokenized:noteData:noteContentData:noteAccessData:", a3, a4, a5, a6, 0, 0, 0);
}

- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 contentType:(int64_t)a5 isTokenized:(BOOL)a6 noteData:(id *)a7 noteContentData:(id *)a8 noteAccessData:(id *)a9
{
  _BOOL8 v11;
  id v15;
  ICASLinkAddApproach *v16;
  ICASLinkContentType *v17;
  ICASLinkAddData *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  ICASLinkContentType *v28;
  ICASLinkAddApproach *v29;
  ICASLinkAddData *v30;
  _QWORD v31[5];

  v11 = a6;
  v31[4] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = -[ICASLinkAddApproach initWithLinkAddApproach:]([ICASLinkAddApproach alloc], "initWithLinkAddApproach:", -[ICNAEventReporter addApproachEnumForAddApproach:](self, "addApproachEnumForAddApproach:", a4));
  v17 = -[ICASLinkContentType initWithLinkContentType:]([ICASLinkContentType alloc], "initWithLinkContentType:", a5);
  v18 = [ICASLinkAddData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v17;
  v29 = v16;
  v30 = -[ICASLinkAddData initWithLinkAddApproach:linkContentType:isTokenizedLink:](v18, "initWithLinkAddApproach:linkContentType:isTokenizedLink:", v16, v17, v19);

  if (a7 && (v20 = *a7) != 0)
  {
    if (!a8)
      goto LABEL_7;
  }
  else
  {
    -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v15);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!a8)
    {
LABEL_7:
      -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v15);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v21 = *a8;
  if (!v21)
    goto LABEL_7;
LABEL_8:
  if (!a9 || (v22 = *a9) == 0)
  {
    -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v15);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v15;
  +[ICNAController sharedController](ICNAController, "sharedController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  v31[0] = v30;
  v31[1] = v20;
  v31[2] = v21;
  v31[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "submitEventOfType:pushThenPopDataObjects:subTracker:", v25, v26, v27);

  if (a7)
    *a7 = objc_retainAutorelease(v20);
  if (a8)
    *a8 = objc_retainAutorelease(v21);
  if (a9)
    *a9 = objc_retainAutorelease(v22);

}

- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 url:(id)a5
{
  id v8;

  v8 = a3;
  -[ICNAEventReporter submitAddLinkEvent:addApproach:contentType:isTokenized:](self, "submitAddLinkEvent:addApproach:contentType:isTokenized:", v8, a4, -[ICNAEventReporter linkContentTypeEnumForURL:](self, "linkContentTypeEnumForURL:", a5), 0);

}

- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 url:(id)a5 noteData:(id *)a6 noteContentData:(id *)a7 noteAccessData:(id *)a8
{
  id v14;

  v14 = a3;
  -[ICNAEventReporter submitAddLinkEvent:addApproach:contentType:isTokenized:noteData:noteContentData:noteAccessData:](self, "submitAddLinkEvent:addApproach:contentType:isTokenized:noteData:noteContentData:noteAccessData:", v14, a4, -[ICNAEventReporter linkContentTypeEnumForURL:](self, "linkContentTypeEnumForURL:", a5), 0, a6, a7, a8);

}

- (void)submitLinkedNoteAcceleratorInitiateEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v12[0] = v5;
  v12[1] = v6;
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitEventOfType:pushThenPopDataObjects:subTracker:", v9, v10, v11);

}

- (void)submitLinkedNoteAcceleratorEndEvent:(id)a3 maxCharactersTyped:(unint64_t)a4 endResultCount:(unint64_t)a5
{
  id v8;
  ICASAcceleratorUsageData *v9;
  void *v10;
  void *v11;
  ICASAcceleratorUsageData *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = [ICASAcceleratorUsageData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a5));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICASAcceleratorUsageData initWithMaxNumCharTyped:endResultCount:](v9, "initWithMaxNumCharTyped:endResultCount:", v10, v11);

  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteAccessDataForModernNote:](self, "noteAccessDataForModernNote:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAController sharedController](ICNAController, "sharedController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  v20[0] = v12;
  v20[1] = v13;
  v20[2] = v14;
  v20[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "submitEventOfType:pushThenPopDataObjects:subTracker:", v17, v18, v19);

}

- (void)submitPDFWorkflowEngagementSummary:(id)a3 modernNote:(id)a4
{
  id v6;
  id v7;
  ICASPdfStateData *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICASPdfPageData *v13;
  void *v14;
  void *v15;
  ICASPdfPageData *v16;
  ICASPdfAttachmentData *v17;
  void *v18;
  void *v19;
  ICASPdfAttachmentData *v20;
  ICASPdfCollabIxData *v21;
  void *v22;
  void *v23;
  ICASPdfNavIxData *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  ICASPdfNavIxData *v36;
  ICASPdfCollabIxData *v37;
  ICASPdfStateData *v38;
  ICASPdfState *v39;
  ICASPdfState *v40;
  void *v41;
  void *v43;
  _QWORD v44[8];

  v44[7] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v6);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = -[ICASPdfState initWithPdfState:]([ICASPdfState alloc], "initWithPdfState:", objc_msgSend(v7, "startState"));
  v39 = -[ICASPdfState initWithPdfState:]([ICASPdfState alloc], "initWithPdfState:", objc_msgSend(v7, "endState"));
  v8 = [ICASPdfStateData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasSmallStateUsage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasMediumStateUsage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasLargeStateUsage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasFullscreenStateUsage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[ICASPdfStateData initWithPdfStartState:pdfEndState:hasSmallStateUsage:hasMediumStateUsage:hasLargeStateUsage:hasFullScreenStateUsage:](v8, "initWithPdfStartState:pdfEndState:hasSmallStateUsage:hasMediumStateUsage:hasLargeStateUsage:hasFullScreenStateUsage:", v40, v39, v9, v10, v11, v12);

  v13 = [ICASPdfPageData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v7, "startPageCount")));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v7, "endPageCount")));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICASPdfPageData initWithStartPageCount:endPageCount:](v13, "initWithStartPageCount:endPageCount:", v14, v15);

  v17 = [ICASPdfAttachmentData alloc];
  objc_msgSend(v7, "attachmentIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasActivity"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ICASPdfAttachmentData initWithAttachmentID:hasActivity:](v17, "initWithAttachmentID:hasActivity:", v18, v19);

  v21 = [ICASPdfCollabIxData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasCollabView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasCollabEdit"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[ICASPdfCollabIxData initWithHasCollabView:hasCollabEdit:](v21, "initWithHasCollabView:hasCollabEdit:", v22, v23);

  v24 = [ICASPdfNavIxData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasGestures"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasScroll"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasPagination"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "hasPinchZoom"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0CB37E8];
  v30 = objc_msgSend(v7, "hasPinchToExpandState");

  objc_msgSend(v29, "numberWithBool:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[ICASPdfNavIxData initWithHasGestures:hasScroll:hasPagination:hasPinchZoom:hasPinchToExpandState:](v24, "initWithHasGestures:hasScroll:hasPagination:hasPinchZoom:hasPinchToExpandState:", v25, v26, v27, v28, v31);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_opt_class();
  v44[0] = v43;
  v44[1] = v41;
  v44[2] = v38;
  v44[3] = v16;
  v44[4] = v20;
  v44[5] = v37;
  v44[6] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "submitEventOfType:pushThenPopDataObjects:subTracker:", v33, v34, v35);

}

+ (void)setNoteCreateApproachEnumToAppSuiteDefaults:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("analyticsNoteCreateApproachEnumValue"));

}

+ (void)resetNoteCreateApproachEnumInAppSuiteDefaults
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("analyticsNoteCreateApproachEnumValue"));

}

- (id)noteCreateDataFromAppSuiteDefaults
{
  void *v2;
  void *v3;
  ICASNoteCreateData *v4;
  ICASNoteCreateApproach *v5;
  ICASNoteCreateData *v6;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("analyticsNoteCreateApproachEnumValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [ICASNoteCreateData alloc];
    v5 = -[ICASNoteCreateApproach initWithNoteCreateApproach:]([ICASNoteCreateApproach alloc], "initWithNoteCreateApproach:", objc_msgSend(v3, "integerValue"));
    v6 = -[ICASNoteCreateData initWithNoteCreateApproach:](v4, "initWithNoteCreateApproach:", v5);

    +[ICNAEventReporter resetNoteCreateApproachEnumInAppSuiteDefaults](ICNAEventReporter, "resetNoteCreateApproachEnumInAppSuiteDefaults");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)pushNoteCreateDataWithCreateApproach:(int64_t)a3
{
  ICASNoteCreateData *v5;
  ICASNoteCreateApproach *v6;
  void *v7;
  void *v8;
  ICASNoteCreateData *v9;

  v5 = [ICASNoteCreateData alloc];
  v6 = -[ICASNoteCreateApproach initWithNoteCreateApproach:]([ICASNoteCreateApproach alloc], "initWithNoteCreateApproach:", a3);
  v9 = -[ICASNoteCreateData initWithNoteCreateApproach:](v5, "initWithNoteCreateApproach:", v6);

  +[ICNAController sharedController](ICNAController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushDataObject:unique:onlyOnce:subTracker:", v9, 0, 1, v8);

}

- (void)popNoteCreateData
{
  uint64_t v3;
  void *v4;
  id v5;

  +[ICNAController sharedController](ICNAController, "sharedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  -[ICNAEventReporter subTracker](self, "subTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popDataObjectWithType:subTracker:", v3, v4);

}

- (id)collaborationActionDataIsInviting:(BOOL)a3 inviteStep:(int64_t)a4
{
  uint64_t v5;
  ICASCollaborationActionType *v6;
  ICASCollaborationInviteStep *v7;
  ICASCollaborationActionData *v8;

  if (a3)
    v5 = 1;
  else
    v5 = 2;
  v6 = -[ICASCollaborationActionType initWithCollaborationActionType:]([ICASCollaborationActionType alloc], "initWithCollaborationActionType:", v5);
  v7 = -[ICASCollaborationInviteStep initWithCollaborationInviteStep:]([ICASCollaborationInviteStep alloc], "initWithCollaborationInviteStep:", a4);
  v8 = -[ICASCollaborationActionData initWithCollaborationActionType:collaborationInviteStep:collaborationMethod:]([ICASCollaborationActionData alloc], "initWithCollaborationActionType:collaborationInviteStep:collaborationMethod:", v6, v7, 0);

  return v8;
}

- (id)objectDataForCloudSyncingObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ICNAEventReporter noteDataForModernNote:](self, "noteDataForModernNote:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[ICNAEventReporter folderDataForModernFolder:](self, "folderDataForModernFolder:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (id)noteDataForModernNote:(id)a3
{
  id v3;
  ICASNoteType *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ICASNoteData *v9;
  void *v10;
  ICASNoteData *v11;

  v3 = a3;
  v4 = -[ICASNoteType initWithNoteType:]([ICASNoteType alloc], "initWithNoteType:", 1);
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saltedID:forClass:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v3, "isSystemPaper");
  v9 = [ICASNoteData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICASNoteData initWithNoteID:noteType:isScrapPaper:](v9, "initWithNoteID:noteType:isScrapPaper:", v7, v4, v10);

  return v11;
}

- (id)noteDataForHTMLNote:(id)a3
{
  id v3;
  ICASNoteType *v4;
  void *v5;
  void *v6;
  void *v7;
  ICASNoteData *v8;
  ICASNoteData *v9;

  v3 = a3;
  v4 = -[ICASNoteType initWithNoteType:]([ICASNoteType alloc], "initWithNoteType:", 2);
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "saltedID:forClass:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [ICASNoteData alloc];
  v9 = -[ICASNoteData initWithNoteID:noteType:isScrapPaper:](v8, "initWithNoteID:noteType:isScrapPaper:", v7, v4, MEMORY[0x1E0C9AAA0]);

  return v9;
}

- (id)passwordDataForModernNote:(id)a3
{
  id v3;
  uint64_t v4;
  ICASPasswordType *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  ICASPasswordData *v10;
  void *v11;
  ICASPasswordData *v12;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D63AB8], "shouldAuthenticateWithCustomPasswordForObject:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(MEMORY[0x1E0D63AB8], "shouldAuthenticateWithDevicePasswordForObject:", v3))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }
  v5 = -[ICASPasswordType initWithPasswordType:]([ICASPasswordType alloc], "initWithPasswordType:", v4);
  objc_msgSend(v3, "passwordHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "passwordHint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9 != 0;

  }
  v10 = [ICASPasswordData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICASPasswordData initWithPasswordType:hasHint:](v10, "initWithPasswordType:hasHint:", v5, v11);

  return v12;
}

- (id)bioAuthDataForModernNote:(id)a3
{
  void *v3;
  uint64_t v4;
  ICASBioAuthType *v5;
  ICASBioAuthData *v6;

  objc_msgSend(MEMORY[0x1E0D64B38], "promptForIntent:object:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "allowsBiometricAuthentication")
    && objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") == 2)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "allowsBiometricAuthentication"))
  {
    v4 = 2 * (objc_msgSend(MEMORY[0x1E0D63B90], "biometricsType") == 1);
  }
  else
  {
    v4 = 0;
  }
  v5 = -[ICASBioAuthType initWithBioAuthType:]([ICASBioAuthType alloc], "initWithBioAuthType:", v4);
  v6 = -[ICASBioAuthData initWithBioAuthType:]([ICASBioAuthData alloc], "initWithBioAuthType:", v5);

  return v6;
}

- (id)passwordModeDataForContextPath:(int64_t)a3 fromMode:(signed __int16)a4 toMode:(signed __int16)a5
{
  int v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  ICASPwdModeChangeContextPath *v9;
  uint64_t v10;
  ICASStartMode *v11;
  uint64_t v12;
  ICASEndMode *v13;
  ICASPasswordModeData *v14;

  v5 = a5;
  v6 = a4;
  v7 = a5 == 2;
  v8 = a4 == 2;
  v9 = -[ICASPwdModeChangeContextPath initWithPwdModeChangeContextPath:]([ICASPwdModeChangeContextPath alloc], "initWithPwdModeChangeContextPath:", a3);
  if (v6 == 1)
    v10 = 1;
  else
    v10 = 2 * v8;
  v11 = -[ICASStartMode initWithStartMode:]([ICASStartMode alloc], "initWithStartMode:", v10);
  if (v5 == 1)
    v12 = 1;
  else
    v12 = 2 * v7;
  v13 = -[ICASEndMode initWithEndMode:]([ICASEndMode alloc], "initWithEndMode:", v12);
  v14 = -[ICASPasswordModeData initWithPwdModeChangeContextPath:startMode:endMode:]([ICASPasswordModeData alloc], "initWithPwdModeChangeContextPath:startMode:endMode:", v9, v11, v13);

  return v14;
}

- (id)collaborationStatusForModernObject:(id)a3
{
  id v3;
  uint64_t v4;
  ICASCollaborationStatus *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isOwnedByCurrentUser") & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isSharedReadOnly") & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isSharedViaICloud"))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }
  v5 = -[ICASCollaborationStatus initWithCollaborationStatus:]([ICASCollaborationStatus alloc], "initWithCollaborationStatus:", v4);

  return v5;
}

- (id)collaborationTypeForModernObject:(id)a3
{
  id v3;
  uint64_t v4;
  ICASCollaborationType *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isSharedViaICloud"))
  {
    if (objc_msgSend(v3, "isSharedRootObject"))
      v4 = 2;
    else
      v4 = 3;
  }
  else
  {
    v4 = 1;
  }
  v5 = -[ICASCollaborationType initWithCollaborationType:]([ICASCollaborationType alloc], "initWithCollaborationType:", v4);

  return v5;
}

- (id)folderDataForModernFolder:(id)a3
{
  id v4;
  uint64_t v5;
  ICASFolderLabelType *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ICASFolderData *v22;
  void *v23;
  ICASFolderData *v24;
  ICASFolderType *v26;

  v4 = a3;
  v26 = -[ICASFolderType initWithFolderType:]([ICASFolderType alloc], "initWithFolderType:", 1);
  if ((objc_msgSend(v4, "isDefaultFolderForAccount") & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isTrashFolder") & 1) != 0)
  {
    v5 = 3;
  }
  else if (objc_msgSend(v4, "isSmartFolder"))
  {
    v5 = 5;
  }
  else
  {
    v5 = 4;
  }
  v6 = -[ICASFolderLabelType initWithFolderLabelType:]([ICASFolderLabelType alloc], "initWithFolderLabelType:", v5);
  v7 = v4;
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    v10 = v7;
    while (1)
    {
      objc_msgSend(v8, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultFolder");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v10 == (void *)v12)
        break;
      v13 = (void *)v12;
      objc_msgSend(v8, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trashFolder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v15)
      {
        ++v9;
        objc_msgSend(v10, "parent");
        v16 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v16;
        if (v16)
          continue;
      }
      goto LABEL_16;
    }

  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
LABEL_16:
  -[ICNAEventReporter collaborationStatusForModernObject:](self, "collaborationStatusForModernObject:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter collaborationTypeForModernObject:](self, "collaborationTypeForModernObject:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "saltedID:forClass:", v20, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [ICASFolderData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v9));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ICASFolderData initWithFolderID:folderType:folderLabelType:subFolderLevel:collaborationStatus:collaborationType:](v22, "initWithFolderID:folderType:folderLabelType:subFolderLevel:collaborationStatus:collaborationType:", v21, v26, v6, v23, v17, v18);

  return v24;
}

- (id)folderDataForModernAccountProxy:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ICASFolderData *v8;
  ICASFolderType *v9;
  ICASFolderLabelType *v10;
  ICASCollaborationStatus *v11;
  ICASCollaborationType *v12;
  ICASFolderData *v13;

  v3 = a3;
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saltedID:forClass:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [ICASFolderData alloc];
  v9 = -[ICASFolderType initWithFolderType:]([ICASFolderType alloc], "initWithFolderType:", 1);
  v10 = -[ICASFolderLabelType initWithFolderLabelType:]([ICASFolderLabelType alloc], "initWithFolderLabelType:", 1);
  v11 = -[ICASCollaborationStatus initWithCollaborationStatus:]([ICASCollaborationStatus alloc], "initWithCollaborationStatus:", 1);
  v12 = -[ICASCollaborationType initWithCollaborationType:]([ICASCollaborationType alloc], "initWithCollaborationType:", 1);
  v13 = -[ICASFolderData initWithFolderID:folderType:folderLabelType:subFolderLevel:collaborationStatus:collaborationType:](v8, "initWithFolderID:folderType:folderLabelType:subFolderLevel:collaborationStatus:collaborationType:", v7, v9, v10, &unk_1E774D208, v11, v12);

  return v13;
}

- (id)folderDataForVirtualFolder:(id)a3
{
  id v3;
  uint64_t v4;
  ICASFolderData *v5;
  void *v6;
  void *v7;
  void *v8;
  ICASFolderType *v9;
  ICASFolderLabelType *v10;
  ICASCollaborationStatus *v11;
  ICASCollaborationType *v12;
  ICASFolderData *v13;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D64AB8]) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0D64AB0]))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }
  v5 = [ICASFolderData alloc];
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saltedID:forClass:", v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICASFolderType initWithFolderType:]([ICASFolderType alloc], "initWithFolderType:", 1);
  v10 = -[ICASFolderLabelType initWithFolderLabelType:]([ICASFolderLabelType alloc], "initWithFolderLabelType:", v4);
  v11 = -[ICASCollaborationStatus initWithCollaborationStatus:]([ICASCollaborationStatus alloc], "initWithCollaborationStatus:", 0);
  v12 = -[ICASCollaborationType initWithCollaborationType:]([ICASCollaborationType alloc], "initWithCollaborationType:", 1);
  v13 = -[ICASFolderData initWithFolderID:folderType:folderLabelType:subFolderLevel:collaborationStatus:collaborationType:](v5, "initWithFolderID:folderType:folderLabelType:subFolderLevel:collaborationStatus:collaborationType:", v8, v9, v10, &unk_1E774D208, v11, v12);

  return v13;
}

- (id)folderDataForHTMLFolder:(id)a3
{
  id v3;
  ICASFolderType *v4;
  void *v5;
  id v6;
  uint64_t v7;
  ICASFolderLabelType *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  ICASFolderType *v16;
  ICASCollaborationStatus *v17;
  ICASCollaborationType *v18;
  void *v19;
  void *v20;
  void *v21;
  ICASFolderData *v22;
  void *v23;
  ICASFolderData *v24;
  ICASFolderLabelType *v26;

  v3 = a3;
  v4 = -[ICASFolderType initWithFolderType:]([ICASFolderType alloc], "initWithFolderType:", 2);
  objc_msgSend(v3, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultFolder");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v3)
    v7 = 2;
  else
    v7 = 4;
  v8 = -[ICASFolderLabelType initWithFolderLabelType:]([ICASFolderLabelType alloc], "initWithFolderLabelType:", v7);
  v9 = v3;
  v10 = v9;
  v26 = v8;
  if (v9)
  {
    v11 = 0;
    v12 = v9;
    do
    {
      objc_msgSend(v10, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "defaultFolder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v14)
        break;
      ++v11;
      objc_msgSend(v12, "parentFolder");
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }
    while (v15);
    v16 = v4;
  }
  else
  {
    v16 = v4;
    v12 = 0;
    v11 = 0;
  }
  v17 = -[ICASCollaborationStatus initWithCollaborationStatus:]([ICASCollaborationStatus alloc], "initWithCollaborationStatus:", 1);
  v18 = -[ICASCollaborationType initWithCollaborationType:]([ICASCollaborationType alloc], "initWithCollaborationType:", 1);
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "externalIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "saltedID:forClass:", v20, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [ICASFolderData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v11));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ICASFolderData initWithFolderID:folderType:folderLabelType:subFolderLevel:collaborationStatus:collaborationType:](v22, "initWithFolderID:folderType:folderLabelType:subFolderLevel:collaborationStatus:collaborationType:", v21, v16, v26, v23, v17, v18);

  return v24;
}

- (id)folderDataForHTMLCollection:(id)a3
{
  id v4;
  void *v5;
  ICASFolderData *v6;
  ICASFolderType *v7;
  ICASFolderLabelType *v8;
  void *v9;
  void *v10;
  void *v11;
  ICASFolderData *v12;
  ICASCollaborationStatus *v13;
  ICASCollaborationType *v14;

  v4 = a3;
  ICProtocolCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICNAEventReporter folderDataForHTMLFolder:](self, "folderDataForHTMLFolder:", v5);
    v6 = (ICASFolderData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[ICASFolderType initWithFolderType:]([ICASFolderType alloc], "initWithFolderType:", 2);
    v8 = -[ICASFolderLabelType initWithFolderLabelType:]([ICASFolderLabelType alloc], "initWithFolderLabelType:", 1);
    +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "basicAccountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saltedID:forClass:", v10, objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [ICASFolderData alloc];
    v13 = -[ICASCollaborationStatus initWithCollaborationStatus:]([ICASCollaborationStatus alloc], "initWithCollaborationStatus:", 1);
    v14 = -[ICASCollaborationType initWithCollaborationType:]([ICASCollaborationType alloc], "initWithCollaborationType:", 1);
    v6 = -[ICASFolderData initWithFolderID:folderType:folderLabelType:subFolderLevel:collaborationStatus:collaborationType:](v12, "initWithFolderID:folderType:folderLabelType:subFolderLevel:collaborationStatus:collaborationType:", v11, v7, v8, &unk_1E774D208, v13, v14);

  }
  return v6;
}

- (id)folderContentDataForNoteContainer:(id)a3
{
  id v3;
  ICASFolderContentData *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ICASFolderContentData *v8;

  v3 = a3;
  v4 = [ICASFolderContentData alloc];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(v3, "visibleNotesCount");

  objc_msgSend(v5, "numberWithInteger:", ICNARoundTo2SigFigsInt(v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICASFolderContentData initWithNoteCount:](v4, "initWithNoteCount:", v7);

  return v8;
}

- (id)folderContentDataForVirtualFolder:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  ICASFolderContentData *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  ICASFolderContentData *v11;

  v5 = a4;
  v6 = a3;
  v7 = [ICASFolderContentData alloc];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v6, "visibleNoteCountInContext:", v5);

  objc_msgSend(v8, "numberWithInteger:", ICNARoundTo2SigFigsInt(v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICASFolderContentData initWithNoteCount:](v7, "initWithNoteCount:", v10);

  return v11;
}

- (id)folderContentDataForNoteCollection:(id)a3
{
  uint64_t v3;
  ICASFolderContentData *v4;
  void *v5;
  ICASFolderContentData *v6;

  v3 = objc_msgSend(MEMORY[0x1E0D629F0], "countOfVisibleNotesInCollection:", a3);
  v4 = [ICASFolderContentData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICASFolderContentData initWithNoteCount:](v4, "initWithNoteCount:", v5);

  return v6;
}

- (id)layoutDataForIsInGridMode:(BOOL)a3 isTimelineView:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  ICASLayoutType *v6;
  uint64_t v7;
  ICASLayoutType *v8;
  ICASLayoutData *v9;
  void *v10;
  ICASLayoutData *v11;

  v4 = a4;
  v5 = a3;
  v6 = [ICASLayoutType alloc];
  if (v5)
    v7 = 2;
  else
    v7 = 1;
  v8 = -[ICASLayoutType initWithLayoutType:](v6, "initWithLayoutType:", v7);
  v9 = [ICASLayoutData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICASLayoutData initWithLayoutType:isTimelineView:](v9, "initWithLayoutType:isTimelineView:", v8, v10);

  return v11;
}

- (id)accountDataForModernAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICASAccountData *v9;

  v4 = a3;
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saltedID:forClass:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountTypeForModernAccount:](self, "accountTypeForModernAccount:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ICASAccountData initWithAccountType:accountID:]([ICASAccountData alloc], "initWithAccountType:accountID:", v8, v7);
  return v9;
}

- (id)accountDataForHTMLAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICASAccountData *v9;

  v4 = a3;
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saltedID:forClass:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAEventReporter accountTypeForHTMLAccount:](self, "accountTypeForHTMLAccount:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ICASAccountData initWithAccountType:accountID:]([ICASAccountData alloc], "initWithAccountType:accountID:", v8, v7);
  return v9;
}

- (id)noteAccessDataForModernNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICASNoteAccessData *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  ICASNoteAccessData *v12;

  v4 = a3;
  -[ICNAEventReporter collaborationStatusForModernObject:](self, "collaborationStatusForModernObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAEventReporter collaborationTypeForModernObject:](self, "collaborationTypeForModernObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [ICASNoteAccessData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isPasswordProtected"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v4, "isPinned");

  objc_msgSend(v9, "numberWithBool:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICASNoteAccessData initWithIsPasswordProtected:isPinned:collaborationStatus:collaborationType:](v7, "initWithIsPasswordProtected:isPinned:collaborationStatus:collaborationType:", v8, v11, v5, v6);

  return v12;
}

- (id)noteAccessDataForHTMLNote
{
  ICASCollaborationStatus *v2;
  ICASCollaborationType *v3;
  ICASNoteAccessData *v4;
  ICASNoteAccessData *v5;

  v2 = -[ICASCollaborationStatus initWithCollaborationStatus:]([ICASCollaborationStatus alloc], "initWithCollaborationStatus:", 1);
  v3 = -[ICASCollaborationType initWithCollaborationType:]([ICASCollaborationType alloc], "initWithCollaborationType:", 1);
  v4 = [ICASNoteAccessData alloc];
  v5 = -[ICASNoteAccessData initWithIsPasswordProtected:isPinned:collaborationStatus:collaborationType:](v4, "initWithIsPasswordProtected:isPinned:collaborationStatus:collaborationType:", MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], v2, v3);

  return v5;
}

- (id)noteContentDataForModernNote:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  ICASNoteContentData *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  ICASNoteContentData *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[17];
  _QWORD v61[9];
  _QWORD v62[6];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  char v130;
  _QWORD v131[3];
  char v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  char v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  char v140;

  v4 = a3;
  objc_msgSend(v4, "textStorageWithoutCreating");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = 0;
  v138 = &v137;
  v139 = 0x2020000000;
  v140 = 0;
  v133 = 0;
  v134 = &v133;
  v135 = 0x2020000000;
  v136 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x2020000000;
  v132 = 0;
  v127 = 0;
  v128 = &v127;
  v129 = 0x2020000000;
  v130 = 0;
  v123 = 0;
  v124 = &v123;
  v125 = 0x2020000000;
  v126 = 0;
  v119 = 0;
  v120 = &v119;
  v121 = 0x2020000000;
  v122 = 0;
  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v118 = 0;
  v111 = 0;
  v112 = &v111;
  v113 = 0x2020000000;
  v114 = 0;
  v107 = 0;
  v108 = &v107;
  v109 = 0x2020000000;
  v110 = 0;
  v103 = 0;
  v104 = &v103;
  v105 = 0x2020000000;
  v106 = 0;
  v99 = 0;
  v100 = &v99;
  v101 = 0x2020000000;
  v102 = 0;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v98 = 0;
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__3;
  v77 = __Block_byref_object_dispose__3;
  v78 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__3;
  v67 = __Block_byref_object_dispose__3;
  v68 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = objc_msgSend(v5, "length");
    v8 = objc_msgSend(v5, "ic_range");
    v62[0] = v6;
    v62[1] = 3221225472;
    v62[2] = __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke;
    v62[3] = &unk_1E771CB38;
    v62[4] = &v133;
    v62[5] = &v137;
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", v8, v9, 0, v62);
    v10 = objc_msgSend(v5, "ic_range");
    v11 = *MEMORY[0x1E0CEA0C0];
    v61[0] = v6;
    v61[1] = 3221225472;
    v61[2] = __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke_2;
    v61[3] = &unk_1E771CB60;
    v61[4] = self;
    v61[5] = &v79;
    v61[6] = &v73;
    v61[7] = &v69;
    v61[8] = &v63;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v11, v10, v12, 0, v61);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "visibleAttachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v6;
  v60[1] = 3221225472;
  v60[2] = __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke_3;
  v60[3] = &unk_1E771CB88;
  v60[4] = &v123;
  v60[5] = v131;
  v60[6] = &v119;
  v60[7] = &v115;
  v60[8] = &v127;
  v60[9] = &v99;
  v60[10] = &v111;
  v60[11] = &v107;
  v60[12] = &v95;
  v60[13] = &v91;
  v60[14] = &v83;
  v60[15] = &v87;
  v60[16] = &v103;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v60);
  v39 = v5;

  objc_msgSend((id)objc_opt_class(), "inlineAttachmentReportForModernNote:faultOutInlineAttachmentsAfterDone:", v4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countOfTags");
  v42 = objc_msgSend(v14, "countOfTags");
  v16 = objc_msgSend(v14, "countOfDistinctTags");
  v17 = objc_msgSend(v14, "countOfMentions");
  v18 = objc_msgSend(v14, "countOfMentions");
  v19 = objc_msgSend(v14, "countOfDistinctMentions");
  v20 = objc_msgSend(v14, "countOfNoteLinks");
  v80[3] += v20;
  v37 = (id)objc_msgSend((id)v74[5], "count");
  v36 = objc_msgSend(v14, "countOfDistinctNoteLinks");
  v21 = objc_msgSend(v14, "countOfFolderLinks");
  v70[3] += v21;
  v35 = objc_msgSend((id)v64[5], "count");
  v34 = objc_msgSend(v14, "countOfDistinctFolderLinks");
  v59 = v4;
  v33 = [ICASNoteContentData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v7));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v138 + 24));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v134 + 24));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v128 + 24));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v124 + 24));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v120 + 24));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v116 + 24));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v104 + 24));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v100 + 24));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "creationDate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[ICNAEventReporter weeksSinceDate:](self, "weeksSinceDate:", v58)));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v112 + 24));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v108 + 24));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15 != 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v96 + 24));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v42));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v16));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17 != 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v18));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v19));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v92 + 24));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v88 + 24));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v84 + 24));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v80[3]));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt((uint64_t)v37 + v36));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v70[3]));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v34 + v35));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[ICASNoteContentData initWithCharacterCount:hasChecklist:hasStyleFormatting:hasTable:hasAttachmentInlineDrawingV1:hasAttachmentInlineDrawingV2:hasAttachmentFullscreenDrawing:hasAttachmentOther:hasAttachedPhoto:weeksSinceCreation:hasAttachmentRichUrl:hasAttachmentMapLink:hasTags:hasScannedDoc:countOfTags:countOfDistinctTags:hasMentions:countOfMentions:countOfDistinctMentions:hasPaperKitDrawing:hasPaperDocument:hasPdf:countOfNoteLinks:countOfDistinctNoteLinks:countOfFolderLinks:countOfDistinctFolderLinks:](v33, "initWithCharacterCount:hasChecklist:hasStyleFormatting:hasTable:hasAttachmentInlineDrawingV1:hasAttachmentInlineDrawingV2:hasAttachmentFullscreenDrawing:hasAttachmentOther:hasAttachedPhoto:weeksSinceCreation:hasAttachmentRichUrl:hasAttachmentMapLink:hasTags:hasScannedDoc:countOfTags:countOfDistinctTags:hasMentions:countOfMentions:countOfDistinctMentions:hasPaperKitDrawing:hasPaperDocument:hasPdf:countOfNoteLinks:countOfDistinctNoteLinks:countOfFolderLinks:countOfDistinctFolderLinks:", v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45,
          v44,
          v43,
          v41,
          v40,
          v23,
          v24,
          v25,
          v26,
          v27,
          v28,
          v29,
          v30,
          v31);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(v131, 8);
  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(&v137, 8);

  return v38;
}

void __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "style") != 3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  if (objc_msgSend(v7, "style") == 103)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *a5 = 1;
  }

}

void __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "linkContentTypeEnumForURL:", v3);
    if (v5 == 2)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v6 = *(_QWORD *)(a1 + 64);
      goto LABEL_11;
    }
    if (v5 == 1)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v6 = *(_QWORD *)(a1 + 48);
LABEL_11:
      objc_msgSend(*(id *)(*(_QWORD *)(v6 + 8) + 40), "ic_addNonNilObject:", v4);
    }
  }
LABEL_12:

}

void __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke_3(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  +[ICNAEventReporter analyticsTypeUTIAttachment:](ICNAEventReporter, "analyticsTypeUTIAttachment:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D63688]))
  {
    v6 = a1[4];
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D63680]))
    {
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D63670]))
      {
        v7 = a1[7];
      }
      else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D636B8]))
      {
        v7 = a1[8];
      }
      else if (objc_msgSend(v10, "attachmentType") == 3)
      {
        v7 = a1[9];
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v5, "isEqualToString:", v8);

        if (v9)
        {
          v7 = a1[10];
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.notes.analytics.appleMaps")))
        {
          v7 = a1[11];
        }
        else if (objc_msgSend(v10, "attachmentType") == 11)
        {
          v7 = a1[12];
        }
        else if (objc_msgSend(v10, "attachmentType") == 13)
        {
          v7 = a1[13];
        }
        else if (objc_msgSend(v10, "attachmentType") == 6)
        {
          v7 = a1[14];
        }
        else if (objc_msgSend(v10, "attachmentType") == 14
               || objc_msgSend(v10, "attachmentType") == 15)
        {
          v7 = a1[15];
        }
        else
        {
          v7 = a1[16];
        }
      }
      goto LABEL_6;
    }
    v6 = a1[6];
  }
  *(_BYTE *)(*(_QWORD *)(v6 + 8) + 24) = 1;
  v7 = a1[5];
LABEL_6:
  *(_BYTE *)(*(_QWORD *)(v7 + 8) + 24) = 1;
  if (((*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) & *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) & *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) & *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) & *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) & *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) & *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24)) & (*(_BYTE *)(*(_QWORD *)(a1[12] + 8) + 24) & *(_BYTE *)(*(_QWORD *)(a1[13] + 8) + 24) & *(_BYTE *)(*(_QWORD *)(a1[16] + 8) + 24))) != 0)
    *a3 = 1;

}

+ (id)inlineAttachmentReportForModernNote:(id)a3 faultOutInlineAttachmentsAfterDone:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  ICNANoteInlineAttachmentReport *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[13];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v4 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v6 = objc_alloc_init(ICNANoteInlineAttachmentReport);
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__3;
  v43 = __Block_byref_object_dispose__3;
  v44 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v5, "visibleInlineAttachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__ICNAEventReporter_inlineAttachmentReportForModernNote_faultOutInlineAttachmentsAfterDone___block_invoke;
  v20[3] = &unk_1E771CBB0;
  v20[4] = &v61;
  v20[5] = &v33;
  v20[6] = &v57;
  v20[7] = &v27;
  v20[8] = &v53;
  v20[9] = &v21;
  v20[10] = &v49;
  v20[11] = &v45;
  v20[12] = &v39;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v20);

  v8 = objc_msgSend((id)v34[5], "count");
  v9 = objc_msgSend((id)v28[5], "count");
  v10 = objc_msgSend((id)v22[5], "count");
  -[ICNANoteInlineAttachmentReport setCountOfTags:](v6, "setCountOfTags:", v62[3]);
  -[ICNANoteInlineAttachmentReport setCountOfDistinctTags:](v6, "setCountOfDistinctTags:", v8);
  -[ICNANoteInlineAttachmentReport setCountOfMentions:](v6, "setCountOfMentions:", v58[3]);
  -[ICNANoteInlineAttachmentReport setCountOfDistinctMentions:](v6, "setCountOfDistinctMentions:", v9);
  -[ICNANoteInlineAttachmentReport setCountOfNoteLinks:](v6, "setCountOfNoteLinks:", v54[3]);
  -[ICNANoteInlineAttachmentReport setCountOfDistinctNoteLinks:](v6, "setCountOfDistinctNoteLinks:", v10);
  -[ICNANoteInlineAttachmentReport setCountOfFolderLinks:](v6, "setCountOfFolderLinks:", 0);
  -[ICNANoteInlineAttachmentReport setCountOfDistinctFolderLinks:](v6, "setCountOfDistinctFolderLinks:", 0);
  -[ICNANoteInlineAttachmentReport setCountOfCalculateResults:](v6, "setCountOfCalculateResults:", v50[3]);
  -[ICNANoteInlineAttachmentReport setCountOfCalculateGraphExpressions:](v6, "setCountOfCalculateGraphExpressions:", v46[3]);
  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = (id)v40[5];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v65, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend((id)objc_opt_class(), "faultOutObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v65, 16);
      }
      while (v12);
    }

  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v6;
}

void __92__ICNAEventReporter_inlineAttachmentReportForModernNote_faultOutInlineAttachmentsAfterDone___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;
  int v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "isHashtagAttachment"))
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    v3 = a1[5];
LABEL_7:
    v4 = *(void **)(*(_QWORD *)(v3 + 8) + 40);
    objc_msgSend(v10, "tokenContentIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (const __CFString *)v5;
    else
      v7 = CFSTR("???");
    objc_msgSend(v4, "ic_addNonNilObject:", v7);

    goto LABEL_11;
  }
  if (objc_msgSend(v10, "isMentionAttachment"))
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v3 = a1[7];
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "isLinkAttachment"))
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
    v3 = a1[9];
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "isCalculateResultAttachment"))
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24);
LABEL_11:
    v8 = v10;
    goto LABEL_12;
  }
  v9 = objc_msgSend(v10, "isCalculateGraphExpressionAttachment");
  v8 = v10;
  if (v9)
    ++*(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 24);
LABEL_12:
  objc_msgSend(*(id *)(*(_QWORD *)(a1[12] + 8) + 40), "ic_addNonNilObject:", v8);

}

- (int64_t)weeksSinceDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  return llround(v7 / 60.0 / 60.0 / 24.0 / 7.0);
}

- (id)noteCollapsibleSectionDataForHTMLNote:(id)a3
{
  return -[ICASCollapsibleSectionData initWithSectionAffordanceExposures:sectionAffordanceUsages:]([ICASCollapsibleSectionData alloc], "initWithSectionAffordanceExposures:sectionAffordanceUsages:", &unk_1E774D208, &unk_1E774D208);
}

- (id)noteContentDataForHTMLNote:(id)a3
{
  id v4;
  ICASNoteContentData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ICASNoteContentData *v12;

  v4 = a3;
  v5 = [ICASNoteContentData alloc];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "contentAsPlainText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v7, "length")));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[ICNAEventReporter weeksSinceDate:](self, "weeksSinceDate:", v10)));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICASNoteContentData initWithCharacterCount:hasChecklist:hasStyleFormatting:hasTable:hasAttachmentInlineDrawingV1:hasAttachmentInlineDrawingV2:hasAttachmentFullscreenDrawing:hasAttachmentOther:hasAttachedPhoto:weeksSinceCreation:hasAttachmentRichUrl:hasAttachmentMapLink:hasTags:hasScannedDoc:countOfTags:countOfDistinctTags:hasMentions:countOfMentions:countOfDistinctMentions:hasPaperKitDrawing:hasPaperDocument:hasPdf:countOfNoteLinks:countOfDistinctNoteLinks:countOfFolderLinks:countOfDistinctFolderLinks:](v5, "initWithCharacterCount:hasChecklist:hasStyleFormatting:hasTable:hasAttachmentInlineDrawingV1:hasAttachmentInlineDrawingV2:hasAttachmentFullscreenDrawing:hasAttachmentOther:hasAttachedPhoto:weeksSinceCreation:hasAttachmentRichUrl:hasAttachmentMapLink:hasTags:hasScannedDoc:countOfTags:countOfDistinctTags:hasMentions:countOfMentions:countOfDistinctMentions:hasPaperKitDrawing:hasPaperDocument:hasPdf:countOfNoteLinks:countOfDistinctNoteLinks:countOfFolderLinks:countOfDistinctFolderLinks:", v8, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], v11, MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0], MEMORY[0x1E0C9AAA0],
          MEMORY[0x1E0C9AAA0],
          &unk_1E774D208,
          &unk_1E774D208,
          MEMORY[0x1E0C9AAA0],
          &unk_1E774D208,
          &unk_1E774D208,
          MEMORY[0x1E0C9AAA0],
          MEMORY[0x1E0C9AAA0],
          MEMORY[0x1E0C9AAA0],
          &unk_1E774D208,
          &unk_1E774D208,
          &unk_1E774D208,
          &unk_1E774D208);

  return v12;
}

- (id)selectedResultAccountTypeForSearchResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  ICASSelectedResultAccountType *v9;

  objc_msgSend(a3, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICProtocolCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_3:
      v6 = +[ICNAController accountTypeEnumForModernAccount:](ICNAController, "accountTypeEnumForModernAccount:", v5);
      v7 = 0;
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_3;
LABEL_8:
    v7 = 0;
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if (!v4)
  {
    v7 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  v6 = +[ICNAController accountTypeEnumForHTMLAccount:](ICNAController, "accountTypeEnumForHTMLAccount:", v7);
  v5 = 0;
LABEL_4:
  switch(v6)
  {
    case 1:
    case 2:
    case 3:
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      v6 = 4;
      break;
    case 9:
      v6 = 5;
      break;
    case 10:
      v6 = 6;
      break;
    default:
      goto LABEL_14;
  }
LABEL_15:
  v9 = -[ICASSelectedResultAccountType initWithSelectedResultAccountType:]([ICASSelectedResultAccountType alloc], "initWithSelectedResultAccountType:", v6);

  return v9;
}

- (id)searchSuggestionDataWithSearchSuggestionType:(unint64_t)a3
{
  uint64_t v3;
  ICASSearchSuggestionData *v4;
  ICASSearchSuggestionType *v5;
  ICASSearchSuggestionData *v6;

  if (a3 - 1 > 6)
    v3 = 0;
  else
    v3 = qword_1BDD4D250[a3 - 1];
  v4 = [ICASSearchSuggestionData alloc];
  v5 = -[ICASSearchSuggestionType initWithSearchSuggestionType:]([ICASSearchSuggestionType alloc], "initWithSearchSuggestionType:", v3);
  v6 = -[ICASSearchSuggestionData initWithSearchSuggestionType:](v4, "initWithSearchSuggestionType:", v5);

  return v6;
}

- (id)tipDataForFeature:(id)a3
{
  id v3;
  ICASTipData *v4;

  v3 = a3;
  v4 = -[ICASTipData initWithTipFeature:]([ICASTipData alloc], "initWithTipFeature:", v3);

  return v4;
}

- (id)accountTypeForModernAccount:(id)a3
{
  id v3;
  ICASAccountType *v4;
  int64_t v5;

  v3 = a3;
  v4 = [ICASAccountType alloc];
  v5 = +[ICNAController accountTypeEnumForModernAccount:](ICNAController, "accountTypeEnumForModernAccount:", v3);

  return -[ICASAccountType initWithAccountType:](v4, "initWithAccountType:", v5);
}

- (id)accountTypeForHTMLAccount:(id)a3
{
  id v3;
  ICASAccountType *v4;
  int64_t v5;

  v3 = a3;
  v4 = [ICASAccountType alloc];
  v5 = +[ICNAController accountTypeEnumForHTMLAccount:](ICNAController, "accountTypeEnumForHTMLAccount:", v3);

  return -[ICASAccountType initWithAccountType:](v4, "initWithAccountType:", v5);
}

- (id)noteEditDataForContextType:(int64_t)a3
{
  ICASNoteEditContext *v3;
  ICASNoteEditData *v4;

  v3 = -[ICASNoteEditContext initWithNoteEditContext:]([ICASNoteEditContext alloc], "initWithNoteEditContext:", a3);
  v4 = -[ICASNoteEditData initWithNoteEditContext:]([ICASNoteEditData alloc], "initWithNoteEditContext:", v3);

  return v4;
}

- (id)styleDataForStyleTypeValue:(int64_t)a3
{
  ICASStyleType *v3;
  ICASStyleData *v4;

  v3 = -[ICASStyleType initWithStyleType:]([ICASStyleType alloc], "initWithStyleType:", a3);
  v4 = -[ICASStyleData initWithStyleType:]([ICASStyleData alloc], "initWithStyleType:", v3);

  return v4;
}

- (id)noteEditorCallOutBarDataForButtonTypeValue:(int64_t)a3
{
  ICASNoteEditorCallOutBarButtonType *v3;
  ICASNoteEditorCallOutBarData *v4;

  v3 = -[ICASNoteEditorCallOutBarButtonType initWithNoteEditorCallOutBarButtonType:]([ICASNoteEditorCallOutBarButtonType alloc], "initWithNoteEditorCallOutBarButtonType:", a3);
  v4 = -[ICASNoteEditorCallOutBarData initWithNoteEditorCallOutBarButtonType:]([ICASNoteEditorCallOutBarData alloc], "initWithNoteEditorCallOutBarButtonType:", v3);

  return v4;
}

- (unint64_t)pencilStrokeCountForDrawing:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "strokes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_inputType") == 1)
          ++v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)searchRankingExperimentItemDataWithStrategyTypeEnum:(int64_t)a3 rank:(unint64_t)a4
{
  ICASRankingStrategyType *v5;
  ICASSearchRankingExperimentItemData *v6;
  void *v7;
  ICASSearchRankingExperimentItemData *v8;

  v5 = -[ICASRankingStrategyType initWithRankingStrategyType:]([ICASRankingStrategyType alloc], "initWithRankingStrategyType:", a3);
  v6 = [ICASSearchRankingExperimentItemData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICASSearchRankingExperimentItemData initWithRankingStrategyType:rank:](v6, "initWithRankingStrategyType:rank:", v5, v7);

  return v8;
}

+ (id)analyticsTypeUTIAttachment:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;

  v3 = a3;
  objc_msgSend(v3, "typeUTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (__CFString *)objc_msgSend(v4, "copy");

  if ((objc_msgSend(v3, "isMap") & 1) != 0)
  {
    v6 = CFSTR("com.apple.notes.analytics.appleMaps");
LABEL_5:

    v5 = (__CFString *)v6;
    goto LABEL_6;
  }
  if (objc_msgSend(v3, "attachmentType") == 6)
  {
    v6 = (const __CFString *)(id)*MEMORY[0x1E0D63690];
    goto LABEL_5;
  }
LABEL_6:

  return v5;
}

+ (id)filteredActivityType:(id)a3
{
  __CFString *v3;

  objc_msgSend(a1, "maskString:withoutPrefix:withMask:", a3, CFSTR("com.apple."), CFSTR("other"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("com.apple.UIKit.activity.PostTo")))
  {

    v3 = CFSTR("other");
  }
  return v3;
}

+ (id)maskString:(id)a3 withoutPrefix:(id)a4 withMask:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7
    && ((v10 = objc_msgSend(v7, "length"), v10 < objc_msgSend(v8, "length"))
     || (objc_msgSend(v7, "hasPrefix:", v8) & 1) == 0))
  {
    v11 = (id)objc_msgSend(v9, "copy");
  }
  else
  {
    v11 = v7;
  }
  v12 = v11;

  return v12;
}

+ (BOOL)activityTypeHasUnknownShareFlow:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = activityTypeHasUnknownShareFlow__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&activityTypeHasUnknownShareFlow__onceToken, &__block_literal_global_537);
  v5 = objc_msgSend((id)activityTypeHasUnknownShareFlow__unknownActivityTypes, "containsObject:", v4);

  return v5;
}

void __53__ICNAEventReporter_activityTypeHasUnknownShareFlow___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CEB220], *MEMORY[0x1E0CEB1D8], *MEMORY[0x1E0CEB1C0], *MEMORY[0x1E0CEB228], *MEMORY[0x1E0CEB1B8], CFSTR("com.apple.DocumentManagerUICore.SaveToFiles"), CFSTR("com.apple.mobilenotes.PagesHandoff"), CFSTR("com.apple.mobilenotes.findInNote"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)activityTypeHasUnknownShareFlow__unknownActivityTypes;
  activityTypeHasUnknownShareFlow__unknownActivityTypes = v0;

}

+ (void)faultOutObject:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "managedObjectContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshObject:mergeChanges:", v3, 0);

  }
}

+ (BOOL)attachmentHasDeepLinkSafariHighlight:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "synapseData");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v4 = objc_alloc(MEMORY[0x1E0DB0700]);
    objc_msgSend(v3, "synapseData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithData:error:", v5, 0);

    objc_msgSend(v6, "userActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_linkContextInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = v8 != 0;

  }
  return (char)v4;
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (NSMutableSet)timedDataTrackingSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimedDataTrackingSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)pendingInlineDrawingInformation
{
  return self->_pendingInlineDrawingInformation;
}

- (void)setPendingInlineDrawingInformation:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInlineDrawingInformation, a3);
}

- (void)initWithSubTrackerName:windowScene:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, v0, v1, "Tried to init event reporter for a nil window scene.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithSubTrackerName:window:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, v0, v1, "Tried to init event reporter for a nil window.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithSubTrackerName:view:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, v0, v1, "Tried to init event reporter for a nil view.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)startAttributionSideBarViewEventForNote:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, v0, v1, "Tried to start attribution sidebar view event for a nil note.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)startAttributionSideBarViewEventForNote:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, v0, v1, "Tried to start attribution sidebar view event with nil noteData.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)submitAttributionSideBarViewEventForNote:contextPath:startState:endState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, v0, v1, "Tried to submit attribution sidebar view event for a nil note.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)submitAttributionSideBarViewEventForNote:contextPath:startState:endState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, v0, v1, "Tried to submit attribution sidebar view event with nil calloutData.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)submitAttributionSideBarViewEventForNote:contextPath:startState:endState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, v0, v1, "Tried to submit attribution sidebar view event with nil noteData.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
