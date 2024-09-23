@implementation MapsSuggestionsGCDTimer

- (MapsSuggestionsGCDTimer)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  MapsSuggestionsGCDTimer *v11;
  void *v12;
  NSObject *v14[2];
  id v15[5];
  _QWORD aBlock[4];
  id v17;
  id v18;
  id location;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsGCDTimer;
  v11 = -[MapsSuggestionsBaseTrigger initWithName:](&v20, sel_initWithName_, CFSTR("MapsSuggestionsGCDTimer"));
  if (v11)
  {
    objc_initWeak(&location, v11);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__MapsSuggestionsGCDTimer_initWithName_queue_block___block_invoke;
    aBlock[3] = &unk_1E4BCE550;
    objc_copyWeak(&v18, &location);
    v17 = v10;
    v12 = _Block_copy(aBlock);
    MSg::Queue::Queue(v14, v9);
    MSg::Timer::Timer((uint64_t)v15, v8, (id *)v14, v12);
    MSg::Timer::operator=((uint64_t)&v11->_timer, (uint64_t *)v15);
    MSg::Timer::~Timer(v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __52__MapsSuggestionsGCDTimer_initWithName_queue_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "triggerMyObservers");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsTimer.mm";
      v7 = 1026;
      v8 = 33;
      v9 = 2082;
      v10 = "-[MapsSuggestionsGCDTimer initWithName:queue:block:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (MapsSuggestionsGCDTimer)initWithName:(id)a3 queue:(id)a4 timerReturningBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  MapsSuggestionsGCDTimer *v11;
  void *v12;
  NSObject *v14[2];
  id v15[5];
  _QWORD aBlock[4];
  id v17;
  id v18;
  id location;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsGCDTimer;
  v11 = -[MapsSuggestionsBaseTrigger initWithName:](&v20, sel_initWithName_, CFSTR("MapsSuggestionsGCDTimer"));
  if (v11)
  {
    objc_initWeak(&location, v11);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__MapsSuggestionsGCDTimer_initWithName_queue_timerReturningBlock___block_invoke;
    aBlock[3] = &unk_1E4BCE550;
    objc_copyWeak(&v18, &location);
    v17 = v10;
    v12 = _Block_copy(aBlock);
    MSg::Queue::Queue(v14, v9);
    MSg::Timer::Timer((uint64_t)v15, v8, (id *)v14, v12);
    MSg::Timer::operator=((uint64_t)&v11->_timer, (uint64_t *)v15);
    MSg::Timer::~Timer(v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __66__MapsSuggestionsGCDTimer_initWithName_queue_timerReturningBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "triggerMyObservers");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "MapsSuggestionsTimer.mm";
      v7 = 1026;
      v8 = 51;
      v9 = 2082;
      v10 = "-[MapsSuggestionsGCDTimer initWithName:queue:timerReturningBlock:]_block_invoke";
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

  }
}

- (void)scheduleWithTimeInterval:(double)a3 repeatAfter:(double)a4 leeway:(double)a5
{
  Duration v5[2];
  Duration v6[2];
  Duration v7[2];

  *(_QWORD *)v7 = (uint64_t)(a3 * 1000000000.0);
  *(_QWORD *)v5 = (uint64_t)(a4 * 1000000000.0);
  *(_QWORD *)v6 = (uint64_t)(a5 * 1000000000.0);
  MSg::Timer::schedule((MSg::Timer *)&self->_timer, v7, v6, v5);
}

- (void)scheduleWithTimeInterval:(double)a3 leeway:(double)a4
{
  Duration v4[2];
  Duration v5[2];
  Duration v6[2];

  *(_QWORD *)v6 = (uint64_t)(a3 * 1000000000.0);
  *(_QWORD *)v4 = -1;
  *(_QWORD *)v5 = (uint64_t)(a4 * 1000000000.0);
  MSg::Timer::schedule((MSg::Timer *)&self->_timer, v6, v5, v4);
}

- (void)scheduleWithInterval:(Duration)a3 repeatAfter:(Duration)a4 leeway:(Duration)a5
{
  Duration v5[2];
  Duration v6[2];
  Duration v7[2];

  *(_QWORD *)v7 = *(_QWORD *)&a3;
  *(_QWORD *)v5 = *(_QWORD *)&a5;
  *(_QWORD *)v6 = *(_QWORD *)&a4;
  MSg::Timer::schedule((MSg::Timer *)&self->_timer, v7, v5, v6);
}

- (void)scheduleWithInterval:(Duration)a3 leeway:(Duration)a4
{
  Duration v4[2];
  Duration v5[2];
  Duration v6[2];

  *(_QWORD *)v6 = *(_QWORD *)&a3;
  *(_QWORD *)v4 = -1;
  *(_QWORD *)v5 = *(_QWORD *)&a4;
  MSg::Timer::schedule((MSg::Timer *)&self->_timer, v6, v5, v4);
}

- (void)unschedule
{
  MSg::Timer::unschedule((MSg::Timer *)&self->_timer);
}

- (void)dealloc
{
  objc_super v3;

  MSg::Timer::unschedule((MSg::Timer *)&self->_timer);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsGCDTimer;
  -[MapsSuggestionsGCDTimer dealloc](&v3, sel_dealloc);
}

- (NSString)uniqueName
{
  return self->_timer._name;
}

- (id)objectForJSON
{
  NSString *name;
  NSDate *firesAt;
  double v4;
  MSg *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  name = self->_timer._name;
  firesAt = self->_timer._state.firesAt;
  v9[0] = CFSTR("name");
  v9[1] = CFSTR("firesInSec");
  v10[0] = name;
  if (firesAt)
  {
    v4 = MapsSuggestionsSecondsTo(firesAt);
    MSg::jsonFor(v5, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  MSg::Timer::~Timer((id *)&self->_timer._queue._innerQueue);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
