@implementation MapsSuggestionsRangeTrigger

- (MapsSuggestionsRangeTrigger)initWithLocation:(id)a3 radius:(double)a4 onEnter:(BOOL)a5 minUpdateTime:(double)a6 locationUpdater:(id)a7 forcingLocationUpdater:(id)a8
{
  id v15;
  id v16;
  id v17;
  MapsSuggestionsRangeTrigger *v18;
  MapsSuggestionsQueue *v19;
  MapsSuggestionsQueue *queue;
  objc_super v22;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)MapsSuggestionsRangeTrigger;
  v18 = -[MapsSuggestionsBaseTrigger initWithName:](&v22, sel_initWithName_, CFSTR("MapsSuggestionsRangeTrigger"));
  if (v18)
  {
    v19 = -[MapsSuggestionsQueue initSerialQueueWithName:]([MapsSuggestionsQueue alloc], "initSerialQueueWithName:", CFSTR("MapsSuggestionsRangeTriggerQueue"));
    queue = v18->_queue;
    v18->_queue = v19;

    objc_storeStrong((id *)&v18->_destinationLocation, a3);
    v18->_radius = a4;
    v18->_onEnter = a5;
    v18->_forceUpdateTime = a6;
    objc_storeStrong((id *)&v18->_locationUpdater, a7);
    objc_storeStrong((id *)&v18->_forcingLocationUpdater, a8);
  }

  return v18;
}

- (void)stop
{
  MapsSuggestionsQueue *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__MapsSuggestionsRangeTrigger_stop__block_invoke;
  v4[3] = &unk_1E4BCDFF8;
  objc_copyWeak(&v5, &location);
  -[MapsSuggestionsQueue syncBlock:](queue, "syncBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __35__MapsSuggestionsRangeTrigger_stop__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[10], "cancel");
    objc_msgSend(v2[8], "stopLocationUpdatesForDelegate:", v2);
    objc_msgSend(v2[9], "stopLocationUpdatesForDelegate:", v2);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136446722;
      v5 = "MapsSuggestionsRangeTrigger.m";
      v6 = 1026;
      v7 = 55;
      v8 = 2082;
      v9 = "-[MapsSuggestionsRangeTrigger stop]_block_invoke";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }

  }
}

- (void)didUpdateLocation:(id)a3
{
  id v4;
  double v5;
  _BOOL4 onEnter;
  BOOL v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "horizontalAccuracy");
    v4 = v8;
    if (v5 <= 100.0)
    {
      -[MapsSuggestionsCanKicker kickCanByTime:](self->_locationForceUpdate, "kickCanByTime:", self->_forceUpdateTime);
      -[MapsSuggestionsLocationUpdater stopLocationUpdatesForDelegate:](self->_forcingLocationUpdater, "stopLocationUpdatesForDelegate:", self);
      onEnter = self->_onEnter;
      v7 = onEnter == -[MapsSuggestionsRangeTrigger withinRange:](self, "withinRange:", v8);
      v4 = v8;
      if (v7)
      {
        -[MapsSuggestionsLocationUpdater stopLocationUpdatesForDelegate:](self->_locationUpdater, "stopLocationUpdatesForDelegate:", self);
        -[MapsSuggestionsBaseTrigger triggerMyObservers](self, "triggerMyObservers");
        v4 = v8;
      }
    }
  }

}

- (BOOL)withinRange:(id)a3
{
  double radius;
  double v4;

  radius = self->_radius;
  objc_msgSend(a3, "distanceFromLocation:", self->_destinationLocation);
  return radius > v4;
}

- (void)didAddFirstObserver
{
  MapsSuggestionsCanKicker *v3;
  void *v4;
  MapsSuggestionsCanKicker *v5;
  MapsSuggestionsCanKicker *locationForceUpdate;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = [MapsSuggestionsCanKicker alloc];
  -[MapsSuggestionsQueue innerQueue](self->_queue, "innerQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __50__MapsSuggestionsRangeTrigger_didAddFirstObserver__block_invoke;
  v11 = &unk_1E4BCDFF8;
  objc_copyWeak(&v12, &location);
  v5 = -[MapsSuggestionsCanKicker initWithName:queue:block:](v3, "initWithName:queue:block:", CFSTR("MapsSuggestionsRangeTriggerCanKicker"), v4, &v8);
  locationForceUpdate = self->_locationForceUpdate;
  self->_locationForceUpdate = v5;

  v7 = (id)-[MapsSuggestionsLocationUpdater startLocationUpdatesForDelegate:](self->_locationUpdater, "startLocationUpdatesForDelegate:", self, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__MapsSuggestionsRangeTrigger_didAddFirstObserver__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (id)objc_msgSend(WeakRetained[9], "startLocationUpdatesForDelegate:", WeakRetained);
    v4 = (id)objc_msgSend(v2[8], "startLocationUpdatesForDelegate:", v2);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136446722;
      v7 = "MapsSuggestionsRangeTrigger.m";
      v8 = 1026;
      v9 = 87;
      v10 = 2082;
      v11 = "-[MapsSuggestionsRangeTrigger didAddFirstObserver]_block_invoke";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationForceUpdate, 0);
  objc_storeStrong((id *)&self->_forcingLocationUpdater, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
}

@end
