@implementation ATXInformationHeuristicRefreshTimeTrigger

- (ATXInformationHeuristicRefreshTimeTrigger)initWithFireDate:(id)a3
{
  id v4;
  ATXInformationHeuristicRefreshTimeTrigger *v5;
  id v6;
  uint64_t v7;
  NSDate *fireDate;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXInformationHeuristicRefreshTimeTrigger;
  v5 = -[ATXInformationHeuristicRefreshTrigger init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v7;

  }
  return v5;
}

- (void)_start
{
  double v3;
  double v4;
  NSObject *v5;
  _BOOL4 v6;
  NSDate *v7;
  void *v8;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *source;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  NSDate *fireDate;
  void *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[4];
  ATXInformationHeuristicRefreshTimeTrigger *v20;
  __int16 v21;
  NSDate *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_source)
  {
    -[NSDate timeIntervalSinceNow](self->_fireDate, "timeIntervalSinceNow");
    v4 = v3;
    __atxlog_handle_gi();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4 <= 0.0)
    {
      if (v6)
      {
        fireDate = self->_fireDate;
        -[ATXInformationHeuristicRefreshTrigger registeredHeuristics](self, "registeredHeuristics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v20 = self;
        v21 = 2112;
        v22 = fireDate;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshTimeTrigger (%p): Past [%@]. Will not start. %@", buf, 0x20u);

      }
    }
    else
    {
      if (v6)
      {
        v7 = self->_fireDate;
        -[ATXInformationHeuristicRefreshTrigger registeredHeuristics](self, "registeredHeuristics");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v20 = self;
        v21 = 2112;
        v22 = v7;
        v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshTimeTrigger (%p): Start [%@]. %@", buf, 0x20u);

      }
      objc_initWeak((id *)buf, self);
      dispatch_get_global_queue(25, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);
      source = self->_source;
      self->_source = v10;

      v12 = self->_source;
      v13 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
      v14 = self->_source;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __51__ATXInformationHeuristicRefreshTimeTrigger__start__block_invoke;
      handler[3] = &unk_1E82C4900;
      objc_copyWeak(&v18, (id *)buf);
      dispatch_source_set_event_handler(v14, handler);
      dispatch_resume((dispatch_object_t)self->_source);
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __51__ATXInformationHeuristicRefreshTimeTrigger__start__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "timeIntervalSinceDate:", WeakRetained[4]);
    v4 = v3;
    __atxlog_handle_gi();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = WeakRetained[4];
      objc_msgSend(WeakRetained, "registeredHeuristics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218754;
      v11 = WeakRetained;
      v12 = 2112;
      v13 = v6;
      v14 = 2048;
      v15 = v4;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshTimeTrigger (%p): Fired [%@] %0.1fs after date. Triggering heuristics refresh. %@", (uint8_t *)&v10, 0x2Au);

    }
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "registeredHeuristics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "informationHeuristicRefreshTrigger:didTriggerRefreshForHeuristics:", WeakRetained, v9);

  }
}

- (void)_stop
{
  NSObject *v3;
  NSDate *fireDate;
  void *v5;
  OS_dispatch_source *source;
  int v7;
  ATXInformationHeuristicRefreshTimeTrigger *v8;
  __int16 v9;
  NSDate *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_source)
  {
    __atxlog_handle_gi();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      fireDate = self->_fireDate;
      -[ATXInformationHeuristicRefreshTrigger registeredHeuristics](self, "registeredHeuristics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134218498;
      v8 = self;
      v9 = 2112;
      v10 = fireDate;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1C99DF000, v3, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshTimeTrigger (%p): Stopped [%@]. %@.", (uint8_t *)&v7, 0x20u);

    }
    dispatch_source_cancel((dispatch_source_t)self->_source);
    source = self->_source;
    self->_source = 0;

  }
}

- (unint64_t)hash
{
  return -[NSDate hash](self->_fireDate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXInformationHeuristicRefreshTimeTrigger *v4;
  NSDate *fireDate;
  char v6;

  v4 = (ATXInformationHeuristicRefreshTimeTrigger *)a3;
  if (self == v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  fireDate = self->_fireDate;
  if (fireDate == v4->_fireDate)
LABEL_5:
    v6 = 1;
  else
    v6 = -[NSDate isEqual:](fireDate, "isEqual:");
LABEL_7:

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("InfoHeuristicRefreshTimeTrigger at %@"), self->_fireDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshTimeTrigger;
  v4 = a3;
  -[ATXInformationHeuristicRefreshTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fireDate, CFSTR("fireDate"), v5.receiver, v5.super_class);

}

- (ATXInformationHeuristicRefreshTimeTrigger)initWithCoder:(id)a3
{
  id v4;
  ATXInformationHeuristicRefreshTimeTrigger *v5;
  void *v6;
  ATXInformationHeuristicRefreshTimeTrigger *v7;
  uint64_t v9;
  NSDate *fireDate;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXInformationHeuristicRefreshTimeTrigger;
  v5 = -[ATXInformationHeuristicRefreshTrigger initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_3;
  -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:](v5, "_safeDecodeObjectOfClass:forKey:withCoder:nonNull:", objc_opt_class(), CFSTR("fireDate"), v4, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  fireDate = v5->_fireDate;
  v5->_fireDate = (NSDate *)v9;

  if (!v5->_fireDate
    || (objc_msgSend(v4, "error"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
LABEL_3:
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
