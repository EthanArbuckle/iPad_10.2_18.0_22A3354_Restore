@implementation ICNAFindResultExposureReporter

- (ICNAFindResultExposureReporter)initWithWindow:(id)a3
{
  id v4;
  ICNAFindResultExposureReporter *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *isolationQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICNAFindResultExposureReporter;
  v5 = -[ICNAFindResultExposureReporter init](&v10, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.notes.analytics.findResultExposureReporter", v6);
    isolationQueue = v5->_isolationQueue;
    v5->_isolationQueue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_window, v4);
  }

  return v5;
}

- (void)startTrackingFindSession
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNAFindResultExposureReporter isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ICNAFindResultExposureReporter_startTrackingFindSession__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_async(v3, block);

}

void __58__ICNAFindResultExposureReporter_startTrackingFindSession__block_invoke(uint64_t a1)
{
  FindSessionData *v2;
  id v3;

  v2 = objc_alloc_init(FindSessionData);
  objc_msgSend(*(id *)(a1 + 32), "setFindSessionData:", v2);

  objc_msgSend(*(id *)(a1 + 32), "eventReporter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startFindInNoteEvent");

}

- (void)updateWithSearchQuery:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICNAFindResultExposureReporter isolationQueue](self, "isolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ICNAFindResultExposureReporter_updateWithSearchQuery___block_invoke;
  v7[3] = &unk_1E771BEA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __56__ICNAFindResultExposureReporter_updateWithSearchQuery___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "findSessionData");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearchQuery:", v1);

}

- (void)submitEventIfApplicableForNote:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICNAFindResultExposureReporter isolationQueue](self, "isolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ICNAFindResultExposureReporter_submitEventIfApplicableForNote___block_invoke;
  v7[3] = &unk_1E771BEA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__ICNAFindResultExposureReporter_submitEventIfApplicableForNote___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "findSessionData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventReporter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchQuery");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "submitFindInNoteEventWasSearchQueryEntered:modernNote:", objc_msgSend(v3, "length") != 0, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "setFindSessionData:", 0);
  }

}

- (BOOL)hasActiveTrackingFindSession
{
  ICNAFindResultExposureReporter *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICNAFindResultExposureReporter isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__ICNAFindResultExposureReporter_hasActiveTrackingFindSession__block_invoke;
  v5[3] = &unk_1E771BED0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __62__ICNAFindResultExposureReporter_hasActiveTrackingFindSession__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "findSessionData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (ICNAEventReporter)eventReporter
{
  ICNAEventReporter *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  ICNAEventReporter *v7;
  ICNAEventReporter *eventReporter;
  void *v9;

  if (!self->_eventReporter
    && +[ICNAOptedInObject isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
  {
    v3 = [ICNAEventReporter alloc];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAFindResultExposureReporter window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICNAEventReporter initWithSubTrackerName:window:](v3, "initWithSubTrackerName:window:", v5, v6);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, CFSTR("ICNAEventReporterLostSessionNotification"), self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  void *v6;
  id v7;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("ICNAEventReporterLostSessionNotification"), v6);
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_isolationQueue, a3);
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (FindSessionData)findSessionData
{
  return self->_findSessionData;
}

- (void)setFindSessionData:(id)a3
{
  objc_storeStrong((id *)&self->_findSessionData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findSessionData, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
